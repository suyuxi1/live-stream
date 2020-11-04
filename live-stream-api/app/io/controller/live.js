'use strict'

const await = require('await-stream-ready/lib/await')
const user = require('../../model/user')

const Controller = require('egg').Controller

class NspController extends Controller {
  //验证用户token
  async checkToken(token) {
    const { ctx, app, service, helper } = this
    //当前连接
    const socket = ctx.socket
    const id = socket.id

    //  用户验证
    if (!token) {
      // 通知前端  您没有访问该接口的权限
      socket.emit(id, ctx.helper.parseMsg('error', '您没有访问该接口的权限'))
      return false
    }

    // 根据token解密，换取用户信息
    let user = {}
    try {
      user = ctx.checkToken(token)
    } catch (error) {
      let fail = error.name === 'TokenExpiredError' ? 'token 已过期！请重新获取令牌' : 'Token 令牌不合法！'
      socket.emit(id, ctx.helper.parseMsg('error', fail))
      return false
    }
    //判断用户是否存在
    let t = await ctx.service.cache.get('user_' + user.id)
    if (!t || t !== token) {
      socket.emit(id, ctx.helper.parseMsg('error', 'Token令牌不合法！'))
      return false
    }

    //4. 判断用户是否存在
    user = await app.model.User.findOne({
      where: {
        id: user.id,
      },
    })
    if (!user) {
      socket.emit(id, ctx.helper.parseMsg('error', '用户不存在'))
      return false
    }
    return user
  }

  // 进入直播间
  async joinLive() {
    const { ctx, app, service, helper } = this
    const nsp = app.io.of('/')
    //接收参数
    const message = ctx.args[0] || {}

    //当前连接
    const socket = ctx.socket
    const id = socket.id

    let { live_id, token } = message

    //验证用户token
    let user = await this.checkToken(token)
    if (!user) {
      return
    }
    //验证当前直播间是否存在或处于直播中
    let msg = await service.live.checkStatus(live_id)

    if (msg) {
      socket.emit(id, ctx.helper.parseMsg('error', msg))
      return
    }

    const room = 'live_' + live_id
    //用户加入房间
    socket.join(room)

    const rooms = [room]
    //加入redis存储中
    let list = await service.cache.get('userList_' + room)
    list = list ? list : []
    list = list.filter((item) => item.id !== user.id)
    list.unshift({
      id: user.id,
      name: user.username,
      avatar: user.avatar,
    })
    service.cache.set('userList_' + room, list)
    console.log('直播间当前用户')
    console.log(list)

    //更新在线用户列表
    nsp.adapter.clients(rooms, (err, clients) => {
      nsp.to(room).emit('online', {
        clients,
        action: 'join',
        user: {
          id: user.id,
          name: user.username,
          avatar: user.avatar,
        },
        data: list,
      })
    })
    //加入播放历史记录
    let liveUser = await app.model.LiveUser.findOne({
      where: {
        user_id: user.id,
        live_id,
      },
    })

    if (!liveUser) {
      app.model.LiveUser.create({
        user_id: user.id,
        live_id,
      })
      //总观看人数+1
      let live = await service.live.exist(live_id)
      if (live) {
        live.increment({
          look_count: 1,
        })
      }
    }
  }
}

module.exports = NspController
