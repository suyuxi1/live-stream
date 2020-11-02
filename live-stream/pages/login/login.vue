<template>
	<view class="container">
		<view class="flex align-center justify-center" style="height: 300rpx;">
			<text style="font-size: 50rpx;" class="text-light">{{ loginType === '手机' ? '手机验证码登录' : '账号密码登录' }}</text>
		</view>
		<view class="px-3">
			<view class="flex align-center border-bottom my-1">
				<text v-if="loginType === '手机'" class="text-white mr-3">+86</text>
				<input
					type="number"
					v-model="from.username"
					class="font text-white"
					:placeholder="loginType === '手机' ? '请输入手机号' : '昵称/手机/邮箱'"
					placeholder-style="color: #ffffff;"
					style="height: 100rpx;"
					value=""
				/>
			</view>
			<view class="flex align-center justify-center border-bottom my-5">
				<input
					type="password"
					v-model="from.password"
					class="font text-white"
					:placeholder="loginType === '手机' ? '请输入验证码' : '请输入密码'"
					placeholder-style="color: #ffffff;"
					style="height: 100rpx;"
					value=""
				/>
				<button plain class="mr-0" style="border: none ;color: #eaeaea; font-size: 30rpx;">{{ loginType === '手机' ? '获取验证码' : '忘记密码' }}</button>
			</view>
		</view>
		<view class="p-3 flex align-center justify-center">
			<view class="bg-main rounded p-3 flex align-center justify-center flex-1" hover-class="bg-main-hover"><text class="text-white font-md">登 录</text></view>
		</view>
		<view class="flex align-center justify-center my-2">
			<text class="text-white px-1" @click="changeLoginType">{{ loginType === '手机' ? '账号密码登录' : '验证码登录' }}</text>
			<text class="text-white px-1">|</text>
			<text class="text-white px-1">登录遇到问题</text>
		</view>
		<view class="flex align-center justify-center my-5"><text class="text-light-muted">————社交账号登录————</text></view>

		<view class="flex align-center justify-center " style="width: 750rpx; height: 120rpx;">
			<image src="../../static/login/wx.png" style="width: 100rpx; height: 100rpx;" class="rounded-circle px-5" mode=""></image>
			<image src="../../static/login/qq.png" style="width: 100rpx; height: 100rpx;" class="rounded-circle px-5" mode=""></image>
			<image src="../../static/login/wb.png" style="width: 100rpx; height: 100rpx;" class="rounded-circle px-5" mode=""></image>
		</view>
		<view class="flex align-center justify-center my-5">
			<text class="text-light-muted">注册代表您同意</text>
			<text class="text-white">《XXX社区协议》</text>
		</view>

		<!-- <view class="flex align-center justify-center" style="height: 350rpx;"><text style="font-size: 50rpx;" class="text-light">LIVE-SHOW</text></view>
		<view class="px-3">
			<input
				type="text"
				v-model="from.username"
				class="px-3 mb-4 font rounded border text-white"
				placeholder="请输入用户名"
				placeholder-style="color: #ffffff;"
				style="height: 100rpx;"
				value=""
			/>
			<input
				type="password"
				v-model="from.password"
				class="px-3 mb-4 font rounded border text-white"
				placeholder="请输入密码"
				placeholder-style="color: #ffffff;"
				style="height: 100rpx;"
				value=""
			/>
			<input
				v-if="type != 'login'"
				type="password"
				v-model="from.repassword"
				class="px-3 mb-4 font rounded border text-white"
				placeholder="请输入确认密码"
				placeholder-style="color: #ffffff;"
				style="height: 100rpx;"
				value=""
			/>
		</view>
		<view class="p-3 flex align-center justify-center" @click="submit">
			<view class="bg-main rounded p-3 flex align-center justify-center flex-1" hover-class="bg-main-hover">
				<text class="text-white font-md">{{ type === 'login' ? '登 录' : '注册' }}</text>
			</view>
		</view>
		<view class="flex align-center justify-center">
			<text class="text-light-muted font p-2" @click="changeType">{{ type === 'login' ? '注册账号' : '去登录' }}</text>
		</view> -->
	</view>
</template>

<script>
export default {
	data() {
		return {
			loginType: '手机',
			type: 'login',
			from: {
				username: '',
				password: '',
				repassword: ''
			}
		};
	},
	methods: {
		changeLoginType() {
			this.loginType = this.loginType === '手机' ? '账密' : '手机';
		},
		changeType() {
			this.type = this.type === 'login' ? 'reg' : 'login';
		},
		submit() {
			let msg = this.type === 'login' ? '登录' : '注册';
			this.$H.post('/' + this.type, this.from).then(res => {
				uni.showToast({
					title: msg + '成功',
					icon: 'none'
				});
				if (this.type === 'reg') {
					this.changeType();
					this.form = {
						username: '',
						password: '',
						repassword: ''
					};
				} else {
					this.$store.dispatch('login', res);
					uni.navigateBack({
						delta: 1
					});
				}
			});
		}
	}
};
</script>

<style>
.container {
	width: 750rpx;
	/* height: 100%; */
	height: 100vh;
	margin: 0;
	padding: 100rpx 0 0 0;
	background-size: cover;
	background-image: linear-gradient(to bottom, #ba7ace 0%, #8745ff 100%);
}
</style>
