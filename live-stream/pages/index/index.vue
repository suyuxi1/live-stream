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
		<view class="flex flex-wrap"><list-item class="list-item p" v-for="(item, index) in list" :key="index" :item="item" @click="openLive(item)"></list-item></view>
	</view>
</template>

<script>
// import tab from '../../components/common/tab.vue';
import listItem from '../../components/common/list-item.vue';
export default {
	components: {
		listItem
		// tab
	},
	data() {
		return {
			list: [
				{
					gold: 10,
					likes: 520,
					title: 'CCTV-3',
					cover: 'http://pic.netbian.com/uploads/allimg/190824/205524-15666513248366.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 530,
					title: 'CCTV-6',
					cover: 'http://pic.netbian.com/uploads/allimg/200604/001849-15912011292fcb.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8',
					state: 0
				},
				{
					gold: 10,
					likes: 540,
					title: 'CCTV-10',
					cover: 'http://pic.netbian.com/uploads/allimg/190909/192110-1568028070e5ea.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/cctv10hd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 550,
					title: '高清电影',
					cover: 'http://pic.netbian.com/uploads/allimg/200922/224915-1600786155f16e.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/chchd.m3u8',
					state: 0
				},
				{
					gold: 10,
					likes: 560,
					title: '湖南卫视',
					cover: 'http://pic.netbian.com/uploads/allimg/200803/000001-15963840010072.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/hunanhd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 570,
					title: '广东卫视',
					cover: 'http://pic.netbian.com/uploads/allimg/200108/222203-1578493323c2d3.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/gdhd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 580,
					title: '金鹰纪实',
					cover: 'http://pic.netbian.com/uploads/allimg/190328/223136-1553783496a5e9.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/gedocu.m3u8',
					state: 0
				},
				{
					gold: 10,
					likes: 590,
					title: '黑龙江',
					cover: 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg',
					url: 'http://ivi.bupt.edu.cn/hls/hljhd.m3u8',
					state: 0
				}
			]
		};
	},
	onLoad() {},
	methods: {
		openLive(item) {
			// console.log('进入转播方法');
			console.log('视频地址' + item.url);
			uni.navigateTo({
				url: '../live/live?url=' + item.url
			});
		}
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
