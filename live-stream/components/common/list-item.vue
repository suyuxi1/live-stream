<template>
	<view @click="$emit('click')">
		<image :src="item.cover" mode="aspectFill" style="width: 365rpx; height: 365rpx;" class="rounded"></image>

		<view class="rounded-circle px-2 flex align-center" style="position: absolute; left: 15rpx; top: 15rpx; background-color: rgba(0,0,0,0.4);">
			<text class="iconfont iconbizhongguanli text-warning mr-1"></text>
			<text class="text-white font">{{ item.coin }}</text>
		</view>

		<view class="rounded-circle px-2 flex align-center" style="position: absolute; right: 15rpx; top: 15rpx; background-color: rgba(0,0,0,0.4);">
			<text class="font-sm text-white">人气：</text>
			<text class="text-white font-sm">{{ item.look_count }}</text>
		</view>

		<view class="rounded-circle flex align-center" style="position: absolute; left: 15rpx; bottom: 15rpx;">
			<text class="font text-white">{{ item.title }}</text>
		</view>

		<view class="rounded-circle px-2 flex align-center" style="position: absolute; right: 15rpx; bottom: 15rpx; background-color: rgba(0,0,0,0.4);">
			<text class="rounded-circle  mr-1" style="width: 20rpx; height: 20rpx;" :class="'bg-' + (item.status === 1 ? 'success' : 'danger')"></text>
			<text class="text-white font-sm">{{ item.status | formatStatus }}</text>
		</view>
	</view>
</template>

<script>
export default {
	props: {
		item: Object,
		index: [Number, String]
	},
	filters: {
		formatStatus(value) {
			let o = {
				0: '直播未开始',
				1: '直播中',
				2: '暂停',
				3: '已结束'
			};
			return o[value];
		}
	},
	data() {
		return {};
	}
};
</script>

<style></style>
