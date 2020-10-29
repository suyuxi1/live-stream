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
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 530,
					title: 'CCTV-6',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8',
					state: 0
				},
				{
					gold: 10,
					likes: 540,
					title: 'CCTV-10',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/cctv10hd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 550,
					title: '高清电影',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/chchd.m3u8',
					state: 0
				},
				{
					gold: 10,
					likes: 560,
					title: '湖南卫视',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/hunanhd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 570,
					title: '广东卫视',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/gdhd.m3u8',
					state: 1
				},
				{
					gold: 10,
					likes: 580,
					title: '金鹰纪实',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					url: 'http://ivi.bupt.edu.cn/hls/gedocu.m3u8',
					state: 0
				},
				{
					gold: 10,
					likes: 590,
					title: '黑龙江',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
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
			console.log('视频地址'+item.url);
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
