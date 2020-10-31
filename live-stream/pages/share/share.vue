<template>
	<view>
		<view><image src="../../static/banner/2.jpg" mode="" class="img" style="width: 750rpx; height: 300rpx;"></image></view>

		<!-- 列表 -->
		<view class="flex flex-wrap"><list-item class="list-item p" v-for="(item, index) in list" :key="index" :item="item" @click="openLive(item)"></list-item></view>
		
		<view class="bg-light fixed-bottom" style="z-index:10"><button @tap="goback" class=" bg-main">返回</button></view>
	</view>
</template>

<script>
import listItem from '../../components/common/list-item.vue';
import ivi from '../../common/ivi.js';
export default {
	components: {
		ivi,
		listItem
	},
	data() {
		return {
			list: []
		};
	},
	onLoad() {
		this.list = ivi;
	},
	methods: {
		//返回上一层页面
		goback() {
			uni.navigateBack({});
		},
		openLive(item) {
			// console.log('进入转播方法');
			console.log('视频地址' + item.url);
			uni.navigateTo({
				// url: '../live/live?url=' + item.url
				url:'../share-live/share-live?url=' + item.url
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
