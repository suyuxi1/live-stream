(this["webpackJsonp"]=this["webpackJsonp"]||[]).push([["app-service"],{"00f0":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r={data:function(){return{}},methods:{}};e.default=r},"0de9":function(t,e,n){"use strict";function r(t){var e=Object.prototype.toString.call(t);return e.substring(8,e.length-1)}function i(){return"string"===typeof __channelId__&&__channelId__}function o(t){for(var e=arguments.length,n=new Array(e>1?e-1:0),r=1;r<e;r++)n[r-1]=arguments[r];console[t].apply(console,n)}function c(){for(var t=arguments.length,e=new Array(t),n=0;n<t;n++)e[n]=arguments[n];var o=e.shift();if(i())return e.push(e.pop().replace("at ","uni-app:///")),console[o].apply(console,e);var c=e.map((function(t){var e=Object.prototype.toString.call(t).toLowerCase();if("[object object]"===e||"[object array]"===e)try{t="---BEGIN:JSON---"+JSON.stringify(t)+"---END:JSON---"}catch(i){t="[object object]"}else if(null===t)t="---NULL---";else if(void 0===t)t="---UNDEFINED---";else{var n=r(t).toUpperCase();t="NUMBER"===n||"BOOLEAN"===n?"---BEGIN:"+n+"---"+t+"---END:"+n+"---":String(t)}return t})),s="";if(c.length>1){var u=c.pop();s=c.join("---COMMA---"),0===u.indexOf(" at ")?s+=u:s+="---COMMA---"+u}else s=c[0];console[o](s)}n.r(e),n.d(e,"log",(function(){return o})),n.d(e,"default",(function(){return c}))},1451:function(t,e,n){"use strict";n.r(e);var r=n("37c9"),i=n("193c");for(var o in i)"default"!==o&&function(t){n.d(e,t,(function(){return i[t]}))}(o);var c,s=n("f0c5"),u=Object(s["a"])(i["default"],r["b"],r["c"],!1,null,null,null,!1,r["a"],c);e["default"]=u.exports},"17e9":function(t,e,n){"use strict";n("efa8");var r=o(n("8bbf")),i=o(n("1ac7"));function o(t){return t&&t.__esModule?t:{default:t}}function c(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);e&&(r=r.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),n.push.apply(n,r)}return n}function s(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?c(Object(n),!0).forEach((function(e){u(t,e,n[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):c(Object(n)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))}))}return t}function u(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}r.default.config.productionTip=!1,i.default.mpType="app";var a=new r.default(s({},i.default));a.$mount()},"193c":function(t,e,n){"use strict";n.r(e);var r=n("00f0"),i=n.n(r);for(var o in r)"default"!==o&&function(t){n.d(e,t,(function(){return r[t]}))}(o);e["default"]=i.a},"1a70":function(t,e,n){"use strict";var r;n.d(e,"b",(function(){return i})),n.d(e,"c",(function(){return o})),n.d(e,"a",(function(){return r}));var i=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("view",[r("swiper",{attrs:{_i:1}},[r("swiper-item",[r("image",{attrs:{src:t._$s(3,"a-src",n("2767")),_i:3}})]),r("swiper-item",[r("image",{attrs:{src:t._$s(5,"a-src",n("3edd")),_i:5}})])]),r("view",{staticClass:t._$s(6,"sc","flex flex-wrap"),attrs:{_i:6}},t._l(t._$s(7,"f",{forItems:t.list}),(function(e,n,i,o){return r("list-item",{key:t._$s(7,"f",{forIndex:i,key:n}),staticClass:t._$s("7-"+o,"sc","list-item p"),attrs:{item:e,_i:"7-"+o},on:{click:function(n){return t.openLive(e)}}})})),1)])},o=[]},"1ac7":function(t,e,n){"use strict";n.r(e);var r=n("a63e");for(var i in r)"default"!==i&&function(t){n.d(e,t,(function(){return r[t]}))}(i);var o,c,s,u,a=n("f0c5"),l=Object(a["a"])(r["default"],o,c,!1,null,null,null,!1,s,u);e["default"]=l.exports},"1c26":function(t,e,n){"use strict";n.r(e);var r=n("3b2d"),i=n.n(r);for(var o in r)"default"!==o&&function(t){n.d(e,t,(function(){return r[t]}))}(o);e["default"]=i.a},2767:function(t,e){t.exports="/static/banner/1.jpg"},"286a":function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={onLaunch:function(){t("log","App Launch"," at App.vue:4");var e=weex.requireModule("dom");e.addRule("fontFace",{fontFamily:"iconfont",src:"url('http://at.alicdn.com/t/font_1859985_7mxozsfdvib.ttf')"}),uni.onTabBarMidButtonTap((function(){t("log","\u70b9\u51fb\u4e86\u4e2d\u95f4\u6309\u94ae"," at App.vue:12")}))},onShow:function(){t("log","App Show"," at App.vue:16")},onHide:function(){t("log","App Hide"," at App.vue:19")}};e.default=n}).call(this,n("0de9")["default"])},3665:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r=i(n("3eda"));function i(t){return t&&t.__esModule?t:{default:t}}var o={components:{listItem:r.default},data:function(){return{list:[{gold:10,likes:520,title:"CCTV-3",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8",state:1},{gold:10,likes:530,title:"CCTV-6",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8",state:0},{gold:10,likes:540,title:"CCTV-10",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/cctv10hd.m3u8",state:1},{gold:10,likes:550,title:"\u9ad8\u6e05\u7535\u5f71",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/chchd.m3u8",state:0},{gold:10,likes:560,title:"\u6e56\u5357\u536b\u89c6",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/hunanhd.m3u8",state:1},{gold:10,likes:570,title:"\u5e7f\u4e1c\u536b\u89c6",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/gdhd.m3u8",state:1},{gold:10,likes:580,title:"\u91d1\u9e70\u7eaa\u5b9e",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/gedocu.m3u8",state:0},{gold:10,likes:590,title:"\u9ed1\u9f99\u6c5f",cover:"http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4",url:"http://ivi.bupt.edu.cn/hls/hljhd.m3u8",state:0}]}},onLoad:function(){},methods:{openLive:function(e){t("log","\u89c6\u9891\u5730\u5740"+e.url," at pages/index/index.vue:98"),uni.navigateTo({url:"../live/live?url="+e.url})}}};e.default=o}).call(this,n("0de9")["default"])},"37c9":function(t,e,n){"use strict";var r;n.d(e,"b",(function(){return i})),n.d(e,"c",(function(){return o})),n.d(e,"a",(function(){return r}));var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("view")},o=[]},"3b2d":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r={props:{item:Object},data:function(){return{}}};e.default=r},"3eda":function(t,e,n){"use strict";n.r(e);var r=n("d828"),i=n("1c26");for(var o in i)"default"!==o&&function(t){n.d(e,t,(function(){return i[t]}))}(o);var c,s=n("f0c5"),u=Object(s["a"])(i["default"],r["b"],r["c"],!1,null,null,null,!1,r["a"],c);e["default"]=u.exports},"3edd":function(t,e){t.exports="/static/banner/2.jpg"},"8bbf":function(t,e){t.exports=Vue},"8d56":function(t,e,n){"use strict";n.r(e);var r=n("3665"),i=n.n(r);for(var o in r)"default"!==o&&function(t){n.d(e,t,(function(){return r[t]}))}(o);e["default"]=i.a},a63e:function(t,e,n){"use strict";n.r(e);var r=n("286a"),i=n.n(r);for(var o in r)"default"!==o&&function(t){n.d(e,t,(function(){return r[t]}))}(o);e["default"]=i.a},c910:function(t,e,n){"use strict";n.r(e);var r=n("1a70"),i=n("8d56");for(var o in i)"default"!==o&&function(t){n.d(e,t,(function(){return i[t]}))}(o);var c,s=n("f0c5"),u=Object(s["a"])(i["default"],r["b"],r["c"],!1,null,null,null,!1,r["a"],c);e["default"]=u.exports},d828:function(t,e,n){"use strict";var r;n.d(e,"b",(function(){return i})),n.d(e,"c",(function(){return o})),n.d(e,"a",(function(){return r}));var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("view",{attrs:{_i:0},on:{click:function(e){return t.$emit("click")}}},[n("image",{staticClass:t._$s(1,"sc","rounded"),attrs:{src:t._$s(1,"a-src",t.item.cover),_i:1}}),n("view",{staticClass:t._$s(2,"sc","rounded-circle px-2 flex align-center"),attrs:{_i:2}},[n("text",{staticClass:t._$s(3,"sc","iconfont iconbizhongguanli text-warning mr-1"),attrs:{_i:3}}),n("text",{staticClass:t._$s(4,"sc","text-white font"),attrs:{_i:4}},[t._v(t._$s(4,"t0-0",t._s(t.item.gold)))])]),n("view",{staticClass:t._$s(5,"sc","rounded-circle px-2 flex align-center"),attrs:{_i:5}},[n("text",{staticClass:t._$s(6,"sc","font-sm text-white"),attrs:{_i:6}}),n("text",{staticClass:t._$s(7,"sc","text-white font-sm"),attrs:{_i:7}},[t._v(t._$s(7,"t0-0",t._s(t.item.likes)))])]),n("view",{staticClass:t._$s(8,"sc","rounded-circle flex align-center"),attrs:{_i:8}},[n("text",{staticClass:t._$s(9,"sc","font text-white"),attrs:{_i:9}},[t._v(t._$s(9,"t0-0",t._s(t.item.title)))])]),n("view",{staticClass:t._$s(10,"sc","rounded-circle px-2 flex align-center"),attrs:{_i:10}},[n("text",{staticClass:t._$s(11,"sc","rounded-circle  mr-1"),class:t._$s(11,"c",1===t.item.state?"bg-success":"bg-danger"),attrs:{_i:11}}),n("text",{staticClass:t._$s(12,"sc","text-white font-sm"),attrs:{_i:12}},[t._v(t._$s(12,"t0-0",t._s(1===t.item.state?"\u76f4\u64ad\u4e2d":"\u5df2\u7ed3\u675f")))])])])},o=[]},efa8:function(t,e,n){"undefined"===typeof Promise||Promise.prototype.finally||(Promise.prototype.finally=function(t){var e=this.constructor;return this.then((function(n){return e.resolve(t()).then((function(){return n}))}),(function(n){return e.resolve(t()).then((function(){throw n}))}))}),uni.restoreGlobal&&uni.restoreGlobal(weex,plus,setTimeout,clearTimeout,setInterval,clearInterval),__definePage("pages/index/index",(function(){return Vue.extend(n("c910").default)})),__definePage("pages/my/my",(function(){return Vue.extend(n("1451").default)}))},f0c5:function(t,e,n){"use strict";function r(t,e,n,r,i,o,c,s,u,a){var l,f="function"===typeof t?t.options:t;if(u){f.components||(f.components={});var d=Object.prototype.hasOwnProperty;for(var p in u)d.call(u,p)&&!d.call(f.components,p)&&(f.components[p]=u[p])}if(a&&((a.beforeCreate||(a.beforeCreate=[])).unshift((function(){this[a.__module]=this})),(f.mixins||(f.mixins=[])).push(a)),e&&(f.render=e,f.staticRenderFns=n,f._compiled=!0),r&&(f.functional=!0),o&&(f._scopeId="data-v-"+o),c?(l=function(t){t=t||this.$vnode&&this.$vnode.ssrContext||this.parent&&this.parent.$vnode&&this.parent.$vnode.ssrContext,t||"undefined"===typeof __VUE_SSR_CONTEXT__||(t=__VUE_SSR_CONTEXT__),i&&i.call(this,t),t&&t._registeredComponents&&t._registeredComponents.add(c)},f._ssrRegister=l):i&&(l=s?function(){i.call(this,this.$root.$options.shadowRoot)}:i),l)if(f.functional){f._injectStyles=l;var A=f.render;f.render=function(t,e){return l.call(e),A(t,e)}}else{var v=f.beforeCreate;f.beforeCreate=v?[].concat(v,l):[l]}return{exports:t,options:f}}n.d(e,"a",(function(){return r}))}},[["17e9","app-config"]]]);