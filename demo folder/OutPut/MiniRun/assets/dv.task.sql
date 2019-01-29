/*
Navicat MySQL Data Transfer

Source Server         : mysql@gateway001
Source Server Version : 50723
Source Host           : 47.96.97.244:3306
Source Database       : dv

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-14 11:08:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `TaskID` varchar(255) DEFAULT NULL,
  `TaskName` varchar(255) DEFAULT NULL,
  `PlanStartAt` datetime DEFAULT NULL,
  `PlanEndAt` datetime DEFAULT NULL,
  `StartAt` datetime DEFAULT NULL,
  `EndAt` datetime DEFAULT NULL,
  `ProjectNum` varchar(255) DEFAULT NULL,
  `ProjectName` varchar(255) DEFAULT NULL,
  `loaddate` datetime DEFAULT NULL,
  `PersonID` varchar(255) DEFAULT NULL,
  `person` varchar(255) DEFAULT NULL,
  `MileStone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
