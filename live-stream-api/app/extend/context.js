'use strict'

const crypto = require('crypto')
module.exports = {
  // 成功提示
  apiSuccess(data = '', msg = 'ok', code = 200) {
    this.body = { msg, data }
    this.status = code
  },
  // 失败提示
  apiFail(data = '', msg = 'fail', code = 400) {
    this.body = { msg, data }
    this.status = code
  },
  // 生成token
  getToken(value) {
    return this.app.jwt.sign(value, this.app.config.jwt.secret)
  },
  // 页面失败提示
  async pageFail(data = '', code = 404) {
    return await this.render('admin/common/404.html', {
      data,
      code,
    })
  },
  // 验证token
  checkToken(token) {
    return this.app.jwt.verify(token, this.app.config.jwt.secret)
  },
  // 验证密码
  async checkPassword(password, hash_password) {
    // 先对需要验证的密码进行加密
    const hmac = crypto.createHash('sha256', this.app.config.crypto.secret)
    hmac.update(password)
    password = hmac.digest('hex')
    let res = password === hash_password
    if (!res) {
      this.throw(400, '密码错误')
    }
    return true
  },
  // 生成随机字符串
  randomString(length) {
    const chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    var result = ''
    for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)]
    return result
  },
  // 生成唯一ID
  genID(length) {
    return Number(Math.random().toString().substr(3, length) + Date.now()).toString(36)
  },
  // 是否是移动端访问
  ismobile() {
    let userAgent = this.request.header['user-agent'].toLowerCase()
    let pat_phone = /ipad|iphone os|midp|rv:1.2.3.4|ucweb|android|windows ce|windows mobile/
    return pat_phone.test(userAgent)
  },
  // 分页
  async page(modelName, where = {}, options = {}) {
    let page = this.query.page ? parseInt(this.query.page) : 1
    let limit = this.query.limit ? parseInt(this.query.limit) : 10
    let offset = (page - 1) * limit

    if (!options.order) {
      options.order = [['id', 'DESC']]
    }

    let res = await this.app.model[modelName].findAndCountAll({
      where,
      offset,
      limit,
      ...options,
    })

    // 总页数
    let totalPage = Math.ceil(res.count / limit)

    let query = { ...this.query }
    if (query.hasOwnProperty('page')) {
      delete query.page
    }
    if (query.hasOwnProperty('limit')) {
      delete query.limit
    }

    // 对象转&拼接字符串
    const urlEncode = (param, key, encode) => {
      if (param == null) return ''
      var paramStr = ''
      var t = typeof param
      if (t == 'string' || t == 'number' || t == 'boolean') {
        paramStr += '&' + key + '=' + (encode == null || encode ? encodeURIComponent(param) : param)
      } else {
        for (var i in param) {
          var k = key == null ? i : key + (param instanceof Array ? '[' + i + ']' : '.' + i)
          paramStr += urlEncode(param[i], k, encode)
        }
      }
      return paramStr
    }

    query = urlEncode(query)

    let pageEl = ''
    for (let index = 1; index <= totalPage; index++) {
      let active = ''
      if (page === index) {
        active = 'active'
      }
      pageEl += `
        <li class="page-item ${active}">
        <a class="page-link" href="?page=${index}&limit=${limit}${query}">${index}</a></li>
        `
    }

    const preDisabled = page <= 1 ? 'disabled' : ''
    const nextDisabled = page >= totalPage ? 'disabled' : ''

    let pageRender = `
    <ul class="pagination">
        <li class="page-item ${preDisabled}">
            <a class="page-link" href="?page=${page - 1}&limit=${limit}${query}" aria-label="Previous">
                <span aria-hidden="true">«</span>
                <span class="sr-only">Previous</span>
            </a>
        </li>
        ${pageEl}
        <li class="page-item ${nextDisabled}">
            <a class="page-link" href="?page=${page + 1}&limit=${limit}${query}" aria-label="Next">
                <span aria-hidden="true">»</span>
            <span class="sr-only">Next</span>
            </a>
        </li>
    </ul>
    `
    this.locals.pageRender = pageRender
    return res.rows
  },
  randomString(length) {
    const chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    var result = ''
    for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)]
    return result
  },
  // 渲染公共模板
  async renderTemplate(params = {}) {
    let toast = this.cookies.get('toast', {
      encrypt: true,
    })
    params.toast = toast ? JSON.parse(toast) : null
    return await this.render('admin/common/template.html', params)
  },
  toast(msg, type = 'danger') {
    this.cookies.set(
      'toast',
      JSON.stringify({
        msg,
        type,
      }),
      {
        maxAge: 1500,
        encrypt: true,
      }
    )
  },
}
