'use strict'

const Controller = require('egg').Controller

class NspController extends Controller {
  //验证用户token
  async checkToken(token) {
    const { ctx, app, service, helper } = this
    //当前连接
    const socket = ctx.socket
    const id = ctx.id

    //  用户验证
    if (!token) {
      // 通知前端   您没有访问该接口的权限
      socket.emit(id, ctx.helper.parseMsg('err', '您没有访问该接口的权限'))
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
    // 判断用户是否存在
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
    console.log('验证当前直播间是否存在或处于直播中--->' + msg)
    if (msg) {
      socket.emit(id, ctx.helper.parseMsg('error', msg))
      return
    }

    console.log('当前直播在线状态')
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

    // 加入播放历史记录
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

      // 总观看人数+1
      let live = await service.live.exist(live_id)
      if (live) {
        live.increment({
          look_count: 1,
        })
      }
    }
  }

  // 离开直播间
  async leaveLive() {
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
      socket.emit(id, ctx.helper.parseMsg('error', msg, { notoast: true }))
      return
    }

    const room = 'live_' + live_id
    //用户离开房间
    socket.leave(room)
    const rooms = [room]

    // 更新redis
    console.log('useList_' + room)
    let list = await service.cache.get('userList_' + room)
    console.log('移除前')
    console.log(list)
    if (list) {
      list = list.filter((item) => item.id !== user.id)
      service.cache.set('userList_' + room, list)
    }
    console.log('移除后')
    console.log(list)

    //更新在线用户列表
    nsp.adapter.clients(rooms, (err, clients) => {
      nsp.to(room).emit('online', {
        clients,
        action: 'leave',
        user: {
          id: user.id,
          name: user.username,
          avatar: user.avatar,
        },
        data: list,
      })
    })
  }
}

module.exports = NspController

// 'use strict'
//  const Controller = require('egg').Controller

//  class NspController extends Controller{
//      async test(){
//         const {ctx, app} = this
//         //前端传来的参数
//         let message = ctx.args[0]
//         console.log(message)

//         //当前的socket连接
//         const socket = ctx.socket
//         //取得socket的id
//         const id = socket.id
//         //向这个socket发送消息
//         socket.emit(id, '发送来自后端的消息')
//      }
//  }

// //  module.exports = NspController
