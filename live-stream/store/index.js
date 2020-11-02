import Vue from 'vue'
import Vuex from 'vuex'

import $H from '../common/request.js'

Vue.use(Vuex)

export default new Vuex.Store({
	state: {
		test: 111,
		user: null,
		token: null
	},
	actions: {
		login({
			state
		}, user) {
			state.user = user
			state.token = user.token

			uni.setStorageSync('user', JSON.stringify(user))
			uni.setStorageSync('token', user.token)
		},
		logout({
			state
		}, user) {
			state.user = null
			state.token = null
		},
		getUserInfo({
			state
		}) {
			$H.get('/user/info', {
				token: true,
				noJump: true,
				toast: false
			}).then(res => {
				state.user = res
				uni.setStorage({
					key: "user",
					data: JSON.stringify(state.user)
				})
			})
		}
	}
})
