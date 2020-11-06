<template>
	<view class="container">
		<view class="ml-5" style="position: fixed;" @click="goback"><text class="iconfont text-white">&#xe607;</text></view>
		<!-- 头部 -->
		<view class="flex align-center justify-center" style="height: 300rpx;">
			<text style="font-size: 50rpx;" class="text-light">{{ loginType === '手机' ? '手机验证码登录' : '账号密码登录' }}</text>
		</view>
		<!-- 输入框 -->
		<view class="px-3">
			<view class="flex align-center border-bottom my-1">
				<text v-if="loginType === '手机'" class="text-white mr-3">+86</text>
				<input
					:type="loginType === '手机' ? 'number' : 'text'"
					v-model="changeAccount"
					class="font text-white"
					:placeholder="loginType === '手机' ? '请输入手机号' : '昵称/手机/邮箱'"
					placeholder-style="color: #ffffff;"
					style="height: 100rpx;"
					value=""
				/>
			</view>
			<view class="flex align-center justify-center border-bottom my-5">
				<input
					:type="loginType === '手机' ? 'number' : 'password'"
					v-model="changeVerify"
					class="font text-white"
					:placeholder="loginType === '手机' ? '请输入验证码' : '请输入密码'"
					placeholder-style="color: #ffffff;"
					style="height: 100rpx;"
					value=""
				/>
				<button v-if="loginType === '手机'" plain :disabled="this.codeBtn.disabled" class="mr-0" style="border: none ;color: #eaeaea; font-size: 30rpx;" @tap="sendCode">
					{{ codeBtn.text }}
				</button>
				<button v-else plain class="mr-0" style="border: none ;color: #eaeaea; font-size: 30rpx;">忘记密码</button>
			</view>
		</view>

		<!-- 登录按钮 -->
		<view class="p-3 flex align-center justify-center">
			<view class="bg-main rounded p-3 flex align-center justify-center flex-1" hover-class="bg-main-hover" @click="login">
				<text class="text-white font-md">登 录</text>
			</view>
		</view>

		<!-- 切换登录方式 -->
		<view class="flex align-center justify-center my-2">
			<text class="text-white px-1" @click="changeLoginType">{{ loginType === '手机' ? '账号密码登录' : '验证码登录' }}</text>
			<text class="text-white px-1">|</text>
			<text class="text-white px-1">登录遇到问题</text>
		</view>
		<view class="flex align-center justify-center my-5"><text class="text-light-muted">————社交账号登录————</text></view>

		<!-- 第三方登录 -->
		<view class="flex align-center justify-center " style="width: 750rpx; height: 120rpx;">
			<image
				v-for="(item, index) in otherLoginList"
				:key="index"
				style="width: 100rpx; height: 100rpx;"
				class="rounded-circle px-5"
				:src="item.image"
				@click="otherLogin(item)"
			></image>
		</view>
		<view class="flex align-center justify-center my-5">
			<text class="text-light-muted">注册代表您同意</text>
			<text class="text-white">《XXX社区协议》</text>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			loginType: '账密',
			/* 第三方登录 */
			otherLoginList: [
				{
					type: 'weixin',
					openId: 'wxid',
					image: '../../static/login/wx.png'
				},
				{
					type: 'qq',
					openId: 'qqid',
					image: '../../static/login/qq.png'
				},
				{
					type: 'sinaweibo',
					openId: 'wbid',
					image: '../../static/login/wb.png'
				}
			],
			//获取验证码
			codeBtn: {
				text: '获取验证码',
				seconds: 10,
				disabled: false
			},
			phoneLogin: {
				phone: 13457513856,
				code: ''
			},
			from: {
				username: 'sususu1',
				password: '123456',
				repassword: ''
			}
		};
	},
	computed: {
		changeAccount: {
			get() {
				return this.loginType === '手机' ? this.phoneLogin.phone : this.from.username;
			},
			set(val) {
				this.loginType === '手机' ? (this.phoneLogin.phone = val) : (this.from.username = val);
			}
		},
		changeVerify: {
			get() {
				return this.loginType === '手机' ? this.phoneLogin.code : this.from.password;
			},
			set(val) {
				this.loginType === '手机' ? (this.phoneLogin.code = val) : (this.from.password = val);
			}
		}
	},

	methods: {
		/**
		 * 第三方登录
		 * @param {Object} item
		 */
		otherLogin(item) {
			// 不同第三方登录，只需要更改 provider 的值即可
			console.log('第三方登录的类型是》》》》》》》》》》》》》');
			console.log(item);
			uni.login({
				provider: item.type,
				success: loginRes => {
					uni.getUserInfo({
						provider: item.type,
						success: infoRes => {
							// 统一的登录请求参数
							console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>请求得到的数据：');
							console.log(infoRes);
							let user = {
								[item.openId]: infoRes.userInfo.openId,
								username: infoRes.userInfo.nickName,
								avatar: infoRes.userInfo.avatarUrl
							};
							console.log(user);
							// 统一调用登录方法
							this.userLogin(user);
							item: null;
						},
						fail() {
							console.log('请求失败');
						}
					});
				}
			});
		},
		/**
		 * 统一登录的方法
		 * @param {Object} loginDTO
		 */
		async userLogin(user) {
			uni.showLoading({
				title: '登录中'
			});
			/**
			 * 此处调用第三方登录接口
			 */
			this.$H.post('/otherlogin', user).then(res => {
				if (res.id) {
					this.$store.dispatch('login', res);
					uni.showToast({
						title: '登录成功'
					});
					setTimeout(() => {
						uni.switchTab({
							url: '../index/index'
						});
						uni.hideLoading();
					}, 2000);
				} else {
					uni.showToast({
						title: '登录失败'
					});
				}
				console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>接口返回得到的数据：');
				console.log(res);
			});
		},

		//手机号或账密login登录
		login(user) {
			//手机号登录
			if (this.loginType === '手机') {
				console.log(this.phoneLogin.phone);
				this.$H.post('/phoneLogin', this.phoneLogin).then(res => {
					uni.showToast({
						title: '登录成功',
						icon: 'none'
					});
					this.$store.dispatch('login', res);
					uni.navigateBack({
						delta: 1
					});
				});
			} else {
				//账密登录
				console.log(this.from);
				this.$H.post('/login', this.from).then(res => {
					uni.showToast({
						title: '登录成功',
						icon: 'none'
					});
					this.$store.dispatch('login', res);
					uni.navigateBack({
						delta: 1
					});
					console.log(res.data.data);
				});
			}
		},
		changeLoginType() {
			this.loginType = this.loginType === '手机' ? '账密' : '手机';
		},
		//获取验证码，倒计时
		sendCode() {
			//调用获取验证码方法
			this.getcode();
			// this.codeBtn.waitingCode = true;
			this.codeBtn.disabled = true;
			this.codeBtn.text = this.codeBtn.seconds + 'S后重新发送';
			let countdown = setInterval(() => {
				this.codeBtn.seconds--;
				this.codeBtn.text = this.codeBtn.seconds + 'S后重新发送';
				if (this.codeBtn.seconds < 0) {
					this.codeBtn.disabled = false;
					clearInterval(countdown);
					this.codeBtn.seconds = 10;
					this.codeBtn.text = '重新发送';
				}
			}, 1000);
		},
		// 调用获取验证码接口
		async getcode() {
			// console.log(this.phoneLogin.phone);
			this.$H.post('/sendcode', this.phoneLogin).then(res => {
				uni.showToast({
					title: '已发送',
					icon: 'none'
				});
			});
			// console.log(res.data);
		},
		//返回上一层页面
		goback() {
			uni.navigateBack({});
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
