/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : flybbs

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2018-12-06 11:47:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tab_comment
-- ----------------------------
DROP TABLE IF EXISTS `tab_comment`;
CREATE TABLE `tab_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `comment_content` varchar(1000) NOT NULL DEFAULT '',
  `like_num` int(11) NOT NULL DEFAULT '0',
  `is_choose` int(11) NOT NULL DEFAULT '0',
  `comment_time` datetime NOT NULL DEFAULT '0000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tab_topic
-- ----------------------------
DROP TABLE IF EXISTS `tab_topic`;
CREATE TABLE `tab_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `view_times` int(11) NOT NULL DEFAULT '0',
  `kiss_num` int(11) NOT NULL DEFAULT '0',
  `is_top` int(11) NOT NULL DEFAULT '0',
  `is_good` int(11) NOT NULL DEFAULT '0',
  `is_end` int(11) NOT NULL DEFAULT '0',
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-01-01 00:00:00',
  `userid` int(11) NOT NULL DEFAULT '0',
  `topic_category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_topic
-- ----------------------------

-- ----------------------------
-- Table structure for tab_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `tab_topic_category`;
CREATE TABLE `tab_topic_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `nickname` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `sign` varchar(500) NOT NULL DEFAULT '',
  `sex` int(11) NOT NULL DEFAULT '0',
  `pic_path` varchar(500) NOT NULL DEFAULT '',
  `qq` varchar(50) NOT NULL DEFAULT '',
  `weibo` varchar(100) NOT NULL DEFAULT '',
  `vip_grade` int(11) NOT NULL DEFAULT '0',
  `kiss_num` int(11) NOT NULL DEFAULT '0',
  `join_time` datetime NOT NULL DEFAULT '0000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------

-- ----------------------------
-- Table structure for tab_user_collect_topic
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_collect_topic`;
CREATE TABLE `tab_user_collect_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user_collect_topic
-- ----------------------------

-- ----------------------------
-- Table structure for tab_user_message
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_message`;
CREATE TABLE `tab_user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(100) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user_message
-- ----------------------------

-- ----------------------------
-- Table structure for tab_user_qiandao
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_qiandao`;
CREATE TABLE `tab_user_qiandao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user_qiandao
-- ----------------------------
