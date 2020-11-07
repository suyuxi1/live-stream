1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
279
280
281
282
283
284
285
286
287
288
289
290
291
292
293
294
295
296
297
298
299
300
301
302
303
304
305
306
307
308
309
310
311
312
313
314
315
316
317
318
;('use strict')

const await = require('await-stream-ready/lib/await')

const Controller = require('egg').Controller

class LiveController extends Controller {
  async index() {
    const { ctx, app } = this
    let tabs = [
      {
        name: '全部',
        url: '/admin/live',
        active: false,
      },
      {
        name: '直播中',
        url: '?status=1',
        status: 1,
        active: false,
      },
      {
        name: '未开播',
        url: '?status=0',
        status: 0,
        active: false,
      },
      {
        name: '直播结束',
        url: '?status=3',
        status: 3,
        active: false,
      },
    ]
    let where = !ctx.query.status && ctx.query.status != 0 ? {} : { status: ctx.query.status }
    let data = await ctx.page('Live', where, {
      include: [
        {
          model: app.model.User,
          attributes: ['id', 'username'],
        },
      ],
    })
    tabs = tabs.map((item) => {
      if (
        (!ctx.query.status && ctx.query.status != 0 && item.url === '/admin/live') ||
        item.status == ctx.query.status
      ) {
        item.active = true
      }
      return item
    })
    data = JSON.parse(JSON.stringify(data))
    await ctx.renderTemplate({
      title: '直播间管理',
      tempType: 'table',
      table: {
        tabs,
        // 表头
        columns: [
          {
            title: '直播间',
            fixed: 'left',
            render(item) {
              return `<h2 class="table-avatar">
                        <a class="avatar mr-2"><img class="rounded" src="${item.cover}"></a>
                        <a>${item.title}<span>创建人:ceshi</span></a>
                        </h2>`
            },
          },
          {
            title: '观看人数',
            key: 'look_count',
            width: 180,
            fixed: 'center',
          },
          {
            title: '金币数',
            key: 'coin',
            width: 180,
            fixed: 'center',
          },
          {
            title: '创建时间',
            key: 'created_time',
            width: 180,
            fixed: 'center',
          },
          {
            title: '操作',
            width: 200,
            fixed: 'center',
            render(item) {
              let close = ''
              if (item.status !== 3) {
                close = `<a @click="modal('/admin/live/close/${item.id}','是否要关闭该直播间?')" class ="btn btn-sm bg-warning text-white">关闭直播</a>`
              }
              return `
                <div class ="actions btn-group btn-group-sm">
                <a @click="openInfo('/admin/live/look/${item.id}','观看记录')" class="btn btn-sm bg-primary text-white">观看记录</a>
                <a @click="openInfo('/admin/live/gift/${item.id}','礼物记录')" class="btn btn-sm bg-purple text-white">礼物记录</a>
                <a @click="openInfo('/admin/live/comment/${item.id}','弹幕记录')" class="btn btn-sm bg-success text-white">弹幕记录</a>
                ${close}
                <a @click="del('/admin/live/delete/${item.id}')" class="btn btn-sm bg-danger text-white">删除</a>
                </div>`
            },
          },
        ],
        data,
      },
    })
  }
  async update() {
    const { ctx, app } = this
    ctx.validate({
      id: {
        type: 'int',
        required: true,
      },
      name: {
        type: 'string',
        required: true,
      },
      image: {
        type: 'string',
      },
      coin: {
        type: 'int',
      },
    })
    const id = ctx.params.id
    const { name, image, coin } = ctx.request.body
    //   当前管理员是否存在
    const live = await app.model.Live.findOne({
      where: {
        id,
      },
    })
    if (!live) {
      return ctx.apiFail('该记录不存在')
    }
    live.name = name
    live.image = image
    live.coin = coin
    ctx.apiSuccess(await live.save())
  }
  async closelive() {
    const { ctx, app } = this
    const id = ctx.params.id
    const live = await app.model.Live.findOne({
      where: {
        id,
      },
    })
    if (!live) {
      ctx.toast('该直播间不存在', 'danger')
    } else if (live.status === 3) {
      ctx.toast('该直播间已结束', 'danger')
    } else {
      live.status = 3
      await live.save()
      ctx.toast('关闭成功', 'success')
    }
    ctx.redirect('/admin/live')
  }
  async delete() {
    const { ctx, app } = this
    const id = ctx.params.id
    await app.model.Live.destroy({
      where: {
        id,
      },
    })
    ctx.toast('删除成功', 'success')
    ctx.redirect(`/admin/live`)
  }
  //   观看记录
  async look() {
    const { ctx, app } = this
    const id = ctx.params.id
    const res = await app.model.LiveUser.findAll({
      where: {
        live_id: id,
      },
      include: [
        {
          model: app.model.User,
          attributes: ['id', 'username', 'avatar'],
        },
      ],
    })
    ctx.apiSuccess({
      ths: [
        {
          title: '用户名',
          key: 'username',
        },
        {
          title: '观看时间',
          key: 'created_time',
        },
      ],
      data: res.map((item) => {
        return {
          id: item.id,
          username: item.user.username,
          avatar: item.user.avatar,
          created_time: app.formatTime(item.created_time),
        }
      }),
    })
  }
  // 礼物记录
  async gift() {
    const { ctx, app } = this
    const id = ctx.params.id

    const res = await app.model.LiveGift.findAll({
      where: {
        live_id: id,
      },
      include: [
        {
          model: app.model.User,
          attributes: ['id', 'username', 'avatar'],
        },
        {
          model: app.model.Gift,
        },
      ],
    })

    ctx.apiSuccess({
      ths: [
        {
          title: '礼物名称',
          key: 'gift_name',
        },
        {
          title: '礼物图标',
          key: 'gift_image',
        },
        {
          title: '礼物金币',
          key: 'gift_coin',
        },
        {
          title: '赠送者',
          key: 'username',
        },
        {
          title: '赠送时间',
          key: 'created_time',
        },
      ],
      data: res.map((item) => {
        return {
          created_time: app.formatTime(item.created_time),
          gift_name: item.gift.name,
          gift_coin: item.gift.coin,
          gift_image: item.gift.image,
          usernameL: item.user.username,
          avatar: item.user.avatar,
        }
      }),
    })
  }

  // 弹幕记录
  async comment() {
    const { ctx, app } = this
    const id = ctx.params.id

    const res = await app.model.Comment.findAll({
      where: {
        live_id: id,
      },
      include: [
        {
          model: app.model.User,
          attributes: ['id', 'username', 'avatar'],
        },
      ],
    })

    ctx.apiSuccess({
      ths: [
        {
          title: '内容',
          key: 'content',
        },
        {
          title: '发送人',
          key: 'username',
        },
        {
          title: '发送时间',
          key: 'created_time',
        },
      ],
      data: res.map((item) => {
        return {
          content: item.content,
          created_time: app.formatTime(item.created_time),
          username: item.user.username,
          avatar: item.user.avatar,
        }
      }),
    })
  }
}
module.exports = LiveController
