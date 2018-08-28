/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : bluemine_1.0.0

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-08-28 16:51:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for batch_job_execution
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution`;
CREATE TABLE `batch_job_execution` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL COMMENT '主键',
  `VERSION` bigint(20) DEFAULT NULL COMMENT '版本号',
  `JOB_INSTANCE_ID` bigint(20) NOT NULL COMMENT '作业实例ID',
  `CREATE_TIME` datetime NOT NULL COMMENT '作业执行器创建时间',
  `START_TIME` datetime DEFAULT NULL COMMENT '作业执行器开始执行时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '作业执行器结束时间 ',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '作业执行器执行的状态:COMPLETED、FAILED、STARTING、UNKNOW等',
  `EXIT_CODE` varchar(2500) DEFAULT NULL COMMENT '作业执行器退出代码 如：UNKNOW、EXECUTING、COMPLETED等',
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL COMMENT '作业执行器退出信息,通常存放异常信息',
  `LAST_UPDATED` datetime DEFAULT NULL COMMENT '本条记录上次更新时间',
  `JOB_CONFIGURATION_LOCATION` varchar(2500) DEFAULT NULL COMMENT '作业配置文件的位置',
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`) USING BTREE,
  CONSTRAINT `batch_job_execution_ibfk_1` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `batch_job_instance` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业执行器表,存放当前作业的执行信息,创建时间、执行时间、执行结束时间、执行状态、执行Job实例等信息';

