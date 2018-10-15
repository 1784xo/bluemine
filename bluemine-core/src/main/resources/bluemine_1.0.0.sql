/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : bluemine_1.0.0

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-10-15 14:07:51
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
INSERT INTO `batch_job_execution_seq` VALUES ('0', '0');

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
INSERT INTO `batch_job_seq` VALUES ('275', '0');

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
INSERT INTO `batch_step_execution_seq` VALUES ('0', '0');

-- ----------------------------
-- Table structure for call_summary
-- ----------------------------
DROP TABLE IF EXISTS `call_summary`;
CREATE TABLE `call_summary` (
  `CALL_ID` bigint(20) NOT NULL COMMENT '会话ID',
  `CALL_NO` varchar(64) DEFAULT NULL COMMENT '会话单号',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `START_TIME` int(14) NOT NULL COMMENT '会话开始时间',
  `END_TIME` int(14) NOT NULL COMMENT '会话结束时间',
  `SEAT_ID` bigint(20) NOT NULL COMMENT '坐席ID',
  `SEAT_NO` varchar(16) NOT NULL COMMENT '坐席编号',
  `PHONE_NUMBER` varchar(16) DEFAULT NULL COMMENT '来电手机号',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CALL_ID`),
  UNIQUE KEY `UX_CHANNEL_CALL` (`CHANNEL_ID`,`CALL_NO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of call_summary
-- ----------------------------

-- ----------------------------
-- Table structure for call_sync_trigger
-- ----------------------------
DROP TABLE IF EXISTS `call_sync_trigger`;
CREATE TABLE `call_sync_trigger` (
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CALL_DATE` int(8) NOT NULL COMMENT '会话日期',
  `RESOURCE_FILE` varchar(1024) NOT NULL COMMENT '需要同步的资源路径',
  `EXECUTE_COUNT` int(11) NOT NULL COMMENT '执行次数',
  `STATUS_CODE` char(12) NOT NULL COMMENT '作业执行代码',
  `REQUEST_TIME` datetime DEFAULT NULL COMMENT '请求时间',
  `DESC_TEXT` text COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CHANNEL_ID`,`CALL_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of call_sync_trigger
-- ----------------------------

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
  `SEPARATE_SESSION_FLAG` char(1) NOT NULL COMMENT '独立会话标识 ',
  `DESC_TEXT` varchar(120) NOT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CHANNEL_ID`),
  UNIQUE KEY `UX_CHANNEL` (`CHANNEL_NO`,`CHANNEL_TYPE`,`CHANNEL_CODE`) USING BTREE COMMENT '唯一性'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='渠道表';

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('49252889384718336', '100001', 'TEST', 'PRO1', 'Y', 'Y', '测试公司产品1', 'SYS', '2018-06-26 15:16:03', 'SYS', '2018-06-26 15:16:03', '0', '33000');

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
INSERT INTO `code_profile` VALUES ('49252889384718336', 'QRT', 'LOT', '时长', 'Length of Time', 'SYS', '2018-09-13 21:23:55', 'SYS', '2018-09-13 21:23:55', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'QRT', 'ST', '话术', 'Speech technique', 'SYS', '2018-09-14 19:39:54', 'SYS', '2018-09-14 19:39:54', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'QRT', 'MUTE', '静音', 'Mute', 'SYS', '2018-09-14 19:41:53', 'SYS', '2018-09-14 19:41:53', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'QRT', 'CHAT', '闲聊', 'Chart', 'SYS', '2018-09-14 19:44:43', 'SYS', '2018-09-14 19:44:43', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'QRT', 'MOOD', '情绪', 'mood', 'SYS', '2018-09-14 19:46:16', 'SYS', '2018-09-14 19:46:16', '0');
INSERT INTO `code_profile` VALUES ('49252889384718336', 'QRT', 'SOL', '语速', 'Speed of language', 'SYS', '2018-09-14 19:47:48', 'SYS', '2018-09-14 19:47:48', '0');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `DEPT_ID` bigint(20) NOT NULL COMMENT '部门ID',
  `ACTIVATED` char(1) NOT NULL COMMENT '激活标识',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `DEPT_NO` int(11) NOT NULL COMMENT '部门编号',
  `DEPT_TEXT` varchar(50) NOT NULL COMMENT '部门名称',
  `PARENT_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `CUSTOMIZABLE` char(1) NOT NULL COMMENT '定制化标识',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`DEPT_ID`),
  UNIQUE KEY `UX_CHANNEL_DEPT` (`CHANNEL_ID`,`DEPT_NO`) USING BTREE COMMENT '唯一性',
  KEY `IX_SRCH_ONE` (`DEPT_ID`,`CHANNEL_ID`) USING BTREE COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('57511425390707712', 'Y', '49252889384718336', '4', '业务部', '0', 'N', '业务部', 'SYS', '2018-09-27 19:19:29', 'SYS', '2018-09-27 19:19:29', '0');
INSERT INTO `dept` VALUES ('57512477158573056', 'Y', '49252889384718336', '5', '客服一部', '0', 'Y', '客服一部', 'SYS', '2018-09-27 19:36:12', 'SYS', '2018-09-27 19:36:12', '0');
INSERT INTO `dept` VALUES ('57512755559695360', 'Y', '49252889384718336', '6', 'test2', '57512477158573056', 'Y', 'test2', 'SYS', '2018-09-27 19:40:38', 'SYS', '2018-09-27 19:40:38', '0');
INSERT INTO `dept` VALUES ('57514805485929472', 'Y', '49252889384718336', '7', '客服部', '0', 'N', '客服部', 'SYS', '2018-09-27 20:13:13', 'SYS', '2018-09-27 22:54:03', '1');
INSERT INTO `dept` VALUES ('57515813121328128', 'Y', '49252889384718336', '8', '测试部', '57511425390707712', 'Y', '实打实', 'SYS', '2018-09-27 20:29:14', 'SYS', '2018-09-27 22:54:05', '1');
INSERT INTO `dept` VALUES ('57524399160460288', 'Y', '49252889384718336', '9', '测试客服', '57514805485929472', 'Y', '测试客服', 'SYS', '2018-09-27 22:45:42', 'SYS', '2018-09-27 22:54:04', '1');
INSERT INTO `dept` VALUES ('57524875729863680', 'Y', '49252889384718336', '10', 'test33', '57512755559695360', 'Y', '萨达萨达', 'SYS', '2018-09-27 22:53:17', 'SYS', '2018-09-29 15:20:31', '4');

-- ----------------------------
-- Table structure for dept_control
-- ----------------------------
DROP TABLE IF EXISTS `dept_control`;
CREATE TABLE `dept_control` (
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `NEXT_DEPT_NO` int(11) NOT NULL DEFAULT '1' COMMENT '下一个部门编号',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门控制表';

-- ----------------------------
-- Records of dept_control
-- ----------------------------
INSERT INTO `dept_control` VALUES ('49252889384718336', '11', null, 'SYS', '2018-09-26 18:34:47', 'SYS', '2018-09-27 22:53:17', '7');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `EMPLOYEE_ID` bigint(20) NOT NULL COMMENT '员工ID',
  `EMPLOYEE_NO` char(11) NOT NULL COMMENT '员工编号',
  `ACTIVATED` char(1) NOT NULL DEFAULT 'Y' COMMENT '激活标识',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `USER_NAME` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `EMPLOYEE_NAME` varchar(32) NOT NULL COMMENT '员工姓名',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮件地址',
  `SEAT_ID` bigint(20) DEFAULT '0' COMMENT '坐席ID',
  `ROLE_ID` bigint(20) DEFAULT '0' COMMENT '角色ID',
  `DEPT_ID` bigint(20) NOT NULL COMMENT '部门ID',
  `MAC` varchar(20) NOT NULL COMMENT 'mac地址',
  `GROUP_ID` bigint(20) NOT NULL COMMENT '质检组ID',
  `LEAD_ID` bigint(20) DEFAULT '0' COMMENT '领导ID',
  `START_TIME` int(8) DEFAULT '90000' COMMENT '工作开始时间',
  `END_TIME` int(8) DEFAULT '170000' COMMENT '工作结束时间',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('49070939912015872', '000001', 'Y', '49252889384718336', 'admin', '测试员工1', 'test@bluemine.com', '49238845276819456', '2', '57524875729863680', 'AC-ED-5C-68-2A-78', '56129517488473088', '1', '90000', '170000', '阿三', 'SYS', '2018-06-26 15:22:17', 'SYS', '2018-06-26 15:22:17', '0', '33000');
INSERT INTO `employee` VALUES ('57687911559103488', '123', 'N', '49252889384718336', '123', '123', null, null, null, '57524399160460288', '123', '56144594955437056', null, '90000', '170000', null, 'SYS', '2018-09-29 18:04:40', 'SYS', '2018-09-29 18:04:40', '0', '33000');
INSERT INTO `employee` VALUES ('57688319810634752', '00002', 'Y', '49252889384718336', '驱蚊器', '121', null, null, null, '57524875729863680', '12121', '56129517488473088', null, '90000', '170000', null, 'SYS', '2018-09-29 18:11:09', 'SYS', '2018-09-29 19:07:26', '1', '33000');
INSERT INTO `employee` VALUES ('57688513856963584', '123', 'N', '49252889384718336', '123', '123', null, null, null, '57515813121328128', '1231', '56129517488473088', null, '90000', '170000', null, 'SYS', '2018-09-29 18:14:14', 'SYS', '2018-09-29 18:14:14', '0', '33000');
INSERT INTO `employee` VALUES ('57688597550105600', '啊实打实', 'Y', '49252889384718336', '啊实打实', '啊实打实', null, null, null, '57515813121328128', '啊实打实', '56129517488473088', null, '90000', '170000', null, 'SYS', '2018-09-29 18:15:34', 'SYS', '2018-09-29 18:15:34', '0', '33000');
INSERT INTO `employee` VALUES ('57691908097475584', '吃的', 'Y', '49252889384718336', '吃的 ', '吃的', null, null, null, '57512755559695360', 'CDC的', '56131912300790784', null, '90000', '170000', null, 'SYS', '2018-09-29 19:08:11', 'SYS', '2018-09-29 19:08:11', '0', '33000');

-- ----------------------------
-- Table structure for quality_group
-- ----------------------------
DROP TABLE IF EXISTS `quality_group`;
CREATE TABLE `quality_group` (
  `GROUP_ID` bigint(20) NOT NULL COMMENT '质检组ID',
  `ACTIVATED` char(1) NOT NULL COMMENT '启用状态',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `GROUP_NAME` varchar(32) DEFAULT NULL COMMENT '质检组名称',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`GROUP_ID`),
  KEY `IX_SRCH_ONE` (`CHANNEL_ID`) USING BTREE COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='质检组表';

-- ----------------------------
-- Records of quality_group
-- ----------------------------
INSERT INTO `quality_group` VALUES ('56129517488473088', 'Y', '49252889384718336', '收受', '请问请问555', 'SYS', '2018-09-12 13:14:39', 'SYS', '2018-09-13 13:53:26', '11');
INSERT INTO `quality_group` VALUES ('56131912300790784', 'Y', '49252889384718336', '得2', '12312312', 'SYS', '2018-09-12 13:52:43', 'SYS', '2018-09-12 22:47:56', '5');
INSERT INTO `quality_group` VALUES ('56132269597819904', 'Y', '49252889384718336', '1231', '12313', 'SYS', '2018-09-12 13:58:24', 'SYS', '2018-09-12 13:58:24', '0');
INSERT INTO `quality_group` VALUES ('56136014703395840', 'Y', '49252889384718336', '234', '234', 'SYS', '2018-09-12 14:57:55', 'SYS', '2018-09-12 14:57:55', '0');
INSERT INTO `quality_group` VALUES ('56141642119283712', 'Y', '49252889384718336', '22', '222', 'SYS', '2018-09-12 16:27:22', 'SYS', '2018-09-12 16:27:31', '1');
INSERT INTO `quality_group` VALUES ('56141985672627200', 'Y', '49252889384718336', '345', '45345', 'SYS', '2018-09-12 16:32:50', 'SYS', '2018-09-12 22:02:11', '1');
INSERT INTO `quality_group` VALUES ('56144483679503360', 'Y', '49252889384718336', '而扼腕', '微软微软', 'SYS', '2018-09-12 17:12:32', 'SYS', '2018-09-12 17:12:32', '0');
INSERT INTO `quality_group` VALUES ('56144594955437056', 'Y', '49252889384718336', '请问请问v', '我去饿我去饿 ', 'SYS', '2018-09-12 17:14:18', 'SYS', '2018-09-12 17:14:18', '0');
INSERT INTO `quality_group` VALUES ('56144705275069440', 'Y', '49252889384718336', '2312', '12312312', 'SYS', '2018-09-12 17:16:03', 'SYS', '2018-09-12 17:16:21', '1');
INSERT INTO `quality_group` VALUES ('56145123974611968', 'N', '49252889384718336', '一一年1', '哈哈哈', 'SYS', '2018-09-12 17:22:43', 'SYS', '2018-09-12 22:51:37', '2');
INSERT INTO `quality_group` VALUES ('57510775253664768', 'N', '49252889384718336', '业务部', '123123', 'SYS', '2018-09-27 19:09:09', 'SYS', '2018-09-27 19:09:09', '0');

-- ----------------------------
-- Table structure for quality_item
-- ----------------------------
DROP TABLE IF EXISTS `quality_item`;
CREATE TABLE `quality_item` (
  `ITEM_ID` bigint(20) NOT NULL COMMENT '质检明细ID',
  `ROW_ID` bigint(20) NOT NULL COMMENT '质检项ID',
  `ACTIVATED` char(1) NOT NULL COMMENT '启用状态',
  `LOGICRELATION` int(3) NOT NULL DEFAULT '0' COMMENT '明细项之间逻辑关系 0 与 1或 2 非',
  `LOGICSORT` int(3) NOT NULL DEFAULT '0' COMMENT '明细项排序',
  `LOGICIF` int(3) NOT NULL DEFAULT '0' COMMENT '明细项逻辑判断 0 大于 1 小于 -1 不显示',
  `LOGICVALUE` varchar(32) NOT NULL DEFAULT '' COMMENT '明细项逻辑值',
  `LOGICUNIT` int(3) NOT NULL DEFAULT '0' COMMENT '明细项逻辑值单位 0 秒 1 字/分钟 2分钟 3 % -1 不显示',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`ITEM_ID`),
  KEY `IX_SRCH_ONE` (`ROW_ID`,`CHANNEL_ID`) USING BTREE COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='质检项明细表';

-- ----------------------------
-- Records of quality_item
-- ----------------------------
INSERT INTO `quality_item` VALUES ('56531687938491392', '56413738566190080', 'N', '0', '0', '0', '12312432qwe2323', '0', '49252889384718336', null, 'SYS', '2018-09-16 23:46:59', 'SYS', '2018-09-23 23:06:54', '2');
INSERT INTO `quality_item` VALUES ('56531712648184832', '56413738566190080', 'Y', '0', '1', '0', '$蓝莓酵素&$眼睛', '0', '49252889384718336', null, 'SYS', '2018-09-16 23:47:22', 'SYS', '2018-09-16 23:47:22', '0');
INSERT INTO `quality_item` VALUES ('56621399106683904', '56413738566190080', 'Y', '0', '2', '0', '22fe3edewerwe', '0', '49252889384718336', null, 'SYS', '2018-09-17 23:32:54', 'SYS', '2018-09-17 23:33:03', '1');
INSERT INTO `quality_item` VALUES ('57250392618075136', '56413852486632448', 'N', '0', '0', '0', '1', '0', '49252889384718336', '单次静音时长', 'SYS', '2018-09-24 22:10:29', 'SYS', '2018-09-24 22:11:43', '1');
INSERT INTO `quality_item` VALUES ('57250392626463744', '56413852486632448', 'N', '0', '1', '0', '2', '0', '49252889384718336', '累积静音时长', 'SYS', '2018-09-24 22:10:29', 'SYS', '2018-09-24 22:11:43', '1');
INSERT INTO `quality_item` VALUES ('57254716356199424', '56413612248433664', 'Y', '0', '0', '0', '10', '0', '49252889384718336', '单次静音时长', 'SYS', '2018-09-24 23:19:12', 'SYS', '2018-09-24 23:20:59', '2');
INSERT INTO `quality_item` VALUES ('57254716357248000', '56413612248433664', 'Y', '0', '0', '0', '20', '0', '49252889384718336', '累积静音时长', 'SYS', '2018-09-24 23:19:12', 'SYS', '2018-09-24 23:21:00', '2');
INSERT INTO `quality_item` VALUES ('57309424674440192', '57255092034765824', 'Y', '0', '0', '1', '10', '0', '49252889384718336', '业务词比例', 'SYS', '2018-09-25 13:48:46', 'SYS', '2018-09-25 13:48:56', '1');
INSERT INTO `quality_item` VALUES ('57311860200866816', '57255088021865472', 'N', '0', '0', '0', '10', '3', '49252889384718336', '语速变化', 'SYS', '2018-09-25 14:27:29', 'SYS', '2018-09-25 14:27:29', '0');
INSERT INTO `quality_item` VALUES ('57311860201915392', '57255088021865472', 'N', '2', '0', '0', '20', '3', '49252889384718336', '音量变化', 'SYS', '2018-09-25 14:27:29', 'SYS', '2018-09-25 14:31:41', '1');
INSERT INTO `quality_item` VALUES ('57311860202963968', '57255088021865472', 'N', '0', '0', '-1', '30', '-1', '49252889384718336', '禁忌话术', 'SYS', '2018-09-25 14:27:29', 'SYS', '2018-09-25 14:27:29', '0');

-- ----------------------------
-- Table structure for quality_row
-- ----------------------------
DROP TABLE IF EXISTS `quality_row`;
CREATE TABLE `quality_row` (
  `ROW_ID` bigint(20) NOT NULL COMMENT '质检项ID',
  `GROUP_ID` bigint(20) NOT NULL COMMENT '质检组ID',
  `ACTIVATED` char(1) NOT NULL COMMENT '启用状态',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `ROW_NAME` varchar(32) DEFAULT NULL COMMENT '质检项名称',
  `ROW_TYPE` varchar(10) NOT NULL COMMENT '质检项类型',
  `WEIGHT` int(2) NOT NULL DEFAULT '0' COMMENT '权重',
  `POINT` int(8) NOT NULL DEFAULT '0' COMMENT '评分',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`ROW_ID`),
  KEY `IX_SRCH_ONE` (`GROUP_ID`,`CHANNEL_ID`) USING BTREE COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='质检项表';

-- ----------------------------
-- Records of quality_row
-- ----------------------------
INSERT INTO `quality_row` VALUES ('56413612248433664', '56129517488473088', 'Y', '49252889384718336', '情绪异常', 'MUTE', '0', '0', '情绪异常', 'SYS', '2018-09-15 16:30:13', 'SYS', '2018-09-21 16:24:53', '3');
INSERT INTO `quality_row` VALUES ('56413738566190080', '56132269597819904', 'Y', '49252889384718336', '禁忌语', 'ST', '0', '0', '禁忌语', 'SYS', '2018-09-15 16:32:14', 'SYS', '2018-09-21 16:40:50', '2');
INSERT INTO `quality_row` VALUES ('56413852486632448', '56129517488473088', 'Y', '49252889384718336', '超时', 'MUTE', '0', '0', '超时', 'SYS', '2018-09-15 16:34:02', 'SYS', '2018-09-24 22:04:12', '6');
INSERT INTO `quality_row` VALUES ('57255088021865472', '56131912300790784', 'Y', '49252889384718336', '测试', 'MOOD', '0', '0', '萨达萨达是', 'SYS', '2018-09-24 23:25:07', 'SYS', '2018-09-25 14:02:18', '2');
INSERT INTO `quality_row` VALUES ('57255092034765824', '56131912300790784', 'Y', '49252889384718336', '闲聊', 'CHAT', '0', '0', '萨达萨达是', 'SYS', '2018-09-24 23:25:11', 'SYS', '2018-09-25 11:48:11', '1');

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
INSERT INTO `rule` VALUES ('55332151571284992', '49252889384718336', 'ALL', 'ALL', '55329858256929792', '0', '$心脏病', null, 'SYS', '2018-09-03 18:00:52', 'SYS', '2018-09-06 19:16:59', '1', '33000');
INSERT INTO `rule` VALUES ('55332165889590272', '49252889384718336', 'ALL', 'ALL', '55329858256929792', '0', '$心脏&$斑块', null, 'SYS', '2018-09-03 18:01:05', 'SYS', '2018-09-06 19:17:00', '3', '33000');
INSERT INTO `rule` VALUES ('55332180979647488', '49252889384718336', 'ALL', 'ALL', '55329858256929792', '0', '$心脏&$早搏', null, 'SYS', '2018-09-03 18:01:20', 'SYS', '2018-09-06 19:17:01', '3', '33000');
INSERT INTO `rule` VALUES ('55332279730340864', '49252889384718336', 'ALL', 'ALL', '55329858256929792', '0', '$心脏&$不好', null, 'SYS', '2018-09-03 18:02:54', 'SYS', '2018-09-06 19:17:01', '2', '33000');
INSERT INTO `rule` VALUES ('55333176330978304', '49252889384718336', 'AUD', 'CSC', '55333157147280384', '0', '$阿姨', null, 'SYS', '2018-09-03 18:17:09', 'SYS', '2018-09-06 19:17:23', '2', '33000');
INSERT INTO `rule` VALUES ('55333207416013824', '49252889384718336', 'AUD', 'CSC', '55333164411814912', '0', '$叔叔', null, 'SYS', '2018-09-03 18:17:39', 'SYS', '2018-09-06 19:17:29', '2', '33000');
INSERT INTO `rule` VALUES ('55333402034865152', '49252889384718336', 'ALL', 'CUST', '55330121237693440', '0', '$高血压!$没有', null, 'SYS', '2018-09-03 18:20:44', 'SYS', '2018-09-06 19:17:15', '5', '33000');
INSERT INTO `rule` VALUES ('55333414515016704', '49252889384718336', 'ALL', 'ALL', '55330121237693440', '0', '$血压&$高', null, 'SYS', '2018-09-03 18:20:56', 'SYS', '2018-09-06 19:17:16', '2', '33000');
INSERT INTO `rule` VALUES ('55333427257312256', '49252889384718336', 'ALL', 'ALL', '55330121237693440', '0', '$血脂&$高', null, 'SYS', '2018-09-03 18:21:08', 'SYS', '2018-09-06 19:17:17', '2', '33000');
INSERT INTO `rule` VALUES ('55333433331713024', '49252889384718336', 'ALL', 'ALL', '55330121237693440', '0', '$三高', null, 'SYS', '2018-09-03 18:21:14', 'SYS', '2018-09-06 19:17:17', '1', '33000');
INSERT INTO `rule` VALUES ('55333465909920768', '49252889384718336', 'ALL', 'ALL', '55333447264142336', '0', '$睡眠&$不好', null, 'SYS', '2018-09-03 18:21:45', 'SYS', '2018-09-11 18:44:10', '2', '33000');
INSERT INTO `rule` VALUES ('55333544408417280', '49252889384718336', 'ALL', 'ALL', '55333447264142336', '0', '$改善&$睡眠', null, 'SYS', '2018-09-03 18:23:00', 'SYS', '2018-09-11 18:44:21', '2', '33000');
INSERT INTO `rule` VALUES ('55333550718747648', '49252889384718336', 'ALL', 'ALL', '55333447264142336', '0', '$失眠', null, 'SYS', '2018-09-03 18:23:06', 'SYS', '2018-09-11 18:44:29', '1', '33000');
INSERT INTO `rule` VALUES ('55393856214041600', '49252889384718336', 'ALL', 'ALL', '55393805202916352', '0', '$中草药&$软黄金', null, 'SYS', '2018-09-04 10:21:38', 'SYS', '2018-09-06 19:14:26', '2', '33000');
INSERT INTO `rule` VALUES ('55394051337257984', '49252889384718336', 'ALL', 'ALL', '55393805202916352', '0', '$冬虫夏草|$小蓝帽', null, 'SYS', '2018-09-04 10:24:44', 'SYS', '2018-09-06 19:14:25', '2', '33000');
INSERT INTO `rule` VALUES ('55394188449055744', '49252889384718336', 'ALL', 'ALL', '55393805202916352', '0', '$虫草&$胶囊', null, 'SYS', '2018-09-04 10:26:55', 'SYS', '2018-09-06 19:14:24', '2', '33000');
INSERT INTO `rule` VALUES ('55394272046777344', '49252889384718336', 'ALL', 'ALL', '55393805202916352', '0', '$威士雅&$胶囊', null, 'SYS', '2018-09-04 10:28:15', 'SYS', '2018-09-06 19:14:24', '2', '33000');
INSERT INTO `rule` VALUES ('55394479304115200', '49252889384718336', 'ALL', 'ALL', '55394312351941632', '0', '$蓝莓&$果蔬', null, 'SYS', '2018-09-04 10:31:32', 'SYS', '2018-09-06 19:14:54', '2', '33000');
INSERT INTO `rule` VALUES ('55394659936011264', '49252889384718336', 'ALL', 'ALL', '55394312351941632', '0', '$四十九种水果蔬菜&$提取物', null, 'SYS', '2018-09-04 10:34:24', 'SYS', '2018-09-06 19:14:53', '2', '33000');
INSERT INTO `rule` VALUES ('55394743157294080', '49252889384718336', 'ALL', 'ALL', '55394312351941632', '0', '$酶&$果胶', null, 'SYS', '2018-09-04 10:35:44', 'SYS', '2018-09-06 19:14:52', '2', '33000');
INSERT INTO `rule` VALUES ('55394856487388160', '49252889384718336', 'ALL', 'ALL', '55394312351941632', '0', '$蓝莓&$护眼', null, 'SYS', '2018-09-04 10:37:32', 'SYS', '2018-09-06 19:14:51', '2', '33000');
INSERT INTO `rule` VALUES ('55395026882036736', '49252889384718336', 'ALL', 'ALL', '55394312351941632', '0', '$发酵&$酵素', null, 'SYS', '2018-09-04 10:40:14', 'SYS', '2018-09-06 19:14:51', '2', '33000');
INSERT INTO `rule` VALUES ('55395470010254336', '49252889384718336', 'ALL', 'ALL', '55395095795500032', '0', '$广西瑶族&$长寿乡', null, 'SYS', '2018-09-04 10:47:17', 'SYS', '2018-09-06 19:15:47', '3', '33000');
INSERT INTO `rule` VALUES ('55395533361021952', '49252889384718336', 'ALL', 'ALL', '55395095795500032', '0', '$泡脚&$养生配方', null, 'SYS', '2018-09-04 10:48:17', 'SYS', '2018-09-06 19:15:51', '2', '33000');
INSERT INTO `rule` VALUES ('55395919904932864', '49252889384718336', 'ALL', 'ALL', '55395095795500032', '0', '$艾叶夜交藤|$伸筋草|桂枝', null, 'SYS', '2018-09-04 10:54:26', 'SYS', '2018-09-06 19:15:55', '3', '33000');
INSERT INTO `rule` VALUES ('55396597866988544', '49252889384718336', 'ALL', 'ALL', '55395095795500032', '0', '$巴马&$中药泡脚汤', null, 'SYS', '2018-09-04 11:05:13', 'SYS', '2018-09-06 19:16:00', '2', '33000');
INSERT INTO `rule` VALUES ('55396959656117248', '49252889384718336', 'ALL', 'ALL', '55396727090349056', '0', '防滑&耐磨', null, 'SYS', '2018-09-04 11:10:58', 'SYS', '2018-09-06 18:11:05', '1', '33000');
INSERT INTO `rule` VALUES ('55396999522976768', '49252889384718336', 'ALL', 'ALL', '55396727090349056', '0', '透气&轻便', null, 'SYS', '2018-09-04 11:11:36', 'SYS', '2018-09-06 18:11:05', '1', '33000');
INSERT INTO `rule` VALUES ('55397170522653696', '49252889384718336', 'ALL', 'ALL', '55396727090349056', '0', '中老年&脚型', null, 'SYS', '2018-09-04 11:14:19', 'SYS', '2018-09-06 18:11:04', '2', '33000');
INSERT INTO `rule` VALUES ('55397254866961408', '49252889384718336', 'ALL', 'ALL', '55396727090349056', '0', '健步鞋&老年', null, 'SYS', '2018-09-04 11:15:39', 'SYS', '2018-09-06 18:11:04', '2', '33000');
INSERT INTO `rule` VALUES ('55397657105957888', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$多功能&$养生', null, 'SYS', '2018-09-04 11:22:03', 'SYS', '2018-09-06 19:16:30', '2', '33000');
INSERT INTO `rule` VALUES ('55397841125803008', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$手表&$金黄色的表盘', null, 'SYS', '2018-09-04 11:24:58', 'SYS', '2018-09-06 19:16:29', '4', '33000');
INSERT INTO `rule` VALUES ('55398099512755200', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$手表&$高原火山磁石', null, 'SYS', '2018-09-04 11:29:05', 'SYS', '2018-09-06 19:16:28', '2', '33000');
INSERT INTO `rule` VALUES ('55398160323871744', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$生命能量&$手表', null, 'SYS', '2018-09-04 11:30:03', 'SYS', '2018-09-06 19:16:27', '3', '33000');
INSERT INTO `rule` VALUES ('55398471643988992', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$手表&$皮质的表带', null, 'SYS', '2018-09-04 11:35:00', 'SYS', '2018-09-06 19:16:26', '2', '33000');
INSERT INTO `rule` VALUES ('55398753685767168', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$手表&$收藏价格', null, 'SYS', '2018-09-04 11:39:29', 'SYS', '2018-09-06 19:16:26', '2', '33000');
INSERT INTO `rule` VALUES ('55398903798858752', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$手表&$优质的机芯', null, 'SYS', '2018-09-04 11:41:52', 'SYS', '2018-09-06 19:16:25', '2', '33000');
INSERT INTO `rule` VALUES ('55399163335050240', '49252889384718336', 'ALL', 'ALL', '55396727090349056', '0', '鞋子&锻炼身体', null, 'SYS', '2018-09-04 11:45:59', 'SYS', '2018-09-06 18:11:03', '1', '33000');
INSERT INTO `rule` VALUES ('55399961685165056', '49252889384718336', 'ALL', 'ALL', '55399673565840384', '0', '$欧米伽三&$鱼油软胶囊', null, 'SYS', '2018-09-04 11:58:41', 'SYS', '2018-09-06 19:16:40', '2', '33000');
INSERT INTO `rule` VALUES ('55421412098212864', '49252889384718336', 'ALL', 'ALL', '55421102898316288', '0', '$亚麻籽油&$加拿大进口', null, 'SYS', '2018-09-04 17:39:37', 'SYS', '2018-09-06 19:16:46', '2', '33000');
INSERT INTO `rule` VALUES ('55508802993161216', '49252889384718336', 'ALL', 'CSC', '55508597538325504', '0', '$断货&$辣木', null, 'SYS', '2018-09-05 16:48:40', 'SYS', '2018-09-07 15:51:04', '4', '33000');
INSERT INTO `rule` VALUES ('55509904683729920', '49252889384718336', 'AUD', 'CSC', '55509842070111232', '0', '$手表&$收藏价格&$高', null, 'SYS', '2018-09-05 17:06:10', 'SYS', '2018-09-06 19:13:49', '2', '33000');
INSERT INTO `rule` VALUES ('55514188985959424', '49252889384718336', 'AUD', 'CSC', '55513990009226240', '0', '$蓝莓酵素&$眼睛', null, 'SYS', '2018-09-05 18:14:16', 'SYS', '2018-09-06 19:14:02', '3', '33000');
INSERT INTO `rule` VALUES ('55514555412939776', '49252889384718336', 'ALL', 'CSC', '55513990009226240', '0', '$蓝莓酵素&$视力', null, 'SYS', '2018-09-05 18:20:06', 'SYS', '2018-09-06 19:14:01', '3', '33000');
INSERT INTO `rule` VALUES ('55576448583369728', '49252889384718336', 'AUD', 'CSC', '55575560364000256', '0', '$享佳&$老会员', null, 'SYS', '2018-09-06 10:43:52', 'SYS', '2018-09-06 19:17:37', '2', '33000');
INSERT INTO `rule` VALUES ('55588615110034432', '49252889384718336', 'ALL', 'CSC', '55575560364000256', '0', '$回馈&$老会员', null, 'SYS', '2018-09-06 13:57:15', 'SYS', '2018-09-06 19:17:41', '2', '33000');
INSERT INTO `rule` VALUES ('55667494302548992', '49252889384718336', 'AUD', 'CSC', '55666960059368448', '0', '$活动&$给您', null, 'SYS', '2018-09-07 10:51:00', 'SYS', '2018-09-07 11:48:09', '6', '33000');
INSERT INTO `rule` VALUES ('55668826209027072', '49252889384718336', 'ALL', 'CSC', '55666960059368448', '0', '$免费送&$给您体验', null, 'SYS', '2018-09-07 11:12:10', 'SYS', '2018-09-07 11:46:52', '1', '33000');
INSERT INTO `rule` VALUES ('55669216602260480', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$活动&$免费送', null, 'SYS', '2018-09-07 11:18:22', 'SYS', '2018-09-07 11:18:22', '0', '33000');
INSERT INTO `rule` VALUES ('55669573897192448', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$参加&$活动', null, 'SYS', '2018-09-07 11:24:03', 'SYS', '2018-09-07 11:24:03', '0', '33000');
INSERT INTO `rule` VALUES ('55670140081046528', '49252889384718336', 'ALL', 'CSC', '55666960059368448', '0', '$有这个&$活动', null, 'SYS', '2018-09-07 11:33:03', 'SYS', '2018-09-07 11:33:03', '0', '33000');
INSERT INTO `rule` VALUES ('55670407449052160', '49252889384718336', 'AUD', 'CSC', '55666960059368448', '0', '$有一个&$高温补贴', null, 'SYS', '2018-09-07 11:37:18', 'SYS', '2018-09-07 11:43:55', '2', '33000');
INSERT INTO `rule` VALUES ('55670699200644096', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$享受&$高温补贴', null, 'SYS', '2018-09-07 11:41:56', 'SYS', '2018-09-07 11:41:56', '0', '33000');
INSERT INTO `rule` VALUES ('55671398754976768', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$举办&$优惠', null, 'SYS', '2018-09-07 11:53:03', 'SYS', '2018-09-07 11:53:03', '0', '33000');
INSERT INTO `rule` VALUES ('55671503383987200', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$活动&$优惠', null, 'SYS', '2018-09-07 11:54:43', 'SYS', '2018-09-07 11:54:43', '0', '33000');
INSERT INTO `rule` VALUES ('55671693080822784', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$享受&$优惠', null, 'SYS', '2018-09-07 11:57:44', 'SYS', '2018-09-07 11:57:44', '0', '33000');
INSERT INTO `rule` VALUES ('55671921973429248', '49252889384718336', 'ALL', 'CSC', '55669345192281088', '0', '$羊奶粉&$羊奶', null, 'SYS', '2018-09-07 12:01:22', 'SYS', '2018-09-07 14:00:20', '1', '33000');
INSERT INTO `rule` VALUES ('55672119002956800', '49252889384718336', 'ALL', 'CSC', '55669345192281088', '0', '$羊奶&$奶中之王', null, 'SYS', '2018-09-07 12:04:30', 'SYS', '2018-09-07 12:04:30', '0', '33000');
INSERT INTO `rule` VALUES ('55672318249174016', '49252889384718336', 'ALL', 'ALL', '55666960059368448', '0', '$活动&$买&$送', null, 'SYS', '2018-09-07 12:07:40', 'SYS', '2018-09-07 12:07:40', '0', '33000');
INSERT INTO `rule` VALUES ('55672455314834432', '49252889384718336', 'ALL', 'CSC', '55669345192281088', '0', '$牛奶&$羊奶', null, 'SYS', '2018-09-07 12:09:51', 'SYS', '2018-09-07 12:09:51', '0', '33000');
INSERT INTO `rule` VALUES ('55678985217016832', '49252889384718336', 'ALL', 'CSC', '55669345192281088', '0', '$羊奶&$盒', null, 'SYS', '2018-09-07 13:53:38', 'SYS', '2018-09-07 13:53:38', '0', '33000');
INSERT INTO `rule` VALUES ('55679604707329024', '49252889384718336', 'ALL', 'CSC', '55666960059368448', '0', '$免费送', null, 'SYS', '2018-09-07 14:03:29', 'SYS', '2018-09-07 14:03:29', '0', '33000');
INSERT INTO `rule` VALUES ('55680134543344640', '49252889384718336', 'ALL', 'CSC', '55679777051280384', '0', '$北京阜外医院&$银杏叶', null, 'SYS', '2018-09-07 14:11:54', 'SYS', '2018-09-07 14:11:54', '0', '33000');
INSERT INTO `rule` VALUES ('55943723124556800', '49252889384718336', 'ALL', 'CSC', '55943214866138112', '0', '$享佳&$还记得', null, 'SYS', '2018-09-10 12:01:32', 'SYS', '2018-09-10 12:02:00', '1', '33000');
INSERT INTO `rule` VALUES ('55944493957940224', '49252889384718336', 'ALL', 'ALL', '55943214866138112', '0', '$享佳&$体验', null, 'SYS', '2018-09-10 12:13:47', 'SYS', '2018-09-10 12:13:47', '0', '33000');
INSERT INTO `rule` VALUES ('55944674898117632', '49252889384718336', 'ALL', 'CSC', '55943214866138112', '0', '$国家&$小蓝帽认证', null, 'SYS', '2018-09-10 12:16:40', 'SYS', '2018-09-10 12:18:01', '1', '33000');
INSERT INTO `rule` VALUES ('55944947557237760', '49252889384718336', 'ALL', 'CSC', '55666960059368448', '0', '$回馈&$享受', null, 'SYS', '2018-09-10 12:21:00', 'SYS', '2018-09-10 12:21:00', '0', '33000');
INSERT INTO `rule` VALUES ('55950531243312128', '49252889384718336', 'ALL', 'CSC', '55943214866138112', '0', '$获得&$专利', null, 'SYS', '2018-09-10 13:49:45', 'SYS', '2018-09-10 13:49:45', '0', '33000');
INSERT INTO `rule` VALUES ('55951508794016768', '49252889384718336', 'ALL', 'CSC', '55943214866138112', '0', '$体验&$宣传', null, 'SYS', '2018-09-10 14:05:17', 'SYS', '2018-09-10 14:05:17', '0', '33000');
INSERT INTO `rule` VALUES ('55951760821355520', '49252889384718336', 'ALL', 'CSC', '55943214866138112', '0', '$做个&$宣传', null, 'SYS', '2018-09-10 14:09:17', 'SYS', '2018-09-10 14:10:28', '1', '33000');
INSERT INTO `rule` VALUES ('55952091285324800', '49252889384718336', 'ALL', 'CSC', '55393805202916352', '0', '$青海玉树&$野生菌种', null, 'SYS', '2018-09-10 14:14:32', 'SYS', '2018-09-10 14:14:32', '0', '33000');
INSERT INTO `rule` VALUES ('55952223992054784', '49252889384718336', 'ALL', 'ALL', '55397596142797824', '0', '$手腕&$内关穴', null, 'SYS', '2018-09-10 14:16:39', 'SYS', '2018-09-10 14:16:39', '0', '33000');
INSERT INTO `rule` VALUES ('55953253305713664', '49252889384718336', 'ALL', 'CSC', '55943214866138112', '0', '$简单介绍', null, 'SYS', '2018-09-10 14:33:01', 'SYS', '2018-09-10 14:33:01', '0', '33000');
INSERT INTO `rule` VALUES ('55956262905480192', '49252889384718336', 'ALL', 'CSC', '55954420370801664', '0', '$少带', null, 'SYS', '2018-09-10 15:20:51', 'SYS', '2018-09-10 15:20:51', '0', '33000');
INSERT INTO `rule` VALUES ('55956860091532288', '49252889384718336', 'ALL', 'CSC', '55954420370801664', '0', '$可以买点', null, 'SYS', '2018-09-10 15:30:20', 'SYS', '2018-09-10 15:30:20', '0', '33000');
INSERT INTO `rule` VALUES ('55957282623620096', '49252889384718336', 'ALL', 'CSC', '55955007960286208', '0', '$那这样&$不打扰', null, 'SYS', '2018-09-10 15:37:03', 'SYS', '2018-09-10 15:37:03', '0', '33000');
INSERT INTO `rule` VALUES ('55957455289484288', '49252889384718336', 'ALL', 'CSC', '55955007960286208', '0', '$不想要&$不打扰', null, 'SYS', '2018-09-10 15:39:48', 'SYS', '2018-09-10 15:39:48', '0', '33000');
INSERT INTO `rule` VALUES ('55957550304101376', '49252889384718336', 'ALL', 'ALL', '55955007960286208', '0', '$不参加&$不打扰', null, 'SYS', '2018-09-10 15:41:19', 'SYS', '2018-09-10 15:41:19', '0', '33000');
INSERT INTO `rule` VALUES ('56031900240741376', '49252889384718336', 'ALL', 'CSC', '55955007960286208', '0', '$不强求', null, 'SYS', '2018-09-11 11:23:04', 'SYS', '2018-09-11 11:23:04', '0', '33000');
INSERT INTO `rule` VALUES ('56032993439941632', '49252889384718336', 'ALL', 'ALL', '55954950551798784', '0', '$您是&$来电话', null, 'SYS', '2018-09-11 11:40:27', 'SYS', '2018-09-11 11:40:27', '0', '33000');
INSERT INTO `rule` VALUES ('56033181662479360', '49252889384718336', 'ALL', 'CSC', '55954950551798784', '0', '$来电话&$领取', null, 'SYS', '2018-09-11 11:43:26', 'SYS', '2018-09-11 11:43:26', '0', '33000');
INSERT INTO `rule` VALUES ('56037813023441920', '49252889384718336', 'ALL', 'CSC', '55955423329551360', '0', '$赶紧&$这边', null, 'SYS', '2018-09-11 12:57:03', 'SYS', '2018-09-11 13:02:44', '2', '33000');
INSERT INTO `rule` VALUES ('56138103186818048', '49252889384718336', 'ALL', 'CSC', '56138003206145024', '0', ' $新安特!$健步鞋!$手表', null, 'SYS', '2018-09-12 15:31:07', 'SYS', '2018-09-17 14:24:48', '2', '33000');
INSERT INTO `rule` VALUES ('56583058570118144', '49252889384718336', 'ALL', 'CSC', '56577149450093568', '0', '$辣木&$树', null, 'SYS', '2018-09-17 13:23:30', 'SYS', '2018-09-17 13:23:30', '0', '33000');
INSERT INTO `rule` VALUES ('56583199772410880', '49252889384718336', 'ALL', 'ALL', '56577149450093568', '0', '$辣木&药品专利', null, 'SYS', '2018-09-17 13:25:44', 'SYS', '2018-09-17 13:25:44', '0', '33000');
INSERT INTO `rule` VALUES ('56583319620453376', '49252889384718336', 'ALL', 'ALL', '56577149450093568', '0', '$辣木&$国家主席 ', null, 'SYS', '2018-09-17 13:27:39', 'SYS', '2018-09-17 13:29:00', '1', '33000');
INSERT INTO `rule` VALUES ('56583689321088000', '49252889384718336', 'ALL', 'ALL', '56577149450093568', '0', '$辣木&$印度进口', null, 'SYS', '2018-09-17 13:33:31', 'SYS', '2018-09-17 13:33:31', '0', '33000');
INSERT INTO `rule` VALUES ('56584426703848448', '49252889384718336', 'ALL', 'CSC', '56577149450093568', '0', '$辣木&$浓缩', null, 'SYS', '2018-09-17 13:45:14', 'SYS', '2018-09-17 13:45:14', '0', '33000');
INSERT INTO `rule` VALUES ('56584940000674816', '49252889384718336', 'ALL', 'CSC', '56577149450093568', '0', '$辣木&$医药百宝箱', null, 'SYS', '2018-09-17 13:53:24', 'SYS', '2018-09-17 13:53:24', '0', '33000');
INSERT INTO `rule` VALUES ('56586099371312128', '49252889384718336', 'ALL', 'CSC', '56586052758963200', '0', '$沃尔曼', null, 'SYS', '2018-09-17 14:11:50', 'SYS', '2018-09-17 14:11:50', '0', '33000');
INSERT INTO `rule` VALUES ('56586174952670208', '49252889384718336', 'ALL', 'CSC', '56586012290221056', '0', '$贝塔丽', null, 'SYS', '2018-09-17 14:13:02', 'SYS', '2018-09-17 14:13:02', '0', '33000');
INSERT INTO `rule` VALUES ('56587547172701184', '49252889384718336', 'ALL', 'ALL', '55954420370801664', '0', '$经济困难', null, 'SYS', '2018-09-17 14:34:50', 'SYS', '2018-09-17 14:34:50', '0', '33000');
INSERT INTO `rule` VALUES ('56587653201560576', '49252889384718336', 'ALL', 'CSC', '55954420370801664', '0', '$少花点', null, 'SYS', '2018-09-17 14:36:31', 'SYS', '2018-09-17 14:36:31', '0', '33000');
INSERT INTO `rule` VALUES ('56588729528124416', '49252889384718336', 'ALL', 'CSC', '55954487812064256', '0', '$家里有这个条件', null, 'SYS', '2018-09-17 14:53:38', 'SYS', '2018-09-17 14:53:38', '0', '33000');
INSERT INTO `rule` VALUES ('56588819146769408', '49252889384718336', 'ALL', 'CSC', '55954487812064256', '0', '$经济条件好', null, 'SYS', '2018-09-17 14:55:03', 'SYS', '2018-09-17 14:55:03', '0', '33000');
INSERT INTO `rule` VALUES ('56588862127899648', '49252889384718336', 'ALL', 'ALL', '55954487812064256', '0', '$经济条件可以', null, 'SYS', '2018-09-17 14:55:44', 'SYS', '2018-09-17 14:55:44', '0', '33000');
INSERT INTO `rule` VALUES ('56589785247024128', '49252889384718336', 'ALL', 'ALL', '56589676387009536', '0', '$蓝盾&$订购', null, 'SYS', '2018-09-17 15:10:25', 'SYS', '2018-09-17 15:10:25', '0', '33000');
INSERT INTO `rule` VALUES ('56589861039145984', '49252889384718336', 'ALL', 'CSC', '56589676387009536', '0', '$净水器&$过滤', null, 'SYS', '2018-09-17 15:11:37', 'SYS', '2018-09-17 15:11:37', '0', '33000');
INSERT INTO `rule` VALUES ('56589991687521280', '49252889384718336', 'ALL', 'CSC', '56589676387009536', '0', '$净水器&$滤芯', null, 'SYS', '2018-09-17 15:13:42', 'SYS', '2018-09-17 15:13:42', '0', '33000');
INSERT INTO `rule` VALUES ('56590021986124800', '49252889384718336', 'ALL', 'CSC', '55954420370801664', '0', '$价格贵', null, 'SYS', '2018-09-17 15:14:11', 'SYS', '2018-09-17 15:14:11', '0', '33000');
INSERT INTO `rule` VALUES ('56590120917173248', '49252889384718336', 'ALL', 'ALL', '56589676387009536', '0', '$滤芯', null, 'SYS', '2018-09-17 15:15:45', 'SYS', '2018-09-17 15:15:45', '0', '33000');
INSERT INTO `rule` VALUES ('56590643016795136', '49252889384718336', 'ALL', 'ALL', '55679777051280384', '0', '$医生&$银杏叶', null, 'SYS', '2018-09-17 15:24:03', 'SYS', '2018-09-17 15:24:03', '0', '33000');
INSERT INTO `rule` VALUES ('56590925204325376', '49252889384718336', 'ALL', 'CSC', '55679777051280384', '0', '$孙老&$口服液', null, 'SYS', '2018-09-17 15:28:32', 'SYS', '2018-09-17 15:28:32', '0', '33000');
INSERT INTO `rule` VALUES ('56591009238254592', '49252889384718336', 'ALL', 'CSC', '55679777051280384', '0', '$银杏叶酸&$口服液', null, 'SYS', '2018-09-17 15:29:52', 'SYS', '2018-09-17 15:29:52', '0', '33000');
INSERT INTO `rule` VALUES ('56591527114212352', '49252889384718336', 'ALL', 'CSC', '55679777051280384', '0', '$银杏&$第四代', null, 'SYS', '2018-09-17 15:38:06', 'SYS', '2018-09-17 15:39:03', '1', '33000');
INSERT INTO `rule` VALUES ('56591903962989568', '49252889384718336', 'ALL', 'CSC', '55679777051280384', '0', '$喝&$银杏', null, 'SYS', '2018-09-17 15:44:05', 'SYS', '2018-09-17 15:44:05', '0', '33000');
INSERT INTO `rule` VALUES ('56592233412985856', '49252889384718336', 'ALL', 'CSC', '55679777051280384', '0', '$银杏&$有毒', null, 'SYS', '2018-09-17 15:49:20', 'SYS', '2018-09-17 15:49:20', '0', '33000');
INSERT INTO `rule` VALUES ('56592819742082048', '49252889384718336', 'ALL', 'CSC', '55955621240931328', '0', '$爆款&$畅销', null, 'SYS', '2018-09-17 15:58:39', 'SYS', '2018-09-17 15:58:39', '0', '33000');
INSERT INTO `rule` VALUES ('56593079604380672', '49252889384718336', 'ALL', 'CSC', '55954950551798784', '0', '$哪方面&$产品感兴趣', null, 'SYS', '2018-09-17 16:02:47', 'SYS', '2018-09-17 16:02:47', '0', '33000');
INSERT INTO `rule` VALUES ('56593193540551680', '49252889384718336', 'ALL', 'CSC', '55954950551798784', '0', '$刚才打电话来', null, 'SYS', '2018-09-17 16:04:35', 'SYS', '2018-09-17 16:04:35', '0', '33000');

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
INSERT INTO `seat` VALUES ('49238845276819456', '49252889384718336', '192.168.26.139', '172.17.23.15', 'Y', null, 'SYS', '2018-06-28 11:51:53', 'SYS', '2018-06-28 11:51:53', '0', '33000');
INSERT INTO `seat` VALUES ('204647654448304128', '49252889384718336', '192.168.26.27', '172.17.23.16', 'Y', null, 'SYS', '2018-06-28 11:51:53', 'SYS', '2018-06-28 11:51:53', '0', '33000');

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
  UNIQUE KEY `UX_CHANNEL_TAG` (`CHANNEL_ID`,`TAG_NO`) USING BTREE COMMENT '唯一性',
  KEY `IX_SRCH_ONE` (`TAG_ID`,`CHANNEL_ID`) USING BTREE COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('55329425042998272', 'Y', '49252889384718336', '58', '疾病', '198818966817345536', 'Y', null, 'SYS', '2018-09-03 17:17:32', 'SYS', '2018-09-03 17:17:32', '0');
INSERT INTO `tag` VALUES ('55329858256929792', 'Y', '49252889384718336', '59', '心脏不好', '55329425042998272', 'Y', null, 'SYS', '2018-09-03 17:24:25', 'SYS', '2018-09-03 18:19:01', '3');
INSERT INTO `tag` VALUES ('55330121237693440', 'Y', '49252889384718336', '60', '三高', '55329425042998272', 'Y', null, 'SYS', '2018-09-03 17:28:36', 'SYS', '2018-09-03 18:20:32', '1');
INSERT INTO `tag` VALUES ('55333145764987904', 'Y', '49252889384718336', '61', '性别', '198818966817345536', 'Y', null, 'SYS', '2018-09-03 18:16:40', 'SYS', '2018-09-03 18:16:40', '0');
INSERT INTO `tag` VALUES ('55333157147280384', 'Y', '49252889384718336', '62', '女', '55333145764987904', 'Y', null, 'SYS', '2018-09-03 18:16:51', 'SYS', '2018-09-03 18:16:51', '0');
INSERT INTO `tag` VALUES ('55333164411814912', 'Y', '49252889384718336', '63', '男', '55333145764987904', 'Y', null, 'SYS', '2018-09-03 18:16:58', 'SYS', '2018-09-03 18:16:58', '0');
INSERT INTO `tag` VALUES ('55333447264142336', 'Y', '49252889384718336', '64', '失眠', '55329425042998272', 'Y', null, 'SYS', '2018-09-03 18:21:27', 'SYS', '2018-09-03 18:21:27', '0');
INSERT INTO `tag` VALUES ('55335396022715392', 'Y', '49252889384718336', '65', '消费层次', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 18:52:26', 'SYS', '2018-09-10 14:46:46', '9');
INSERT INTO `tag` VALUES ('55336518931219456', 'Y', '49252889384718336', '66', '产品吸引力', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 19:10:17', 'SYS', '2018-09-10 14:58:26', '8');
INSERT INTO `tag` VALUES ('55337011632964608', 'N', '49252889384718336', '67', '无', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 19:18:07', 'SYS', '2018-09-10 15:13:15', '9');
INSERT INTO `tag` VALUES ('55337454352237568', 'Y', '49252889384718336', '68', '客服服务水平', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 19:25:09', 'SYS', '2018-09-10 15:12:41', '5');
INSERT INTO `tag` VALUES ('55393805202916352', 'Y', '49252889384718336', '69', '威士雅虫草菌丝体胶囊', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 10:20:49', 'SYS', '2018-09-12 15:48:27', '1');
INSERT INTO `tag` VALUES ('55394312351941632', 'Y', '49252889384718336', '70', '蓝莓酵素', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 10:28:53', 'SYS', '2018-09-06 12:02:34', '2');
INSERT INTO `tag` VALUES ('55395095795500032', 'Y', '49252889384718336', '71', '御正堂巴马汤', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 10:41:20', 'SYS', '2018-09-10 16:02:15', '1');
INSERT INTO `tag` VALUES ('55396727090349056', 'Y', '49252889384718336', '72', '老年健步鞋', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 11:07:16', 'SYS', '2018-09-17 14:13:36', '5');
INSERT INTO `tag` VALUES ('55397596142797824', 'Y', '49252889384718336', '73', '万管家手表', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 11:21:05', 'SYS', '2018-09-10 16:06:40', '2');
INSERT INTO `tag` VALUES ('55399673565840384', 'Y', '49252889384718336', '74', '鱼油软胶囊', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 11:54:06', 'SYS', '2018-09-12 15:28:57', '2');
INSERT INTO `tag` VALUES ('55421102898316288', 'Y', '49252889384718336', '75', '加拿大压榨亚麻籽油', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 17:34:42', 'SYS', '2018-09-12 15:45:15', '1');
INSERT INTO `tag` VALUES ('55504823298065408', 'Y', '49252889384718336', '76', '产品市场优势', '198818809124098048', 'Y', null, 'SYS', '2018-09-05 15:45:24', 'SYS', '2018-09-22 13:48:52', '11');
INSERT INTO `tag` VALUES ('55508597538325504', 'Y', '49252889384718336', '77', '辣木供不应求', '55504823298065408', 'Y', null, 'SYS', '2018-09-05 16:45:24', 'SYS', '2018-09-07 15:50:29', '2');
INSERT INTO `tag` VALUES ('55509842070111232', 'Y', '49252889384718336', '78', '养生手表收藏价值高', '55504823298065408', 'Y', null, 'SYS', '2018-09-05 17:05:11', 'SYS', '2018-09-05 17:05:11', '0');
INSERT INTO `tag` VALUES ('55513990009226240', 'Y', '49252889384718336', '79', '护眼蓝莓酵素', '55504823298065408', 'Y', null, 'SYS', '2018-09-05 18:11:06', 'SYS', '2018-09-05 18:11:06', '0');
INSERT INTO `tag` VALUES ('55575560364000256', 'Y', '49252889384718336', '80', '相对稳定客户', '198818966817345536', 'Y', null, 'SYS', '2018-09-06 10:29:45', 'SYS', '2018-09-06 10:29:45', '0');
INSERT INTO `tag` VALUES ('55666960059368448', 'Y', '49252889384718336', '81', '活动营销', '198818809124098048', 'Y', null, 'SYS', '2018-09-07 10:42:30', 'SYS', '2018-09-07 10:42:30', '0');
INSERT INTO `tag` VALUES ('55669345192281088', 'Y', '49252889384718336', '82', '羊奶粉', '198818923355967488', 'Y', null, 'SYS', '2018-09-07 11:20:25', 'SYS', '2018-09-07 11:20:25', '0');
INSERT INTO `tag` VALUES ('55679777051280384', 'Y', '49252889384718336', '83', '绿保康银杏叶口服液', '198818923355967488', 'Y', null, 'SYS', '2018-09-07 14:06:13', 'SYS', '2018-09-12 15:41:51', '1');
INSERT INTO `tag` VALUES ('55943214866138112', 'Y', '49252889384718336', '84', '口碑宣传', '198818809124098048', 'Y', null, 'SYS', '2018-09-10 11:53:27', 'SYS', '2018-09-10 11:55:02', '1');
INSERT INTO `tag` VALUES ('55954420370801664', 'Y', '49252889384718336', '85', '价格敏感', '55335396022715392', 'Y', null, 'SYS', '2018-09-10 14:51:34', 'SYS', '2018-09-10 15:29:28', '1');
INSERT INTO `tag` VALUES ('55954487812064256', 'Y', '49252889384718336', '86', '产品价格可接受', '55335396022715392', 'Y', null, 'SYS', '2018-09-10 14:52:38', 'SYS', '2018-09-10 14:52:38', '0');
INSERT INTO `tag` VALUES ('55954950551798784', 'Y', '49252889384718336', '87', '吸引客户', '55336518931219456', 'Y', null, 'SYS', '2018-09-10 14:59:59', 'SYS', '2018-09-10 14:59:59', '0');
INSERT INTO `tag` VALUES ('55955007960286208', 'Y', '49252889384718336', '88', '客户抵触或不感冒', '55336518931219456', 'Y', null, 'SYS', '2018-09-10 15:00:54', 'SYS', '2018-09-10 15:00:54', '0');
INSERT INTO `tag` VALUES ('55955308014502912', 'N', '49252889384718336', '89', '无', '55336518931219456', 'Y', null, 'SYS', '2018-09-10 15:05:40', 'SYS', '2018-09-10 15:11:13', '4');
INSERT INTO `tag` VALUES ('55955423329551360', 'Y', '49252889384718336', '90', '亲和服务', '55337454352237568', 'Y', null, 'SYS', '2018-09-10 15:07:30', 'SYS', '2018-09-11 13:00:35', '2');
INSERT INTO `tag` VALUES ('55955621240931328', 'Y', '49252889384718336', '91', '产品信用', '55954950551798784', 'Y', null, 'SYS', '2018-09-10 15:10:39', 'SYS', '2018-09-10 15:10:39', '0');
INSERT INTO `tag` VALUES ('56128254165156864', 'Y', '49252889384718336', '92', '测试测试', '198818809124098048', 'Y', null, 'SYS', '2018-09-12 12:54:35', 'SYS', '2018-09-12 12:54:35', '0');
INSERT INTO `tag` VALUES ('56138003206145024', 'Y', '49252889384718336', '93', '欣特安牌鱼油胶囊', '55399673565840384', 'Y', null, 'SYS', '2018-09-12 15:29:32', 'SYS', '2018-10-10 14:10:42', '4');
INSERT INTO `tag` VALUES ('56138075926987776', 'Y', '49252889384718336', '94', '熙健牌鱼油软胶囊', '55399673565840384', 'Y', null, 'SYS', '2018-09-12 15:30:41', 'SYS', '2018-09-12 15:30:41', '0');
INSERT INTO `tag` VALUES ('56577149450093568', 'Y', '49252889384718336', '95', '辣木叶片', '198818923355967488', 'Y', null, 'SYS', '2018-09-17 11:49:34', 'SYS', '2018-09-17 11:49:34', '0');
INSERT INTO `tag` VALUES ('56586012290221056', 'Y', '49252889384718336', '96', '贝塔丽健步鞋', '55396727090349056', 'Y', null, 'SYS', '2018-09-17 14:10:27', 'SYS', '2018-09-17 14:10:27', '0');
INSERT INTO `tag` VALUES ('56586052758963200', 'Y', '49252889384718336', '97', '沃尔曼休闲鞋', '55396727090349056', 'Y', null, 'SYS', '2018-09-17 14:11:05', 'SYS', '2018-09-17 14:11:05', '0');
INSERT INTO `tag` VALUES ('56589676387009536', 'Y', '49252889384718336', '98', '蓝盾净水器', '198818923355967488', 'Y', null, 'SYS', '2018-09-17 15:08:41', 'SYS', '2018-09-17 15:08:41', '0');
INSERT INTO `tag` VALUES ('58842384413262848', 'N', '49252889384718336', '99', '111', '198818809124098048', 'Y', null, 'SYS', '2018-10-12 11:54:31', 'SYS', '2018-10-12 11:55:31', '1');
INSERT INTO `tag` VALUES ('198818809124098048', 'Y', '49252889384718336', '1', '业务类', '0', 'N', null, 'SYS', '2018-06-28 15:53:00', 'SYS', '2018-10-12 11:50:12', '25');
INSERT INTO `tag` VALUES ('198818923355967488', 'Y', '49252889384718336', '2', '产品类', '0', 'N', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-08-28 16:01:21', '18');
INSERT INTO `tag` VALUES ('198818966817345536', 'Y', '49252889384718336', '3', '用户类', '0', 'N', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-09-03 17:17:22', '3');
INSERT INTO `tag` VALUES ('198819027139825664', 'Y', '49252889384718336', '4', '评价类', '0', 'N', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-09-03 18:52:59', '1');

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
  PRIMARY KEY (`COLLECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签汇总表';

-- ----------------------------
-- Records of tag_collect
-- ----------------------------

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
INSERT INTO `tag_control` VALUES ('49252889384718336', '100', null, 'SYS', '2018-06-28 15:58:10', 'SYS', '2018-10-12 11:54:31', '90');
