/*
Navicat MySQL Data Transfer

Source Server         : mysql@gateway001
Source Server Version : 50723
Source Host           : 47.96.97.244:3306
Source Database       : zeus

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-18 13:52:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ResourceLocation
-- ----------------------------
DROP TABLE IF EXISTS `ResourceLocation`;
CREATE TABLE `ResourceLocation` (
  `id` int(11) NOT NULL,
  `sys` varchar(255) DEFAULT NULL,
  `tbl` varchar(255) DEFAULT NULL,
  `dt` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ResourceLocation
-- ----------------------------
INSERT INTO `ResourceLocation` VALUES ('1', 'ArasPlm', 'task', '20181001', '/innovatorserver/output/ArasPlm_task_20181001.csv', '2018-10-01 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('2', 'ArasPlm', 'task', '20181002', '/innovatorserver/output/ArasPlm_task_20181002.csv', '2018-10-02 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('3', 'ArasPlm', 'task', '20181003', '/innovatorserver/output/ArasPlm_task_20181003.csv', '2018-10-03 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('4', 'ArasPlm', 'task', '20181004', '/innovatorserver/output/ArasPlm_task_20181004.csv', '2018-10-04 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('5', 'ArasPlm', 'task', '20181005', '/innovatorserver/output/ArasPlm_task_20181005.csv', '2018-10-05 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('6', 'ArasPlm', 'task', '20181006', '/innovatorserver/output/ArasPlm_task_20181006.csv', '2018-10-06 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('7', 'ArasPlm', 'task', '20181007', '/innovatorserver/output/ArasPlm_task_20181007.csv', '2018-10-07 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('8', 'ArasPlm', 'task', '20181008', '/innovatorserver/output/ArasPlm_task_20181008.csv', '2018-10-08 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('9', 'ArasPlm', 'task', '20181009', '/innovatorserver/output/ArasPlm_task_20181009.csv', '2018-10-09 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('10', 'ArasPlm', 'task', '20181010', '/innovatorserver/output/ArasPlm_task_20181010.csv', '2018-10-10 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('11', 'ArasPlm', 'task', '20181011', '/innovatorserver/output/ArasPlm_task_20181011.csv', '2018-10-11 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('12', 'ArasPlm', 'task', '20181012', '/innovatorserver/output/ArasPlm_task_20181012.csv', '2018-10-12 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('13', 'ArasPlm', 'task', '20181013', '/innovatorserver/output/ArasPlm_task_20181013.csv', '2018-10-13 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('14', 'ArasPlm', 'task', '20181014', '/innovatorserver/output/ArasPlm_task_20181014.csv', '2018-10-14 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('15', 'ArasPlm', 'task', '20181015', '/innovatorserver/output/ArasPlm_task_20181015.csv', '2018-10-15 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('16', 'ArasPlm', 'task', '20181016', '/innovatorserver/output/ArasPlm_task_20181016.csv', '2018-10-16 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('17', 'ArasPlm', 'task', '20181017', '/innovatorserver/output/ArasPlm_task_20181017.csv', '2018-10-17 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('18', 'ArasPlm', 'task', '20181018', '/innovatorserver/output/ArasPlm_task_20181018.csv', '2018-10-18 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('19', 'ArasPlm', 'task', '20181019', '/innovatorserver/output/ArasPlm_task_20181019.csv', '2018-10-19 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('20', 'ArasPlm', 'task', '20181020', '/innovatorserver/output/ArasPlm_task_20181020.csv', '2018-10-20 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('21', 'ArasPlm', 'task', '20181021', '/innovatorserver/output/ArasPlm_task_20181021.csv', '2018-10-21 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('22', 'ArasPlm', 'task', '20181022', '/innovatorserver/output/ArasPlm_task_20181022.csv', '2018-10-22 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('23', 'ArasPlm', 'task', '20181023', '/innovatorserver/output/ArasPlm_task_20181023.csv', '2018-10-23 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('24', 'ArasPlm', 'task', '20181024', '/innovatorserver/output/ArasPlm_task_20181024.csv', '2018-10-24 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('25', 'ArasPlm', 'task', '20181025', '/innovatorserver/output/ArasPlm_task_20181025.csv', '2018-10-25 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('26', 'ArasPlm', 'task', '20181026', '/innovatorserver/output/ArasPlm_task_20181026.csv', '2018-10-26 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('27', 'ArasPlm', 'task', '20181027', '/innovatorserver/output/ArasPlm_task_20181027.csv', '2018-10-27 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('28', 'ArasPlm', 'task', '20181028', '/innovatorserver/output/ArasPlm_task_20181028.csv', '2018-10-28 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('29', 'ArasPlm', 'task', '20181029', '/innovatorserver/output/ArasPlm_task_20181029.csv', '2018-10-29 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('30', 'ArasPlm', 'task', '20181030', '/innovatorserver/output/ArasPlm_task_20181030.csv', '2018-10-30 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('31', 'ArasPlm', 'task', '20181031', '/innovatorserver/output/ArasPlm_task_20181031.csv', '2018-10-31 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('32', 'ArasPlm', 'task', '20181101', '/innovatorserver/output/ArasPlm_task_20181101.csv', '2018-11-01 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('33', 'ArasPlm', 'task', '20181102', '/innovatorserver/output/ArasPlm_task_20181102.csv', '2018-11-02 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('34', 'ArasPlm', 'task', '20181103', '/innovatorserver/output/ArasPlm_task_20181103.csv', '2018-11-03 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('35', 'ArasPlm', 'task', '20181104', '/innovatorserver/output/ArasPlm_task_20181104.csv', '2018-11-04 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('36', 'ArasPlm', 'task', '20181105', '/innovatorserver/output/ArasPlm_task_20181105.csv', '2018-11-05 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('37', 'ArasPlm', 'task', '20181106', '/innovatorserver/output/ArasPlm_task_20181106.csv', '2018-11-06 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('38', 'ArasPlm', 'task', '20181107', '/innovatorserver/output/ArasPlm_task_20181107.csv', '2018-11-07 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('39', 'ArasPlm', 'task', '20181108', '/innovatorserver/output/ArasPlm_task_20181108.csv', '2018-11-08 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('40', 'ArasPlm', 'task', '20181109', '/innovatorserver/output/ArasPlm_task_20181109.csv', '2018-11-09 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('41', 'ArasPlm', 'task', '20181110', '/innovatorserver/output/ArasPlm_task_20181110.csv', '2018-11-10 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('42', 'ArasPlm', 'task', '20181111', '/innovatorserver/output/ArasPlm_task_20181111.csv', '2018-11-11 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('43', 'ArasPlm', 'task', '20181112', '/innovatorserver/output/ArasPlm_task_20181112.csv', '2018-11-12 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('44', 'ArasPlm', 'task', '20181113', '/innovatorserver/output/ArasPlm_task_20181113.csv', '2018-11-13 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('45', 'ArasPlm', 'task', '20181114', '/innovatorserver/output/ArasPlm_task_20181114.csv', '2018-11-14 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('46', 'ArasPlm', 'task', '20181115', '/innovatorserver/output/ArasPlm_task_20181115.csv', '2018-11-15 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('47', 'ArasPlm', 'task', '20181116', '/innovatorserver/output/ArasPlm_task_20181116.csv', '2018-11-16 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('48', 'ArasPlm', 'task', '20181117', '/innovatorserver/output/ArasPlm_task_20181117.csv', '2018-11-17 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('49', 'ArasPlm', 'task', '20181118', '/innovatorserver/output/ArasPlm_task_20181118.csv', '2018-11-18 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('50', 'ArasPlm', 'task', '20181119', '/innovatorserver/output/ArasPlm_task_20181119.csv', '2018-11-19 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('51', 'ArasPlm', 'task', '20181120', '/innovatorserver/output/ArasPlm_task_20181120.csv', '2018-11-20 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('52', 'ArasPlm', 'task', '20181121', '/innovatorserver/output/ArasPlm_task_20181121.csv', '2018-11-21 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('53', 'ArasPlm', 'task', '20181122', '/innovatorserver/output/ArasPlm_task_20181122.csv', '2018-11-22 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('54', 'ArasPlm', 'task', '20181123', '/innovatorserver/output/ArasPlm_task_20181123.csv', '2018-11-23 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('55', 'ArasPlm', 'task', '20181124', '/innovatorserver/output/ArasPlm_task_20181124.csv', '2018-11-24 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('56', 'ArasPlm', 'task', '20181125', '/innovatorserver/output/ArasPlm_task_20181125.csv', '2018-11-25 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('57', 'ArasPlm', 'task', '20181126', '/innovatorserver/output/ArasPlm_task_20181126.csv', '2018-11-26 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('58', 'ArasPlm', 'task', '20181127', '/innovatorserver/output/ArasPlm_task_20181127.csv', '2018-11-27 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('59', 'ArasPlm', 'task', '20181128', '/innovatorserver/output/ArasPlm_task_20181128.csv', '2018-11-28 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('60', 'ArasPlm', 'task', '20181129', '/innovatorserver/output/ArasPlm_task_20181129.csv', '2018-11-29 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('61', 'ArasPlm', 'task', '20181130', '/innovatorserver/output/ArasPlm_task_20181130.csv', '2018-11-30 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('62', 'ArasPlm', 'task', '20181201', '/innovatorserver/output/ArasPlm_task_20181201.csv', '2018-12-01 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('63', 'ArasPlm', 'task', '20181202', '/innovatorserver/output/ArasPlm_task_20181202.csv', '2018-12-02 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('64', 'ArasPlm', 'task', '20181203', '/innovatorserver/output/ArasPlm_task_20181203.csv', '2018-12-03 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('65', 'ArasPlm', 'task', '20181204', '/innovatorserver/output/ArasPlm_task_20181204.csv', '2018-12-04 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('66', 'ArasPlm', 'task', '20181205', '/innovatorserver/output/ArasPlm_task_20181205.csv', '2018-12-05 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('67', 'ArasPlm', 'task', '20181206', '/innovatorserver/output/ArasPlm_task_20181206.csv', '2018-12-06 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('68', 'ArasPlm', 'task', '20181207', '/innovatorserver/output/ArasPlm_task_20181207.csv', '2018-12-07 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('69', 'ArasPlm', 'task', '20181208', '/innovatorserver/output/ArasPlm_task_20181208.csv', '2018-12-08 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('70', 'ArasPlm', 'task', '20181209', '/innovatorserver/output/ArasPlm_task_20181209.csv', '2018-12-09 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('71', 'ArasPlm', 'task', '20181210', '/innovatorserver/output/ArasPlm_task_20181210.csv', '2018-12-10 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('72', 'ArasPlm', 'task', '20181211', '/innovatorserver/output/ArasPlm_task_20181211.csv', '2018-12-11 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('73', 'ArasPlm', 'task', '20181212', '/innovatorserver/output/ArasPlm_task_20181212.csv', '2018-12-12 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('74', 'ArasPlm', 'task', '20181213', '/innovatorserver/output/ArasPlm_task_20181213.csv', '2018-12-13 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('75', 'ArasPlm', 'task', '20181214', '/innovatorserver/output/ArasPlm_task_20181214.csv', '2018-12-14 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('76', 'ArasPlm', 'task', '20181215', '/innovatorserver/output/ArasPlm_task_20181215.csv', '2018-12-15 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('77', 'ArasPlm', 'task', '20181216', '/innovatorserver/output/ArasPlm_task_20181216.csv', '2018-12-16 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('78', 'ArasPlm', 'task', '20181217', '/innovatorserver/output/ArasPlm_task_20181217.csv', '2018-12-17 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('79', 'ArasPlm', 'task', '20181218', '/innovatorserver/output/ArasPlm_task_20181218.csv', '2018-12-18 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('80', 'ArasPlm', 'task', '20181219', '/innovatorserver/output/ArasPlm_task_20181219.csv', '2018-12-19 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('81', 'ArasPlm', 'task', '20181220', '/innovatorserver/output/ArasPlm_task_20181220.csv', '2018-12-20 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('82', 'ArasPlm', 'task', '20181221', '/innovatorserver/output/ArasPlm_task_20181221.csv', '2018-12-21 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('83', 'ArasPlm', 'task', '20181222', '/innovatorserver/output/ArasPlm_task_20181222.csv', '2018-12-22 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('84', 'ArasPlm', 'task', '20181223', '/innovatorserver/output/ArasPlm_task_20181223.csv', '2018-12-23 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('85', 'ArasPlm', 'task', '20181224', '/innovatorserver/output/ArasPlm_task_20181224.csv', '2018-12-24 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('86', 'ArasPlm', 'task', '20181225', '/innovatorserver/output/ArasPlm_task_20181225.csv', '2018-12-25 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('87', 'ArasPlm', 'task', '20181226', '/innovatorserver/output/ArasPlm_task_20181226.csv', '2018-12-26 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('88', 'ArasPlm', 'task', '20181227', '/innovatorserver/output/ArasPlm_task_20181227.csv', '2018-12-27 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('89', 'ArasPlm', 'task', '20181228', '/innovatorserver/output/ArasPlm_task_20181228.csv', '2018-12-28 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('90', 'ArasPlm', 'task', '20181229', '/innovatorserver/output/ArasPlm_task_20181229.csv', '2018-12-29 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('91', 'ArasPlm', 'task', '20181230', '/innovatorserver/output/ArasPlm_task_20181230.csv', '2018-12-30 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('92', 'ArasPlm', 'task', '20181231', '/innovatorserver/output/ArasPlm_task_20181231.csv', '2018-12-31 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('93', 'ArasPlm', 'workhour', '20181001', '/innovatorserver/output/ArasPlm_workhour_20181001.csv', '2018-10-01 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('94', 'ArasPlm', 'workhour', '20181002', '/innovatorserver/output/ArasPlm_workhour_20181002.csv', '2018-10-02 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('95', 'ArasPlm', 'workhour', '20181003', '/innovatorserver/output/ArasPlm_workhour_20181003.csv', '2018-10-03 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('96', 'ArasPlm', 'workhour', '20181004', '/innovatorserver/output/ArasPlm_workhour_20181004.csv', '2018-10-04 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('97', 'ArasPlm', 'workhour', '20181005', '/innovatorserver/output/ArasPlm_workhour_20181005.csv', '2018-10-05 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('98', 'ArasPlm', 'workhour', '20181006', '/innovatorserver/output/ArasPlm_workhour_20181006.csv', '2018-10-06 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('99', 'ArasPlm', 'workhour', '20181007', '/innovatorserver/output/ArasPlm_workhour_20181007.csv', '2018-10-07 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('100', 'ArasPlm', 'workhour', '20181008', '/innovatorserver/output/ArasPlm_workhour_20181008.csv', '2018-10-08 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('101', 'ArasPlm', 'workhour', '20181009', '/innovatorserver/output/ArasPlm_workhour_20181009.csv', '2018-10-09 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('102', 'ArasPlm', 'workhour', '20181010', '/innovatorserver/output/ArasPlm_workhour_20181010.csv', '2018-10-10 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('103', 'ArasPlm', 'workhour', '20181011', '/innovatorserver/output/ArasPlm_workhour_20181011.csv', '2018-10-11 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('104', 'ArasPlm', 'workhour', '20181012', '/innovatorserver/output/ArasPlm_workhour_20181012.csv', '2018-10-12 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('105', 'ArasPlm', 'workhour', '20181013', '/innovatorserver/output/ArasPlm_workhour_20181013.csv', '2018-10-13 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('106', 'ArasPlm', 'workhour', '20181014', '/innovatorserver/output/ArasPlm_workhour_20181014.csv', '2018-10-14 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('107', 'ArasPlm', 'workhour', '20181015', '/innovatorserver/output/ArasPlm_workhour_20181015.csv', '2018-10-15 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('108', 'ArasPlm', 'workhour', '20181016', '/innovatorserver/output/ArasPlm_workhour_20181016.csv', '2018-10-16 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('109', 'ArasPlm', 'workhour', '20181017', '/innovatorserver/output/ArasPlm_workhour_20181017.csv', '2018-10-17 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('110', 'ArasPlm', 'workhour', '20181018', '/innovatorserver/output/ArasPlm_workhour_20181018.csv', '2018-10-18 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('111', 'ArasPlm', 'workhour', '20181019', '/innovatorserver/output/ArasPlm_workhour_20181019.csv', '2018-10-19 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('112', 'ArasPlm', 'workhour', '20181020', '/innovatorserver/output/ArasPlm_workhour_20181020.csv', '2018-10-20 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('113', 'ArasPlm', 'workhour', '20181021', '/innovatorserver/output/ArasPlm_workhour_20181021.csv', '2018-10-21 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('114', 'ArasPlm', 'workhour', '20181022', '/innovatorserver/output/ArasPlm_workhour_20181022.csv', '2018-10-22 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('115', 'ArasPlm', 'workhour', '20181023', '/innovatorserver/output/ArasPlm_workhour_20181023.csv', '2018-10-23 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('116', 'ArasPlm', 'workhour', '20181024', '/innovatorserver/output/ArasPlm_workhour_20181024.csv', '2018-10-24 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('117', 'ArasPlm', 'workhour', '20181025', '/innovatorserver/output/ArasPlm_workhour_20181025.csv', '2018-10-25 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('118', 'ArasPlm', 'workhour', '20181026', '/innovatorserver/output/ArasPlm_workhour_20181026.csv', '2018-10-26 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('119', 'ArasPlm', 'workhour', '20181027', '/innovatorserver/output/ArasPlm_workhour_20181027.csv', '2018-10-27 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('120', 'ArasPlm', 'workhour', '20181028', '/innovatorserver/output/ArasPlm_workhour_20181028.csv', '2018-10-28 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('121', 'ArasPlm', 'workhour', '20181029', '/innovatorserver/output/ArasPlm_workhour_20181029.csv', '2018-10-29 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('122', 'ArasPlm', 'workhour', '20181030', '/innovatorserver/output/ArasPlm_workhour_20181030.csv', '2018-10-30 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('123', 'ArasPlm', 'workhour', '20181031', '/innovatorserver/output/ArasPlm_workhour_20181031.csv', '2018-10-31 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('124', 'ArasPlm', 'workhour', '20181101', '/innovatorserver/output/ArasPlm_workhour_20181101.csv', '2018-11-01 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('125', 'ArasPlm', 'workhour', '20181102', '/innovatorserver/output/ArasPlm_workhour_20181102.csv', '2018-11-02 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('126', 'ArasPlm', 'workhour', '20181103', '/innovatorserver/output/ArasPlm_workhour_20181103.csv', '2018-11-03 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('127', 'ArasPlm', 'workhour', '20181104', '/innovatorserver/output/ArasPlm_workhour_20181104.csv', '2018-11-04 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('128', 'ArasPlm', 'workhour', '20181105', '/innovatorserver/output/ArasPlm_workhour_20181105.csv', '2018-11-05 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('129', 'ArasPlm', 'workhour', '20181106', '/innovatorserver/output/ArasPlm_workhour_20181106.csv', '2018-11-06 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('130', 'ArasPlm', 'workhour', '20181107', '/innovatorserver/output/ArasPlm_workhour_20181107.csv', '2018-11-07 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('131', 'ArasPlm', 'workhour', '20181108', '/innovatorserver/output/ArasPlm_workhour_20181108.csv', '2018-11-08 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('132', 'ArasPlm', 'workhour', '20181109', '/innovatorserver/output/ArasPlm_workhour_20181109.csv', '2018-11-09 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('133', 'ArasPlm', 'workhour', '20181110', '/innovatorserver/output/ArasPlm_workhour_20181110.csv', '2018-11-10 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('134', 'ArasPlm', 'workhour', '20181111', '/innovatorserver/output/ArasPlm_workhour_20181111.csv', '2018-11-11 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('135', 'ArasPlm', 'workhour', '20181112', '/innovatorserver/output/ArasPlm_workhour_20181112.csv', '2018-11-12 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('136', 'ArasPlm', 'workhour', '20181113', '/innovatorserver/output/ArasPlm_workhour_20181113.csv', '2018-11-13 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('137', 'ArasPlm', 'workhour', '20181114', '/innovatorserver/output/ArasPlm_workhour_20181114.csv', '2018-11-14 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('138', 'ArasPlm', 'workhour', '20181115', '/innovatorserver/output/ArasPlm_workhour_20181115.csv', '2018-11-15 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('139', 'ArasPlm', 'workhour', '20181116', '/innovatorserver/output/ArasPlm_workhour_20181116.csv', '2018-11-16 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('140', 'ArasPlm', 'workhour', '20181117', '/innovatorserver/output/ArasPlm_workhour_20181117.csv', '2018-11-17 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('141', 'ArasPlm', 'workhour', '20181118', '/innovatorserver/output/ArasPlm_workhour_20181118.csv', '2018-11-18 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('142', 'ArasPlm', 'workhour', '20181119', '/innovatorserver/output/ArasPlm_workhour_20181119.csv', '2018-11-19 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('143', 'ArasPlm', 'workhour', '20181120', '/innovatorserver/output/ArasPlm_workhour_20181120.csv', '2018-11-20 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('144', 'ArasPlm', 'workhour', '20181121', '/innovatorserver/output/ArasPlm_workhour_20181121.csv', '2018-11-21 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('145', 'ArasPlm', 'workhour', '20181122', '/innovatorserver/output/ArasPlm_workhour_20181122.csv', '2018-11-22 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('146', 'ArasPlm', 'workhour', '20181123', '/innovatorserver/output/ArasPlm_workhour_20181123.csv', '2018-11-23 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('147', 'ArasPlm', 'workhour', '20181124', '/innovatorserver/output/ArasPlm_workhour_20181124.csv', '2018-11-24 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('148', 'ArasPlm', 'workhour', '20181125', '/innovatorserver/output/ArasPlm_workhour_20181125.csv', '2018-11-25 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('149', 'ArasPlm', 'workhour', '20181126', '/innovatorserver/output/ArasPlm_workhour_20181126.csv', '2018-11-26 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('150', 'ArasPlm', 'workhour', '20181127', '/innovatorserver/output/ArasPlm_workhour_20181127.csv', '2018-11-27 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('151', 'ArasPlm', 'workhour', '20181128', '/innovatorserver/output/ArasPlm_workhour_20181128.csv', '2018-11-28 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('152', 'ArasPlm', 'workhour', '20181129', '/innovatorserver/output/ArasPlm_workhour_20181129.csv', '2018-11-29 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('153', 'ArasPlm', 'workhour', '20181130', '/innovatorserver/output/ArasPlm_workhour_20181130.csv', '2018-11-30 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('154', 'ArasPlm', 'workhour', '20181201', '/innovatorserver/output/ArasPlm_workhour_20181201.csv', '2018-12-01 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('155', 'ArasPlm', 'workhour', '20181202', '/innovatorserver/output/ArasPlm_workhour_20181202.csv', '2018-12-02 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('156', 'ArasPlm', 'workhour', '20181203', '/innovatorserver/output/ArasPlm_workhour_20181203.csv', '2018-12-03 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('157', 'ArasPlm', 'workhour', '20181204', '/innovatorserver/output/ArasPlm_workhour_20181204.csv', '2018-12-04 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('158', 'ArasPlm', 'workhour', '20181205', '/innovatorserver/output/ArasPlm_workhour_20181205.csv', '2018-12-05 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('159', 'ArasPlm', 'workhour', '20181206', '/innovatorserver/output/ArasPlm_workhour_20181206.csv', '2018-12-06 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('160', 'ArasPlm', 'workhour', '20181207', '/innovatorserver/output/ArasPlm_workhour_20181207.csv', '2018-12-07 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('161', 'ArasPlm', 'workhour', '20181208', '/innovatorserver/output/ArasPlm_workhour_20181208.csv', '2018-12-08 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('162', 'ArasPlm', 'workhour', '20181209', '/innovatorserver/output/ArasPlm_workhour_20181209.csv', '2018-12-09 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('163', 'ArasPlm', 'workhour', '20181210', '/innovatorserver/output/ArasPlm_workhour_20181210.csv', '2018-12-10 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('164', 'ArasPlm', 'workhour', '20181211', '/innovatorserver/output/ArasPlm_workhour_20181211.csv', '2018-12-11 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('165', 'ArasPlm', 'workhour', '20181212', '/innovatorserver/output/ArasPlm_workhour_20181212.csv', '2018-12-12 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('166', 'ArasPlm', 'workhour', '20181213', '/innovatorserver/output/ArasPlm_workhour_20181213.csv', '2018-12-13 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('167', 'ArasPlm', 'workhour', '20181214', '/innovatorserver/output/ArasPlm_workhour_20181214.csv', '2018-12-14 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('168', 'ArasPlm', 'workhour', '20181215', '/innovatorserver/output/ArasPlm_workhour_20181215.csv', '2018-12-15 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('169', 'ArasPlm', 'workhour', '20181216', '/innovatorserver/output/ArasPlm_workhour_20181216.csv', '2018-12-16 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('170', 'ArasPlm', 'workhour', '20181217', '/innovatorserver/output/ArasPlm_workhour_20181217.csv', '2018-12-17 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('171', 'ArasPlm', 'workhour', '20181218', '/innovatorserver/output/ArasPlm_workhour_20181218.csv', '2018-12-18 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('172', 'ArasPlm', 'workhour', '20181219', '/innovatorserver/output/ArasPlm_workhour_20181219.csv', '2018-12-19 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('173', 'ArasPlm', 'workhour', '20181220', '/innovatorserver/output/ArasPlm_workhour_20181220.csv', '2018-12-20 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('174', 'ArasPlm', 'workhour', '20181221', '/innovatorserver/output/ArasPlm_workhour_20181221.csv', '2018-12-21 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('175', 'ArasPlm', 'workhour', '20181222', '/innovatorserver/output/ArasPlm_workhour_20181222.csv', '2018-12-22 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('176', 'ArasPlm', 'workhour', '20181223', '/innovatorserver/output/ArasPlm_workhour_20181223.csv', '2018-12-23 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('177', 'ArasPlm', 'workhour', '20181224', '/innovatorserver/output/ArasPlm_workhour_20181224.csv', '2018-12-24 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('178', 'ArasPlm', 'workhour', '20181225', '/innovatorserver/output/ArasPlm_workhour_20181225.csv', '2018-12-25 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('179', 'ArasPlm', 'workhour', '20181226', '/innovatorserver/output/ArasPlm_workhour_20181226.csv', '2018-12-26 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('180', 'ArasPlm', 'workhour', '20181227', '/innovatorserver/output/ArasPlm_workhour_20181227.csv', '2018-12-27 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('181', 'ArasPlm', 'workhour', '20181228', '/innovatorserver/output/ArasPlm_workhour_20181228.csv', '2018-12-28 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('182', 'ArasPlm', 'workhour', '20181229', '/innovatorserver/output/ArasPlm_workhour_20181229.csv', '2018-12-29 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('183', 'ArasPlm', 'workhour', '20181230', '/innovatorserver/output/ArasPlm_workhour_20181230.csv', '2018-12-30 00:00:00', '47.99.153.63', '80');
INSERT INTO `ResourceLocation` VALUES ('184', 'ArasPlm', 'workhour', '20181231', '/innovatorserver/output/ArasPlm_workhour_20181231.csv', '2018-12-31 00:00:00', '47.99.153.63', '80');
