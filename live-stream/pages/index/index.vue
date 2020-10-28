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
					likes: 620,
					title: '直播间1',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间2',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间3',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间4',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间5',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间6',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间7',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				},
				{
					gold: 10,
					likes: 520,
					title: '直播间8',
					cover: 'http://b40.photo.store.qq.com/psb?/V146ck4w2VCSVT/m.TVJDKX64V7xGxmkf0LEmO8U8FZ.lc6mRYPTYD6zo8!/b/dCgAAAAAAAAA&bo=AASAAgAAAAAFB6I!&rf=viewer_4',
					link: 'http://ivi.bupt.edu.cn/hls/gdtv.m3u8'
				}
			]
		};
	},
	onLoad() {},
	methods: {
		openLive(item) {
			console.log('进入方法');
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
