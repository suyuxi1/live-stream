'use strict'

const await = require('await-stream-ready/lib/await')

const Controller = require('egg').Controller

class UserController extends Controller {

  /**
     * 第三方登录
     */
    async otherLogin() {
      //获取上下文
      let { ctx, app } = this
      //验证数据
      ctx.validate({
          username: {
              type: 'string',
              required: true,
              range: {
                  min: 3,
                  max: 20,
              },
              desc: '用户名',
          },
          password: {
              type: 'string',
              // 默认密码 123456
              defValue: '123456',
              required: false,
              desc: '密码',
          },
          avatar: {
              type: 'string',
              required: true,
              desc: '头像',
          },
          wxid: {
              type: 'string',
              required: false,
              defValue: '',
              desc: '微信openId',
          },
          qqid: {
              type: 'string',
              required: false,
              defValue: '',
              desc: 'QQopenId',
          },
          wbid: {
              type: 'string',
              required: false,
              defValue: '',
              desc: '微博openId',
          },
      })

      let { username, password, avatar, wxid, qqid, wbid } = ctx.request.body
      let user = {}
      // 验证用户是否已经存在
      if (!wxid) {
          user = await app.model.User.findOne({
              where: {
                  wxid,
              },
          })
      }
      if (!qqid) {
          user = await app.model.User.findOne({
              where: {
                  qqid,
              },
          })
      }
      if (!wbid) {
          user = await app.model.User.findOne({
              where: {
                  wbid,
              },
          })
      }
      console.log(JSON.stringify(user))
      if (!user) {
          user = await app.model.User.create({
              username,
              password,
              avatar,
              wxid,
              qqid,
              wbid,
          })
          if (!user) {
              ctx.throw(400, '创建用户失败')
          }
      }
      user = JSON.parse(JSON.stringify(user))
      console.log(user)
      // 生成token
      user.token = ctx.getToken(user)
      delete user.password

      // 加入到存储中
      if (!(await this.service.cache.set('user_' + user.id, user.token))) {
          ctx.throw(400, '登录失败')
      }
      ctx.apiSuccess(user)
  }

  // 手机短信登录
  async phoneLogin() {
    const { ctx, app, service } = this
    // 参数验证
    ctx.validate({
      phone: {
        type: 'string',
        required: true,
        desc: '手机号',
      },
      code: {
        type: 'number',
        required: true,
        desc: '验证码',
      },
    })
    let { phone, code } = ctx.request.body
    let user = await app.model.User.findOne({
      where: {
        phone,
      },
    })
    //取出redis中的验证码
    let res = await service.cache.get('code')
    console.log('redis中的code' + res.toString())
    console.log('前端发送的code的值是' + code)
    if (res.toString() !== code.toString()) {
      ctx.throw(400, '验证码不正确')
    }
    // 如果查不到，直接注册写入新数据
    if (!user) {
      user = await app.model.User.create({
        phone: phone,
        password: '123456',
        avatar: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2975996532,2425031589&fm=26&gp=0.jpg',
        coin: 100,
      })
      // ctx.throw(400, '该用户不存在')
    }
    user = JSON.parse(JSON.stringify(user))
    console.log(user)
    // 生成token
    user.token = ctx.getToken(user)
    delete user.password


    // 加入到存储中
    if (!(await this.service.cache.set('user_' + user.id, user.token))) {
      ctx.throw(400, '登录失败')
    }
    ctx.apiSuccess(user)
  }
  // 注册
  async reg() {
    let { ctx, app } = this
    ctx.validate({
      username: {
        type: 'string',
        required: true,
        range: {
          min: 5,
          max: 20,
        },
        desc: '用户名',
      },
      password: {
        type: 'string',
        required: true,
        desc: '密码',
      },
      repassword: {
        type: 'string',
        required: true,
        desc: '确认密码',
      },
    })

    let { username, password, repassword } = ctx.request.body

    if (password !== repassword) {
      ctx.throw(422, '密码和确认密码不一致')
    }

    // 验证用户是否已经存在
    if (
      await app.model.User.findOne({
        where: {
          username,
        },
      })
    ) {
      ctx.throw(400, '该用户名已存在')
    }

    let user = await app.model.User.create({
      username,
      password,
    })

    if (!user) {
      ctx.throw(400, '创建用户失败')
    }

    ctx.apiSuccess(user)
  }

  // 登录
  async login() {
    const { ctx, app } = this
    // 参数验证
    ctx.validate({
      username: {
        type: 'string',
        required: true,
        desc: '用户名',
      },
      password: {
        type: 'string',
        required: true,
        desc: '密码',
      },
    })
    

    let { username, password } = ctx.request.body
    // let user = await this.app.model.query('select * from user where phone = ? or username = ?', [username, username])
    let user = await app.model.User.findOne({
      where: {
        username : username,
      },
    })
    

    if (!user) {
      ctx.throw(400, '该用户不存在')
    }

    // 验证密码
    await ctx.checkPassword(password, user.password)

    user = JSON.parse(JSON.stringify(user))

    console.log(user)

    // 生成token
    user.token = ctx.getToken(user)
    delete user.password

    // 加入到存储中
    if (!(await this.service.cache.set('user_' + user.id, user.token))) {
      ctx.throw(400, '登录失败')
    }

    ctx.apiSuccess(user)
  }

  //退出登录
  async logout() {
    const { ctx, service } = this
    let current_user_id = ctx.authUser.id

    if (!(await service.cache.remove('user_' + current_user_id))) {
      ctx.throw(400, '退出登录失败')
    }
    ctx.apiSuccess('ok')
  }

  //获取当前用户信息
  async info() {
    const { ctx } = this
    let user = JSON.parse(JSON.stringify(ctx.authUser))
    delete user.password
    ctx.apiSuccess(user)
  }
}

module.exports = UserController
