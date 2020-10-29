<script>
export default {
	onLaunch: function() {
		console.log('App Launch');
		//监听底部导航中间凸起按钮
		uni.onTabBarMidButtonTap(() => {
			console.log('点击中间按钮');
		});
	},
	onShow: function() {
		console.log('App Show');
	},
	onHide: function() {
		console.log('App Hide');
	}
};
</script>

<style>
/*每个页面公共css */
/* 引用自定义的iconfont样式 */
/* #ifndef APP-PLUS-NVUE */
@import url('./common/icon.css');
/* #endif */
/* 动画库 */
/* @import url("./common/animate.css"); */
/* 自定义样式库 */
@import url('./common/free.css');
/* 全局样式 */
@import url('./common/common.css');
</style>
