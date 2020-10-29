<template>
	<view @click="$emit('click')">
		<image :src="item.cover" mode="aspectFill" style="width: 365rpx; height: 365rpx;" class="rounded"></image>

		<view class="rounded-circle px-2 flex align-center" style="position: absolute; left: 15rpx; top: 15rpx; background-color: rgba(0,0,0,0.4);">
			<text class="iconfont iconbizhongguanli text-warning mr-1"></text>
			<text class="text-white font">{{ item.gold }}</text>
		</view>

		<view class="rounded-circle px-2 flex align-center" style="position: absolute; right: 15rpx; top: 15rpx; background-color: rgba(0,0,0,0.4);">
			<text class="font-sm text-white">人气：</text>
			<text class="text-white font-sm">{{ item.likes }}</text>
		</view>

		<view class="rounded-circle flex align-center" style="position: absolute; left: 15rpx; bottom: 15rpx;">
			<text class="font text-white">{{ item.title }}</text>
		</view>

		<view class="rounded-circle px-2 flex align-center" style="position: absolute; right: 15rpx; bottom: 15rpx; background-color: rgba(0,0,0,0.4);">
			<text class="rounded-circle  mr-1" style="width: 20rpx; height: 20rpx;" :class="item.state === 1 ? 'bg-success' : 'bg-danger'"></text>
			<text class="text-white font-sm">{{ item.state === 1 ? '直播中' : '已结束' }}</text>
		</view>
	</view>
</template>

<script>
export default {
	props: {
		item: Object
	},
	data() {
		return {};
	}
};
</script>

<style></style>
