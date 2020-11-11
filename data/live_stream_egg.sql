/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : live_stream_egg

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 10/11/2020 11:12:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `live_id` int NOT NULL DEFAULT 0 COMMENT '直播间id',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `live_id`(`live_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`live_id`) REFERENCES `live` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 's s', 1, 2, '2020-11-05 14:07:10', '2020-11-05 14:07:10');
INSERT INTO `comment` VALUES (2, 'ddf', 1, 2, '2020-11-05 14:07:16', '2020-11-05 14:07:16');
INSERT INTO `comment` VALUES (3, '大哥好过分', 1, 3, '2020-11-05 14:07:21', '2020-11-05 14:07:21');
INSERT INTO `comment` VALUES (4, '哈哈哈哈', 1, 3, '2020-11-05 14:09:49', '2020-11-05 14:09:49');
INSERT INTO `comment` VALUES (5, '我来了', 1, 3, '2020-11-05 14:10:01', '2020-11-05 14:10:01');
INSERT INTO `comment` VALUES (6, '提供给', 1, 2, '2020-11-05 14:10:16', '2020-11-05 14:10:16');
INSERT INTO `comment` VALUES (7, '反戈一击', 1, 2, '2020-11-05 14:10:23', '2020-11-05 14:10:23');
INSERT INTO `comment` VALUES (8, '浐河', 1, 3, '2020-11-05 14:10:40', '2020-11-05 14:10:40');
INSERT INTO `comment` VALUES (9, '来了', 1, 3, '2020-11-05 14:13:00', '2020-11-05 14:13:00');
INSERT INTO `comment` VALUES (10, '啦啦啦啦', 1, 3, '2020-11-05 14:13:08', '2020-11-05 14:13:08');
INSERT INTO `comment` VALUES (11, '哈哈哈', 1, 2, '2020-11-05 14:13:16', '2020-11-05 14:13:16');
INSERT INTO `comment` VALUES (12, 'fgyh', 1, 2, '2020-11-05 16:06:56', '2020-11-05 16:06:56');
INSERT INTO `comment` VALUES (13, '地方干活', 1, 3, '2020-11-05 16:26:28', '2020-11-05 16:26:28');
INSERT INTO `comment` VALUES (14, '时代广告', 1, 3, '2020-11-05 16:28:55', '2020-11-05 16:28:55');
INSERT INTO `comment` VALUES (15, '新东方', 1, 2, '2020-11-05 16:29:00', '2020-11-05 16:29:00');
INSERT INTO `comment` VALUES (16, '知道的是的', 1, 3, '2020-11-05 16:53:04', '2020-11-05 16:53:04');
INSERT INTO `comment` VALUES (17, '绅士手', 1, 2, '2020-11-05 16:53:09', '2020-11-05 16:53:09');
INSERT INTO `comment` VALUES (18, '外', 1, 2, '2020-11-05 17:26:29', '2020-11-05 17:26:29');
INSERT INTO `comment` VALUES (19, '闪闪发光', 1, 2, '2020-11-05 22:57:08', '2020-11-05 22:57:08');
INSERT INTO `comment` VALUES (20, '收拾收拾', 1, 2, '2020-11-05 23:01:08', '2020-11-05 23:01:08');
INSERT INTO `comment` VALUES (33, '来了', 63, 2, '2020-11-09 17:34:50', '2020-11-09 17:34:50');
INSERT INTO `comment` VALUES (34, '热敷缓解', 63, 2, '2020-11-09 17:37:54', '2020-11-09 17:37:54');
INSERT INTO `comment` VALUES (35, 'eb', 63, 2, '2020-11-09 17:38:01', '2020-11-09 17:38:01');
INSERT INTO `comment` VALUES (36, 'ddv', 63, 2, '2020-11-09 17:38:08', '2020-11-09 17:38:08');
INSERT INTO `comment` VALUES (37, 'ddv', 63, 2, '2020-11-09 17:38:08', '2020-11-09 17:38:08');
INSERT INTO `comment` VALUES (38, 'ddv', 63, 2, '2020-11-09 17:38:09', '2020-11-09 17:38:09');
INSERT INTO `comment` VALUES (39, '雨后', 63, 2, '2020-11-09 17:38:16', '2020-11-09 17:38:16');
INSERT INTO `comment` VALUES (40, '啦啦啦', 1, 1, '2020-11-09 19:15:56', '2020-11-09 19:15:56');
INSERT INTO `comment` VALUES (41, '哈哈哈哈哈', 1, 1, '2020-11-09 19:16:06', '2020-11-09 19:16:06');
INSERT INTO `comment` VALUES (42, '看看看看', 1, 2, '2020-11-09 19:16:38', '2020-11-09 19:16:38');
INSERT INTO `comment` VALUES (43, '发哈哈哈', 68, 2, '2020-11-09 19:34:28', '2020-11-09 19:34:28');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `follow_id` int NULL DEFAULT NULL COMMENT '关注id',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `follow_id`(`follow_id`) USING BTREE,
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`follow_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------

-- ----------------------------
-- Table structure for gift
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '礼物名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `coin` int NOT NULL DEFAULT 0 COMMENT '礼物图标',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gift
-- ----------------------------
INSERT INTO `gift` VALUES (1, '爱心煎蛋', '1.png', 1, '2020-11-05 12:03:30', '2020-11-05 12:03:33');
INSERT INTO `gift` VALUES (2, '666', '2.png', 2, '2020-11-05 12:03:30', '2020-11-07 19:26:37');
INSERT INTO `gift` VALUES (3, '小蛋糕', '3.png', 3, '2020-11-05 12:03:30', '2020-11-05 12:03:30');
INSERT INTO `gift` VALUES (4, '小龙虾', '4.png', 4, '2020-11-05 12:03:30', '2020-11-05 12:03:30');
INSERT INTO `gift` VALUES (5, '奇趣蛋', '5.png', 5, '2020-11-05 12:03:30', '2020-11-05 12:03:30');
INSERT INTO `gift` VALUES (6, '胶囊', '6.png', 6, '2020-11-05 12:03:30', '2020-11-05 12:03:30');
INSERT INTO `gift` VALUES (7, '小爱心', '7.png', 7, '2020-11-05 12:03:30', '2020-11-05 12:03:30');
INSERT INTO `gift` VALUES (8, '小花花', '8.png', 8, '2020-11-05 12:03:30', '2020-11-07 17:52:12');

-- ----------------------------
-- Table structure for live
-- ----------------------------
DROP TABLE IF EXISTS `live`;
CREATE TABLE `live`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '直播间标题',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '直播间封面',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `look_count` int NOT NULL DEFAULT 0 COMMENT '总观看人数',
  `coin` int NOT NULL DEFAULT 0 COMMENT '总金币',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '唯一标识',
  `status` int NOT NULL DEFAULT 0 COMMENT '直播间状态 0未开播 1直播中 2暂停直播 3直播结束',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `live_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of live
-- ----------------------------
INSERT INTO `live` VALUES (1, '直播1', 'http://pic.netbian.com/uploads/allimg/190824/205524-15666513248366.jpg', 1, 3, 334, 'yM4WnNhsrSzpStxhjUxM', 1, '2020-11-01 18:26:13', '2020-11-09 19:16:30');
INSERT INTO `live` VALUES (2, '直播2', 'http://pic.netbian.com/uploads/allimg/200604/001849-15912011292fcb.jpg', 1, 22, 222, 'MSuSfJ0Q60fnqfwFKp9m', 3, '2020-11-01 20:12:46', '2020-11-07 19:22:54');
INSERT INTO `live` VALUES (3, '直播3', 'http://pic.netbian.com/uploads/allimg/190909/192110-1568028070e5ea.jpg', 1, 33, 333, '9ztUXlrOFPuynfOwIAYj', 3, '2020-11-03 15:12:01', '2020-11-07 19:25:37');
INSERT INTO `live` VALUES (4, '直播4', 'http://pic.netbian.com/uploads/allimg/200922/224915-1600786155f16e.jpg', 1, 44, 444, '3UHycEffnxn4ltixKew5', 0, '2020-11-03 15:12:31', '2020-11-03 15:12:31');
INSERT INTO `live` VALUES (5, '直播5', 'http://pic.netbian.com/uploads/allimg/200803/000001-15963840010072.jpg', 1, 55, 555, 'DgjEDdKXcw5NEONA5IlG', 0, '2020-11-03 15:27:53', '2020-11-03 15:27:53');
INSERT INTO `live` VALUES (6, '直播6', 'http://pic.netbian.com/uploads/allimg/200108/222203-1578493323c2d3.jpg', 1, 66, 666, 'AJ5YLf5DNkD0Jtis05if', 0, '2020-11-03 15:28:13', '2020-11-03 15:28:13');
INSERT INTO `live` VALUES (7, '直播7', 'http://pic.netbian.com/uploads/allimg/190328/223136-1553783496a5e9.jpg', 1, 77, 777, 'pob6vyg3JzOM5wTqpqOa', 0, '2020-11-03 15:28:31', '2020-11-03 15:28:31');
INSERT INTO `live` VALUES (8, '直播8', 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg', 1, 88, 888, 'nytHr8goxc3311k46pUT', 0, '2020-11-03 15:28:48', '2020-11-03 15:28:48');
INSERT INTO `live` VALUES (63, '的撒', 'http://suyuxi.utools.club/public/uploads/2020/11/09/1604914424644.jpg', 1, 2, 16, 'Xinok1sJBpT5RssFWMA8', 3, '2020-11-09 17:33:55', '2020-11-09 17:40:05');
INSERT INTO `live` VALUES (64, '看看', 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg', 1, 2, 0, 'ReDf22Oce1EkXjaJ3zwy', 3, '2020-11-09 17:40:19', '2020-11-09 17:40:53');
INSERT INTO `live` VALUES (65, '开播', 'http://suyuxi.utools.club/public/uploads/2020/11/09/1604921352021.png', 1, 0, 0, 'G0L0gx43nUbPyRjwdMks', 3, '2020-11-09 19:29:28', '2020-11-09 19:30:50');
INSERT INTO `live` VALUES (66, '哈哈哈', 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg', 1, 0, 0, 'PYjNINiSCoUBNElqG0yb', 0, '2020-11-09 19:31:44', '2020-11-09 19:31:44');
INSERT INTO `live` VALUES (67, '开始了', 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg', 1, 1, 0, '2KvY8QVFFpQHjjunWZUX', 3, '2020-11-09 19:33:23', '2020-11-09 19:33:54');
INSERT INTO `live` VALUES (68, '看看', 'http://pic.netbian.com/uploads/allimg/181117/221319-1542463999f0fd.jpg', 1, 2, 18, 'GnNW6AItSF0tuoIIuQ9o', 3, '2020-11-09 19:34:13', '2020-11-09 19:34:41');

-- ----------------------------
-- Table structure for live_gift
-- ----------------------------
DROP TABLE IF EXISTS `live_gift`;
CREATE TABLE `live_gift`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `live_id` int NOT NULL DEFAULT 0 COMMENT '直播间id',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `gift_id` int NOT NULL DEFAULT 0 COMMENT '礼物id',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `live_id`(`live_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `gift_id`(`gift_id`) USING BTREE,
  CONSTRAINT `live_gift_ibfk_1` FOREIGN KEY (`live_id`) REFERENCES `live` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `live_gift_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `live_gift_ibfk_3` FOREIGN KEY (`gift_id`) REFERENCES `gift` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of live_gift
-- ----------------------------
INSERT INTO `live_gift` VALUES (1, 1, 2, 1, '2020-11-05 15:57:18', '2020-11-05 15:57:18');
INSERT INTO `live_gift` VALUES (2, 1, 2, 1, '2020-11-05 15:57:23', '2020-11-05 15:57:23');
INSERT INTO `live_gift` VALUES (3, 1, 2, 1, '2020-11-05 15:57:23', '2020-11-05 15:57:23');
INSERT INTO `live_gift` VALUES (4, 1, 2, 1, '2020-11-05 15:57:23', '2020-11-05 15:57:23');
INSERT INTO `live_gift` VALUES (5, 1, 2, 1, '2020-11-05 15:57:24', '2020-11-05 15:57:24');
INSERT INTO `live_gift` VALUES (6, 1, 2, 3, '2020-11-05 15:59:58', '2020-11-05 15:59:58');
INSERT INTO `live_gift` VALUES (7, 1, 2, 1, '2020-11-05 16:07:00', '2020-11-05 16:07:00');
INSERT INTO `live_gift` VALUES (8, 1, 2, 1, '2020-11-05 16:07:01', '2020-11-05 16:07:01');
INSERT INTO `live_gift` VALUES (9, 1, 2, 1, '2020-11-05 16:07:02', '2020-11-05 16:07:02');
INSERT INTO `live_gift` VALUES (10, 1, 2, 1, '2020-11-05 16:07:02', '2020-11-05 16:07:02');
INSERT INTO `live_gift` VALUES (11, 1, 2, 1, '2020-11-05 16:07:02', '2020-11-05 16:07:02');
INSERT INTO `live_gift` VALUES (12, 1, 2, 1, '2020-11-05 16:07:02', '2020-11-05 16:07:02');
INSERT INTO `live_gift` VALUES (13, 1, 2, 8, '2020-11-05 16:08:54', '2020-11-05 16:08:54');
INSERT INTO `live_gift` VALUES (14, 1, 2, 1, '2020-11-05 16:24:08', '2020-11-05 16:24:08');
INSERT INTO `live_gift` VALUES (15, 1, 2, 2, '2020-11-05 16:24:16', '2020-11-05 16:24:16');
INSERT INTO `live_gift` VALUES (16, 1, 2, 1, '2020-11-05 16:24:22', '2020-11-05 16:24:22');
INSERT INTO `live_gift` VALUES (17, 1, 2, 4, '2020-11-05 16:24:26', '2020-11-05 16:24:26');
INSERT INTO `live_gift` VALUES (18, 1, 3, 2, '2020-11-05 16:25:50', '2020-11-05 16:25:50');
INSERT INTO `live_gift` VALUES (19, 1, 3, 4, '2020-11-05 16:25:57', '2020-11-05 16:25:57');
INSERT INTO `live_gift` VALUES (20, 1, 2, 2, '2020-11-05 16:26:05', '2020-11-05 16:26:05');
INSERT INTO `live_gift` VALUES (21, 1, 3, 1, '2020-11-05 16:27:47', '2020-11-05 16:27:47');
INSERT INTO `live_gift` VALUES (22, 1, 3, 1, '2020-11-05 16:29:12', '2020-11-05 16:29:12');
INSERT INTO `live_gift` VALUES (23, 1, 2, 3, '2020-11-05 16:29:20', '2020-11-05 16:29:20');
INSERT INTO `live_gift` VALUES (24, 1, 3, 1, '2020-11-05 16:29:47', '2020-11-05 16:29:47');
INSERT INTO `live_gift` VALUES (25, 1, 3, 1, '2020-11-05 16:29:49', '2020-11-05 16:29:49');
INSERT INTO `live_gift` VALUES (26, 1, 3, 2, '2020-11-05 16:29:51', '2020-11-05 16:29:51');
INSERT INTO `live_gift` VALUES (27, 1, 3, 2, '2020-11-05 16:29:53', '2020-11-05 16:29:53');
INSERT INTO `live_gift` VALUES (28, 1, 3, 3, '2020-11-05 16:31:55', '2020-11-05 16:31:55');
INSERT INTO `live_gift` VALUES (29, 1, 3, 3, '2020-11-05 16:31:56', '2020-11-05 16:31:56');
INSERT INTO `live_gift` VALUES (30, 1, 3, 3, '2020-11-05 16:31:58', '2020-11-05 16:31:58');
INSERT INTO `live_gift` VALUES (31, 1, 3, 3, '2020-11-05 16:31:59', '2020-11-05 16:31:59');
INSERT INTO `live_gift` VALUES (32, 1, 3, 3, '2020-11-05 16:31:59', '2020-11-05 16:31:59');
INSERT INTO `live_gift` VALUES (33, 1, 3, 3, '2020-11-05 16:31:59', '2020-11-05 16:31:59');
INSERT INTO `live_gift` VALUES (34, 1, 3, 3, '2020-11-05 16:32:00', '2020-11-05 16:32:00');
INSERT INTO `live_gift` VALUES (35, 1, 3, 3, '2020-11-05 16:32:00', '2020-11-05 16:32:00');
INSERT INTO `live_gift` VALUES (36, 1, 3, 3, '2020-11-05 16:32:02', '2020-11-05 16:32:02');
INSERT INTO `live_gift` VALUES (37, 1, 3, 3, '2020-11-05 16:32:03', '2020-11-05 16:32:03');
INSERT INTO `live_gift` VALUES (38, 1, 3, 3, '2020-11-05 16:32:03', '2020-11-05 16:32:03');
INSERT INTO `live_gift` VALUES (39, 1, 3, 3, '2020-11-05 16:32:04', '2020-11-05 16:32:04');
INSERT INTO `live_gift` VALUES (40, 1, 3, 3, '2020-11-05 16:32:04', '2020-11-05 16:32:04');
INSERT INTO `live_gift` VALUES (41, 1, 3, 3, '2020-11-05 16:32:04', '2020-11-05 16:32:04');
INSERT INTO `live_gift` VALUES (42, 1, 3, 6, '2020-11-05 16:32:09', '2020-11-05 16:32:09');
INSERT INTO `live_gift` VALUES (43, 1, 3, 6, '2020-11-05 16:32:10', '2020-11-05 16:32:10');
INSERT INTO `live_gift` VALUES (44, 1, 2, 8, '2020-11-05 16:32:14', '2020-11-05 16:32:14');
INSERT INTO `live_gift` VALUES (45, 1, 2, 8, '2020-11-05 16:32:14', '2020-11-05 16:32:14');
INSERT INTO `live_gift` VALUES (46, 1, 2, 8, '2020-11-05 16:32:14', '2020-11-05 16:32:14');
INSERT INTO `live_gift` VALUES (47, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (48, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (49, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (50, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (51, 1, 3, 6, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (52, 1, 3, 6, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (53, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (54, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (55, 1, 2, 8, '2020-11-05 16:32:15', '2020-11-05 16:32:15');
INSERT INTO `live_gift` VALUES (56, 1, 3, 4, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (57, 1, 3, 4, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (58, 1, 3, 4, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (59, 1, 3, 4, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (60, 1, 3, 4, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (61, 1, 3, 4, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (62, 1, 2, 8, '2020-11-05 16:32:16', '2020-11-05 16:32:16');
INSERT INTO `live_gift` VALUES (63, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (64, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (65, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (66, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (67, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (68, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (69, 1, 2, 8, '2020-11-05 16:32:17', '2020-11-05 16:32:17');
INSERT INTO `live_gift` VALUES (70, 1, 2, 8, '2020-11-05 16:32:18', '2020-11-05 16:32:18');
INSERT INTO `live_gift` VALUES (71, 1, 2, 8, '2020-11-05 16:32:18', '2020-11-05 16:32:18');
INSERT INTO `live_gift` VALUES (72, 1, 2, 8, '2020-11-05 16:32:18', '2020-11-05 16:32:18');
INSERT INTO `live_gift` VALUES (73, 1, 2, 8, '2020-11-05 16:32:18', '2020-11-05 16:32:18');
INSERT INTO `live_gift` VALUES (74, 1, 2, 8, '2020-11-05 16:32:18', '2020-11-05 16:32:18');
INSERT INTO `live_gift` VALUES (75, 1, 3, 4, '2020-11-05 16:32:19', '2020-11-05 16:32:19');
INSERT INTO `live_gift` VALUES (76, 1, 2, 8, '2020-11-05 16:32:19', '2020-11-05 16:32:19');
INSERT INTO `live_gift` VALUES (77, 1, 2, 1, '2020-11-05 16:50:04', '2020-11-05 16:50:04');
INSERT INTO `live_gift` VALUES (78, 1, 2, 1, '2020-11-05 16:50:06', '2020-11-05 16:50:06');
INSERT INTO `live_gift` VALUES (79, 1, 2, 1, '2020-11-05 16:50:12', '2020-11-05 16:50:12');
INSERT INTO `live_gift` VALUES (80, 1, 2, 1, '2020-11-05 16:50:13', '2020-11-05 16:50:13');
INSERT INTO `live_gift` VALUES (81, 1, 2, 1, '2020-11-05 16:50:13', '2020-11-05 16:50:13');
INSERT INTO `live_gift` VALUES (82, 1, 2, 4, '2020-11-05 16:53:14', '2020-11-05 16:53:14');
INSERT INTO `live_gift` VALUES (83, 1, 3, 3, '2020-11-05 16:53:18', '2020-11-05 16:53:18');
INSERT INTO `live_gift` VALUES (84, 1, 3, 7, '2020-11-05 16:53:21', '2020-11-05 16:53:21');
INSERT INTO `live_gift` VALUES (85, 1, 3, 7, '2020-11-05 16:53:22', '2020-11-05 16:53:22');
INSERT INTO `live_gift` VALUES (86, 1, 3, 8, '2020-11-05 16:53:23', '2020-11-05 16:53:23');
INSERT INTO `live_gift` VALUES (87, 1, 3, 8, '2020-11-05 16:53:23', '2020-11-05 16:53:23');
INSERT INTO `live_gift` VALUES (88, 1, 3, 8, '2020-11-05 16:53:23', '2020-11-05 16:53:23');
INSERT INTO `live_gift` VALUES (89, 1, 2, 3, '2020-11-05 17:26:21', '2020-11-05 17:26:21');
INSERT INTO `live_gift` VALUES (90, 1, 2, 3, '2020-11-05 22:56:59', '2020-11-05 22:56:59');
INSERT INTO `live_gift` VALUES (91, 1, 2, 3, '2020-11-05 22:57:28', '2020-11-05 22:57:28');
INSERT INTO `live_gift` VALUES (92, 1, 2, 3, '2020-11-05 22:57:54', '2020-11-05 22:57:54');
INSERT INTO `live_gift` VALUES (93, 1, 2, 3, '2020-11-05 22:58:47', '2020-11-05 22:58:47');
INSERT INTO `live_gift` VALUES (94, 1, 2, 4, '2020-11-05 22:59:40', '2020-11-05 22:59:40');
INSERT INTO `live_gift` VALUES (95, 1, 2, 4, '2020-11-05 23:00:22', '2020-11-05 23:00:22');
INSERT INTO `live_gift` VALUES (96, 1, 2, 1, '2020-11-05 23:03:47', '2020-11-05 23:03:47');
INSERT INTO `live_gift` VALUES (117, 1, 1, 1, '2020-11-08 22:04:22', '2020-11-08 22:04:22');
INSERT INTO `live_gift` VALUES (118, 1, 2, 3, '2020-11-08 22:04:25', '2020-11-08 22:04:25');
INSERT INTO `live_gift` VALUES (195, 63, 2, 8, '2020-11-09 17:34:42', '2020-11-09 17:34:42');
INSERT INTO `live_gift` VALUES (196, 63, 2, 8, '2020-11-09 17:34:43', '2020-11-09 17:34:43');
INSERT INTO `live_gift` VALUES (197, 1, 1, 1, '2020-11-09 19:15:43', '2020-11-09 19:15:43');
INSERT INTO `live_gift` VALUES (198, 1, 1, 1, '2020-11-09 19:15:46', '2020-11-09 19:15:46');
INSERT INTO `live_gift` VALUES (199, 1, 1, 2, '2020-11-09 19:15:49', '2020-11-09 19:15:49');
INSERT INTO `live_gift` VALUES (200, 1, 1, 2, '2020-11-09 19:15:49', '2020-11-09 19:15:49');
INSERT INTO `live_gift` VALUES (201, 1, 2, 3, '2020-11-09 19:16:28', '2020-11-09 19:16:28');
INSERT INTO `live_gift` VALUES (202, 1, 2, 4, '2020-11-09 19:16:30', '2020-11-09 19:16:30');
INSERT INTO `live_gift` VALUES (203, 68, 2, 7, '2020-11-09 19:34:32', '2020-11-09 19:34:32');
INSERT INTO `live_gift` VALUES (204, 68, 2, 8, '2020-11-09 19:34:34', '2020-11-09 19:34:34');
INSERT INTO `live_gift` VALUES (205, 68, 2, 3, '2020-11-09 19:34:35', '2020-11-09 19:34:35');

-- ----------------------------
-- Table structure for live_user
-- ----------------------------
DROP TABLE IF EXISTS `live_user`;
CREATE TABLE `live_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `live_id` int NOT NULL DEFAULT 0 COMMENT '直播间id',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `live_id`(`live_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `live_user_ibfk_1` FOREIGN KEY (`live_id`) REFERENCES `live` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `live_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of live_user
-- ----------------------------
INSERT INTO `live_user` VALUES (1, 1, 2, '2020-11-05 13:42:43', '2020-11-05 13:42:43');
INSERT INTO `live_user` VALUES (2, 1, 3, '2020-11-05 13:43:41', '2020-11-05 13:43:41');
INSERT INTO `live_user` VALUES (3, 1, 1, '2020-11-05 17:31:26', '2020-11-05 17:31:26');
INSERT INTO `live_user` VALUES (43, 63, 1, '2020-11-09 17:33:55', '2020-11-09 17:33:55');
INSERT INTO `live_user` VALUES (44, 63, 2, '2020-11-09 17:34:32', '2020-11-09 17:34:32');
INSERT INTO `live_user` VALUES (45, 64, 1, '2020-11-09 17:40:20', '2020-11-09 17:40:20');
INSERT INTO `live_user` VALUES (46, 64, 2, '2020-11-09 17:40:45', '2020-11-09 17:40:45');
INSERT INTO `live_user` VALUES (47, 67, 1, '2020-11-09 19:33:24', '2020-11-09 19:33:24');
INSERT INTO `live_user` VALUES (48, 68, 1, '2020-11-09 19:34:14', '2020-11-09 19:34:14');
INSERT INTO `live_user` VALUES (49, 68, 2, '2020-11-09 19:34:22', '2020-11-09 19:34:22');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'su', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-06 22:19:01', '2020-11-06 22:19:01');
INSERT INTO `manager` VALUES (2, 'root', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-06 22:26:09', '2020-11-06 22:26:09');
INSERT INTO `manager` VALUES (3, 'root1', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-06 22:26:14', '2020-11-06 22:26:14');
INSERT INTO `manager` VALUES (4, 'root2', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-06 22:26:19', '2020-11-06 22:26:19');
INSERT INTO `manager` VALUES (5, 'su11', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-07 12:52:38', '2020-11-07 12:52:38');
INSERT INTO `manager` VALUES (6, 'su12', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-07 12:58:17', '2020-11-07 12:58:17');
INSERT INTO `manager` VALUES (7, 'root1111', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2020-11-07 19:26:50', '2020-11-07 19:26:50');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `price` int NOT NULL DEFAULT 0 COMMENT '价格',
  `status` enum('pending','success','fail') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending' COMMENT '支付状态',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `no`(`no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20201101085836-user.js');
INSERT INTO `sequelizemeta` VALUES ('20201101101341-live.js');
INSERT INTO `sequelizemeta` VALUES ('20201104025410-live_user.js');
INSERT INTO `sequelizemeta` VALUES ('20201105053722-comment.js');
INSERT INTO `sequelizemeta` VALUES ('20201105061344-gift.js');
INSERT INTO `sequelizemeta` VALUES ('20201105062908-live_gift.js');
INSERT INTO `sequelizemeta` VALUES ('20201106133316-manager.js');
INSERT INTO `sequelizemeta` VALUES ('20201107042320-follow.js');
INSERT INTO `sequelizemeta` VALUES ('20201107042325-order.js');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `wxid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openId\r\n',
  `qqid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQopenId',
  `wbid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微博openId',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'phone',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像',
  `coin` int NOT NULL DEFAULT 0 COMMENT '金币',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, NULL, NULL, '13457513856', 'sususu', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://public-cdn-oss.mosoteach.cn/avatar/2019/8A/965209d99c71342f39ec8cf2a5474356.jpg?v=1567422040&x-oss-process=style/s200x200', 93, '2020-11-01 17:13:36', '2020-11-09 19:15:49');
INSERT INTO `user` VALUES (2, NULL, NULL, NULL, '15916919760', 'sususu1', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'http://pic.netbian.com/uploads/allimg/190422/202106-1555935666ca06.jpg', 9469, '2020-11-01 18:46:36', '2020-11-09 20:02:07');
INSERT INTO `user` VALUES (3, NULL, NULL, NULL, NULL, 'sususu11', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'http://pic.netbian.com/uploads/allimg/180519/191036-15267282365cbe.jpg', 9906, '2020-11-02 15:35:02', '2020-11-05 16:53:23');

SET FOREIGN_KEY_CHECKS = 1;
