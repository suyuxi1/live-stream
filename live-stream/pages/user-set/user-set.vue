<template>
	<view>
		<f-list-item title="账号与安全"></f-list-item>
		<f-list-item title="资料编辑"></f-list-item>
		<f-list-item title="清除缓存"></f-list-item>
		<f-list-item title="意见反馈"></f-list-item>
		<f-list-item title="关于直播"></f-list-item>
		<view class="p-3 flex align-center justify-center">
			<view class="bg-main rounded-circle p-3 flex align-center justify-center flex-1" hover-class="bg-main-hover" @click="logout">
				<text class="text-white font-md">退出登录</text>
			</view>
		</view>
	</view>
</template>

<script>
import fListItem from '../../components/common/f-list-item.vue';
export default {
	components: {
		fListItem
	},
	data() {
		return {};
	},
	methods: {
		logout() {
			this.$store.dispatch('logout').then(res => {
				uni.showToast({
					title: '退出成功',
					icon: 'none'
				});
				uni.navigateTo({
					url: '../login/login'
				});
			});
		}
	}
};
</script>

<style></style>
