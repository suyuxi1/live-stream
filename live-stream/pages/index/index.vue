<template>
	<!-- <view class="content"><tab></tab></view> -->
	<view>
		<!-- <view><image src="../../static/banner/2.jpg" mode="" class="img" style="width: 750rpx; height: 300rpx;"></image></view> -->
		<!-- 轮播图 -->
		<swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="200" style="width: 750rpx; height: 300rpx;">
			<swiper-item><image src="../../static/banner/1.jpg" mode="" style="width: 750rpx; height: 300rpx;"></image></swiper-item>
			<swiper-item><image src="../../static/banner/2.jpg" mode="" style="width: 750rpx; height: 300rpx;"></image></swiper-item>
		</swiper>

		<!-- 列表 -->
		<view class="flex flex-wrap">
			<view class="list-item p" v-for="i in 10" :key="i" @click="openLive">
				<image src="../../static/index.png" mode="aspectFill" style="width: 365rpx; height: 365rpx;" class="rounded"></image>
			</view>
		</view>
	</view>
</template>

<script>
// import tab from '../../components/common/tab.vue';
export default {
	// components: {
	// 	tab
	// },
	data() {
		return {};
	},
	onLoad() {},
	methods: {
		openLive() {}
	}
};
</script>

<style>
.list-item {
	width: 375rpx;
	height: 375rpx;
	padding: 5rpx;
	box-sizing: border-box;
	position: relative;
}
</style>
