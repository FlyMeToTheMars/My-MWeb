/*
Navicat MySQL Data Transfer

Source Server         : mysql@gateway001
Source Server Version : 50723
Source Host           : 47.96.97.244:3306
Source Database       : dv

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-18 13:53:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for workhour
-- ----------------------------
DROP TABLE IF EXISTS `workhour`;
CREATE TABLE `workhour` (
  `whid` varchar(255) DEFAULT NULL,
  `taskid` varchar(255) DEFAULT NULL,
  `participant` varchar(255) DEFAULT NULL,
  `workhour` double(10,2) DEFAULT NULL,
  `loaddate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
