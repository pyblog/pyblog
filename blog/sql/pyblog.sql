/*
Navicat MySQL Data Transfer

Source Server         : axonRemote
Source Server Version : 50141
Source Host           : 10.5.0.103:3306
Source Database       : pyblog

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2012-07-16 16:40:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add site', '6', 'add_site');
INSERT INTO `auth_permission` VALUES ('17', 'Can change site', '6', 'change_site');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete site', '6', 'delete_site');
INSERT INTO `auth_permission` VALUES ('19', 'Can add log entry', '7', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('20', 'Can change log entry', '7', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete log entry', '7', 'delete_logentry');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'admin', '', '', 'desarrollo.quitora@gmail.com', 'pbkdf2_sha256$10000$VWBHY43TStzm$NSQouDOYS2XOcQ7Bekv63aiwKgrkKQwFEWXWhdCIJg8=', '1', '1', '1', '2012-07-16 21:40:32', '2012-07-16 21:39:51');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'site', 'sites', 'site');
INSERT INTO `django_content_type` VALUES ('7', 'log entry', 'admin', 'logentry');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('cda19ffc82614221691e3bab7cc9f809', 'ODRlZmJlZTUxYWRmMzZmNjU1MWY2MDAyOGMwZmZlN2NjNzYwNzIzOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-07-30 21:40:32');

-- ----------------------------
-- Table structure for `django_site`
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');
