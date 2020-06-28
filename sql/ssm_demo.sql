/*
 Navicat Premium Data Transfer

 Source Server         : my mysql 
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : ssm_demo

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 21/02/2020 11:32:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` bigint(20) NULL DEFAULT NULL,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'jack', 'E10ADC3949BA59ABBE56E057F20F883E', '杰克', 1, '超级管理员', '1', '13312341234', '123@qq.com');
INSERT INTO `admin` VALUES (3, 'rose', 'E10ADC3949BA59ABBE56E057F20F883E', '露丝', 2, NULL, '0', '13212341234', 'rose@qq.com');
INSERT INTO `admin` VALUES (5, 'rony', 'E10ADC3949BA59ABBE56E057F20F883E', '鲁尼', 3, NULL, '1', NULL, NULL);
INSERT INTO `admin` VALUES (7, '超人', 'E10ADC3949BA59ABBE56E057F20F883E', '超人', 2, NULL, '2', '12312341234', '123@125.com');
INSERT INTO `admin` VALUES (8, 'wer5', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 2, NULL, '0', NULL, NULL);
INSERT INTO `admin` VALUES (10, 'taiyizhenren', 'E10ADC3949BA59ABBE56E057F20F883E', '太乙真人', 10, NULL, '0', '13212121212', 'adfa12ew3@qq.com');
INSERT INTO `admin` VALUES (13, 'shfhdf', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 3, NULL, '1', NULL, NULL);
INSERT INTO `admin` VALUES (14, 'jj', 'E10ADC3949BA59ABBE56E057F20F883E', '叽叽', 3, NULL, '1', '13111111111', 'jiji@126.com');
INSERT INTO `admin` VALUES (16, 'ww', 'E10ADC3949BA59ABBE56E057F20F883E', 'wwww', 3, NULL, '1', '12311111111', '121@126.com');
INSERT INTO `admin` VALUES (22, 'wwww', 'E10ADC3949BA59ABBE56E057F20F883E', '12313', 10, NULL, '1', '13212341234', '1232@126.com');

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminUsername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginIp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `logoutTime` datetime  DEFAULT NULL,
  `isSafeExit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 769 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES (255, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 15:19:09', '2019-12-17 15:19:30', 1);
INSERT INTO `adminlog` VALUES (256, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 15:21:51', '2019-12-17 15:30:13', 1);
INSERT INTO `adminlog` VALUES (257, 'jj', '0:0:0:0:0:0:0:1', '2019-12-17 15:30:54', '2019-12-17 15:31:10', 1);
INSERT INTO `adminlog` VALUES (258, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 16:33:06', '2019-12-17 16:34:58', 1);
INSERT INTO `adminlog` VALUES (259, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 16:35:34', '2019-12-17 16:36:56', 1);
INSERT INTO `adminlog` VALUES (260, 'rose', '0:0:0:0:0:0:0:1', '2019-12-17 16:38:06', '2019-12-17 16:38:06', 0);
INSERT INTO `adminlog` VALUES (261, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 16:52:15', '2019-12-17 16:52:22', 1);
INSERT INTO `adminlog` VALUES (262, 'rose', '0:0:0:0:0:0:0:1', '2019-12-17 16:54:29', '2019-12-17 16:54:42', 1);
INSERT INTO `adminlog` VALUES (263, 'rose', '0:0:0:0:0:0:0:1', '2019-12-17 16:57:54', '2019-12-17 16:57:54', 0);
INSERT INTO `adminlog` VALUES (264, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 17:18:13', '2019-12-17 17:18:13', 0);
INSERT INTO `adminlog` VALUES (265, 'jack', '0:0:0:0:0:0:0:1', '2019-12-17 17:19:19', '2019-12-17 17:19:19', 0);
INSERT INTO `adminlog` VALUES (266, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 08:32:47', '2019-12-18 08:32:47', 0);
INSERT INTO `adminlog` VALUES (267, 'rose', '0:0:0:0:0:0:0:1', '2019-12-18 08:47:44', '2019-12-18 08:47:44', 0);
INSERT INTO `adminlog` VALUES (268, 'rose', '0:0:0:0:0:0:0:1', '2019-12-18 09:00:56', '2019-12-18 09:00:56', 1);
INSERT INTO `adminlog` VALUES (269, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 09:03:16', '2019-12-18 09:04:22', 1);
INSERT INTO `adminlog` VALUES (270, 'rose', '0:0:0:0:0:0:0:1', '2019-12-18 09:04:45', '2019-12-18 09:04:45', 1);
INSERT INTO `adminlog` VALUES (271, 'rose', '0:0:0:0:0:0:0:1', '2019-12-18 09:15:28', '2019-12-18 09:15:28', 1);
INSERT INTO `adminlog` VALUES (272, 'jj', '0:0:0:0:0:0:0:1', '2019-12-18 09:33:32', '2019-12-18 09:35:03', 1);
INSERT INTO `adminlog` VALUES (273, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 09:35:19', '2019-12-18 09:35:19', 0);
INSERT INTO `adminlog` VALUES (274, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 14:23:33', '2019-12-18 14:23:33', 0);
INSERT INTO `adminlog` VALUES (275, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 14:42:52', '2019-12-18 14:42:52', 0);
INSERT INTO `adminlog` VALUES (276, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:19:43', '2019-12-18 15:19:43', 0);
INSERT INTO `adminlog` VALUES (277, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:21:31', '2019-12-18 15:21:31', 0);
INSERT INTO `adminlog` VALUES (278, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:24:36', '2019-12-18 15:24:36', 0);
INSERT INTO `adminlog` VALUES (279, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:34:09', '2019-12-18 15:40:30', 1);
INSERT INTO `adminlog` VALUES (280, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:41:18', '2019-12-18 15:48:45', 1);
INSERT INTO `adminlog` VALUES (281, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:51:16', '2019-12-18 15:51:16', 0);
INSERT INTO `adminlog` VALUES (282, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 15:59:44', '2019-12-18 15:59:44', 0);
INSERT INTO `adminlog` VALUES (283, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:06:16', '2019-12-18 16:06:16', 0);
INSERT INTO `adminlog` VALUES (284, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:08:04', '2019-12-18 16:08:04', 0);
INSERT INTO `adminlog` VALUES (285, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:13:07', '2019-12-18 16:13:07', 0);
INSERT INTO `adminlog` VALUES (286, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:33:59', '2019-12-18 16:33:59', 0);
INSERT INTO `adminlog` VALUES (287, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:38:46', '2019-12-18 16:38:46', 0);
INSERT INTO `adminlog` VALUES (288, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:40:08', '2019-12-18 16:40:08', 0);
INSERT INTO `adminlog` VALUES (289, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:43:55', '2019-12-18 16:43:55', 0);
INSERT INTO `adminlog` VALUES (290, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:46:41', '2019-12-18 16:46:41', 0);
INSERT INTO `adminlog` VALUES (291, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:49:36', '2019-12-18 16:49:36', 0);
INSERT INTO `adminlog` VALUES (292, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 16:54:47', '2019-12-18 16:54:47', 0);
INSERT INTO `adminlog` VALUES (293, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 17:01:24', '2019-12-18 17:01:24', 0);
INSERT INTO `adminlog` VALUES (294, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 17:11:30', '2019-12-18 17:11:30', 0);
INSERT INTO `adminlog` VALUES (295, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 17:16:00', '2019-12-18 17:16:00', 0);
INSERT INTO `adminlog` VALUES (296, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 17:17:44', '2019-12-18 17:17:44', 0);
INSERT INTO `adminlog` VALUES (297, 'jack', '0:0:0:0:0:0:0:1', '2019-12-18 17:22:27', '2019-12-18 17:23:20', 1);
INSERT INTO `adminlog` VALUES (298, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 10:27:04', '2019-12-19 10:27:04', 0);
INSERT INTO `adminlog` VALUES (299, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 10:34:13', '2019-12-19 10:34:13', 0);
INSERT INTO `adminlog` VALUES (300, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 10:45:18', '2019-12-19 10:47:13', 1);
INSERT INTO `adminlog` VALUES (301, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 10:47:51', '2019-12-19 10:47:51', 0);
INSERT INTO `adminlog` VALUES (302, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 10:49:54', '2019-12-19 10:49:54', 0);
INSERT INTO `adminlog` VALUES (303, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:02:56', '2019-12-19 11:02:56', 0);
INSERT INTO `adminlog` VALUES (304, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:04:49', '2019-12-19 11:11:54', 1);
INSERT INTO `adminlog` VALUES (305, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:12:37', '2019-12-19 11:12:37', 0);
INSERT INTO `adminlog` VALUES (306, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:18:00', '2019-12-19 11:18:00', 0);
INSERT INTO `adminlog` VALUES (307, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:32:04', '2019-12-19 11:32:04', 0);
INSERT INTO `adminlog` VALUES (308, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:43:26', '2019-12-19 11:43:26', 0);
INSERT INTO `adminlog` VALUES (309, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:49:34', '2019-12-19 11:49:34', 0);
INSERT INTO `adminlog` VALUES (310, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:53:55', '2019-12-19 11:53:55', 0);
INSERT INTO `adminlog` VALUES (311, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 11:55:14', '2019-12-19 11:55:14', 0);
INSERT INTO `adminlog` VALUES (312, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:03:48', '2019-12-19 13:03:48', 0);
INSERT INTO `adminlog` VALUES (313, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:16:55', '2019-12-19 13:17:36', 1);
INSERT INTO `adminlog` VALUES (314, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:19:23', '2019-12-19 13:19:23', 0);
INSERT INTO `adminlog` VALUES (315, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:28:47', '2019-12-19 13:33:19', 1);
INSERT INTO `adminlog` VALUES (316, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:34:16', '2019-12-19 13:34:16', 0);
INSERT INTO `adminlog` VALUES (317, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:36:31', '2019-12-19 13:36:31', 0);
INSERT INTO `adminlog` VALUES (318, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:42:18', '2019-12-19 13:42:18', 0);
INSERT INTO `adminlog` VALUES (319, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:49:05', '2019-12-19 13:49:05', 0);
INSERT INTO `adminlog` VALUES (320, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:53:16', '2019-12-19 13:55:32', 1);
INSERT INTO `adminlog` VALUES (321, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 13:56:23', '2019-12-19 13:56:23', 0);
INSERT INTO `adminlog` VALUES (322, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:07:29', '2019-12-19 14:07:29', 0);
INSERT INTO `adminlog` VALUES (323, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:12:53', '2019-12-19 14:12:53', 0);
INSERT INTO `adminlog` VALUES (324, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:26:46', '2019-12-19 14:26:46', 0);
INSERT INTO `adminlog` VALUES (325, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:28:51', '2019-12-19 14:33:53', 1);
INSERT INTO `adminlog` VALUES (326, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:34:32', '2019-12-19 14:34:32', 0);
INSERT INTO `adminlog` VALUES (327, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:37:58', '2019-12-19 14:37:58', 0);
INSERT INTO `adminlog` VALUES (328, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:43:45', '2019-12-19 14:43:45', 0);
INSERT INTO `adminlog` VALUES (329, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 14:51:08', '2019-12-19 14:51:08', 0);
INSERT INTO `adminlog` VALUES (330, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:00:37', '2019-12-19 16:00:37', 0);
INSERT INTO `adminlog` VALUES (331, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:02:25', '2019-12-19 16:02:46', 1);
INSERT INTO `adminlog` VALUES (332, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:04:23', '2019-12-19 16:04:23', 0);
INSERT INTO `adminlog` VALUES (333, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:04:56', '2019-12-19 16:04:56', 0);
INSERT INTO `adminlog` VALUES (334, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:10:10', '2019-12-19 16:10:10', 0);
INSERT INTO `adminlog` VALUES (335, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:12:57', '2019-12-19 16:12:57', 0);
INSERT INTO `adminlog` VALUES (336, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:15:55', '2019-12-19 16:22:22', 1);
INSERT INTO `adminlog` VALUES (337, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:23:00', '2019-12-19 16:34:25', 1);
INSERT INTO `adminlog` VALUES (338, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:34:36', '2019-12-19 16:40:36', 1);
INSERT INTO `adminlog` VALUES (339, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:41:02', '2019-12-19 16:41:02', 0);
INSERT INTO `adminlog` VALUES (340, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:42:29', '2019-12-19 16:42:29', 0);
INSERT INTO `adminlog` VALUES (341, 'jack', '0:0:0:0:0:0:0:1', '2019-12-19 16:45:01', '2019-12-19 16:45:01', 0);
INSERT INTO `adminlog` VALUES (342, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 09:43:03', '2019-12-20 09:43:03', 0);
INSERT INTO `adminlog` VALUES (343, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 10:31:17', '2019-12-20 10:33:04', 1);
INSERT INTO `adminlog` VALUES (344, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 10:33:38', '2019-12-20 10:33:38', 0);
INSERT INTO `adminlog` VALUES (345, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 10:39:59', '2019-12-20 10:39:59', 0);
INSERT INTO `adminlog` VALUES (346, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 10:43:34', '2019-12-20 10:45:40', 1);
INSERT INTO `adminlog` VALUES (347, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 10:46:20', '2019-12-20 10:46:20', 0);
INSERT INTO `adminlog` VALUES (348, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 10:55:46', '2019-12-20 11:02:44', 1);
INSERT INTO `adminlog` VALUES (349, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 11:03:58', '2019-12-20 11:03:58', 0);
INSERT INTO `adminlog` VALUES (350, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 11:30:27', '2019-12-20 11:30:27', 0);
INSERT INTO `adminlog` VALUES (351, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 16:02:45', '2019-12-20 16:02:45', 0);
INSERT INTO `adminlog` VALUES (352, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 16:09:23', '2019-12-20 16:12:43', 1);
INSERT INTO `adminlog` VALUES (353, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 16:13:35', '2019-12-20 16:13:35', 0);
INSERT INTO `adminlog` VALUES (354, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 16:15:37', '2019-12-20 16:15:37', 0);
INSERT INTO `adminlog` VALUES (355, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 17:03:09', '2019-12-20 17:03:09', 0);
INSERT INTO `adminlog` VALUES (356, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 17:36:57', '2019-12-20 17:36:57', 0);
INSERT INTO `adminlog` VALUES (357, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 17:46:02', '2019-12-20 17:46:02', 0);
INSERT INTO `adminlog` VALUES (358, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 17:52:07', '2019-12-20 17:52:07', 0);
INSERT INTO `adminlog` VALUES (359, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 17:57:21', '2019-12-20 17:57:21', 0);
INSERT INTO `adminlog` VALUES (360, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 17:59:46', '2019-12-20 17:59:46', 0);
INSERT INTO `adminlog` VALUES (361, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 18:13:38', '2019-12-20 18:13:38', 0);
INSERT INTO `adminlog` VALUES (362, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:00:52', '2019-12-20 20:06:30', 1);
INSERT INTO `adminlog` VALUES (363, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:07:10', '2019-12-20 20:21:49', 1);
INSERT INTO `adminlog` VALUES (364, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:22:15', '2019-12-20 20:22:15', 0);
INSERT INTO `adminlog` VALUES (365, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:27:34', '2019-12-20 20:27:39', 1);
INSERT INTO `adminlog` VALUES (366, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:28:01', '2019-12-20 20:29:05', 1);
INSERT INTO `adminlog` VALUES (367, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:29:14', '2019-12-20 20:29:14', 0);
INSERT INTO `adminlog` VALUES (368, 'jack', '0:0:0:0:0:0:0:1', '2019-12-20 20:31:31', '2019-12-20 20:35:51', 1);
INSERT INTO `adminlog` VALUES (369, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 06:13:36', '2019-12-21 06:13:36', 0);
INSERT INTO `adminlog` VALUES (370, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 06:15:04', '2019-12-21 06:15:04', 0);
INSERT INTO `adminlog` VALUES (371, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 06:17:39', '2019-12-21 06:17:39', 0);
INSERT INTO `adminlog` VALUES (372, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:21:36', '2019-12-21 07:21:36', 0);
INSERT INTO `adminlog` VALUES (373, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:23:48', '2019-12-21 07:23:48', 0);
INSERT INTO `adminlog` VALUES (374, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:29:00', '2019-12-21 07:33:04', 1);
INSERT INTO `adminlog` VALUES (375, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:33:42', '2019-12-21 07:36:30', 1);
INSERT INTO `adminlog` VALUES (376, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:37:27', '2019-12-21 07:41:10', 1);
INSERT INTO `adminlog` VALUES (377, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:41:42', '2019-12-21 07:43:59', 1);
INSERT INTO `adminlog` VALUES (378, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:44:37', '2019-12-21 07:48:09', 1);
INSERT INTO `adminlog` VALUES (379, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:48:44', '2019-12-21 07:53:53', 1);
INSERT INTO `adminlog` VALUES (380, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 07:54:37', '2019-12-21 07:54:37', 0);
INSERT INTO `adminlog` VALUES (381, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 08:01:39', '2019-12-21 08:01:39', 0);
INSERT INTO `adminlog` VALUES (382, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 10:36:57', '2019-12-21 10:42:40', 1);
INSERT INTO `adminlog` VALUES (383, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 10:50:52', '2019-12-21 10:50:52', 0);
INSERT INTO `adminlog` VALUES (384, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 11:24:53', '2019-12-21 11:26:29', 1);
INSERT INTO `adminlog` VALUES (385, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 11:29:13', '2019-12-21 11:37:25', 1);
INSERT INTO `adminlog` VALUES (386, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 11:40:16', '2019-12-21 11:40:19', 1);
INSERT INTO `adminlog` VALUES (387, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 11:41:10', '2019-12-21 11:42:07', 1);
INSERT INTO `adminlog` VALUES (388, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 11:42:17', '2019-12-21 11:42:17', 0);
INSERT INTO `adminlog` VALUES (389, 'jack', '0:0:0:0:0:0:0:1', '2019-12-21 16:14:55', '2019-12-21 16:17:44', 1);
INSERT INTO `adminlog` VALUES (390, 'jack', '0:0:0:0:0:0:0:1', '2019-12-23 14:08:57', '2019-12-23 14:08:57', 0);
INSERT INTO `adminlog` VALUES (391, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 08:56:33', '2019-12-24 08:56:33', 0);
INSERT INTO `adminlog` VALUES (392, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 08:58:22', '2019-12-24 08:58:22', 0);
INSERT INTO `adminlog` VALUES (393, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:03:05', '2019-12-24 09:03:05', 0);
INSERT INTO `adminlog` VALUES (394, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:16:43', '2019-12-24 09:16:43', 0);
INSERT INTO `adminlog` VALUES (395, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:26:45', '2019-12-24 09:26:45', 0);
INSERT INTO `adminlog` VALUES (396, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:28:31', '2019-12-24 09:32:42', 1);
INSERT INTO `adminlog` VALUES (397, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:33:16', '2019-12-24 09:33:16', 0);
INSERT INTO `adminlog` VALUES (398, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:48:27', '2019-12-24 09:49:05', 1);
INSERT INTO `adminlog` VALUES (399, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 09:49:37', '2019-12-24 09:52:05', 1);
INSERT INTO `adminlog` VALUES (400, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:14:18', '2019-12-24 10:15:36', 1);
INSERT INTO `adminlog` VALUES (401, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:16:16', '2019-12-24 10:16:16', 0);
INSERT INTO `adminlog` VALUES (402, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:22:52', '2019-12-24 10:27:00', 1);
INSERT INTO `adminlog` VALUES (403, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:28:14', '2019-12-24 10:28:14', 0);
INSERT INTO `adminlog` VALUES (404, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:30:42', '2019-12-24 10:30:42', 0);
INSERT INTO `adminlog` VALUES (405, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:34:23', '2019-12-24 10:34:23', 0);
INSERT INTO `adminlog` VALUES (406, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:37:33', '2019-12-24 10:37:33', 0);
INSERT INTO `adminlog` VALUES (407, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:38:47', '2019-12-24 10:38:47', 0);
INSERT INTO `adminlog` VALUES (408, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 10:51:12', '2019-12-24 10:51:23', 1);
INSERT INTO `adminlog` VALUES (409, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 11:01:24', '2019-12-24 11:01:30', 1);
INSERT INTO `adminlog` VALUES (410, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 11:12:34', '2019-12-24 11:17:09', 1);
INSERT INTO `adminlog` VALUES (411, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 11:18:10', '2019-12-24 11:18:10', 0);
INSERT INTO `adminlog` VALUES (412, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 11:18:44', '2019-12-24 11:18:44', 0);
INSERT INTO `adminlog` VALUES (413, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 13:32:52', '2019-12-24 13:32:52', 0);
INSERT INTO `adminlog` VALUES (414, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 14:35:27', '2019-12-24 14:35:27', 0);
INSERT INTO `adminlog` VALUES (415, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 14:41:16', '2019-12-24 14:41:16', 0);
INSERT INTO `adminlog` VALUES (416, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 14:42:58', '2019-12-24 14:42:58', 0);
INSERT INTO `adminlog` VALUES (417, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 14:44:35', '2019-12-24 14:44:35', 0);
INSERT INTO `adminlog` VALUES (418, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 14:52:11', '2019-12-24 14:52:11', 0);
INSERT INTO `adminlog` VALUES (419, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 15:04:15', '2019-12-24 15:04:19', 1);
INSERT INTO `adminlog` VALUES (420, 'jack', '0:0:0:0:0:0:0:1', '2019-12-24 15:49:00', '2019-12-24 15:49:19', 1);
INSERT INTO `adminlog` VALUES (421, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:04:14', '2019-12-25 10:05:08', 1);
INSERT INTO `adminlog` VALUES (422, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:06:16', '2019-12-25 10:09:39', 1);
INSERT INTO `adminlog` VALUES (423, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:10:02', '2019-12-25 10:10:18', 1);
INSERT INTO `adminlog` VALUES (424, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:10:55', '2019-12-25 10:12:34', 1);
INSERT INTO `adminlog` VALUES (425, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:28:31', '2019-12-25 10:32:31', 1);
INSERT INTO `adminlog` VALUES (426, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:33:08', '2019-12-25 10:33:38', 1);
INSERT INTO `adminlog` VALUES (427, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:34:37', '2019-12-25 10:37:02', 1);
INSERT INTO `adminlog` VALUES (428, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:38:02', '2019-12-25 10:47:13', 1);
INSERT INTO `adminlog` VALUES (429, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 10:47:54', '2019-12-25 11:00:11', 1);
INSERT INTO `adminlog` VALUES (430, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 11:41:29', '2019-12-25 11:46:40', 1);
INSERT INTO `adminlog` VALUES (431, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 11:47:11', '2019-12-25 11:48:50', 1);
INSERT INTO `adminlog` VALUES (432, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 11:50:17', '2019-12-25 11:50:17', 0);
INSERT INTO `adminlog` VALUES (433, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 11:55:44', '2019-12-25 11:55:44', 0);
INSERT INTO `adminlog` VALUES (434, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 13:45:37', '2019-12-25 13:45:37', 0);
INSERT INTO `adminlog` VALUES (435, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 13:50:05', '2019-12-25 13:50:05', 0);
INSERT INTO `adminlog` VALUES (436, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 13:53:38', '2019-12-25 13:53:38', 0);
INSERT INTO `adminlog` VALUES (437, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 13:55:10', '2019-12-25 13:55:10', 0);
INSERT INTO `adminlog` VALUES (438, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 14:14:24', '2019-12-25 14:14:24', 0);
INSERT INTO `adminlog` VALUES (439, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 14:48:06', '2019-12-25 14:48:06', 0);
INSERT INTO `adminlog` VALUES (440, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 14:49:19', '2019-12-25 14:49:19', 0);
INSERT INTO `adminlog` VALUES (441, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 14:57:39', '2019-12-25 14:57:39', 0);
INSERT INTO `adminlog` VALUES (442, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:18:32', '2019-12-25 15:18:32', 0);
INSERT INTO `adminlog` VALUES (443, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:30:03', '2019-12-25 15:30:03', 0);
INSERT INTO `adminlog` VALUES (444, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:33:53', '2019-12-25 15:33:53', 0);
INSERT INTO `adminlog` VALUES (445, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:42:45', '2019-12-25 15:42:45', 0);
INSERT INTO `adminlog` VALUES (446, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:48:12', '2019-12-25 15:48:12', 0);
INSERT INTO `adminlog` VALUES (447, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:49:33', '2019-12-25 15:49:33', 0);
INSERT INTO `adminlog` VALUES (448, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 15:57:46', '2019-12-25 15:57:46', 0);
INSERT INTO `adminlog` VALUES (449, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 16:01:47', '2019-12-25 16:01:47', 0);
INSERT INTO `adminlog` VALUES (450, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 16:19:48', '2019-12-25 16:19:48', 0);
INSERT INTO `adminlog` VALUES (451, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 16:23:18', '2019-12-25 16:23:18', 0);
INSERT INTO `adminlog` VALUES (452, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 16:26:29', '2019-12-25 16:26:29', 0);
INSERT INTO `adminlog` VALUES (453, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 16:30:09', '2019-12-25 16:30:09', 0);
INSERT INTO `adminlog` VALUES (454, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 16:32:17', '2019-12-25 16:32:17', 0);
INSERT INTO `adminlog` VALUES (455, 'jack', '0:0:0:0:0:0:0:1', '2019-12-25 18:26:58', '2019-12-25 18:26:58', 0);
INSERT INTO `adminlog` VALUES (456, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 08:54:33', '2019-12-26 08:54:33', 0);
INSERT INTO `adminlog` VALUES (457, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 08:59:38', '2019-12-26 08:59:38', 0);
INSERT INTO `adminlog` VALUES (458, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 09:26:07', '2019-12-26 09:27:02', 1);
INSERT INTO `adminlog` VALUES (459, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 09:27:43', '2019-12-26 09:27:43', 0);
INSERT INTO `adminlog` VALUES (460, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 09:39:13', '2019-12-26 09:40:04', 1);
INSERT INTO `adminlog` VALUES (461, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 09:43:43', '2019-12-26 09:43:43', 0);
INSERT INTO `adminlog` VALUES (462, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 10:08:09', '2019-12-26 10:08:09', 0);
INSERT INTO `adminlog` VALUES (463, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 10:47:11', '2019-12-26 10:47:11', 0);
INSERT INTO `adminlog` VALUES (464, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 11:08:49', '2019-12-26 11:08:49', 0);
INSERT INTO `adminlog` VALUES (465, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 13:10:32', '2019-12-26 13:10:32', 0);
INSERT INTO `adminlog` VALUES (466, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 13:12:19', '2019-12-26 13:12:19', 0);
INSERT INTO `adminlog` VALUES (467, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 13:14:02', '2019-12-26 13:14:02', 0);
INSERT INTO `adminlog` VALUES (468, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 13:19:11', '2019-12-26 13:19:11', 0);
INSERT INTO `adminlog` VALUES (469, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 13:53:20', '2019-12-26 13:53:20', 0);
INSERT INTO `adminlog` VALUES (470, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 14:16:10', '2019-12-26 14:16:10', 0);
INSERT INTO `adminlog` VALUES (471, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 14:23:46', '2019-12-26 14:23:46', 0);
INSERT INTO `adminlog` VALUES (472, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 14:25:38', '2019-12-26 14:25:38', 0);
INSERT INTO `adminlog` VALUES (473, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 14:32:52', '2019-12-26 14:32:52', 0);
INSERT INTO `adminlog` VALUES (474, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 14:33:55', '2019-12-26 14:33:55', 0);
INSERT INTO `adminlog` VALUES (475, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 15:30:51', '2019-12-26 15:30:51', 0);
INSERT INTO `adminlog` VALUES (476, 'jack', '0:0:0:0:0:0:0:1', '2019-12-26 19:34:31', '2019-12-26 19:34:48', 1);
INSERT INTO `adminlog` VALUES (477, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 08:39:01', '2019-12-27 08:48:09', 1);
INSERT INTO `adminlog` VALUES (478, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 09:31:49', '2019-12-27 09:31:49', 0);
INSERT INTO `adminlog` VALUES (479, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 11:02:10', '2019-12-27 11:02:10', 0);
INSERT INTO `adminlog` VALUES (480, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 11:05:22', '2019-12-27 11:05:22', 0);
INSERT INTO `adminlog` VALUES (481, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 11:09:34', '2019-12-27 11:09:34', 0);
INSERT INTO `adminlog` VALUES (482, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 11:19:31', '2019-12-27 11:19:31', 0);
INSERT INTO `adminlog` VALUES (483, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 11:30:33', '2019-12-27 11:30:33', 0);
INSERT INTO `adminlog` VALUES (484, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 11:35:26', '2019-12-27 11:36:40', 1);
INSERT INTO `adminlog` VALUES (485, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 14:18:26', '2019-12-27 14:21:54', 1);
INSERT INTO `adminlog` VALUES (486, 'jack', '0:0:0:0:0:0:0:1', '2019-12-27 20:32:15', '2019-12-27 20:33:01', 1);
INSERT INTO `adminlog` VALUES (487, 'jack', '0:0:0:0:0:0:0:1', '2019-12-28 07:20:54', '2019-12-28 07:30:55', 1);
INSERT INTO `adminlog` VALUES (488, 'jack', '0:0:0:0:0:0:0:1', '2019-12-28 07:35:11', '2019-12-28 07:35:45', 1);
INSERT INTO `adminlog` VALUES (489, 'jack', '0:0:0:0:0:0:0:1', '2019-12-28 07:39:27', '2019-12-28 07:39:44', 1);
INSERT INTO `adminlog` VALUES (490, 'jack', '0:0:0:0:0:0:0:1', '2019-12-28 10:49:11', '2019-12-28 10:49:33', 1);
INSERT INTO `adminlog` VALUES (491, 'jack', '0:0:0:0:0:0:0:1', '2019-12-28 10:54:54', '2019-12-28 10:55:23', 1);
INSERT INTO `adminlog` VALUES (492, 'jack', '0:0:0:0:0:0:0:1', '2019-12-28 17:43:10', '2019-12-28 17:44:15', 1);
INSERT INTO `adminlog` VALUES (493, 'jack', '0:0:0:0:0:0:0:1', '2019-12-29 15:30:43', '2019-12-29 15:30:43', 0);
INSERT INTO `adminlog` VALUES (494, 'jack', '0:0:0:0:0:0:0:1', '2019-12-29 15:50:26', '2019-12-29 15:50:26', 0);
INSERT INTO `adminlog` VALUES (495, 'jack', '0:0:0:0:0:0:0:1', '2019-12-29 15:53:20', '2019-12-29 15:54:28', 1);
INSERT INTO `adminlog` VALUES (496, 'jack', '0:0:0:0:0:0:0:1', '2019-12-29 16:00:05', '2019-12-29 16:00:05', 0);
INSERT INTO `adminlog` VALUES (497, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 13:36:26', '2020-01-07 13:43:36', 1);
INSERT INTO `adminlog` VALUES (498, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 13:44:53', '2020-01-07 13:45:00', 1);
INSERT INTO `adminlog` VALUES (499, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 13:46:18', '2020-01-07 13:46:18', 0);
INSERT INTO `adminlog` VALUES (500, 'jack', '0:0:0:0:0:0:0:1', '2020-01-07 14:13:07', '2020-01-07 14:13:07', 0);
INSERT INTO `adminlog` VALUES (501, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 15:02:51', '2020-01-08 15:02:51', 0);
INSERT INTO `adminlog` VALUES (502, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 16:32:29', '2020-01-08 16:32:29', 0);
INSERT INTO `adminlog` VALUES (503, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 17:12:24', '2020-01-08 17:12:24', 0);
INSERT INTO `adminlog` VALUES (504, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 17:27:42', '2020-01-08 17:27:42', 0);
INSERT INTO `adminlog` VALUES (505, 'jack', '0:0:0:0:0:0:0:1', '2020-01-08 19:58:34', '2020-01-08 19:58:34', 0);
INSERT INTO `adminlog` VALUES (506, 'jack', '0:0:0:0:0:0:0:1', '2020-01-09 09:00:43', '2020-01-09 09:01:37', 1);
INSERT INTO `adminlog` VALUES (507, 'jack', '0:0:0:0:0:0:0:1', '2020-01-13 13:42:21', '2020-01-13 13:57:33', 1);
INSERT INTO `adminlog` VALUES (508, 'jack', '0:0:0:0:0:0:0:1', '2020-01-13 13:58:12', '2020-01-13 13:58:22', 1);
INSERT INTO `adminlog` VALUES (509, 'jack', '0:0:0:0:0:0:0:1', '2020-01-13 14:00:50', '2020-01-13 14:01:48', 1);
INSERT INTO `adminlog` VALUES (510, 'jack', '0:0:0:0:0:0:0:1', '2020-01-13 14:02:33', '2020-01-13 14:02:38', 1);
INSERT INTO `adminlog` VALUES (511, 'jack', '0:0:0:0:0:0:0:1', '2020-02-17 12:43:57', '2020-02-17 12:43:57', 0);
INSERT INTO `adminlog` VALUES (512, 'jack', '0:0:0:0:0:0:0:1', '2020-02-17 12:53:35', '2020-02-17 12:53:35', 0);
INSERT INTO `adminlog` VALUES (513, 'jack', '0:0:0:0:0:0:0:1', '2020-02-17 12:58:26', '2020-02-17 12:58:26', 0);
INSERT INTO `adminlog` VALUES (514, 'jack', '0:0:0:0:0:0:0:1', '2020-02-17 13:03:19', '2020-02-17 13:03:19', 0);
INSERT INTO `adminlog` VALUES (515, 'jack', '0:0:0:0:0:0:0:1', '2020-02-17 13:56:32', '2020-02-17 13:56:32', 0);
INSERT INTO `adminlog` VALUES (516, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 21:18:27', '2020-02-20 21:18:27', 0);
INSERT INTO `adminlog` VALUES (517, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 21:21:02', '2020-02-20 21:21:02', 0);
INSERT INTO `adminlog` VALUES (518, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 21:25:04', '2020-02-20 21:25:04', 0);
INSERT INTO `adminlog` VALUES (519, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 21:36:24', '2020-02-20 21:36:24', 0);
INSERT INTO `adminlog` VALUES (520, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 21:37:18', '2020-02-20 21:37:18', 0);
INSERT INTO `adminlog` VALUES (521, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 21:37:44', '2020-02-20 21:37:44', 0);
INSERT INTO `adminlog` VALUES (522, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:05:15', '2020-02-20 22:05:15', 0);
INSERT INTO `adminlog` VALUES (523, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:08:37', '2020-02-20 22:08:37', 0);
INSERT INTO `adminlog` VALUES (524, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:09:24', '2020-02-20 22:09:24', 0);
INSERT INTO `adminlog` VALUES (525, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:10:57', '2020-02-20 22:10:57', 0);
INSERT INTO `adminlog` VALUES (526, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:20:46', '2020-02-20 22:20:46', 0);
INSERT INTO `adminlog` VALUES (527, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:26:19', '2020-02-20 22:26:19', 0);
INSERT INTO `adminlog` VALUES (528, 'jack', '0:0:0:0:0:0:0:1', '2020-02-20 22:30:03', '2020-02-20 22:30:03', 0);
INSERT INTO `adminlog` VALUES (529, 'jack', '0:0:0:0:0:0:0:1', '2020-02-21 10:52:10', '2020-02-21 10:52:10', 0);
INSERT INTO `adminlog` VALUES (530, 'jack', '0:0:0:0:0:0:0:1', '2020-02-21 11:10:13', '2020-02-21 11:10:13', 0);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lessonType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credit` int(11) NULL DEFAULT NULL,
  `teacherId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (2, 'C语言程序设计', 'B202', '必修课', 5, 1);
INSERT INTO `course` VALUES (3, '数据库设计新', 'C301', '必修课', 8, 6);
INSERT INTO `course` VALUES (4, 'android编程', 'A102', '选修课', 1, 2);
INSERT INTO `course` VALUES (6, 'java深入浅出', 'B204', '必修课', 3, 3);
INSERT INTO `course` VALUES (7, 'PHP基础教程', 'A302', '必修课', 2, 3);
INSERT INTO `course` VALUES (9, '高等数学', 'B201', '必修课', 4, 7);
INSERT INTO `course` VALUES (10, '微积分', 'C201', '必修课', 3, 8);
INSERT INTO `course` VALUES (11, '嵌入式系统设计', 'A102', '必修课', 3, 10);
INSERT INTO `course` VALUES (12, '工厂供电', 'A102', '选修课', 1, 9);
INSERT INTO `course` VALUES (13, '口述历史', 'A102', '选修课', 1, 11);
INSERT INTO `course` VALUES (14, 'MATLAB仿真应用', 'B201', '选修课', 2, 11);
INSERT INTO `course` VALUES (15, '美国历史', 'B201', '选修', 2, 12);
INSERT INTO `course` VALUES (18, '汽车构造原理', 'C303', '必修课', 12, 11);
INSERT INTO `course` VALUES (19, '疯狂文言文', 'C302', '选修课', 3, 11);
INSERT INTO `course` VALUES (21, '疯狂文言文1', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (22, '疯狂文言文2', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (23, '疯狂文言文3', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (24, '疯狂文言文4', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (25, '疯狂文言文5', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (26, '疯狂文言文6', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (27, '疯狂文言文7', NULL, NULL, NULL, 11);
INSERT INTO `course` VALUES (28, '中国历史', 'B2023', '必修课3', 53, 13);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` bigint(20) NULL DEFAULT NULL,
  `sorting` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '后台首页', 'layui-icon-home', NULL, NULL, 'false', 0, 1);
INSERT INTO `menu` VALUES (2, '我的面板', 'layui-icon-username', '', '', 'false', 0, 2);
INSERT INTO `menu` VALUES (3, '个人信息', 'layui-icon-username', '../admin/personalDate', NULL, 'false', 2, 111);
INSERT INTO `menu` VALUES (4, '修改密码', 'layui-icon-password', '../admin/changePassword', NULL, 'false', 2, 112);
INSERT INTO `menu` VALUES (5, '登录日志', 'layui-icon-log', '../admin/adminLoginLog', NULL, 'false', 2, 113);
INSERT INTO `menu` VALUES (6, '学生管理', 'layui-icon-login-wechat', '', '', 'false', 0, 3);
INSERT INTO `menu` VALUES (7, '学生列表', 'layui-icon-tabs', '../student/studentList', '', 'false', 6, 114);
INSERT INTO `menu` VALUES (8, '课程管理', 'layui-icon-template-1', NULL, NULL, 'false', 0, 4);
INSERT INTO `menu` VALUES (9, '课程列表', 'layui-icon-template', '../course/courseList', NULL, 'false', 8, 115);
INSERT INTO `menu` VALUES (10, '管理员管理', 'layui-icon-set', NULL, NULL, 'false', 0, 6);
INSERT INTO `menu` VALUES (11, '管理员列表', 'layui-icon-more-vertical', '../admin/adminList', NULL, 'false', 10, 116);
INSERT INTO `menu` VALUES (12, '角色管理', 'layui-icon-form', '../admin/roleList', NULL, 'false', 10, 117);
INSERT INTO `menu` VALUES (13, '菜单管理', 'layui-icon-rate', '../admin/menuList', '', 'false', 0, 7);
INSERT INTO `menu` VALUES (24, '第三级菜单', 'layui-icon-camera', '', '', 'false', 3, 1111);
INSERT INTO `menu` VALUES (36, '教师管理', 'layui-icon-friends', '', '', 'false', 0, 5);
INSERT INTO `menu` VALUES (37, '教师列表', 'layui-icon-tabs', '../teacher/teacherList', NULL, 'false', 36, 118);
INSERT INTO `menu` VALUES (41, '学生选课菜单', 'layui-icon-app', '', '', 'false', 0, 8);
INSERT INTO `menu` VALUES (42, '选择课程', 'layui-icon-read', '../student/chooseCourse', '', 'false', 41, 117);
INSERT INTO `menu` VALUES (43, '选课明细', 'layui-icon-align-left', '../student/courseList', '', 'false', 41, 118);
INSERT INTO `menu` VALUES (44, '教师菜单', 'layui-icon-username', '', '', 'false', 0, 9);
INSERT INTO `menu` VALUES (45, '添加修改课程', 'layui-icon-tabs', '../teacher/modifyCourse', '', 'false', 44, 120);
INSERT INTO `menu` VALUES (46, '课程明细', 'layui-icon-date', '../teacher/courseList', '', 'false', 44, 121);
INSERT INTO `menu` VALUES (49, '学生信息', 'layui-icon-vercode', '', '', 'false', 0, 10);
INSERT INTO `menu` VALUES (50, '个人信息', 'layui-icon-snowflake', '../student/info', '', 'false', 49, 123);
INSERT INTO `menu` VALUES (51, '修改密码', 'layui-icon-password', '../student/changePassword', '', 'false', 49, 124);
INSERT INTO `menu` VALUES (52, '教师信息', 'layui-icon-rate', '', '', 'false', 0, 11);
INSERT INTO `menu` VALUES (53, '个人信息', 'layui-icon-rate', '../teacher/info', '', 'false', 52, 125);
INSERT INTO `menu` VALUES (54, '修改密码', 'layui-icon-password', '../teacher/changePassword', '', 'false', 52, 126);
INSERT INTO `menu` VALUES (55, '学生选课明细', 'layui-icon-spread-left', '../student/studentCourses', '', 'false', 6, 126);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleRemark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '所有权限');
INSERT INTO `role` VALUES (2, '学生管理员', '部分权限，管理学生。');
INSERT INTO `role` VALUES (3, '课程管理员', '部分权限，管理课程');
INSERT INTO `role` VALUES (10, '菜单管理员', '部分权限 ，管理菜单');
INSERT INTO `role` VALUES (11, '教师管理员', '部分权限，管理教师');
INSERT INTO `role` VALUES (12, '学生', '选课，查询课程');
INSERT INTO `role` VALUES (13, '教师', '课程添加，查询');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `roleId` bigint(20) NULL DEFAULT NULL,
  `menuId` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (1, 1);
INSERT INTO `rolemenu` VALUES (1, 2);
INSERT INTO `rolemenu` VALUES (1, 3);
INSERT INTO `rolemenu` VALUES (1, 24);
INSERT INTO `rolemenu` VALUES (1, 4);
INSERT INTO `rolemenu` VALUES (1, 5);
INSERT INTO `rolemenu` VALUES (1, 6);
INSERT INTO `rolemenu` VALUES (1, 7);
INSERT INTO `rolemenu` VALUES (1, 55);
INSERT INTO `rolemenu` VALUES (1, 8);
INSERT INTO `rolemenu` VALUES (1, 9);
INSERT INTO `rolemenu` VALUES (1, 36);
INSERT INTO `rolemenu` VALUES (1, 37);
INSERT INTO `rolemenu` VALUES (2, 1);
INSERT INTO `rolemenu` VALUES (2, 2);
INSERT INTO `rolemenu` VALUES (2, 3);
INSERT INTO `rolemenu` VALUES (2, 4);
INSERT INTO `rolemenu` VALUES (2, 5);
INSERT INTO `rolemenu` VALUES (2, 6);
INSERT INTO `rolemenu` VALUES (2, 7);
INSERT INTO `rolemenu` VALUES (3, 1);
INSERT INTO `rolemenu` VALUES (3, 2);
INSERT INTO `rolemenu` VALUES (3, 3);
INSERT INTO `rolemenu` VALUES (3, 4);
INSERT INTO `rolemenu` VALUES (3, 5);
INSERT INTO `rolemenu` VALUES (3, 8);
INSERT INTO `rolemenu` VALUES (3, 9);
INSERT INTO `rolemenu` VALUES (10, 1);
INSERT INTO `rolemenu` VALUES (1, 10);
INSERT INTO `rolemenu` VALUES (1, 11);
INSERT INTO `rolemenu` VALUES (1, 12);
INSERT INTO `rolemenu` VALUES (11, 1);
INSERT INTO `rolemenu` VALUES (11, 2);
INSERT INTO `rolemenu` VALUES (10, 2);
INSERT INTO `rolemenu` VALUES (10, 3);
INSERT INTO `rolemenu` VALUES (10, 24);
INSERT INTO `rolemenu` VALUES (10, 4);
INSERT INTO `rolemenu` VALUES (10, 5);
INSERT INTO `rolemenu` VALUES (10, 13);
INSERT INTO `rolemenu` VALUES (11, 3);
INSERT INTO `rolemenu` VALUES (11, 24);
INSERT INTO `rolemenu` VALUES (11, 4);
INSERT INTO `rolemenu` VALUES (11, 5);
INSERT INTO `rolemenu` VALUES (11, 36);
INSERT INTO `rolemenu` VALUES (11, 37);
INSERT INTO `rolemenu` VALUES (12, 1);
INSERT INTO `rolemenu` VALUES (12, 41);
INSERT INTO `rolemenu` VALUES (12, 42);
INSERT INTO `rolemenu` VALUES (12, 43);
INSERT INTO `rolemenu` VALUES (13, 1);
INSERT INTO `rolemenu` VALUES (13, 44);
INSERT INTO `rolemenu` VALUES (13, 45);
INSERT INTO `rolemenu` VALUES (13, 46);
INSERT INTO `rolemenu` VALUES (12, 49);
INSERT INTO `rolemenu` VALUES (12, 50);
INSERT INTO `rolemenu` VALUES (12, 51);
INSERT INTO `rolemenu` VALUES (13, 52);
INSERT INTO `rolemenu` VALUES (13, 53);
INSERT INTO `rolemenu` VALUES (13, 54);
INSERT INTO `rolemenu` VALUES (1, 13);

-- ----------------------------
-- Table structure for s_c_m
-- ----------------------------
DROP TABLE IF EXISTS `s_c_m`;
CREATE TABLE `s_c_m`  (
  `s_id` int(11) NULL DEFAULT NULL,
  `c_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_c_m
-- ----------------------------
INSERT INTO `s_c_m` VALUES (1, 2);
INSERT INTO `s_c_m` VALUES (1, 3);
INSERT INTO `s_c_m` VALUES (1, 4);
INSERT INTO `s_c_m` VALUES (9, 2);
INSERT INTO `s_c_m` VALUES (9, 7);
INSERT INTO `s_c_m` VALUES (9, 13);
INSERT INTO `s_c_m` VALUES (1, 6);
INSERT INTO `s_c_m` VALUES (11, 2);
INSERT INTO `s_c_m` VALUES (11, 6);
INSERT INTO `s_c_m` VALUES (11, 10);
INSERT INTO `s_c_m` VALUES (11, 13);
INSERT INTO `s_c_m` VALUES (9, 11);
INSERT INTO `s_c_m` VALUES (7, 2);
INSERT INTO `s_c_m` VALUES (7, 3);
INSERT INTO `s_c_m` VALUES (7, 13);
INSERT INTO `s_c_m` VALUES (7, 19);
INSERT INTO `s_c_m` VALUES (7, 18);
INSERT INTO `s_c_m` VALUES (8, 6);
INSERT INTO `s_c_m` VALUES (8, 12);
INSERT INTO `s_c_m` VALUES (8, 14);
INSERT INTO `s_c_m` VALUES (8, 19);
INSERT INTO `s_c_m` VALUES (4, 13);
INSERT INTO `s_c_m` VALUES (4, 18);
INSERT INTO `s_c_m` VALUES (1, 21);
INSERT INTO `s_c_m` VALUES (2, 22);
INSERT INTO `s_c_m` VALUES (2, 23);
INSERT INTO `s_c_m` VALUES (9, 19);
INSERT INTO `s_c_m` VALUES (9, 18);
INSERT INTO `s_c_m` VALUES (2, 2);
INSERT INTO `s_c_m` VALUES (2, 3);
INSERT INTO `s_c_m` VALUES (2, 4);
INSERT INTO `s_c_m` VALUES (2, 6);
INSERT INTO `s_c_m` VALUES (3, 7);
INSERT INTO `s_c_m` VALUES (9, 10);
INSERT INTO `s_c_m` VALUES (1, 12);
INSERT INTO `s_c_m` VALUES (7, 14);
INSERT INTO `s_c_m` VALUES (8, 4);
INSERT INTO `s_c_m` VALUES (8, 13);
INSERT INTO `s_c_m` VALUES (8, 18);
INSERT INTO `s_c_m` VALUES (8, 15);
INSERT INTO `s_c_m` VALUES (4, 10);
INSERT INTO `s_c_m` VALUES (9, 15);
INSERT INTO `s_c_m` VALUES (24, 2);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `birthday` datetime  DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `levelId` int(11) NULL DEFAULT NULL,
  `createTime` datetime  DEFAULT NULL,
  `roleId` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '张三', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '2019-12-03 00:00:00', '13112341234', '12341234@qq.com', '山东济南', '精神小伙', 1, 2, '2019-12-09 14:58:21', 12);
INSERT INTO `student` VALUES (2, 'jack', 'E10ADC3949BA59ABBE56E057F20F883E', 2, '2018-10-11 00:00:00', '13112341234', '12341234@qq.com', '山东济南', '神经病', 1, 2, '2019-07-01 15:18:22', 12);
INSERT INTO `student` VALUES (3, '李四', 'E10ADC3949BA59ABBE56E057F20F883E', 2, '2018-08-15 00:00:00', '13211111111', 'aqwerq@qq.com', '山东聊城', '富二代', 1, 2, '2017-10-01 08:58:43', 12);
INSERT INTO `student` VALUES (4, '王五', 'E10ADC3949BA59ABBE56E057F20F883E', 2, '2012-12-01 00:00:00', '13412341234', 'aaa@163.com', '上海虹桥', '也是富二代', 1, 1, '2018-01-30 08:59:49', 12);
INSERT INTO `student` VALUES (5, '李刚', 'E10ADC3949BA59ABBE56E057F20F883E', 2, '2015-07-04 00:00:00', '13512341234', '13as@163.com', '天津南开', '有名的拆迁户', 0, 4, '2019-03-14 09:09:09', 12);
INSERT INTO `student` VALUES (7, '王安石', 'E10ADC3949BA59ABBE56E057F20F883E', 0, '2015-12-19 00:00:00', '13212341234', '123@126.com', '山东菏泽', '吹牛很厉害', 0, 2, '2019-12-19 16:14:03', 12);
INSERT INTO `student` VALUES (8, '李白', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '1997-12-19 00:00:00', '13412121212', 'libai122@qq.com', '湖南长沙', '刺客 走位飘逸', 1, 3, '2019-12-19 16:16:55', 12);
INSERT INTO `student` VALUES (9, '诸葛亮', 'E10ADC3949BA59ABBE56E057F20F883E', 0, '2000-12-19 00:00:00', '13590871221', 'zhugeliang@163.com', '山东琅琊人', '职业法师 有时候也是刺客', 0, 1, '2019-12-19 16:25:25', 12);
INSERT INTO `student` VALUES (10, '李晓明', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '2019-12-23 00:00:00', '13212344321', 'lixioaming@126.com', '山东莱芜', '贫困户一级', 1, 1, '2019-12-23 14:22:37', 12);
INSERT INTO `student` VALUES (11, '徐庶', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '2019-12-01 00:00:00', '13211111111', '123123@126.com', '浙江杭州', '好学生', 0, 1, '2019-12-24 11:11:18', 12);
INSERT INTO `student` VALUES (12, '黎明', '4297F44B13955235245B2497399D7A93', 1, NULL, '13212344321', NULL, NULL, NULL, 0, 0, '2020-02-21 11:08:11', NULL);
INSERT INTO `student` VALUES (13, '112', 'E10ADC3949BA59ABBE56E057F20F883E', 2, '2020-02-04 00:00:00', '13212344321', '123@qq.com', '214', '2423', 1, 1, '2020-02-21 11:11:29', NULL);
INSERT INTO `student` VALUES (24, 'test1', '4297F44B13955235245B2497399D7A93', 1, NULL, '12345678900', NULL, NULL, NULL, 0, 0, '2020-02-21 11:21:02', 12);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `birthday` datetime  DEFAULT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  `rank` int(11) NULL DEFAULT NULL,
  `jobDate` datetime DEFAULT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '王刚', 0, '2004-11-01 00:00:00', 1, 2, '2005-06-04 00:00:00', '自动化学院新', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (2, '李明', 1, '2018-07-01 16:58:59', 2, 3, '2019-02-01 16:59:10', '计算机学院', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (3, '王凯新', 2, '2008-08-01 00:00:00', 1, 4, '2009-08-01 00:00:00', '机械工程学院', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (6, '黎勇', 1, '2016-12-20 00:00:00', 1, 1, '2016-12-20 00:00:00', '汽车工程学院', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (7, '朱丽华', 0, '2019-12-20 00:00:00', 4, 1, '2019-12-20 00:00:00', '化学学院', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (8, '宿茂刚', 1, '2019-12-19 00:00:00', 4, 4, '2019-12-02 00:00:00', '体育学院', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (9, '李华', 2, '2019-12-01 00:00:00', 1, 1, '2019-12-01 00:00:00', '魔法学院', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, 13);
INSERT INTO `teacher` VALUES (10, '叶问', 1, '2019-12-07 00:00:00', 1, 1, '2019-12-27 00:00:00', '机械学院', 'E10ADC3949BA59ABBE56E057F20F883E', '13211111111', 13);
INSERT INTO `teacher` VALUES (11, '司马徽', 1, '2019-10-25 00:00:00', 4, 4, '2019-12-03 00:00:00', '历史系', '4297F44B13955235245B2497399D7A93', NULL, 13);
INSERT INTO `teacher` VALUES (12, '王上元', 0, '2019-12-02 00:00:00', 4, 4, '2019-12-02 00:00:00', '历史系', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, NULL);
INSERT INTO `teacher` VALUES (13, 'test1', 1, NULL, 0, 0, NULL, NULL, '4297F44B13955235245B2497399D7A93', '12345678900', 13);

SET FOREIGN_KEY_CHECKS = 1;
