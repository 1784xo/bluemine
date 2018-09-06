/*
Navicat MySQL Data Transfer

Source Server         : 140.143.19.85
Source Server Version : 50723
Source Host           : 140.143.19.85:3306
Source Database       : bluemine

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-09-06 20:23:15
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
INSERT INTO `batch_job_seq` VALUES ('81', '0');

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
-- Table structure for call_batch_trigger
-- ----------------------------
DROP TABLE IF EXISTS `call_batch_trigger`;
CREATE TABLE `call_batch_trigger` (
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CALL_NO` varchar(64) NOT NULL COMMENT '会话单号',
  `CALL_DATE` int(8) NOT NULL COMMENT '会话日期',
  `SEAT_NO` varchar(64) NOT NULL COMMENT '坐席编号',
  `TRIGGER_DATE` bigint(20) NOT NULL COMMENT '触发时间',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `EXECUTIVE_NO` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数',
  `STATUS_CODE` varchar(255) NOT NULL COMMENT '作业执行代码 ',
  `DESC_TEXT` varchar(2500) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CHANNEL_ID`,`CALL_NO`,`CALL_DATE`,`SEAT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话汇总跑批触发表';

-- ----------------------------
-- Records of call_batch_trigger
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
INSERT INTO `rule` VALUES ('55333465909920768', '49252889384718336', 'ALL', 'ALL', '55333447264142336', '0', '睡眠&不好', null, 'SYS', '2018-09-03 18:21:45', 'SYS', '2018-09-06 18:13:00', '1', '33000');
INSERT INTO `rule` VALUES ('55333544408417280', '49252889384718336', 'ALL', 'ALL', '55333447264142336', '0', '改善&睡眠', null, 'SYS', '2018-09-03 18:23:00', 'SYS', '2018-09-06 18:12:59', '1', '33000');
INSERT INTO `rule` VALUES ('55333550718747648', '49252889384718336', 'ALL', 'ALL', '55333447264142336', '0', '失眠', null, 'SYS', '2018-09-03 18:23:06', 'SYS', '2018-09-03 18:23:06', '0', '33000');
INSERT INTO `rule` VALUES ('55336717361644544', '49252889384718336', 'ALL', 'ALL', '55336518931219456', '0', '$蓝莓&$酵素', null, 'SYS', '2018-09-03 19:13:26', 'SYS', '2018-09-06 19:17:53', '2', '33000');
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
INSERT INTO `rule` VALUES ('55399876865852416', '49252889384718336', 'ALL', 'ALL', '55399673565840384', '0', '$新安特&$欧米伽三', null, 'SYS', '2018-09-04 11:57:20', 'SYS', '2018-09-06 19:16:36', '3', '33000');
INSERT INTO `rule` VALUES ('55399961685165056', '49252889384718336', 'ALL', 'ALL', '55399673565840384', '0', '$欧米伽三&$鱼油软胶囊', null, 'SYS', '2018-09-04 11:58:41', 'SYS', '2018-09-06 19:16:40', '2', '33000');
INSERT INTO `rule` VALUES ('55421412098212864', '49252889384718336', 'ALL', 'ALL', '55421102898316288', '0', '$亚麻籽油&$加拿大进口', null, 'SYS', '2018-09-04 17:39:37', 'SYS', '2018-09-06 19:16:46', '2', '33000');
INSERT INTO `rule` VALUES ('55500587411735552', '49252889384718336', 'AUD', 'CSC', '55335396022715392', '0', '$你&$我不知道', null, 'SYS', '2018-09-05 14:38:05', 'SYS', '2018-09-06 19:17:47', '2', '33000');
INSERT INTO `rule` VALUES ('55508802993161216', '49252889384718336', 'ALL', 'CSC', '55508597538325504', '0', '$辣木&$断货', null, 'SYS', '2018-09-05 16:48:40', 'SYS', '2018-09-06 19:13:33', '2', '33000');
INSERT INTO `rule` VALUES ('55509904683729920', '49252889384718336', 'AUD', 'CSC', '55509842070111232', '0', '$手表&$收藏价格&$高', null, 'SYS', '2018-09-05 17:06:10', 'SYS', '2018-09-06 19:13:49', '2', '33000');
INSERT INTO `rule` VALUES ('55514188985959424', '49252889384718336', 'AUD', 'CSC', '55513990009226240', '0', '$蓝莓酵素&$眼睛', null, 'SYS', '2018-09-05 18:14:16', 'SYS', '2018-09-06 19:14:02', '3', '33000');
INSERT INTO `rule` VALUES ('55514555412939776', '49252889384718336', 'ALL', 'CSC', '55513990009226240', '0', '$蓝莓酵素&$视力', null, 'SYS', '2018-09-05 18:20:06', 'SYS', '2018-09-06 19:14:01', '3', '33000');
INSERT INTO `rule` VALUES ('55576448583369728', '49252889384718336', 'AUD', 'CSC', '55575560364000256', '0', '$享佳&$老会员', null, 'SYS', '2018-09-06 10:43:52', 'SYS', '2018-09-06 19:17:37', '2', '33000');
INSERT INTO `rule` VALUES ('55588615110034432', '49252889384718336', 'ALL', 'CSC', '55575560364000256', '0', '$回馈&$老会员', null, 'SYS', '2018-09-06 13:57:15', 'SYS', '2018-09-06 19:17:41', '2', '33000');

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
INSERT INTO `tag` VALUES ('55329425042998272', 'Y', '49252889384718336', '58', '疾病', '198818966817345536', 'Y', null, 'SYS', '2018-09-03 17:17:32', 'SYS', '2018-09-03 17:17:32', '0');
INSERT INTO `tag` VALUES ('55329858256929792', 'Y', '49252889384718336', '59', '心脏不好', '55329425042998272', 'Y', null, 'SYS', '2018-09-03 17:24:25', 'SYS', '2018-09-03 18:19:01', '3');
INSERT INTO `tag` VALUES ('55330121237693440', 'Y', '49252889384718336', '60', '三高', '55329425042998272', 'Y', null, 'SYS', '2018-09-03 17:28:36', 'SYS', '2018-09-03 18:20:32', '1');
INSERT INTO `tag` VALUES ('55333145764987904', 'Y', '49252889384718336', '61', '性别', '198818966817345536', 'Y', null, 'SYS', '2018-09-03 18:16:40', 'SYS', '2018-09-03 18:16:40', '0');
INSERT INTO `tag` VALUES ('55333157147280384', 'Y', '49252889384718336', '62', '女', '55333145764987904', 'Y', null, 'SYS', '2018-09-03 18:16:51', 'SYS', '2018-09-03 18:16:51', '0');
INSERT INTO `tag` VALUES ('55333164411814912', 'Y', '49252889384718336', '63', '男', '55333145764987904', 'Y', null, 'SYS', '2018-09-03 18:16:58', 'SYS', '2018-09-03 18:16:58', '0');
INSERT INTO `tag` VALUES ('55333447264142336', 'Y', '49252889384718336', '64', '失眠', '55329425042998272', 'Y', null, 'SYS', '2018-09-03 18:21:27', 'SYS', '2018-09-03 18:21:27', '0');
INSERT INTO `tag` VALUES ('55335396022715392', 'N', '49252889384718336', '65', '话术欠佳', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 18:52:26', 'SYS', '2018-09-05 14:34:41', '5');
INSERT INTO `tag` VALUES ('55336518931219456', 'N', '49252889384718336', '66', '蓝莓酵素', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 19:10:17', 'SYS', '2018-09-04 10:43:12', '4');
INSERT INTO `tag` VALUES ('55337011632964608', 'N', '49252889384718336', '67', '羊奶粉', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 19:18:07', 'SYS', '2018-09-04 10:44:01', '4');
INSERT INTO `tag` VALUES ('55337454352237568', 'N', '49252889384718336', '68', '巴马汤', '198819027139825664', 'Y', null, 'SYS', '2018-09-03 19:25:09', 'SYS', '2018-09-04 10:44:02', '1');
INSERT INTO `tag` VALUES ('55393805202916352', 'Y', '49252889384718336', '69', '虫草菌丝体胶囊', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 10:20:49', 'SYS', '2018-09-04 10:20:49', '0');
INSERT INTO `tag` VALUES ('55394312351941632', 'Y', '49252889384718336', '70', '蓝莓酵素', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 10:28:53', 'SYS', '2018-09-06 12:02:34', '2');
INSERT INTO `tag` VALUES ('55395095795500032', 'Y', '49252889384718336', '71', '巴马汤', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 10:41:20', 'SYS', '2018-09-04 10:41:20', '0');
INSERT INTO `tag` VALUES ('55396727090349056', 'Y', '49252889384718336', '72', '贝塔丽健步鞋', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 11:07:16', 'SYS', '2018-09-04 11:14:55', '3');
INSERT INTO `tag` VALUES ('55397596142797824', 'Y', '49252889384718336', '73', '多功能手表', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 11:21:05', 'SYS', '2018-09-04 11:23:30', '1');
INSERT INTO `tag` VALUES ('55399673565840384', 'Y', '49252889384718336', '74', '鱼油软胶囊', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 11:54:06', 'SYS', '2018-09-04 11:54:06', '0');
INSERT INTO `tag` VALUES ('55421102898316288', 'Y', '49252889384718336', '75', '亚麻籽油', '198818923355967488', 'Y', null, 'SYS', '2018-09-04 17:34:42', 'SYS', '2018-09-04 17:34:42', '0');
INSERT INTO `tag` VALUES ('55504823298065408', 'Y', '49252889384718336', '76', '市场优势', '198818809124098048', 'Y', null, 'SYS', '2018-09-05 15:45:24', 'SYS', '2018-09-06 11:54:31', '6');
INSERT INTO `tag` VALUES ('55508597538325504', 'Y', '49252889384718336', '77', '辣木叶片供不应求', '55504823298065408', 'Y', null, 'SYS', '2018-09-05 16:45:24', 'SYS', '2018-09-05 16:45:24', '0');
INSERT INTO `tag` VALUES ('55509842070111232', 'Y', '49252889384718336', '78', '养生手表收藏价值高', '55504823298065408', 'Y', null, 'SYS', '2018-09-05 17:05:11', 'SYS', '2018-09-05 17:05:11', '0');
INSERT INTO `tag` VALUES ('55513990009226240', 'Y', '49252889384718336', '79', '护眼蓝莓酵素', '55504823298065408', 'Y', null, 'SYS', '2018-09-05 18:11:06', 'SYS', '2018-09-05 18:11:06', '0');
INSERT INTO `tag` VALUES ('55575560364000256', 'Y', '49252889384718336', '80', '相对稳定客户', '198818966817345536', 'Y', null, 'SYS', '2018-09-06 10:29:45', 'SYS', '2018-09-06 10:29:45', '0');
INSERT INTO `tag` VALUES ('198818809124098048', 'N', '49252889384718336', '1', '业务类', '0', 'N', null, 'SYS', '2018-06-28 15:53:00', 'SYS', '2018-09-06 11:54:27', '10');
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
  PRIMARY KEY (`COLLECT_ID`),
  UNIQUE KEY `UX_UNIQUE` (`CHANNEL_ID`,`CALL_NO`,`TAG_ID`,`RULE_ID`) USING BTREE
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
INSERT INTO `tag_control` VALUES ('49252889384718336', '81', null, 'SYS', '2018-06-28 15:58:10', 'SYS', '2018-09-06 10:29:45', '71');
