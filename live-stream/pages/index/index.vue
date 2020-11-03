<template>
	<!-- <view class="content"><tab></tab></view> -->
	<view>
		<!-- <view><image src="../../static/banner/2.jpg" mode="" class="img" style="width: 750rpx; height: 300rpx;"></image></view> -->
		<!-- 轮播图 -->
		<!-- <swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="200" style="width: 750rpx; height: 300rpx;">
			<swiper-item><image src="../../static/banner/1.jpg" mode="" style="width: 750rpx; height: 300rpx;"></image></swiper-item>
			<swiper-item><image src="../../static/banner/2.jpg" mode="" style="width: 750rpx; height: 300rpx;"></image></swiper-item>
		</swiper> -->

		<view class="top flex align-center justify-center">
			<input
				type="text"
				class="rounded-circle mx-1 pl-5 font text-white"
				placeholder="搜索直播间"
				placeholder-style="color: #ffffff;"
				style="width: 600rpx; height: 70rpx; background-color: rgba(0,0,0,0.2);"
			/>
		</view>

		<!-- 列表 -->
		<view class="flex flex-wrap"><list-item class="list-item p" v-for="(item, index) in list" :key="index" :item="item" @click="openLive(item)"></list-item></view>

		<view class="f-divider"></view>
		<view class="flex align-center justify-center py-3">
			<text class="font-md text-secondary">{{ loadText }}</text>
		</view>
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
				// {
				// 	coin: 10,
				// 	look_count: 520,
				// 	title: 'CCTV-3',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/190824/205524-15666513248366.jpg',
				// 	url: 'http://suyuxi.utools.club/live/MSuSfJ0Q60fnqfwFKp9m.flv?sign=1604332766-32385776ba7ef343d6ab97b3c50dad43',
				// 	// url: 'http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8',
				// 	status: 1
				// },
				// {
				// 	coin: 10,
				// 	look_count: 530,
				// 	title: 'CCTV-6',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/200604/001849-15912011292fcb.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8',
				// 	status: 0
				// },
				// {
				// 	coin: 10,
				// 	look_count: 540,
				// 	title: 'CCTV-10',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/190909/192110-1568028070e5ea.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/cctv10hd.m3u8',
				// 	status: 1
				// },
				// {
				// 	coin: 10,
				// 	look_count: 550,
				// 	title: '高清电影',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/200922/224915-1600786155f16e.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/chchd.m3u8',
				// 	status: 0
				// },
				// {
				// 	coin: 10,
				// 	look_count: 560,
				// 	title: '湖南卫视',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/200803/000001-15963840010072.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/hunanhd.m3u8',
				// 	status: 1
				// },
				// {
				// 	coin: 10,
				// 	look_count: 570,
				// 	title: '广东卫视',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/200108/222203-1578493323c2d3.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/gdhd.m3u8',
				// 	status: 1
				// },
				// {
				// 	coin: 10,
				// 	look_count: 580,
				// 	title: '金鹰纪实',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/190328/223136-1553783496a5e9.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/gedocu.m3u8',
				// 	status: 0
				// },
				// {
				// 	coin: 10,
				// 	look_count: 590,
				// 	title: '黑龙江',
				// 	cover: 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg',
				// 	url: 'http://ivi.bupt.edu.cn/hls/hljhd.m3u8',
				// 	status: 0
				// }
			],
			page: 1,
			loadText: '上拉加载更多'
		};
	},
	onLoad() {
		this.getData();
	},
	onPullDownRefresh() {
		this.page = 1;
		this.getData()
			.then(res => {
				uni.showToast({
					title: '刷新成功',
					icon: 'none'
				});
				uni.stopPullDownRefresh();
			})
			.catch(err => {
				uni.stopPullDownRefresh();
			});
	},
	onReachBottom() {
		if (this.loadText !== '上拉加载更多') {
			return;
		}
		this.loadText = '加载中...';
		this.page++;
		this.getData();
	},
	methods: {
		getData() {
			let page = this.page;
			return this.$H
				.get('/live/list/' + page)
				.then(res => {
					(this.list = page === 1 ? res : [...this.list, ...res]), (this.loadText = res.length < 10 ? '没有更多了' : '上拉加载更多');
				})
				.catch(err => {
					if (this.page > 1) {
						this.page--;
						this.loadText = '上拉加载更多';
					}
				});
		},
		openLive(item) {
			// console.log('进入转播方法');
			console.log('视频' + item.id);
			uni.navigateTo({
				url: '../live/live?id=' + item.id
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
.top {
	width: 750rpx;
	height: 260rpx;
	background-image: url(../../static/logo.png);
	background-size: cover;
	background-image: linear-gradient(to right, #ba7ace 0%, #8745ff 100%);
}
</style>