-- ----------------------------
-- Records of batch_job_execution
-- ----------------------------
INSERT INTO `batch_job_execution` VALUES ('1', '2', '1', '2018-08-13 15:16:56', '2018-08-13 15:16:56', '2018-08-13 15:16:58', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:16:58', null);
INSERT INTO `batch_job_execution` VALUES ('2', '2', '2', '2018-08-13 15:16:59', '2018-08-13 15:16:59', '2018-08-13 15:17:00', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:00', null);
INSERT INTO `batch_job_execution` VALUES ('3', '2', '3', '2018-08-13 15:17:00', '2018-08-13 15:17:00', '2018-08-13 15:17:01', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:01', null);
INSERT INTO `batch_job_execution` VALUES ('4', '2', '4', '2018-08-13 15:17:01', '2018-08-13 15:17:02', '2018-08-13 15:17:02', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:02', null);
INSERT INTO `batch_job_execution` VALUES ('5', '2', '5', '2018-08-13 15:17:03', '2018-08-13 15:17:03', '2018-08-13 15:17:03', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:03', null);
INSERT INTO `batch_job_execution` VALUES ('6', '2', '6', '2018-08-13 15:17:03', '2018-08-13 15:17:03', '2018-08-13 15:17:04', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:04', null);
INSERT INTO `batch_job_execution` VALUES ('7', '2', '7', '2018-08-13 15:17:04', '2018-08-13 15:17:04', '2018-08-13 15:17:05', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:05', null);
INSERT INTO `batch_job_execution` VALUES ('8', '2', '8', '2018-08-13 15:17:05', '2018-08-13 15:17:05', '2018-08-13 15:17:06', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:06', null);
INSERT INTO `batch_job_execution` VALUES ('9', '2', '9', '2018-08-13 15:17:06', '2018-08-13 15:17:06', '2018-08-13 15:17:07', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:07', null);
INSERT INTO `batch_job_execution` VALUES ('10', '2', '10', '2018-08-13 15:17:08', '2018-08-13 15:17:08', '2018-08-13 15:17:08', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:08', null);
INSERT INTO `batch_job_execution` VALUES ('11', '2', '11', '2018-08-13 15:17:08', '2018-08-13 15:17:08', '2018-08-13 15:17:09', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:09', null);
INSERT INTO `batch_job_execution` VALUES ('12', '2', '12', '2018-08-13 15:17:09', '2018-08-13 15:17:09', '2018-08-13 15:17:10', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:10', null);
INSERT INTO `batch_job_execution` VALUES ('13', '2', '13', '2018-08-13 15:17:10', '2018-08-13 15:17:10', '2018-08-13 15:17:11', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:11', null);
INSERT INTO `batch_job_execution` VALUES ('14', '2', '14', '2018-08-13 15:17:11', '2018-08-13 15:17:11', '2018-08-13 15:17:12', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:12', null);
INSERT INTO `batch_job_execution` VALUES ('15', '2', '15', '2018-08-13 15:17:12', '2018-08-13 15:17:12', '2018-08-13 15:17:12', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:12', null);
INSERT INTO `batch_job_execution` VALUES ('16', '2', '16', '2018-08-13 15:17:13', '2018-08-13 15:17:13', '2018-08-13 15:17:14', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:14', null);
INSERT INTO `batch_job_execution` VALUES ('17', '2', '17', '2018-08-13 15:17:14', '2018-08-13 15:17:15', '2018-08-13 15:17:16', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:16', null);
INSERT INTO `batch_job_execution` VALUES ('18', '2', '18', '2018-08-13 15:17:16', '2018-08-13 15:17:16', '2018-08-13 15:17:16', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:16', null);
INSERT INTO `batch_job_execution` VALUES ('19', '2', '19', '2018-08-13 15:17:16', '2018-08-13 15:17:17', '2018-08-13 15:17:17', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:17', null);
INSERT INTO `batch_job_execution` VALUES ('20', '2', '20', '2018-08-13 15:17:17', '2018-08-13 15:17:18', '2018-08-13 15:17:18', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:18', null);
INSERT INTO `batch_job_execution` VALUES ('21', '2', '21', '2018-08-13 15:17:18', '2018-08-13 15:17:18', '2018-08-13 15:17:19', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:19', null);
INSERT INTO `batch_job_execution` VALUES ('22', '2', '22', '2018-08-13 15:17:19', '2018-08-13 15:17:19', '2018-08-13 15:17:20', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:20', null);
INSERT INTO `batch_job_execution` VALUES ('23', '2', '23', '2018-08-13 15:17:20', '2018-08-13 15:17:20', '2018-08-13 15:17:21', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:21', null);
INSERT INTO `batch_job_execution` VALUES ('24', '2', '24', '2018-08-13 15:17:21', '2018-08-13 15:17:21', '2018-08-13 15:17:22', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:22', null);
INSERT INTO `batch_job_execution` VALUES ('25', '2', '25', '2018-08-13 15:17:22', '2018-08-13 15:17:22', '2018-08-13 15:17:22', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:22', null);
INSERT INTO `batch_job_execution` VALUES ('26', '2', '26', '2018-08-13 15:17:22', '2018-08-13 15:17:23', '2018-08-13 15:17:23', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:23', null);
INSERT INTO `batch_job_execution` VALUES ('27', '2', '27', '2018-08-13 15:17:23', '2018-08-13 15:17:23', '2018-08-13 15:17:24', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:24', null);
INSERT INTO `batch_job_execution` VALUES ('28', '2', '28', '2018-08-13 15:17:24', '2018-08-13 15:17:24', '2018-08-13 15:17:25', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:25', null);
INSERT INTO `batch_job_execution` VALUES ('29', '2', '29', '2018-08-13 15:17:25', '2018-08-13 15:17:25', '2018-08-13 15:17:26', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:26', null);
INSERT INTO `batch_job_execution` VALUES ('30', '2', '30', '2018-08-13 15:17:26', '2018-08-13 15:17:26', '2018-08-13 15:17:27', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:27', null);
INSERT INTO `batch_job_execution` VALUES ('31', '2', '31', '2018-08-13 15:17:27', '2018-08-13 15:17:27', '2018-08-13 15:17:27', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:17:27', null);
INSERT INTO `batch_job_execution` VALUES ('32', '2', '32', '2018-08-13 15:18:49', '2018-08-13 15:18:50', '2018-08-13 15:18:53', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:18:53', null);
INSERT INTO `batch_job_execution` VALUES ('33', '2', '33', '2018-08-13 15:18:54', '2018-08-13 15:18:54', '2018-08-13 15:18:56', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:18:56', null);
INSERT INTO `batch_job_execution` VALUES ('34', '2', '34', '2018-08-13 15:18:56', '2018-08-13 15:18:56', '2018-08-13 15:18:58', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:18:58', null);
INSERT INTO `batch_job_execution` VALUES ('35', '2', '35', '2018-08-13 15:18:59', '2018-08-13 15:18:59', '2018-08-13 15:19:00', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:19:00', null);
INSERT INTO `batch_job_execution` VALUES ('36', '2', '36', '2018-08-13 15:19:01', '2018-08-13 15:19:01', '2018-08-13 15:19:04', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:19:04', null);
INSERT INTO `batch_job_execution` VALUES ('37', '2', '37', '2018-08-13 15:19:04', '2018-08-13 15:19:04', '2018-08-13 15:19:08', 'COMPLETED', 'COMPLETED', '', '2018-08-13 15:19:08', null);
INSERT INTO `batch_job_execution` VALUES ('38', '2', '38', '2018-08-21 19:11:59', '2018-08-21 19:12:00', '2018-08-21 19:12:00', 'COMPLETED', 'COMPLETED', '', '2018-08-21 19:12:00', null);

-- ----------------------------
-- Table structure for batch_job_execution_context
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_context`;
CREATE TABLE `batch_job_execution_context` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL COMMENT '外键ID,作业执行器编号',
  `SHORT_CONTEXT` varchar(2500) NOT NULL COMMENT '作业执行器上下文字符串格式',
  `SERIALIZED_CONTEXT` text COMMENT '序列化的作业执行上下文',
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `batch_job_execution_context_ibfk_1` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业执行上下文表,存放上下文信息';

-- ----------------------------
-- Records of batch_job_execution_context
-- ----------------------------
INSERT INTO `batch_job_execution_context` VALUES ('1', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('2', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('3', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('4', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('5', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('6', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('7', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('8', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('9', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('10', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('11', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('12', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('13', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('14', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('15', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('16', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('17', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('18', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('19', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('20', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('21', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('22', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('23', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('24', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('25', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('26', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('27', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('28', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('29', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('30', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('31', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('32', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('33', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('34', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('35', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('36', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('37', '{\"map\":[\"\"]}', null);
INSERT INTO `batch_job_execution_context` VALUES ('38', '{\"map\":[\"\"]}', null);

-- ----------------------------
-- Table structure for batch_job_execution_params
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_params`;
CREATE TABLE `batch_job_execution_params` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL COMMENT '外键ID,作业执行器ID编号，一个作业实例可能又会多行参数记录',
  `TYPE_CD` varchar(6) NOT NULL COMMENT '参数的类型，总共有四种 String、Date、Double、Long',
  `KEY_NAME` varchar(100) NOT NULL COMMENT '参数的名字',
  `STRING_VAL` varchar(250) DEFAULT NULL COMMENT '参数如果是String,就存放String类型的参数值',
  `DATE_VAL` datetime DEFAULT NULL COMMENT '参数如果是Date,就存放Date类型的参数值',
  `LONG_VAL` bigint(20) DEFAULT NULL COMMENT '参数如果是Long,就存放Long类型的参数值',
  `DOUBLE_VAL` double DEFAULT NULL COMMENT '参数如果是Double,就存放Double类型的参数值',
  `IDENTIFYING` char(1) NOT NULL COMMENT '用于标识作业参数是否标识作业实例',
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`) USING BTREE,
  CONSTRAINT `batch_job_execution_params_ibfk_1` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业参数表,用于存放每个JOB执行的时候的参数信息,即对于的JOB实例';

-- ----------------------------
-- Records of batch_job_execution_params
-- ----------------------------
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'callNo', '10001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'callDate', '2018-07-01', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'callNo', '10002', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'callDate', '2018-07-02', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'callNo', '10003', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'callDate', '2018-07-03', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'callNo', '10004', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'callDate', '2018-07-04', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'callNo', '10005', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'callDate', '2018-07-05', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'callNo', '10006', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'callDate', '2018-07-06', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'callNo', '10007', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'callDate', '2018-07-07', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'callNo', '10008', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'callDate', '2018-07-08', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('9', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('9', 'STRING', 'callNo', '10009', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('9', 'STRING', 'callDate', '2018-07-09', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('9', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('10', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('10', 'STRING', 'callNo', '100010', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('10', 'STRING', 'callDate', '2018-07-10', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('10', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('11', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('11', 'STRING', 'callNo', '100011', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('11', 'STRING', 'callDate', '2018-07-11', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('11', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('12', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('12', 'STRING', 'callNo', '100012', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('12', 'STRING', 'callDate', '2018-07-12', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('12', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('13', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('13', 'STRING', 'callNo', '100013', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('13', 'STRING', 'callDate', '2018-07-13', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('13', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('14', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('14', 'STRING', 'callNo', '100014', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('14', 'STRING', 'callDate', '2018-07-14', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('14', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('15', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('15', 'STRING', 'callNo', '100015', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('15', 'STRING', 'callDate', '2018-07-15', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('15', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('16', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('16', 'STRING', 'callNo', '100016', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('16', 'STRING', 'callDate', '2018-07-16', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('16', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('17', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('17', 'STRING', 'callNo', '100017', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('17', 'STRING', 'callDate', '2018-07-17', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('17', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('18', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('18', 'STRING', 'callNo', '100018', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('18', 'STRING', 'callDate', '2018-07-18', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('18', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('19', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('19', 'STRING', 'callNo', '100019', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('19', 'STRING', 'callDate', '2018-07-19', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('19', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('20', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('20', 'STRING', 'callNo', '100020', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('20', 'STRING', 'callDate', '2018-07-20', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('20', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('21', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('21', 'STRING', 'callNo', '100021', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('21', 'STRING', 'callDate', '2018-07-21', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('21', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('22', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('22', 'STRING', 'callNo', '100022', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('22', 'STRING', 'callDate', '2018-07-22', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('22', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('23', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('23', 'STRING', 'callNo', '100023', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('23', 'STRING', 'callDate', '2018-07-23', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('23', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('24', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('24', 'STRING', 'callNo', '100024', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('24', 'STRING', 'callDate', '2018-07-24', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('24', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('25', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('25', 'STRING', 'callNo', '100025', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('25', 'STRING', 'callDate', '2018-07-25', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('25', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('26', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('26', 'STRING', 'callNo', '100026', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('26', 'STRING', 'callDate', '2018-07-26', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('26', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('27', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('27', 'STRING', 'callNo', '100027', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('27', 'STRING', 'callDate', '2018-07-27', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('27', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('28', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('28', 'STRING', 'callNo', '100028', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('28', 'STRING', 'callDate', '2018-07-28', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('28', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('29', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('29', 'STRING', 'callNo', '100029', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('29', 'STRING', 'callDate', '2018-07-29', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('29', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('30', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('30', 'STRING', 'callNo', '100030', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('30', 'STRING', 'callDate', '2018-07-30', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('30', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('31', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('31', 'STRING', 'callNo', '100031', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('31', 'STRING', 'callDate', '2018-07-31', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('31', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('32', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('32', 'STRING', 'callNo', '101', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('32', 'STRING', 'callDate', '2018-07-01', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('32', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('33', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('33', 'STRING', 'callNo', '102', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('33', 'STRING', 'callDate', '2018-07-01', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('33', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('34', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('34', 'STRING', 'callNo', '103', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('34', 'STRING', 'callDate', '2018-07-01', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('34', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('35', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('35', 'STRING', 'callNo', '104', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('35', 'STRING', 'callDate', '2018-07-04', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('35', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('36', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('36', 'STRING', 'callNo', '105', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('36', 'STRING', 'callDate', '2018-07-25', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('36', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('37', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('37', 'STRING', 'callNo', '106', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('37', 'STRING', 'callDate', '2018-07-25', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('37', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('38', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('38', 'STRING', 'callNo', '107', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('38', 'STRING', 'callDate', '2018-07-29', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('38', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');

-- ----------------------------
-- Table structure for batch_job_execution_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_seq`;
CREATE TABLE `batch_job_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于BATCH_JOB_EXECUTION和BATCH_JOB_EXECUTION_CONTEXT提供主键生成';

-- ----------------------------
-- Records of batch_job_execution_seq
-- ----------------------------
INSERT INTO `batch_job_execution_seq` VALUES ('38', '0');

-- ----------------------------
-- Table structure for batch_job_instance
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_instance`;
CREATE TABLE `batch_job_instance` (
  `JOB_INSTANCE_ID` bigint(20) NOT NULL COMMENT '主键 ，作业实例编号,根据BATCH_JOB_SEQ自动生成',
  `VERSION` bigint(20) DEFAULT NULL COMMENT '版本号',
  `JOB_NAME` varchar(100) NOT NULL COMMENT '作业名称 即在配置文件定义的JobId字段内容',
  `JOB_KEY` varchar(32) NOT NULL COMMENT '作业标识,根据作业参数序列化生成的标识,需要注意通过JOB_NAME+JOB_KEY能够唯一区分一个作业实例',
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业实例表,存放JOB的实例信息';

-- ----------------------------
-- Records of batch_job_instance
-- ----------------------------
INSERT INTO `batch_job_instance` VALUES ('1', '0', 'callCollectJob', '7963783d3b3e1e726f17442fa3da4bd9');
INSERT INTO `batch_job_instance` VALUES ('2', '0', 'callCollectJob', 'c7f69d1bbda8f1b9400f15a132b1ede0');
INSERT INTO `batch_job_instance` VALUES ('3', '0', 'callCollectJob', '9a3e24ebc36bd7eaeefdfffe976ff0c7');
INSERT INTO `batch_job_instance` VALUES ('4', '0', 'callCollectJob', 'b51d2e8a24e124178f4a248509afb4a1');
INSERT INTO `batch_job_instance` VALUES ('5', '0', 'callCollectJob', '7e735d42feb1852fa99011d59046f089');
INSERT INTO `batch_job_instance` VALUES ('6', '0', 'callCollectJob', 'ec419fb1242537d36e370fa12b302913');
INSERT INTO `batch_job_instance` VALUES ('7', '0', 'callCollectJob', '36d8a2ca314184c8af0e86e7d92e810a');
INSERT INTO `batch_job_instance` VALUES ('8', '0', 'callCollectJob', '062228ca3ac47a17e03c94e8f3deb4ef');
INSERT INTO `batch_job_instance` VALUES ('9', '0', 'callCollectJob', 'ca1af44072fae6ee62b30d803b78ed21');
INSERT INTO `batch_job_instance` VALUES ('10', '0', 'callCollectJob', '3b06a2bd38503baca7edf2985b93fb7d');
INSERT INTO `batch_job_instance` VALUES ('11', '0', 'callCollectJob', '1f5d8211fc975ca4abceef36b51163a8');
INSERT INTO `batch_job_instance` VALUES ('12', '0', 'callCollectJob', 'aa1d67de396ebeed1627d43082a46349');
INSERT INTO `batch_job_instance` VALUES ('13', '0', 'callCollectJob', 'cf264273738311ccebd3d702990b8066');
INSERT INTO `batch_job_instance` VALUES ('14', '0', 'callCollectJob', '612fa486a27ee497461a2b38a715d52a');
INSERT INTO `batch_job_instance` VALUES ('15', '0', 'callCollectJob', 'cb442efcda48958818a021a1242a03f4');
INSERT INTO `batch_job_instance` VALUES ('16', '0', 'callCollectJob', 'eb73ec29c66270225c6eb88e75f3b321');
INSERT INTO `batch_job_instance` VALUES ('17', '0', 'callCollectJob', 'a99c67331c8690e068051d106c30b425');
INSERT INTO `batch_job_instance` VALUES ('18', '0', 'callCollectJob', '09e4ddcc585ba1864a12d6a2c5baa751');
INSERT INTO `batch_job_instance` VALUES ('19', '0', 'callCollectJob', 'ec340e91a17385d242d627ad35c34455');
INSERT INTO `batch_job_instance` VALUES ('20', '0', 'callCollectJob', '32f1f75c9c0744657327d9f5dbd9725e');
INSERT INTO `batch_job_instance` VALUES ('21', '0', 'callCollectJob', 'c3933a996f93576230f9737bf3ec916c');
INSERT INTO `batch_job_instance` VALUES ('22', '0', 'callCollectJob', '531454f2acc291858c225bc5623a114f');
INSERT INTO `batch_job_instance` VALUES ('23', '0', 'callCollectJob', '7cc338c3208e99dbb07903bb66797b41');
INSERT INTO `batch_job_instance` VALUES ('24', '0', 'callCollectJob', 'b3f7aa78c396b6eb49b9c0d8711329e2');
INSERT INTO `batch_job_instance` VALUES ('25', '0', 'callCollectJob', '7e4179541a61baa48176cda3bca0d5a1');
INSERT INTO `batch_job_instance` VALUES ('26', '0', 'callCollectJob', 'ba2a638087d70c48d36c53197e2c5c79');
INSERT INTO `batch_job_instance` VALUES ('27', '0', 'callCollectJob', '6387957830bd421e7bd238fff72af656');
INSERT INTO `batch_job_instance` VALUES ('28', '0', 'callCollectJob', '82384ab4f9c3937ee4edb0d2ff914f8e');
INSERT INTO `batch_job_instance` VALUES ('29', '0', 'callCollectJob', 'd6afef35949de5ce04a343519dbe8de4');
INSERT INTO `batch_job_instance` VALUES ('30', '0', 'callCollectJob', 'e9c138b44387dea23987cf972787377a');
INSERT INTO `batch_job_instance` VALUES ('31', '0', 'callCollectJob', '81b808302b968f148ba248ae52ef6a6b');
INSERT INTO `batch_job_instance` VALUES ('32', '0', 'callCollectJob', 'fb155a842dd69553115682b5ae43dcfa');
INSERT INTO `batch_job_instance` VALUES ('33', '0', 'callCollectJob', 'ce5d16a28011a9b9063d9d72c41a9f3b');
INSERT INTO `batch_job_instance` VALUES ('34', '0', 'callCollectJob', 'd9fba20af9be1bc0b04e7de44af7865a');
INSERT INTO `batch_job_instance` VALUES ('35', '0', 'callCollectJob', 'e29f24bc6ac509c011d109e048708a36');
INSERT INTO `batch_job_instance` VALUES ('36', '0', 'callCollectJob', 'a342c5870f786f2550eb25dfa23951c3');
INSERT INTO `batch_job_instance` VALUES ('37', '0', 'callCollectJob', '2a485326d42dc06de9815f6d25c71a46');
INSERT INTO `batch_job_instance` VALUES ('38', '0', 'callCollectJob', '3601722b31879e71547d0bc88e8f3a60');

-- ----------------------------
-- Table structure for batch_job_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_seq`;
CREATE TABLE `batch_job_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于BATCH_JOB_INSTNCE和BATCH_JOB_EXECUTION_PARAMS提供主键生成';

-- ----------------------------
-- Records of batch_job_seq
-- ----------------------------
INSERT INTO `batch_job_seq` VALUES ('38', '0');

-- ----------------------------
-- Table structure for batch_step_execution
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution`;
CREATE TABLE `batch_step_execution` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL COMMENT '主键',
  `VERSION` bigint(20) NOT NULL COMMENT '版本',
  `STEP_NAME` varchar(100) NOT NULL COMMENT '作业步的名称',
  `JOB_EXECUTION_ID` bigint(20) NOT NULL COMMENT '作业执行器ID',
  `START_TIME` datetime NOT NULL COMMENT '作业步执行器执行开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '作业步执行器执行结束时间',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '作业步执行器执行状态,COMPLETED, STARTING, STARTED, STOPPING, STOPPED, FAILED, ABANDONED, UNKNOWN.存在于org.springframework.batch.core.BatchStatus',
  `COMMIT_COUNT` bigint(20) DEFAULT NULL COMMENT '事务提交次数',
  `READ_COUNT` bigint(20) DEFAULT NULL COMMENT '读数据次数',
  `FILTER_COUNT` bigint(20) DEFAULT NULL COMMENT '过滤掉的数据次数',
  `WRITE_COUNT` bigint(20) DEFAULT NULL COMMENT '写数据次数',
  `READ_SKIP_COUNT` bigint(20) DEFAULT NULL COMMENT '读数据跳过的次数',
  `WRITE_SKIP_COUNT` bigint(20) DEFAULT NULL COMMENT '写数据跳过的次数',
  `PROCESS_SKIP_COUNT` bigint(20) DEFAULT NULL COMMENT '处理数据跳过的次数',
  `ROLLBACK_COUNT` bigint(20) DEFAULT NULL COMMENT '事务回滚的次数',
  `EXIT_CODE` varchar(2500) DEFAULT NULL COMMENT '作业步执行器退出编码，状态码存在于org.springframework.batch.core.ExitStauts',
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL COMMENT '作业步执行器退出描述,一般是异常信息',
  `LAST_UPDATED` datetime DEFAULT NULL COMMENT '本条记录上次更新时间',
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`) USING BTREE,
  CONSTRAINT `batch_step_execution_ibfk_1` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业步执行器，存放每个Step执行器的信息：开始时间、执行完成时间、读/写次数等';

-- ----------------------------
-- Records of batch_step_execution
-- ----------------------------
INSERT INTO `batch_step_execution` VALUES ('1', '4', 'callCollectStep', '1', '2018-08-13 15:16:57', '2018-08-13 15:16:58', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:16:58');
INSERT INTO `batch_step_execution` VALUES ('2', '4', 'callCollectStep', '2', '2018-08-13 15:16:59', '2018-08-13 15:16:59', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:16:59');
INSERT INTO `batch_step_execution` VALUES ('3', '4', 'callCollectStep', '3', '2018-08-13 15:17:00', '2018-08-13 15:17:01', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:01');
INSERT INTO `batch_step_execution` VALUES ('4', '4', 'callCollectStep', '4', '2018-08-13 15:17:02', '2018-08-13 15:17:02', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:02');
INSERT INTO `batch_step_execution` VALUES ('5', '4', 'callCollectStep', '5', '2018-08-13 15:17:03', '2018-08-13 15:17:03', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:03');
INSERT INTO `batch_step_execution` VALUES ('6', '4', 'callCollectStep', '6', '2018-08-13 15:17:04', '2018-08-13 15:17:04', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:04');
INSERT INTO `batch_step_execution` VALUES ('7', '4', 'callCollectStep', '7', '2018-08-13 15:17:04', '2018-08-13 15:17:05', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:05');
INSERT INTO `batch_step_execution` VALUES ('8', '4', 'callCollectStep', '8', '2018-08-13 15:17:06', '2018-08-13 15:17:06', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:06');
INSERT INTO `batch_step_execution` VALUES ('9', '4', 'callCollectStep', '9', '2018-08-13 15:17:07', '2018-08-13 15:17:07', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:07');
INSERT INTO `batch_step_execution` VALUES ('10', '4', 'callCollectStep', '10', '2018-08-13 15:17:08', '2018-08-13 15:17:08', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:08');
INSERT INTO `batch_step_execution` VALUES ('11', '4', 'callCollectStep', '11', '2018-08-13 15:17:09', '2018-08-13 15:17:09', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:09');
INSERT INTO `batch_step_execution` VALUES ('12', '4', 'callCollectStep', '12', '2018-08-13 15:17:10', '2018-08-13 15:17:10', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:10');
INSERT INTO `batch_step_execution` VALUES ('13', '4', 'callCollectStep', '13', '2018-08-13 15:17:10', '2018-08-13 15:17:11', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:11');
INSERT INTO `batch_step_execution` VALUES ('14', '4', 'callCollectStep', '14', '2018-08-13 15:17:11', '2018-08-13 15:17:11', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:11');
INSERT INTO `batch_step_execution` VALUES ('15', '4', 'callCollectStep', '15', '2018-08-13 15:17:12', '2018-08-13 15:17:12', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:12');
INSERT INTO `batch_step_execution` VALUES ('16', '4', 'callCollectStep', '16', '2018-08-13 15:17:13', '2018-08-13 15:17:14', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:14');
INSERT INTO `batch_step_execution` VALUES ('17', '4', 'callCollectStep', '17', '2018-08-13 15:17:15', '2018-08-13 15:17:16', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:16');
INSERT INTO `batch_step_execution` VALUES ('18', '4', 'callCollectStep', '18', '2018-08-13 15:17:16', '2018-08-13 15:17:16', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:16');
INSERT INTO `batch_step_execution` VALUES ('19', '4', 'callCollectStep', '19', '2018-08-13 15:17:17', '2018-08-13 15:17:17', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:17');
INSERT INTO `batch_step_execution` VALUES ('20', '4', 'callCollectStep', '20', '2018-08-13 15:17:18', '2018-08-13 15:17:18', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:18');
INSERT INTO `batch_step_execution` VALUES ('21', '4', 'callCollectStep', '21', '2018-08-13 15:17:18', '2018-08-13 15:17:19', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:19');
INSERT INTO `batch_step_execution` VALUES ('22', '4', 'callCollectStep', '22', '2018-08-13 15:17:20', '2018-08-13 15:17:20', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:20');
INSERT INTO `batch_step_execution` VALUES ('23', '4', 'callCollectStep', '23', '2018-08-13 15:17:20', '2018-08-13 15:17:21', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:21');
INSERT INTO `batch_step_execution` VALUES ('24', '4', 'callCollectStep', '24', '2018-08-13 15:17:21', '2018-08-13 15:17:22', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:22');
INSERT INTO `batch_step_execution` VALUES ('25', '4', 'callCollectStep', '25', '2018-08-13 15:17:22', '2018-08-13 15:17:22', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:22');
INSERT INTO `batch_step_execution` VALUES ('26', '4', 'callCollectStep', '26', '2018-08-13 15:17:23', '2018-08-13 15:17:23', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:23');
INSERT INTO `batch_step_execution` VALUES ('27', '4', 'callCollectStep', '27', '2018-08-13 15:17:23', '2018-08-13 15:17:24', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:24');
INSERT INTO `batch_step_execution` VALUES ('28', '4', 'callCollectStep', '28', '2018-08-13 15:17:25', '2018-08-13 15:17:25', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:25');
INSERT INTO `batch_step_execution` VALUES ('29', '4', 'callCollectStep', '29', '2018-08-13 15:17:25', '2018-08-13 15:17:26', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:26');
INSERT INTO `batch_step_execution` VALUES ('30', '4', 'callCollectStep', '30', '2018-08-13 15:17:26', '2018-08-13 15:17:27', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:27');
INSERT INTO `batch_step_execution` VALUES ('31', '4', 'callCollectStep', '31', '2018-08-13 15:17:27', '2018-08-13 15:17:27', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:17:27');
INSERT INTO `batch_step_execution` VALUES ('32', '4', 'callCollectStep', '32', '2018-08-13 15:18:51', '2018-08-13 15:18:53', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:18:53');
INSERT INTO `batch_step_execution` VALUES ('33', '4', 'callCollectStep', '33', '2018-08-13 15:18:55', '2018-08-13 15:18:56', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:18:56');
INSERT INTO `batch_step_execution` VALUES ('34', '4', 'callCollectStep', '34', '2018-08-13 15:18:57', '2018-08-13 15:18:58', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:18:58');
INSERT INTO `batch_step_execution` VALUES ('35', '4', 'callCollectStep', '35', '2018-08-13 15:18:59', '2018-08-13 15:19:00', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:19:00');
INSERT INTO `batch_step_execution` VALUES ('36', '4', 'callCollectStep', '36', '2018-08-13 15:19:02', '2018-08-13 15:19:04', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:19:04');
INSERT INTO `batch_step_execution` VALUES ('37', '4', 'callCollectStep', '37', '2018-08-13 15:19:05', '2018-08-13 15:19:08', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-13 15:19:08');
INSERT INTO `batch_step_execution` VALUES ('38', '4', 'callCollectStep', '38', '2018-08-21 19:12:00', '2018-08-21 19:12:00', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-08-21 19:12:00');

-- ----------------------------
-- Table structure for batch_step_execution_context
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution_context`;
CREATE TABLE `batch_step_execution_context` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL COMMENT '作业步执行器ID',
  `SHORT_CONTEXT` varchar(2500) NOT NULL COMMENT '作业步执行器上下文字符串格式',
  `SERIALIZED_CONTEXT` text COMMENT '序列化作业步执行器上下文',
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `batch_step_execution_context_ibfk_1` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `batch_step_execution` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业步执行器上下文,存放作业步执行的上下文信息';

-- ----------------------------
-- Records of batch_step_execution_context
-- ----------------------------
INSERT INTO `batch_step_execution_context` VALUES ('1', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('2', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('3', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('4', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('5', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('6', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('7', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('8', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('9', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('10', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('11', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('12', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('13', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('14', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('15', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('16', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('17', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('18', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('19', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('20', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('21', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('22', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('23', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('24', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('25', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('26', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('27', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('28', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('29', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('30', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('31', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('32', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('33', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('34', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('35', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('36', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('37', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);
INSERT INTO `batch_step_execution_context` VALUES ('38', '{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}', null);

-- ----------------------------
-- Table structure for batch_step_execution_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution_seq`;
CREATE TABLE `batch_step_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于BATCH_STEP_EXECUTION和BATCH_STEP_EXECUTION_CONTEXT提供主键';

-- ----------------------------
-- Records of batch_step_execution_seq
-- ----------------------------
INSERT INTO `batch_step_execution_seq` VALUES ('38', '0');

-- ----------------------------
-- Table structure for call_collect_trigger
-- ----------------------------
DROP TABLE IF EXISTS `call_collect_trigger`;
CREATE TABLE `call_collect_trigger` (
  `CHANNEL_NO` varchar(64) NOT NULL COMMENT '渠道标识编号',
  `CALL_NO` varchar(64) NOT NULL COMMENT '会话单号',
  `CALL_DATE` int(8) NOT NULL COMMENT '会话日期',
  `SEAT_NO` varchar(64) NOT NULL COMMENT '坐席编号',
  `TRIGGER_DATE` datetime NOT NULL COMMENT '触发时间',
  `TRIGGER_TYPE` char(4) NOT NULL COMMENT '触发类型',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `EXECUTIVE_NO` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数',
  `STATUS_CODE` varchar(255) NOT NULL COMMENT '作业执行代码 ',
  `DESC_TEXT` varchar(255) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CHANNEL_NO`,`CALL_NO`,`CALL_DATE`,`SEAT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话汇总跑批触发表';

-- ----------------------------
-- Records of call_collect_trigger
-- ----------------------------
INSERT INTO `call_collect_trigger` VALUES ('100001', '10001', '20180701', '2', '2018-08-13 15:16:56', 'CALL', '2018-08-13 15:16:56', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100010', '20180710', '2', '2018-08-13 15:17:07', 'CALL', '2018-08-13 15:17:07', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100011', '20180711', '2', '2018-08-13 15:17:08', 'CALL', '2018-08-13 15:17:08', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100012', '20180712', '2', '2018-08-13 15:17:09', 'CALL', '2018-08-13 15:17:09', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100013', '20180713', '2', '2018-08-13 15:17:10', 'CALL', '2018-08-13 15:17:10', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100014', '20180714', '2', '2018-08-13 15:17:11', 'CALL', '2018-08-13 15:17:11', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100015', '20180715', '2', '2018-08-13 15:17:12', 'CALL', '2018-08-13 15:17:12', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100016', '20180716', '2', '2018-08-13 15:17:13', 'CALL', '2018-08-13 15:17:13', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:14', 'SYS', '2018-08-13 15:17:14', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100017', '20180717', '2', '2018-08-13 15:17:14', 'CALL', '2018-08-13 15:17:14', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100018', '20180718', '2', '2018-08-13 15:17:16', 'CALL', '2018-08-13 15:17:16', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100019', '20180719', '2', '2018-08-13 15:17:16', 'CALL', '2018-08-13 15:17:16', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10002', '20180702', '2', '2018-08-13 15:16:58', 'CALL', '2018-08-13 15:16:58', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100020', '20180720', '2', '2018-08-13 15:17:17', 'CALL', '2018-08-13 15:17:17', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100021', '20180721', '2', '2018-08-13 15:17:18', 'CALL', '2018-08-13 15:17:18', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100022', '20180722', '2', '2018-08-13 15:17:19', 'CALL', '2018-08-13 15:17:19', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100023', '20180723', '2', '2018-08-13 15:17:20', 'CALL', '2018-08-13 15:17:20', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100024', '20180724', '2', '2018-08-13 15:17:21', 'CALL', '2018-08-13 15:17:21', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100025', '20180725', '2', '2018-08-13 15:17:22', 'CALL', '2018-08-13 15:17:22', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100026', '20180726', '2', '2018-08-13 15:17:22', 'CALL', '2018-08-13 15:17:22', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100027', '20180727', '2', '2018-08-13 15:17:23', 'CALL', '2018-08-13 15:17:23', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100028', '20180728', '2', '2018-08-13 15:17:24', 'CALL', '2018-08-13 15:17:24', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100029', '20180729', '2', '2018-08-13 15:17:25', 'CALL', '2018-08-13 15:17:25', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10003', '20180703', '2', '2018-08-13 15:17:00', 'CALL', '2018-08-13 15:17:00', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:01', 'SYS', '2018-08-13 15:17:01', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100030', '20180730', '2', '2018-08-13 15:17:26', 'CALL', '2018-08-13 15:17:26', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '100031', '20180731', '2', '2018-08-13 15:17:27', 'CALL', '2018-08-13 15:17:27', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10004', '20180704', '2', '2018-08-13 15:17:01', 'CALL', '2018-08-13 15:17:01', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10005', '20180705', '2', '2018-08-13 15:17:02', 'CALL', '2018-08-13 15:17:02', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10006', '20180706', '2', '2018-08-13 15:17:03', 'CALL', '2018-08-13 15:17:03', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10007', '20180707', '2', '2018-08-13 15:17:04', 'CALL', '2018-08-13 15:17:04', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10008', '20180708', '2', '2018-08-13 15:17:05', 'CALL', '2018-08-13 15:17:05', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '10009', '20180709', '2', '2018-08-13 15:17:06', 'CALL', '2018-08-13 15:17:06', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '101', '20180701', '2', '2018-08-13 15:18:49', 'CALL', '2018-08-13 15:18:49', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:18:53', 'SYS', '2018-08-13 15:18:53', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '102', '20180701', '2', '2018-08-13 15:18:54', 'CALL', '2018-08-13 15:18:54', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:18:56', 'SYS', '2018-08-13 15:18:56', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '103', '20180701', '2', '2018-08-13 15:18:56', 'CALL', '2018-08-13 15:18:56', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:18:58', 'SYS', '2018-08-13 15:18:58', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '104', '20180704', '2', '2018-08-13 15:18:58', 'CALL', '2018-08-13 15:18:58', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:19:00', 'SYS', '2018-08-13 15:19:00', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '105', '20180725', '2', '2018-08-13 15:19:01', 'CALL', '2018-08-13 15:19:01', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:19:04', 'SYS', '2018-08-13 15:19:04', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '106', '20180725', '2', '2018-08-13 15:19:04', 'CALL', '2018-08-13 15:19:04', '1', 'COMPLETED', '[]', 'SYS', '2018-08-13 15:19:08', 'SYS', '2018-08-13 15:19:08', '0', '33000');
INSERT INTO `call_collect_trigger` VALUES ('100001', '107', '20180729', '2', '2018-08-21 19:11:59', 'CALL', '2018-08-21 19:11:59', '1', 'COMPLETED', '[]', 'SYS', '2018-08-21 19:12:01', 'SYS', '2018-08-21 19:12:01', '0', '33000');

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CHANNEL_NO` varchar(64) NOT NULL COMMENT '渠道标识编号',
  `CHANNEL_TYPE` char(4) NOT NULL COMMENT '渠道类型',
  `CHANNEL_CODE` char(4) NOT NULL COMMENT '渠道代码',
  `ACTIVATED_FLAG` char(1) NOT NULL COMMENT '激活标识',
  `DESC_TEXT` varchar(120) NOT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CHANNEL_ID`),
  UNIQUE KEY `UX_CHANNEL` (`CHANNEL_CODE`,`CHANNEL_TYPE`) USING BTREE COMMENT '唯一性',
  UNIQUE KEY `UX_CHANNEL_NO` (`CHANNEL_NO`) USING BTREE COMMENT '唯一性'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='渠道表';

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('49252889384718336', '100001', 'TEST', 'PRO1', 'Y', '测试公司产品1', 'SYS', '2018-06-26 15:16:03', 'SYS', '2018-06-26 15:16:03', '0', '33000');

-- ----------------------------
-- Table structure for code_profile
-- ----------------------------
DROP TABLE IF EXISTS `code_profile`;
CREATE TABLE `code_profile` (
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CODE_TYPE` char(4) NOT NULL COMMENT '码类型',
  `CODE_VALUE` char(4) NOT NULL COMMENT '码值',
  `CODE_TEXT` varchar(255) NOT NULL COMMENT '码明文',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`CHANNEL_ID`,`CODE_TYPE`,`CODE_VALUE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='码表';

-- ----------------------------
-- Records of code_profile
-- ----------------------------
INSERT INTO `code_profile` VALUES ('49252889384718336', 'CALT', 'ALL', '全部', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'CALT', 'AUD', '语音', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'CALT', 'CMT', '评论', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'CALT', 'OL', '在线', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'ROLE', 'ALL', '全部', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'ROLE', 'CSC', '客服', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'ROLE', 'CUST', '客户', null, 'SYS', '2018-06-28 18:16:21', 'SYS', '2018-06-28 18:16:21', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `EMPLOYEE_ID` bigint(20) NOT NULL COMMENT '员工ID',
  `EMPLOYEE_NO` char(11) NOT NULL COMMENT '员工编号',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `LEAD_ID` bigint(20) NOT NULL COMMENT '领导ID',
  `CHANNEL_TYPE` char(4) NOT NULL COMMENT '渠道类型',
  `CHANNEL_CODE` char(4) NOT NULL COMMENT '渠道ID',
  `EMPLOYEE_NAME` varchar(32) NOT NULL COMMENT '员工姓名',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮件地址',
  `SEAT_ID` bigint(20) NOT NULL COMMENT '坐席ID',
  `START_TIME` int(8) NOT NULL COMMENT '工作开始时间',
  `END_TIME` int(8) NOT NULL COMMENT '工作结束时间',
  `DESC_TEXT` varchar(120) NOT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `UX_ID` (`SEAT_ID`) USING BTREE COMMENT '唯一标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('49070939912015872', '000001', '2', '1', 'TEST', 'PR01', '测试员工1', 'test@bluemine.com', '49238845276819456', '90000', '170000', '', 'SYS', '2018-06-26 15:22:17', 'SYS', '2018-06-26 15:22:17', '0', '33000');

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `RULE_ID` bigint(20) NOT NULL COMMENT '规则ID',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CALL_TYPE` char(4) NOT NULL COMMENT '会话类型',
  `ROLE_TYPE` char(4) NOT NULL COMMENT '数据角色类型',
  `TAG_ID` bigint(20) NOT NULL COMMENT '标签ID',
  `PRIORITY_NO` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `RULE_EXPS` varchar(255) NOT NULL COMMENT '规则表达式',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('49706454618244096', '49252889384718336', 'ALL', 'CUST', '198819246732611584', '0', 'iphone|ios|爱疯', null, 'SYS', '2018-07-03 15:42:49', 'SYS', '2018-08-28 16:02:23', '7', '33000');
INSERT INTO `rule` VALUES ('52789320191345664', '49252889384718336', 'AUD', 'ALL', '198819246732622222', '0', 'miu|雷军|小米max', null, 'SYS', '2018-08-06 16:23:38', 'SYS', '2018-08-06 16:23:38', '0', '33000');
INSERT INTO `rule` VALUES ('52789341326443520', '49252889384718336', 'ALL', 'ALL', '198819246732611111', '0', '荣耀10', null, 'SYS', '2018-08-06 16:23:59', 'SYS', '2018-08-06 16:23:59', '0', '33000');
INSERT INTO `rule` VALUES ('53146634272408576', '49252889384718336', 'ALL', 'ALL', '52969645376832512', '0', 'dqwdwqdwqd', null, 'SYS', '2018-08-10 15:03:00', 'SYS', '2018-08-10 15:03:00', '0', '33000');
INSERT INTO `rule` VALUES ('53147159640441856', '49252889384718336', 'ALL', 'ALL', '52969651999638528', '0', 'dfwfqwdwqdqwd', null, 'SYS', '2018-08-10 15:11:21', 'SYS', '2018-08-10 15:11:21', '0', '33000');
INSERT INTO `rule` VALUES ('54158727225312256', '49252889384718336', 'ALL', 'ALL', '54158686522737664', '0', '吴亦凡|拍照手机', null, 'SYS', '2018-08-21 19:09:47', 'SYS', '2018-08-21 19:09:47', '0', '33000');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `SEAT_ID` bigint(20) NOT NULL COMMENT '坐席ID',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `SEAT_NO` varchar(16) NOT NULL COMMENT '坐席编号',
  `SEAT_IP` char(46) DEFAULT NULL COMMENT '坐席IP地址',
  `ACTIVATED_FLAG` char(1) NOT NULL COMMENT '激活标识',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`SEAT_ID`),
  UNIQUE KEY `UX_CHANNEL_SEAT` (`CHANNEL_ID`,`SEAT_NO`) USING BTREE COMMENT '唯一性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='坐席表';

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('49238845276819456', '49252889384718336', '1', '172.17.23.15', 'Y', null, 'SYS', '2018-06-28 11:51:53', 'SYS', '2018-06-28 11:51:53', '0', '33000');
INSERT INTO `seat` VALUES ('204647654448304128', '49252889384718336', '2', '172.17.23.16', 'Y', null, 'SYS', '2018-06-28 11:51:53', 'SYS', '2018-06-28 11:51:53', '0', '33000');

-- ----------------------------
-- Table structure for seat_control
-- ----------------------------
DROP TABLE IF EXISTS `seat_control`;
CREATE TABLE `seat_control` (
  `SEAT_ID` bigint(20) NOT NULL COMMENT '坐席ID',
  `NEXT_CYCLE_DATE` int(8) NOT NULL COMMENT '下一个周期日期',
  `NEXT_CYCLE_NO` int(11) NOT NULL DEFAULT '1' COMMENT '下一个周期编号',
  `NEXT_CALL_NO` int(11) NOT NULL DEFAULT '1' COMMENT '下一个会话编号',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`SEAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='坐席控制表';

-- ----------------------------
-- Records of seat_control
-- ----------------------------
INSERT INTO `seat_control` VALUES ('1', '1', '1', '1', null, 'SYS', '2018-06-28 14:13:40', 'SYS', '2018-06-28 14:13:41', '0', '0');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `TAG_ID` bigint(20) NOT NULL COMMENT '标签ID',
  `ACTIVATED` char(1) NOT NULL COMMENT '激活标识',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `TAG_NO` int(11) NOT NULL COMMENT '标签编号',
  `TAG_TEXT` varchar(255) NOT NULL COMMENT '标签文本',
  `PARENT_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `CUSTOMIZABLE` char(1) NOT NULL COMMENT '定制化标识',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`TAG_ID`),
  UNIQUE KEY `IU_CHANNEL_TAG` (`CHANNEL_ID`,`TAG_NO`) USING BTREE COMMENT '唯一性',
  KEY `IX_SRCH_ONE` (`TAG_ID`,`CHANNEL_ID`) USING BTREE COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('54158686522737664', 'Y', '49252889384718336', '38', 'OPPO', '198819179812491264', 'Y', null, 'SYS', '2018-08-21 19:09:09', 'SYS', '2018-08-24 19:32:13', '6');
INSERT INTO `tag` VALUES ('198818809124098048', 'N', '49252889384718336', '1', '业务类', '0', 'N', null, 'SYS', '2018-06-28 15:53:00', 'SYS', '2018-08-27 18:09:37', '8');
INSERT INTO `tag` VALUES ('198818923355967488', 'Y', '49252889384718336', '2', '产品类', '0', 'N', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-08-28 16:01:21', '18');
INSERT INTO `tag` VALUES ('198818966817345536', 'N', '49252889384718336', '3', '用户类', '0', 'N', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-08-28 16:01:17', '2');
INSERT INTO `tag` VALUES ('198819027139825664', 'N', '49252889384718336', '4', '评价类', '0', 'N', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-06-28 15:54:18', '0');
INSERT INTO `tag` VALUES ('198819111277563904', 'Y', '49252889384718336', '5', '电视', '198818923355967488', 'Y', null, 'SYS', '2018-06-29 12:00:54', 'SYS', '2018-08-28 16:01:22', '20');
INSERT INTO `tag` VALUES ('198819179812491264', 'Y', '49252889384718336', '6', '手机', '198818923355967488', 'Y', null, 'SYS', '2018-06-29 12:57:41', 'SYS', '2018-08-24 19:39:44', '11');
INSERT INTO `tag` VALUES ('198819213316591616', 'Y', '49252889384718336', '7', '三星', '198819179812491264', 'Y', null, 'SYS', '2018-06-29 12:57:48', 'SYS', '2018-08-27 17:52:23', '49');
INSERT INTO `tag` VALUES ('198819246732611111', 'Y', '49252889384718336', '10', '华为', '198819179812491264', 'Y', '', 'SYS', '2018-07-03 15:08:11', 'SYS', '2018-08-24 19:34:42', '14');
INSERT INTO `tag` VALUES ('198819246732611584', 'Y', '49252889384718336', '8', '苹果', '198819179812491264', 'Y', null, 'SYS', '2018-07-03 15:08:11', 'SYS', '2018-08-28 16:01:12', '18');
INSERT INTO `tag` VALUES ('198819246732622222', 'Y', '49252889384718336', '11', '小米', '198819179812491264', 'Y', '', 'SYS', '2018-07-03 15:08:11', 'SYS', '2018-08-23 17:50:29', '14');
INSERT INTO `tag` VALUES ('198819304509149184', 'Y', '49252889384718336', '9', '夏普', '198819111277563904', 'Y', null, 'SYS', '2018-07-03 15:09:14', 'SYS', '2018-08-27 18:47:25', '26');

-- ----------------------------
-- Table structure for tag_collect
-- ----------------------------
DROP TABLE IF EXISTS `tag_collect`;
CREATE TABLE `tag_collect` (
  `COLLECT_ID` bigint(20) NOT NULL COMMENT '汇总ID',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CALL_NO` varchar(64) NOT NULL COMMENT '会话单号',
  `TAG_ID` bigint(20) NOT NULL COMMENT '标签ID',
  `RULE_ID` bigint(20) NOT NULL COMMENT '碰撞规则ID',
  `CALL_TYPE` char(4) NOT NULL COMMENT '会话类型',
  `ROLE_TYPE` char(4) NOT NULL COMMENT '数据角色类型',
  `PARENT_ID` bigint(20) NOT NULL COMMENT 'tag父级ID',
  `TAG_TEXT` varchar(255) DEFAULT NULL COMMENT '标签文本',
  `RULE_EXPS` varchar(255) DEFAULT NULL COMMENT '规则表达式',
  `CALL_DATE` int(8) NOT NULL COMMENT '会话日期',
  `CALL_YEAR` mediumint(4) NOT NULL COMMENT '会话年',
  `CALL_MONTH` tinyint(2) NOT NULL COMMENT '会话月',
  `CALL_DAY` tinyint(2) NOT NULL COMMENT '会话日',
  `CALL_WEEK` mediumint(9) NOT NULL COMMENT '会话周',
  `SEAT_ID` bigint(20) NOT NULL COMMENT '坐席ID',
  `FREQUENCY` int(11) NOT NULL COMMENT '碰撞发生次数',
  `SUB_FREQUENCY` int(11) NOT NULL COMMENT '子级碰撞发生次数',
  `TOTAL_FREQUENCY` int(11) NOT NULL COMMENT '碰撞发生次数总计',
  `SUB_TOTAL` int(11) NOT NULL COMMENT '成功碰撞的子级总数',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`COLLECT_ID`),
  UNIQUE KEY `UX_UNIQUE` (`CHANNEL_ID`,`CALL_NO`,`TAG_ID`,`RULE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签汇总表';

-- ----------------------------
-- Records of tag_collect
-- ----------------------------
INSERT INTO `tag_collect` VALUES ('53419303486424064', '49252889384718336', '10001', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '12', '0', '12', '0', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303490618368', '49252889384718336', '10001', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303490618369', '49252889384718336', '10001', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303491666945', '49252889384718336', '10001', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764097', '49252889384718336', '10001', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '28', '0', '28', '0', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764098', '49252889384718336', '10001', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '28', '28', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764099', '49252889384718336', '10001', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '28', '28', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764100', '49252889384718336', '10001', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180701', '2018', '7', '1', '201826', '204647654448304128', '26', '0', '26', '0', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764101', '49252889384718336', '10001', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '26', '26', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764102', '49252889384718336', '10001', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '26', '26', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764103', '49252889384718336', '10001', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180701', '2018', '7', '1', '201826', '204647654448304128', '57', '0', '57', '0', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764104', '49252889384718336', '10001', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '57', '57', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303493764105', '49252889384718336', '10001', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '57', '57', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303494812684', '49252889384718336', '10001', '198819246732611584', '52789222041486336', 'AUD', 'ALL', '198819179812491264', '苹果', '爱疯|土豪金', '20180701', '2018', '7', '1', '201826', '204647654448304128', '72', '0', '72', '0', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303494812685', '49252889384718336', '10001', '198819179812491264', '52789222041486336', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419303494812686', '49252889384718336', '10001', '198818923355967488', '52789222041486336', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:16:58', 'SYS', '2018-08-13 15:16:58', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305380152342', '49252889384718336', '10002', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180702', '2018', '7', '2', '201827', '204647654448304128', '82', '0', '82', '0', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305380152343', '49252889384718336', '10002', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305380152344', '49252889384718336', '10002', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305380152345', '49252889384718336', '10002', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305380152346', '49252889384718336', '10002', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180702', '2018', '7', '2', '201827', '204647654448304128', '70', '0', '70', '0', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305380152347', '49252889384718336', '10002', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '70', '70', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200923', '49252889384718336', '10002', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '70', '70', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200924', '49252889384718336', '10002', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180702', '2018', '7', '2', '201827', '204647654448304128', '1', '0', '1', '0', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200925', '49252889384718336', '10002', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '1', '1', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200926', '49252889384718336', '10002', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '1', '1', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200927', '49252889384718336', '10002', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180702', '2018', '7', '2', '201827', '204647654448304128', '32', '0', '32', '0', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200928', '49252889384718336', '10002', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '32', '32', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200929', '49252889384718336', '10002', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '32', '32', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200933', '49252889384718336', '10002', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180702', '2018', '7', '2', '201827', '204647654448304128', '21', '0', '21', '0', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200934', '49252889384718336', '10002', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '21', '21', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419305381200935', '49252889384718336', '10002', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180702', '2018', '7', '2', '201827', '204647654448304128', '0', '21', '21', '1', null, 'SYS', '2018-08-13 15:16:59', 'SYS', '2018-08-13 15:16:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835503', '49252889384718336', '10003', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180703', '2018', '7', '3', '201827', '204647654448304128', '77', '0', '77', '0', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835504', '49252889384718336', '10003', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '77', '77', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835505', '49252889384718336', '10003', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '77', '77', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835506', '49252889384718336', '10003', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '77', '77', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835507', '49252889384718336', '10003', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180703', '2018', '7', '3', '201827', '204647654448304128', '85', '0', '85', '0', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835508', '49252889384718336', '10003', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306754835509', '49252889384718336', '10003', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884085', '49252889384718336', '10003', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180703', '2018', '7', '3', '201827', '204647654448304128', '78', '0', '78', '0', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884086', '49252889384718336', '10003', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884087', '49252889384718336', '10003', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884088', '49252889384718336', '10003', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180703', '2018', '7', '3', '201827', '204647654448304128', '12', '0', '12', '0', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884089', '49252889384718336', '10003', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884090', '49252889384718336', '10003', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884094', '49252889384718336', '10003', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180703', '2018', '7', '3', '201827', '204647654448304128', '20', '0', '20', '0', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884095', '49252889384718336', '10003', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '20', '20', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419306755884096', '49252889384718336', '10003', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180703', '2018', '7', '3', '201827', '204647654448304128', '0', '20', '20', '1', null, 'SYS', '2018-08-13 15:17:00', 'SYS', '2018-08-13 15:17:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253960', '49252889384718336', '10004', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180704', '2018', '7', '4', '201827', '204647654448304128', '11', '0', '11', '0', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253961', '49252889384718336', '10004', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253962', '49252889384718336', '10004', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253963', '49252889384718336', '10004', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253964', '49252889384718336', '10004', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180704', '2018', '7', '4', '201827', '204647654448304128', '73', '0', '73', '0', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253965', '49252889384718336', '10004', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253966', '49252889384718336', '10004', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253967', '49252889384718336', '10004', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180704', '2018', '7', '4', '201827', '204647654448304128', '26', '0', '26', '0', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253968', '49252889384718336', '10004', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '26', '26', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253969', '49252889384718336', '10004', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '26', '26', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253970', '49252889384718336', '10004', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180704', '2018', '7', '4', '201827', '204647654448304128', '90', '0', '90', '0', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253971', '49252889384718336', '10004', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '90', '90', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308361253972', '49252889384718336', '10004', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '90', '90', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308362302551', '49252889384718336', '10004', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180704', '2018', '7', '4', '201827', '204647654448304128', '10', '0', '10', '0', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308362302552', '49252889384718336', '10004', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419308362302553', '49252889384718336', '10004', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-13 15:17:02', 'SYS', '2018-08-13 15:17:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870177', '49252889384718336', '10005', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180705', '2018', '7', '5', '201827', '204647654448304128', '5', '0', '5', '0', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870178', '49252889384718336', '10005', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '5', '5', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870179', '49252889384718336', '10005', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '5', '5', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870180', '49252889384718336', '10005', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '5', '5', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870181', '49252889384718336', '10005', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180705', '2018', '7', '5', '201827', '204647654448304128', '42', '0', '42', '0', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870182', '49252889384718336', '10005', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '42', '42', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309453870183', '49252889384718336', '10005', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '42', '42', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309454918759', '49252889384718336', '10005', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180705', '2018', '7', '5', '201827', '204647654448304128', '25', '0', '25', '0', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309454918760', '49252889384718336', '10005', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '25', '25', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309454918761', '49252889384718336', '10005', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '25', '25', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309454918762', '49252889384718336', '10005', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180705', '2018', '7', '5', '201827', '204647654448304128', '40', '0', '40', '0', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309454918763', '49252889384718336', '10005', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '40', '40', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309454918764', '49252889384718336', '10005', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '40', '40', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309455967343', '49252889384718336', '10005', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180705', '2018', '7', '5', '201827', '204647654448304128', '71', '0', '71', '0', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309455967344', '49252889384718336', '10005', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '71', '71', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419309455967345', '49252889384718336', '10005', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180705', '2018', '7', '5', '201827', '204647654448304128', '0', '71', '71', '1', null, 'SYS', '2018-08-13 15:17:03', 'SYS', '2018-08-13 15:17:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310237156471', '49252889384718336', '10006', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180706', '2018', '7', '6', '201827', '204647654448304128', '36', '0', '36', '0', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205047', '49252889384718336', '10006', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205048', '49252889384718336', '10006', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205049', '49252889384718336', '10006', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205050', '49252889384718336', '10006', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180706', '2018', '7', '6', '201827', '204647654448304128', '18', '0', '18', '0', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205051', '49252889384718336', '10006', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '18', '18', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205052', '49252889384718336', '10006', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '18', '18', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205053', '49252889384718336', '10006', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180706', '2018', '7', '6', '201827', '204647654448304128', '86', '0', '86', '0', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205054', '49252889384718336', '10006', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '86', '86', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205055', '49252889384718336', '10006', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '86', '86', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205056', '49252889384718336', '10006', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180706', '2018', '7', '6', '201827', '204647654448304128', '34', '0', '34', '0', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205057', '49252889384718336', '10006', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205058', '49252889384718336', '10006', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205062', '49252889384718336', '10006', '198819246732611584', '52789222041486336', 'AUD', 'ALL', '198819179812491264', '苹果', '爱疯|土豪金', '20180706', '2018', '7', '6', '201827', '204647654448304128', '30', '0', '30', '0', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205063', '49252889384718336', '10006', '198819179812491264', '52789222041486336', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419310238205064', '49252889384718336', '10006', '198818923355967488', '52789222041486336', 'AUD', 'ALL', '0', '产品类', null, '20180706', '2018', '7', '6', '201827', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:04', 'SYS', '2018-08-13 15:17:04', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417615', '49252889384718336', '10007', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180707', '2018', '7', '7', '201827', '204647654448304128', '7', '0', '7', '0', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417616', '49252889384718336', '10007', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417617', '49252889384718336', '10007', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417618', '49252889384718336', '10007', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417619', '49252889384718336', '10007', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180707', '2018', '7', '7', '201827', '204647654448304128', '11', '0', '11', '0', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417620', '49252889384718336', '10007', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417621', '49252889384718336', '10007', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417622', '49252889384718336', '10007', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180707', '2018', '7', '7', '201827', '204647654448304128', '18', '0', '18', '0', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417623', '49252889384718336', '10007', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '18', '18', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311149417624', '49252889384718336', '10007', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '18', '18', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311153611928', '49252889384718336', '10007', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180707', '2018', '7', '7', '201827', '204647654448304128', '55', '0', '55', '0', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311153611929', '49252889384718336', '10007', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '55', '55', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311153611930', '49252889384718336', '10007', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '55', '55', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311153611934', '49252889384718336', '10007', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180707', '2018', '7', '7', '201827', '204647654448304128', '98', '0', '98', '0', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311153611935', '49252889384718336', '10007', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419311153611936', '49252889384718336', '10007', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180707', '2018', '7', '7', '201827', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:05', 'SYS', '2018-08-13 15:17:05', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422438', '49252889384718336', '10008', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180708', '2018', '7', '8', '201827', '204647654448304128', '97', '0', '97', '0', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422439', '49252889384718336', '10008', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422440', '49252889384718336', '10008', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422441', '49252889384718336', '10008', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422442', '49252889384718336', '10008', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180708', '2018', '7', '8', '201827', '204647654448304128', '36', '0', '36', '0', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422443', '49252889384718336', '10008', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422444', '49252889384718336', '10008', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422445', '49252889384718336', '10008', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180708', '2018', '7', '8', '201827', '204647654448304128', '94', '0', '94', '0', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422446', '49252889384718336', '10008', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '94', '94', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422447', '49252889384718336', '10008', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '94', '94', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422448', '49252889384718336', '10008', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180708', '2018', '7', '8', '201827', '204647654448304128', '48', '0', '48', '0', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422449', '49252889384718336', '10008', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '48', '48', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312250422450', '49252889384718336', '10008', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '48', '48', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312251471029', '49252889384718336', '10008', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180708', '2018', '7', '8', '201827', '204647654448304128', '82', '0', '82', '0', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312251471030', '49252889384718336', '10008', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419312251471031', '49252889384718336', '10008', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180708', '2018', '7', '8', '201827', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:17:06', 'SYS', '2018-08-13 15:17:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196094', '49252889384718336', '10009', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180709', '2018', '7', '9', '201828', '204647654448304128', '48', '0', '48', '0', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196095', '49252889384718336', '10009', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '48', '48', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196096', '49252889384718336', '10009', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '48', '48', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196097', '49252889384718336', '10009', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '48', '48', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196098', '49252889384718336', '10009', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180709', '2018', '7', '9', '201828', '204647654448304128', '76', '0', '76', '0', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196099', '49252889384718336', '10009', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196100', '49252889384718336', '10009', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196101', '49252889384718336', '10009', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180709', '2018', '7', '9', '201828', '204647654448304128', '63', '0', '63', '0', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196102', '49252889384718336', '10009', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '63', '63', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196103', '49252889384718336', '10009', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '63', '63', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196104', '49252889384718336', '10009', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180709', '2018', '7', '9', '201828', '204647654448304128', '1', '0', '1', '0', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196105', '49252889384718336', '10009', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '1', '1', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313411196106', '49252889384718336', '10009', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '1', '1', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313412244685', '49252889384718336', '10009', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180709', '2018', '7', '9', '201828', '204647654448304128', '25', '0', '25', '0', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313412244686', '49252889384718336', '10009', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '25', '25', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419313412244687', '49252889384718336', '10009', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180709', '2018', '7', '9', '201828', '204647654448304128', '0', '25', '25', '1', null, 'SYS', '2018-08-13 15:17:07', 'SYS', '2018-08-13 15:17:07', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314614961365', '49252889384718336', '100010', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180710', '2018', '7', '10', '201828', '204647654448304128', '97', '0', '97', '0', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314614961366', '49252889384718336', '100010', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314614961367', '49252889384718336', '100010', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314614961368', '49252889384718336', '100010', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314614961369', '49252889384718336', '100010', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180710', '2018', '7', '10', '201828', '204647654448304128', '43', '0', '43', '0', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009945', '49252889384718336', '100010', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009946', '49252889384718336', '100010', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009947', '49252889384718336', '100010', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180710', '2018', '7', '10', '201828', '204647654448304128', '37', '0', '37', '0', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009948', '49252889384718336', '100010', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '37', '37', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009949', '49252889384718336', '100010', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '37', '37', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009950', '49252889384718336', '100010', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180710', '2018', '7', '10', '201828', '204647654448304128', '61', '0', '61', '0', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009951', '49252889384718336', '100010', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009952', '49252889384718336', '100010', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009956', '49252889384718336', '100010', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180710', '2018', '7', '10', '201828', '204647654448304128', '8', '0', '8', '0', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009957', '49252889384718336', '100010', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '8', '8', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419314616009958', '49252889384718336', '100010', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180710', '2018', '7', '10', '201828', '204647654448304128', '0', '8', '8', '1', null, 'SYS', '2018-08-13 15:17:08', 'SYS', '2018-08-13 15:17:08', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688173', '49252889384718336', '100011', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180711', '2018', '7', '11', '201828', '204647654448304128', '76', '0', '76', '0', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688174', '49252889384718336', '100011', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688175', '49252889384718336', '100011', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688176', '49252889384718336', '100011', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688177', '49252889384718336', '100011', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180711', '2018', '7', '11', '201828', '204647654448304128', '98', '0', '98', '0', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688178', '49252889384718336', '100011', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688179', '49252889384718336', '100011', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688180', '49252889384718336', '100011', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180711', '2018', '7', '11', '201828', '204647654448304128', '43', '0', '43', '0', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688181', '49252889384718336', '100011', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688182', '49252889384718336', '100011', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688183', '49252889384718336', '100011', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180711', '2018', '7', '11', '201828', '204647654448304128', '36', '0', '36', '0', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688184', '49252889384718336', '100011', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315515688185', '49252889384718336', '100011', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315516736764', '49252889384718336', '100011', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180711', '2018', '7', '11', '201828', '204647654448304128', '31', '0', '31', '0', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315516736765', '49252889384718336', '100011', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '31', '31', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419315516736766', '49252889384718336', '100011', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180711', '2018', '7', '11', '201828', '204647654448304128', '0', '31', '31', '1', null, 'SYS', '2018-08-13 15:17:09', 'SYS', '2018-08-13 15:17:09', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316478280966', '49252889384718336', '100012', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180712', '2018', '7', '12', '201828', '204647654448304128', '36', '0', '36', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316478280967', '49252889384718336', '100012', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316478280968', '49252889384718336', '100012', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316478280969', '49252889384718336', '100012', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '36', '36', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329545', '49252889384718336', '100012', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180712', '2018', '7', '12', '201828', '204647654448304128', '3', '0', '3', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329546', '49252889384718336', '100012', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '3', '3', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329547', '49252889384718336', '100012', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '3', '3', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329548', '49252889384718336', '100012', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180712', '2018', '7', '12', '201828', '204647654448304128', '34', '0', '34', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329549', '49252889384718336', '100012', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329550', '49252889384718336', '100012', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329551', '49252889384718336', '100012', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180712', '2018', '7', '12', '201828', '204647654448304128', '55', '0', '55', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329552', '49252889384718336', '100012', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '55', '55', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316479329553', '49252889384718336', '100012', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '55', '55', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316480378132', '49252889384718336', '100012', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180712', '2018', '7', '12', '201828', '204647654448304128', '23', '0', '23', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316480378133', '49252889384718336', '100012', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '23', '23', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419316480378134', '49252889384718336', '100012', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180712', '2018', '7', '12', '201828', '204647654448304128', '0', '23', '23', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317362230558', '49252889384718336', '100013', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180713', '2018', '7', '13', '201828', '204647654448304128', '19', '0', '19', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317362230559', '49252889384718336', '100013', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '19', '19', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317362230560', '49252889384718336', '100013', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '19', '19', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317362230561', '49252889384718336', '100013', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '19', '19', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317362230562', '49252889384718336', '100013', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180713', '2018', '7', '13', '201828', '204647654448304128', '4', '0', '4', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317362230563', '49252889384718336', '100013', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '4', '4', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279139', '49252889384718336', '100013', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '4', '4', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279140', '49252889384718336', '100013', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180713', '2018', '7', '13', '201828', '204647654448304128', '43', '0', '43', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279141', '49252889384718336', '100013', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279142', '49252889384718336', '100013', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279143', '49252889384718336', '100013', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180713', '2018', '7', '13', '201828', '204647654448304128', '72', '0', '72', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279144', '49252889384718336', '100013', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279145', '49252889384718336', '100013', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279149', '49252889384718336', '100013', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180713', '2018', '7', '13', '201828', '204647654448304128', '67', '0', '67', '0', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279150', '49252889384718336', '100013', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '67', '67', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419317363279151', '49252889384718336', '100013', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180713', '2018', '7', '13', '201828', '204647654448304128', '0', '67', '67', '1', null, 'SYS', '2018-08-13 15:17:10', 'SYS', '2018-08-13 15:17:10', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917174', '49252889384718336', '100014', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180714', '2018', '7', '14', '201828', '204647654448304128', '51', '0', '51', '0', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917175', '49252889384718336', '100014', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '51', '51', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917176', '49252889384718336', '100014', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '51', '51', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917177', '49252889384718336', '100014', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '51', '51', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917178', '49252889384718336', '100014', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180714', '2018', '7', '14', '201828', '204647654448304128', '96', '0', '96', '0', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917179', '49252889384718336', '100014', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '96', '96', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917180', '49252889384718336', '100014', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '96', '96', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917181', '49252889384718336', '100014', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180714', '2018', '7', '14', '201828', '204647654448304128', '10', '0', '10', '0', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917182', '49252889384718336', '100014', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917183', '49252889384718336', '100014', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917184', '49252889384718336', '100014', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180714', '2018', '7', '14', '201828', '204647654448304128', '66', '0', '66', '0', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917185', '49252889384718336', '100014', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '66', '66', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917186', '49252889384718336', '100014', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '66', '66', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917190', '49252889384718336', '100014', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180714', '2018', '7', '14', '201828', '204647654448304128', '64', '0', '64', '0', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917191', '49252889384718336', '100014', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '64', '64', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419318218917192', '49252889384718336', '100014', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180714', '2018', '7', '14', '201828', '204647654448304128', '0', '64', '64', '1', null, 'SYS', '2018-08-13 15:17:11', 'SYS', '2018-08-13 15:17:11', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319056729428', '49252889384718336', '100015', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180715', '2018', '7', '15', '201828', '204647654448304128', '43', '0', '43', '0', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319056729429', '49252889384718336', '100015', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319056729430', '49252889384718336', '100015', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '43', '43', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778006', '49252889384718336', '100015', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180715', '2018', '7', '15', '201828', '204647654448304128', '93', '0', '93', '0', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778007', '49252889384718336', '100015', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778008', '49252889384718336', '100015', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778009', '49252889384718336', '100015', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180715', '2018', '7', '15', '201828', '204647654448304128', '87', '0', '87', '0', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778010', '49252889384718336', '100015', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '87', '87', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778011', '49252889384718336', '100015', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '87', '87', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778015', '49252889384718336', '100015', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180715', '2018', '7', '15', '201828', '204647654448304128', '53', '0', '53', '0', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778016', '49252889384718336', '100015', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '53', '53', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419319057778017', '49252889384718336', '100015', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180715', '2018', '7', '15', '201828', '204647654448304128', '0', '53', '53', '1', null, 'SYS', '2018-08-13 15:17:12', 'SYS', '2018-08-13 15:17:12', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320162977129', '49252889384718336', '100016', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180716', '2018', '7', '16', '201829', '204647654448304128', '42', '0', '42', '0', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320162977130', '49252889384718336', '100016', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '42', '42', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320162977131', '49252889384718336', '100016', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '42', '42', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320162977132', '49252889384718336', '100016', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '42', '42', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320162977133', '49252889384718336', '100016', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180716', '2018', '7', '16', '201829', '204647654448304128', '93', '0', '93', '0', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320162977134', '49252889384718336', '100016', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320166122862', '49252889384718336', '100016', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320166122863', '49252889384718336', '100016', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180716', '2018', '7', '16', '201829', '204647654448304128', '83', '0', '83', '0', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320166122864', '49252889384718336', '100016', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320167171440', '49252889384718336', '100016', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320167171441', '49252889384718336', '100016', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180716', '2018', '7', '16', '201829', '204647654448304128', '85', '0', '85', '0', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320167171442', '49252889384718336', '100016', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320168220018', '49252889384718336', '100016', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320169268597', '49252889384718336', '100016', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180716', '2018', '7', '16', '201829', '204647654448304128', '74', '0', '74', '0', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320169268598', '49252889384718336', '100016', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '74', '74', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419320169268599', '49252889384718336', '100016', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180716', '2018', '7', '16', '201829', '204647654448304128', '0', '74', '74', '1', null, 'SYS', '2018-08-13 15:17:13', 'SYS', '2018-08-13 15:17:13', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322385958271', '49252889384718336', '100017', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180717', '2018', '7', '17', '201829', '204647654448304128', '92', '0', '92', '0', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322385958272', '49252889384718336', '100017', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '92', '92', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322385958273', '49252889384718336', '100017', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '92', '92', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322385958274', '49252889384718336', '100017', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '92', '92', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006850', '49252889384718336', '100017', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180717', '2018', '7', '17', '201829', '204647654448304128', '91', '0', '91', '0', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006851', '49252889384718336', '100017', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '91', '91', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006852', '49252889384718336', '100017', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '91', '91', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006853', '49252889384718336', '100017', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180717', '2018', '7', '17', '201829', '204647654448304128', '39', '0', '39', '0', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006854', '49252889384718336', '100017', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '39', '39', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006855', '49252889384718336', '100017', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '39', '39', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322387006856', '49252889384718336', '100017', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180717', '2018', '7', '17', '201829', '204647654448304128', '98', '0', '98', '0', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322388055432', '49252889384718336', '100017', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322388055433', '49252889384718336', '100017', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322388055437', '49252889384718336', '100017', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180717', '2018', '7', '17', '201829', '204647654448304128', '80', '0', '80', '0', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322388055438', '49252889384718336', '100017', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '80', '80', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419322388055439', '49252889384718336', '100017', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180717', '2018', '7', '17', '201829', '204647654448304128', '0', '80', '80', '1', null, 'SYS', '2018-08-13 15:17:15', 'SYS', '2018-08-13 15:17:15', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867671', '49252889384718336', '100018', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180718', '2018', '7', '18', '201829', '204647654448304128', '60', '0', '60', '0', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867672', '49252889384718336', '100018', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '60', '60', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867673', '49252889384718336', '100018', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '60', '60', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867674', '49252889384718336', '100018', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '60', '60', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867675', '49252889384718336', '100018', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180718', '2018', '7', '18', '201829', '204647654448304128', '11', '0', '11', '0', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867676', '49252889384718336', '100018', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867677', '49252889384718336', '100018', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '11', '11', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867678', '49252889384718336', '100018', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180718', '2018', '7', '18', '201829', '204647654448304128', '75', '0', '75', '0', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867679', '49252889384718336', '100018', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '75', '75', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867680', '49252889384718336', '100018', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '75', '75', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867681', '49252889384718336', '100018', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180718', '2018', '7', '18', '201829', '204647654448304128', '3', '0', '3', '0', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867682', '49252889384718336', '100018', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '3', '3', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867683', '49252889384718336', '100018', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '3', '3', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867687', '49252889384718336', '100018', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180718', '2018', '7', '18', '201829', '204647654448304128', '35', '0', '35', '0', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867688', '49252889384718336', '100018', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '35', '35', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323225867689', '49252889384718336', '100018', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180718', '2018', '7', '18', '201829', '204647654448304128', '0', '35', '35', '1', null, 'SYS', '2018-08-13 15:17:16', 'SYS', '2018-08-13 15:17:16', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668208', '49252889384718336', '100019', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180719', '2018', '7', '19', '201829', '204647654448304128', '21', '0', '21', '0', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668209', '49252889384718336', '100019', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '21', '21', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668210', '49252889384718336', '100019', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '21', '21', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668211', '49252889384718336', '100019', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '21', '21', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668212', '49252889384718336', '100019', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180719', '2018', '7', '19', '201829', '204647654448304128', '57', '0', '57', '0', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668213', '49252889384718336', '100019', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '57', '57', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668214', '49252889384718336', '100019', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '57', '57', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668215', '49252889384718336', '100019', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180719', '2018', '7', '19', '201829', '204647654448304128', '73', '0', '73', '0', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668216', '49252889384718336', '100019', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668217', '49252889384718336', '100019', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668218', '49252889384718336', '100019', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180719', '2018', '7', '19', '201829', '204647654448304128', '84', '0', '84', '0', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668219', '49252889384718336', '100019', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668220', '49252889384718336', '100019', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668224', '49252889384718336', '100019', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180719', '2018', '7', '19', '201829', '204647654448304128', '85', '0', '85', '0', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668225', '49252889384718336', '100019', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419323998668226', '49252889384718336', '100019', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180719', '2018', '7', '19', '201829', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:17', 'SYS', '2018-08-13 15:17:17', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324987475401', '49252889384718336', '100020', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180720', '2018', '7', '20', '201829', '204647654448304128', '58', '0', '58', '0', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523977', '49252889384718336', '100020', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '58', '58', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523978', '49252889384718336', '100020', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '58', '58', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523979', '49252889384718336', '100020', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '58', '58', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523980', '49252889384718336', '100020', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180720', '2018', '7', '20', '201829', '204647654448304128', '72', '0', '72', '0', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523981', '49252889384718336', '100020', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523982', '49252889384718336', '100020', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523983', '49252889384718336', '100020', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180720', '2018', '7', '20', '201829', '204647654448304128', '83', '0', '83', '0', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523984', '49252889384718336', '100020', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324988523985', '49252889384718336', '100020', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324989572561', '49252889384718336', '100020', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180720', '2018', '7', '20', '201829', '204647654448304128', '4', '0', '4', '0', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324989572562', '49252889384718336', '100020', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '4', '4', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324989572563', '49252889384718336', '100020', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '4', '4', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324989572567', '49252889384718336', '100020', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180720', '2018', '7', '20', '201829', '204647654448304128', '20', '0', '20', '0', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324989572568', '49252889384718336', '100020', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '20', '20', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419324989572569', '49252889384718336', '100020', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180720', '2018', '7', '20', '201829', '204647654448304128', '0', '20', '20', '1', null, 'SYS', '2018-08-13 15:17:18', 'SYS', '2018-08-13 15:17:18', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461856', '49252889384718336', '100021', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180721', '2018', '7', '21', '201829', '204647654448304128', '73', '0', '73', '0', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461857', '49252889384718336', '100021', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461858', '49252889384718336', '100021', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461859', '49252889384718336', '100021', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461860', '49252889384718336', '100021', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180721', '2018', '7', '21', '201829', '204647654448304128', '34', '0', '34', '0', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461861', '49252889384718336', '100021', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461862', '49252889384718336', '100021', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461863', '49252889384718336', '100021', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180721', '2018', '7', '21', '201829', '204647654448304128', '52', '0', '52', '0', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461864', '49252889384718336', '100021', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '52', '52', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461865', '49252889384718336', '100021', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '52', '52', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461866', '49252889384718336', '100021', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180721', '2018', '7', '21', '201829', '204647654448304128', '73', '0', '73', '0', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461867', '49252889384718336', '100021', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461868', '49252889384718336', '100021', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461872', '49252889384718336', '100021', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180721', '2018', '7', '21', '201829', '204647654448304128', '94', '0', '94', '0', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461873', '49252889384718336', '100021', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '94', '94', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419325807461874', '49252889384718336', '100021', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180721', '2018', '7', '21', '201829', '204647654448304128', '0', '94', '94', '1', null, 'SYS', '2018-08-13 15:17:19', 'SYS', '2018-08-13 15:17:19', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632506', '49252889384718336', '100022', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180722', '2018', '7', '22', '201829', '204647654448304128', '23', '0', '23', '0', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632507', '49252889384718336', '100022', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '23', '23', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632508', '49252889384718336', '100022', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '23', '23', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632509', '49252889384718336', '100022', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '23', '23', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632510', '49252889384718336', '100022', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180722', '2018', '7', '22', '201829', '204647654448304128', '39', '0', '39', '0', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632511', '49252889384718336', '100022', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '39', '39', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632512', '49252889384718336', '100022', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '39', '39', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632513', '49252889384718336', '100022', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180722', '2018', '7', '22', '201829', '204647654448304128', '90', '0', '90', '0', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632514', '49252889384718336', '100022', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '90', '90', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632515', '49252889384718336', '100022', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '90', '90', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632516', '49252889384718336', '100022', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180722', '2018', '7', '22', '201829', '204647654448304128', '7', '0', '7', '0', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632517', '49252889384718336', '100022', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632518', '49252889384718336', '100022', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632522', '49252889384718336', '100022', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180722', '2018', '7', '22', '201829', '204647654448304128', '83', '0', '83', '0', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632523', '49252889384718336', '100022', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419326933632524', '49252889384718336', '100022', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180722', '2018', '7', '22', '201829', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:17:20', 'SYS', '2018-08-13 15:17:20', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731155', '49252889384718336', '100023', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180723', '2018', '7', '23', '201830', '204647654448304128', '86', '0', '86', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731156', '49252889384718336', '100023', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '86', '86', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731157', '49252889384718336', '100023', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '86', '86', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731158', '49252889384718336', '100023', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '86', '86', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731159', '49252889384718336', '100023', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180723', '2018', '7', '23', '201830', '204647654448304128', '14', '0', '14', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731160', '49252889384718336', '100023', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '14', '14', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731161', '49252889384718336', '100023', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '14', '14', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731162', '49252889384718336', '100023', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180723', '2018', '7', '23', '201830', '204647654448304128', '88', '0', '88', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731163', '49252889384718336', '100023', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731164', '49252889384718336', '100023', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731165', '49252889384718336', '100023', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180723', '2018', '7', '23', '201830', '204647654448304128', '98', '0', '98', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731166', '49252889384718336', '100023', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731167', '49252889384718336', '100023', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '98', '98', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731171', '49252889384718336', '100023', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180723', '2018', '7', '23', '201830', '204647654448304128', '66', '0', '66', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731172', '49252889384718336', '100023', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '66', '66', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419327928731173', '49252889384718336', '100023', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180723', '2018', '7', '23', '201830', '204647654448304128', '0', '66', '66', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600365', '49252889384718336', '100024', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180724', '2018', '7', '24', '201830', '204647654448304128', '30', '0', '30', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600366', '49252889384718336', '100024', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600367', '49252889384718336', '100024', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600368', '49252889384718336', '100024', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600369', '49252889384718336', '100024', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180724', '2018', '7', '24', '201830', '204647654448304128', '17', '0', '17', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600370', '49252889384718336', '100024', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '17', '17', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600371', '49252889384718336', '100024', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '17', '17', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600372', '49252889384718336', '100024', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180724', '2018', '7', '24', '201830', '204647654448304128', '30', '0', '30', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600373', '49252889384718336', '100024', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600374', '49252889384718336', '100024', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '30', '30', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600375', '49252889384718336', '100024', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180724', '2018', '7', '24', '201830', '204647654448304128', '46', '0', '46', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600376', '49252889384718336', '100024', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '46', '46', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600377', '49252889384718336', '100024', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '46', '46', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600381', '49252889384718336', '100024', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180724', '2018', '7', '24', '201830', '204647654448304128', '61', '0', '61', '0', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600382', '49252889384718336', '100024', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419328724600383', '49252889384718336', '100024', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180724', '2018', '7', '24', '201830', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:17:21', 'SYS', '2018-08-13 15:17:21', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275270', '49252889384718336', '100025', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180725', '2018', '7', '25', '201830', '204647654448304128', '76', '0', '76', '0', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275271', '49252889384718336', '100025', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275272', '49252889384718336', '100025', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275273', '49252889384718336', '100025', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '76', '76', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275277', '49252889384718336', '100025', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180725', '2018', '7', '25', '201830', '204647654448304128', '19', '0', '19', '0', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275278', '49252889384718336', '100025', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '19', '19', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275279', '49252889384718336', '100025', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '19', '19', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275280', '49252889384718336', '100025', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180725', '2018', '7', '25', '201830', '204647654448304128', '13', '0', '13', '0', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275281', '49252889384718336', '100025', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '13', '13', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275282', '49252889384718336', '100025', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '13', '13', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275286', '49252889384718336', '100025', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180725', '2018', '7', '25', '201830', '204647654448304128', '32', '0', '32', '0', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275287', '49252889384718336', '100025', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '32', '32', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419329516275288', '49252889384718336', '100025', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '32', '32', '1', null, 'SYS', '2018-08-13 15:17:22', 'SYS', '2018-08-13 15:17:22', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330223015520', '49252889384718336', '100026', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180726', '2018', '7', '26', '201830', '204647654448304128', '31', '0', '31', '0', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064096', '49252889384718336', '100026', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '31', '31', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064097', '49252889384718336', '100026', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '31', '31', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064098', '49252889384718336', '100026', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '31', '31', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064099', '49252889384718336', '100026', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180726', '2018', '7', '26', '201830', '204647654448304128', '10', '0', '10', '0', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064100', '49252889384718336', '100026', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064101', '49252889384718336', '100026', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064102', '49252889384718336', '100026', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180726', '2018', '7', '26', '201830', '204647654448304128', '85', '0', '85', '0', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064103', '49252889384718336', '100026', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064104', '49252889384718336', '100026', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064105', '49252889384718336', '100026', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180726', '2018', '7', '26', '201830', '204647654448304128', '3', '0', '3', '0', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064106', '49252889384718336', '100026', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '3', '3', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064107', '49252889384718336', '100026', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '3', '3', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064111', '49252889384718336', '100026', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180726', '2018', '7', '26', '201830', '204647654448304128', '88', '0', '88', '0', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064112', '49252889384718336', '100026', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419330224064113', '49252889384718336', '100026', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180726', '2018', '7', '26', '201830', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:17:23', 'SYS', '2018-08-13 15:17:23', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819385', '49252889384718336', '100027', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180727', '2018', '7', '27', '201830', '204647654448304128', '81', '0', '81', '0', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819386', '49252889384718336', '100027', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '81', '81', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819387', '49252889384718336', '100027', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '81', '81', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819388', '49252889384718336', '100027', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '81', '81', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819389', '49252889384718336', '100027', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180727', '2018', '7', '27', '201830', '204647654448304128', '87', '0', '87', '0', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819390', '49252889384718336', '100027', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '87', '87', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819391', '49252889384718336', '100027', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '87', '87', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819392', '49252889384718336', '100027', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180727', '2018', '7', '27', '201830', '204647654448304128', '9', '0', '9', '0', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819393', '49252889384718336', '100027', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '9', '9', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819394', '49252889384718336', '100027', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '9', '9', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819395', '49252889384718336', '100027', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180727', '2018', '7', '27', '201830', '204647654448304128', '12', '0', '12', '0', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819396', '49252889384718336', '100027', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819397', '49252889384718336', '100027', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '12', '12', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819401', '49252889384718336', '100027', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180727', '2018', '7', '27', '201830', '204647654448304128', '79', '0', '79', '0', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331103819402', '49252889384718336', '100027', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '79', '79', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419331104867978', '49252889384718336', '100027', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180727', '2018', '7', '27', '201830', '204647654448304128', '0', '79', '79', '1', null, 'SYS', '2018-08-13 15:17:24', 'SYS', '2018-08-13 15:17:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172626', '49252889384718336', '100028', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180728', '2018', '7', '28', '201830', '204647654448304128', '93', '0', '93', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172627', '49252889384718336', '100028', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172628', '49252889384718336', '100028', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172629', '49252889384718336', '100028', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '93', '93', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172630', '49252889384718336', '100028', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180728', '2018', '7', '28', '201830', '204647654448304128', '35', '0', '35', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172631', '49252889384718336', '100028', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '35', '35', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172632', '49252889384718336', '100028', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '35', '35', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172633', '49252889384718336', '100028', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180728', '2018', '7', '28', '201830', '204647654448304128', '68', '0', '68', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172634', '49252889384718336', '100028', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '68', '68', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172635', '49252889384718336', '100028', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '68', '68', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172636', '49252889384718336', '100028', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180728', '2018', '7', '28', '201830', '204647654448304128', '32', '0', '32', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172637', '49252889384718336', '100028', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '32', '32', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172638', '49252889384718336', '100028', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '32', '32', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172642', '49252889384718336', '100028', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180728', '2018', '7', '28', '201830', '204647654448304128', '85', '0', '85', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172643', '49252889384718336', '100028', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419332169172644', '49252889384718336', '100028', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180728', '2018', '7', '28', '201830', '204647654448304128', '0', '85', '85', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607980', '49252889384718336', '100029', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180729', '2018', '7', '29', '201830', '204647654448304128', '5', '0', '5', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607981', '49252889384718336', '100029', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '5', '5', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607982', '49252889384718336', '100029', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '5', '5', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607983', '49252889384718336', '100029', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '5', '5', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607984', '49252889384718336', '100029', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180729', '2018', '7', '29', '201830', '204647654448304128', '29', '0', '29', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607985', '49252889384718336', '100029', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '29', '29', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607986', '49252889384718336', '100029', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '29', '29', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607987', '49252889384718336', '100029', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180729', '2018', '7', '29', '201830', '204647654448304128', '7', '0', '7', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607988', '49252889384718336', '100029', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607989', '49252889384718336', '100029', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607990', '49252889384718336', '100029', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180729', '2018', '7', '29', '201830', '204647654448304128', '53', '0', '53', '0', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607991', '49252889384718336', '100029', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '53', '53', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333063607992', '49252889384718336', '100029', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '53', '53', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333064656571', '49252889384718336', '100029', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180729', '2018', '7', '29', '201830', '204647654448304128', '13', '0', '13', '0', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333064656572', '49252889384718336', '100029', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '13', '13', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333064656573', '49252889384718336', '100029', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '13', '13', '1', null, 'SYS', '2018-08-13 15:17:25', 'SYS', '2018-08-13 15:17:25', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266117', '49252889384718336', '100030', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180730', '2018', '7', '30', '201831', '204647654448304128', '15', '0', '15', '0', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266118', '49252889384718336', '100030', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '15', '15', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266119', '49252889384718336', '100030', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '15', '15', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266120', '49252889384718336', '100030', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '15', '15', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266121', '49252889384718336', '100030', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180730', '2018', '7', '30', '201831', '204647654448304128', '52', '0', '52', '0', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266122', '49252889384718336', '100030', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '52', '52', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266123', '49252889384718336', '100030', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '52', '52', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266124', '49252889384718336', '100030', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180730', '2018', '7', '30', '201831', '204647654448304128', '84', '0', '84', '0', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266125', '49252889384718336', '100030', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266126', '49252889384718336', '100030', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266127', '49252889384718336', '100030', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180730', '2018', '7', '30', '201831', '204647654448304128', '88', '0', '88', '0', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266128', '49252889384718336', '100030', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266129', '49252889384718336', '100030', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266133', '49252889384718336', '100030', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180730', '2018', '7', '30', '201831', '204647654448304128', '53', '0', '53', '0', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266134', '49252889384718336', '100030', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '53', '53', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419333941266135', '49252889384718336', '100030', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180730', '2018', '7', '30', '201831', '204647654448304128', '0', '53', '53', '1', null, 'SYS', '2018-08-13 15:17:26', 'SYS', '2018-08-13 15:17:26', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069982', '49252889384718336', '100031', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180731', '2018', '7', '31', '201831', '204647654448304128', '84', '0', '84', '0', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069983', '49252889384718336', '100031', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069984', '49252889384718336', '100031', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069985', '49252889384718336', '100031', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '84', '84', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069986', '49252889384718336', '100031', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180731', '2018', '7', '31', '201831', '204647654448304128', '54', '0', '54', '0', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069987', '49252889384718336', '100031', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '54', '54', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069988', '49252889384718336', '100031', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '54', '54', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069989', '49252889384718336', '100031', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180731', '2018', '7', '31', '201831', '204647654448304128', '34', '0', '34', '0', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069990', '49252889384718336', '100031', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069991', '49252889384718336', '100031', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '34', '34', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069992', '49252889384718336', '100031', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180731', '2018', '7', '31', '201831', '204647654448304128', '24', '0', '24', '0', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069993', '49252889384718336', '100031', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '24', '24', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069994', '49252889384718336', '100031', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '24', '24', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069998', '49252889384718336', '100031', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180731', '2018', '7', '31', '201831', '204647654448304128', '82', '0', '82', '0', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822069999', '49252889384718336', '100031', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419334822070000', '49252889384718336', '100031', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180731', '2018', '7', '31', '201831', '204647654448304128', '0', '82', '82', '1', null, 'SYS', '2018-08-13 15:17:27', 'SYS', '2018-08-13 15:17:27', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422937056256', '49252889384718336', '101', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '16', '0', '16', '0', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422942299136', '49252889384718336', '101', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '16', '16', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422942299137', '49252889384718336', '101', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '16', '16', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422942299138', '49252889384718336', '101', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '16', '16', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639170', '49252889384718336', '101', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '95', '0', '95', '0', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639171', '49252889384718336', '101', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '95', '95', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639172', '49252889384718336', '101', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '95', '95', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639173', '49252889384718336', '101', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180701', '2018', '7', '1', '201826', '204647654448304128', '4', '0', '4', '0', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639174', '49252889384718336', '101', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '4', '4', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639175', '49252889384718336', '101', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '4', '4', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639176', '49252889384718336', '101', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180701', '2018', '7', '1', '201826', '204647654448304128', '78', '0', '78', '0', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422949639177', '49252889384718336', '101', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422950687753', '49252889384718336', '101', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422950687757', '49252889384718336', '101', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180701', '2018', '7', '1', '201826', '204647654448304128', '95', '0', '95', '0', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422950687758', '49252889384718336', '101', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '95', '95', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419422950687759', '49252889384718336', '101', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '95', '95', '1', null, 'SYS', '2018-08-13 15:18:52', 'SYS', '2018-08-13 15:18:52', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426728707094', '49252889384718336', '102', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '61', '0', '61', '0', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426728707095', '49252889384718336', '102', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426728707096', '49252889384718336', '102', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426728707097', '49252889384718336', '102', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426729755673', '49252889384718336', '102', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '57', '0', '57', '0', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426730804249', '49252889384718336', '102', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '57', '57', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852825', '49252889384718336', '102', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '57', '57', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852826', '49252889384718336', '102', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180701', '2018', '7', '1', '201826', '204647654448304128', '64', '0', '64', '0', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852827', '49252889384718336', '102', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '64', '64', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852828', '49252889384718336', '102', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '64', '64', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852829', '49252889384718336', '102', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180701', '2018', '7', '1', '201826', '204647654448304128', '47', '0', '47', '0', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852830', '49252889384718336', '102', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '47', '47', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426731852831', '49252889384718336', '102', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '47', '47', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426732901410', '49252889384718336', '102', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180701', '2018', '7', '1', '201826', '204647654448304128', '15', '0', '15', '0', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426732901411', '49252889384718336', '102', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '15', '15', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419426732901412', '49252889384718336', '102', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '15', '15', '1', null, 'SYS', '2018-08-13 15:18:55', 'SYS', '2018-08-13 15:18:55', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428965319723', '49252889384718336', '103', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '33', '0', '33', '0', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428966368299', '49252889384718336', '103', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '33', '33', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428966368300', '49252889384718336', '103', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '33', '33', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416876', '49252889384718336', '103', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '33', '33', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416877', '49252889384718336', '103', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180701', '2018', '7', '1', '201826', '204647654448304128', '6', '0', '6', '0', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416878', '49252889384718336', '103', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '6', '6', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416879', '49252889384718336', '103', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '6', '6', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416880', '49252889384718336', '103', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180701', '2018', '7', '1', '201826', '204647654448304128', '47', '0', '47', '0', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416881', '49252889384718336', '103', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '47', '47', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428967416882', '49252889384718336', '103', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '47', '47', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428968465458', '49252889384718336', '103', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180701', '2018', '7', '1', '201826', '204647654448304128', '99', '0', '99', '0', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428968465459', '49252889384718336', '103', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '99', '99', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428968465460', '49252889384718336', '103', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '99', '99', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428968465464', '49252889384718336', '103', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180701', '2018', '7', '1', '201826', '204647654448304128', '7', '0', '7', '0', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428968465465', '49252889384718336', '103', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419428968465466', '49252889384718336', '103', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180701', '2018', '7', '1', '201826', '204647654448304128', '0', '7', '7', '1', null, 'SYS', '2018-08-13 15:18:57', 'SYS', '2018-08-13 15:18:57', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431344538690', '49252889384718336', '104', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180704', '2018', '7', '4', '201827', '204647654448304128', '77', '0', '77', '0', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431344538691', '49252889384718336', '104', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '77', '77', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431344538692', '49252889384718336', '104', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '77', '77', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431346635844', '49252889384718336', '104', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '77', '77', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431346635845', '49252889384718336', '104', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180704', '2018', '7', '4', '201827', '204647654448304128', '83', '0', '83', '0', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431346635846', '49252889384718336', '104', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431346635847', '49252889384718336', '104', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '83', '83', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431346635848', '49252889384718336', '104', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180704', '2018', '7', '4', '201827', '204647654448304128', '40', '0', '40', '0', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431346635849', '49252889384718336', '104', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '40', '40', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684425', '49252889384718336', '104', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '40', '40', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684426', '49252889384718336', '104', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180704', '2018', '7', '4', '201827', '204647654448304128', '73', '0', '73', '0', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684427', '49252889384718336', '104', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684428', '49252889384718336', '104', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '73', '73', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684432', '49252889384718336', '104', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180704', '2018', '7', '4', '201827', '204647654448304128', '74', '0', '74', '0', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684433', '49252889384718336', '104', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '74', '74', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419431347684434', '49252889384718336', '104', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180704', '2018', '7', '4', '201827', '204647654448304128', '0', '74', '74', '1', null, 'SYS', '2018-08-13 15:18:59', 'SYS', '2018-08-13 15:18:59', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435056497753', '49252889384718336', '105', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180725', '2018', '7', '25', '201830', '204647654448304128', '27', '0', '27', '0', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435056497754', '49252889384718336', '105', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '27', '27', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435056497755', '49252889384718336', '105', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '27', '27', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435056497756', '49252889384718336', '105', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '27', '27', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546332', '49252889384718336', '105', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180725', '2018', '7', '25', '201830', '204647654448304128', '96', '0', '96', '0', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546333', '49252889384718336', '105', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '96', '96', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546334', '49252889384718336', '105', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '96', '96', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546335', '49252889384718336', '105', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180725', '2018', '7', '25', '201830', '204647654448304128', '72', '0', '72', '0', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546336', '49252889384718336', '105', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546337', '49252889384718336', '105', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '72', '72', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546338', '49252889384718336', '105', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180725', '2018', '7', '25', '201830', '204647654448304128', '61', '0', '61', '0', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546339', '49252889384718336', '105', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546340', '49252889384718336', '105', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '61', '61', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546344', '49252889384718336', '105', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180725', '2018', '7', '25', '201830', '204647654448304128', '8', '0', '8', '0', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546345', '49252889384718336', '105', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '8', '8', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419435057546346', '49252889384718336', '105', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '8', '8', '1', null, 'SYS', '2018-08-13 15:19:03', 'SYS', '2018-08-13 15:19:03', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957746', '49252889384718336', '106', '52969651999638528', '53147159640441856', 'ALL', 'ALL', '52969645376832512', '88i9i', 'dfwfqwdwqdqwd', '20180725', '2018', '7', '25', '201830', '204647654448304128', '78', '0', '78', '0', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957747', '49252889384718336', '106', '52969645376832512', '53147159640441856', 'ALL', 'ALL', '198819179812491264', 'lpppp', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957748', '49252889384718336', '106', '198819179812491264', '53147159640441856', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957749', '49252889384718336', '106', '198818923355967488', '53147159640441856', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '78', '78', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957750', '49252889384718336', '106', '52969645376832512', '53146634272408576', 'ALL', 'ALL', '198819179812491264', 'lpppp', 'dqwdwqdwqd', '20180725', '2018', '7', '25', '201830', '204647654448304128', '58', '0', '58', '0', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957751', '49252889384718336', '106', '198819179812491264', '53146634272408576', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '58', '58', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957752', '49252889384718336', '106', '198818923355967488', '53146634272408576', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '58', '58', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957753', '49252889384718336', '106', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180725', '2018', '7', '25', '201830', '204647654448304128', '88', '0', '88', '0', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957754', '49252889384718336', '106', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438325957755', '49252889384718336', '106', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '88', '88', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438327006331', '49252889384718336', '106', '198819246732611111', '52789341326443520', 'ALL', 'ALL', '198819179812491264', '华为', '荣耀10', '20180725', '2018', '7', '25', '201830', '204647654448304128', '79', '0', '79', '0', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438327006332', '49252889384718336', '106', '198819179812491264', '52789341326443520', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '79', '79', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438327006333', '49252889384718336', '106', '198818923355967488', '52789341326443520', 'ALL', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '79', '79', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438327006337', '49252889384718336', '106', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180725', '2018', '7', '25', '201830', '204647654448304128', '71', '0', '71', '0', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438327006338', '49252889384718336', '106', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '71', '71', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('53419438327006339', '49252889384718336', '106', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180725', '2018', '7', '25', '201830', '204647654448304128', '0', '71', '71', '1', null, 'SYS', '2018-08-13 15:19:06', 'SYS', '2018-08-13 15:19:06', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866414633984', '49252889384718336', '107', '54158686522737664', '54158727225312256', 'ALL', 'ALL', '198819179812491264', 'OPPO', '吴亦凡|拍照手机', '20180729', '2018', '7', '29', '201830', '204647654448304128', '79', '0', '79', '0', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866433508352', '49252889384718336', '107', '198819179812491264', '54158727225312256', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '79', '79', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866433508353', '49252889384718336', '107', '198818923355967488', '54158727225312256', 'ALL', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '79', '79', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556929', '49252889384718336', '107', '198819246732622222', '52789320191345664', 'AUD', 'ALL', '198819179812491264', '小米', 'miu|雷军|小米max', '20180729', '2018', '7', '29', '201830', '204647654448304128', '10', '0', '10', '0', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556930', '49252889384718336', '107', '198819179812491264', '52789320191345664', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556931', '49252889384718336', '107', '198818923355967488', '52789320191345664', 'AUD', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '10', '10', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556935', '49252889384718336', '107', '198819246732611584', '49706454618244096', 'AUD', 'ALL', '198819179812491264', '苹果', 'iphone|ios', '20180729', '2018', '7', '29', '201830', '204647654448304128', '94', '0', '94', '0', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556936', '49252889384718336', '107', '198819179812491264', '49706454618244096', 'AUD', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '94', '94', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556937', '49252889384718336', '107', '198818923355967488', '49706454618244096', 'AUD', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '94', '94', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866434556938', '49252889384718336', '107', '198819213316591616', '54158704154543104', 'ALL', 'ALL', '198819179812491264', '三星', 'NOTE7', '20180729', '2018', '7', '29', '201830', '204647654448304128', '97', '0', '97', '0', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866435605514', '49252889384718336', '107', '198819179812491264', '54158704154543104', 'ALL', 'ALL', '198818923355967488', '手机', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');
INSERT INTO `tag_collect` VALUES ('54158866435605515', '49252889384718336', '107', '198818923355967488', '54158704154543104', 'ALL', 'ALL', '0', '产品类', null, '20180729', '2018', '7', '29', '201830', '204647654448304128', '0', '97', '97', '1', null, 'SYS', '2018-08-21 19:12:00', 'SYS', '2018-08-21 19:12:00', '0', '33000');

-- ----------------------------
-- Table structure for tag_control
-- ----------------------------
DROP TABLE IF EXISTS `tag_control`;
CREATE TABLE `tag_control` (
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `NEXT_TAG_NO` int(11) NOT NULL DEFAULT '1' COMMENT '下一个规则编号',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签控制表';

-- ----------------------------
-- Records of tag_control
-- ----------------------------
INSERT INTO `tag_control` VALUES ('49252889384718336', '58', null, 'SYS', '2018-06-28 15:58:10', 'SYS', '2018-08-28 16:00:00', '48');
SET FOREIGN_KEY_CHECKS=1;
