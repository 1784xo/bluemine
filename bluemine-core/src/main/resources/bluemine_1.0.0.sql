/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : bluemine_1.0.0

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-07-19 19:38:38
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
  KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`),
  CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `batch_job_instance` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业执行器表,存放当前作业的执行信息,创建时间、执行时间、执行结束时间、执行状态、执行Job实例等信息';

-- ----------------------------
-- Records of batch_job_execution
-- ----------------------------
INSERT INTO `batch_job_execution` VALUES ('1', '2', '1', '2018-07-19 15:57:08', '2018-07-19 15:57:09', '2018-07-19 15:57:10', 'FAILED', 'FAILED', 'java.lang.NumberFormatException: null\r\n	at java.lang.Integer.parseInt(Integer.java:542)\r\n	at java.lang.Integer.<init>(Integer.java:867)\r\n	at com.bluemine.batch.job.cycle.CallCollectConfiguration.write(CallCollectConfiguration.java:106)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\r\n	at org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.support.DelegatingIntroductionInte', '2018-07-19 15:57:10', null);
INSERT INTO `batch_job_execution` VALUES ('2', '2', '1', '2018-07-19 15:58:15', '2018-07-19 15:58:15', '2018-07-19 15:58:17', 'FAILED', 'FAILED', 'java.lang.NumberFormatException: null\r\n	at java.lang.Integer.parseInt(Integer.java:542)\r\n	at java.lang.Integer.<init>(Integer.java:867)\r\n	at com.bluemine.batch.job.cycle.CallCollectConfiguration.write(CallCollectConfiguration.java:106)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\r\n	at org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.support.DelegatingIntroductionInte', '2018-07-19 15:58:17', null);
INSERT INTO `batch_job_execution` VALUES ('3', '2', '1', '2018-07-19 16:10:42', '2018-07-19 16:10:42', '2018-07-19 16:10:44', 'FAILED', 'FAILED', 'org.springframework.dao.DataIntegrityViolationException: could not execute statement; SQL [n/a]; constraint [PRIMARY]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\r\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:278)\r\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:244)\r\n	at org.springframework.orm.jpa.JpaTransactionManager.doCommit(JpaTransactionManager.java:521)\r\n	at org.springframework.transaction.support.AbstractPlatformTransactionManager.processCommit(AbstractPlatformTransactionManager.java:761)\r\n	at org.springframework.transaction.support.AbstractPlatformTransactionManager.commit(AbstractPlatformTransactionManager.java:730)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.batch.core.configuration.annotation.SimpleBatchConfiguration$PassthruAdvice.invoke(SimpleBatchConfiguration.java:127)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:213)\r\n	at com.sun.proxy.$Proxy129.commit(Unknown Source)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:150)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.b', '2018-07-19 16:10:44', null);
INSERT INTO `batch_job_execution` VALUES ('4', '2', '1', '2018-07-19 16:12:01', '2018-07-19 16:12:01', '2018-07-19 16:12:03', 'COMPLETED', 'COMPLETED', '', '2018-07-19 16:12:03', null);
INSERT INTO `batch_job_execution` VALUES ('5', '2', '2', '2018-07-19 17:15:35', '2018-07-19 17:15:35', '2018-07-19 17:15:36', 'FAILED', 'FAILED', 'org.springframework.beans.factory.BeanCreationException: Error creating bean with name \'scopedTarget.callCollectStep\' defined in class path resource [com/bluemine/batch/job/cycle/CallCollectConfiguration.class]: Bean instantiation via factory method failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.batch.core.Step]: Factory method \'callCollectStep\' threw exception; nested exception is com.bluemine.ServerRuntimeException: 不存在的数据\r\n	at org.springframework.beans.factory.support.ConstructorResolver.instantiateUsingFactoryMethod(ConstructorResolver.java:599)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.instantiateUsingFactoryMethod(AbstractAutowireCapableBeanFactory.java:1173)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1067)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:513)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:483)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory$2.getObject(AbstractBeanFactory.java:345)\r\n	at org.springframework.batch.core.scope.JobScope.get(JobScope.java:105)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:340)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:197)\r\n	at org.springframework.aop.target.SimpleBeanTargetSource.getTarget(SimpleBeanTargetSource.java:35)\r\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:192)\r\n	at com.sun.proxy.$Proxy135.getName(Unknown Source)\r\n	at org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:115)\r\n	at org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\r\n	at org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\r\n	at org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\r\n	at org.springframework.batch.core.launch.support.SimpleJobLauncher$1.run(SimpleJobLauncher.java:135)\r\n	at org.springframework.core.task.SyncTaskExecutor.execute(SyncTaskExecutor.java:50)\r\n	at org.springframework.batch.core.launch.support.SimpleJobLauncher.run(SimpleJobLauncher.java:128)\r\n	at s', '2018-07-19 17:15:36', null);
INSERT INTO `batch_job_execution` VALUES ('6', '2', '2', '2018-07-19 17:17:34', '2018-07-19 17:17:34', '2018-07-19 17:17:36', 'COMPLETED', 'COMPLETED', '', '2018-07-19 17:17:36', null);
INSERT INTO `batch_job_execution` VALUES ('7', '2', '3', '2018-07-19 17:23:19', '2018-07-19 17:23:19', '2018-07-19 17:23:25', 'COMPLETED', 'COMPLETED', '', '2018-07-19 17:23:25', null);
INSERT INTO `batch_job_execution` VALUES ('8', '2', '4', '2018-07-19 19:23:17', '2018-07-19 19:23:17', '2018-07-19 19:23:36', 'FAILED', 'FAILED', 'java.lang.NumberFormatException: null\r\n	at java.lang.Integer.parseInt(Integer.java:542)\r\n	at java.lang.Integer.<init>(Integer.java:867)\r\n	at com.bluemine.batch.job.cycle.CallCollectConfiguration.write(CallCollectConfiguration.java:107)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\r\n	at org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.support.DelegatingIntroductionInte', '2018-07-19 19:23:52', null);

-- ----------------------------
-- Table structure for batch_job_execution_context
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_context`;
CREATE TABLE `batch_job_execution_context` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL COMMENT '外键ID,作业执行器编号',
  `SHORT_CONTEXT` varchar(2500) NOT NULL COMMENT '作业执行器上下文字符串格式',
  `SERIALIZED_CONTEXT` text COMMENT '序列化的作业执行上下文',
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
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
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业参数表,用于存放每个JOB执行的时候的参数信息,即对于的JOB实例';

-- ----------------------------
-- Records of batch_job_execution_params
-- ----------------------------
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'seatNo', '1', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'callNo', '13', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('1', 'STRING', 'callDate', '2018-07-20', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'seatNo', '1', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'callNo', '13', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('2', 'STRING', 'callDate', '2018-07-20', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'seatNo', '1', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'callNo', '13', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('3', 'STRING', 'callDate', '2018-07-20', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'seatNo', '1', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'callNo', '13', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('4', 'STRING', 'callDate', '2018-07-20', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'callNo', '14', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('5', 'STRING', 'callDate', '2018-07-21', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'callNo', '14', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('6', 'STRING', 'callDate', '2018-07-21', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'callNo', '14', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('7', 'STRING', 'callDate', '2018-07-22', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'channelNo', '100001', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'seatNo', '2', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'callNo', '14', '1970-01-01 08:00:00', '0', '0', 'Y');
INSERT INTO `batch_job_execution_params` VALUES ('8', 'STRING', 'callDate', '2018-07-23', '1970-01-01 08:00:00', '0', '0', 'Y');

-- ----------------------------
-- Table structure for batch_job_execution_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_execution_seq`;
CREATE TABLE `batch_job_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于BATCH_JOB_EXECUTION和BATCH_JOB_EXECUTION_CONTEXT提供主键生成';

-- ----------------------------
-- Records of batch_job_execution_seq
-- ----------------------------
INSERT INTO `batch_job_execution_seq` VALUES ('8', '0');

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
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业实例表,存放JOB的实例信息';

-- ----------------------------
-- Records of batch_job_instance
-- ----------------------------
INSERT INTO `batch_job_instance` VALUES ('1', '0', 'callCollectJob', '537dc3cd2df1c952736c22d57a786008');
INSERT INTO `batch_job_instance` VALUES ('2', '0', 'callCollectJob', 'eaba6fed4be204068775f1f178ec0209');
INSERT INTO `batch_job_instance` VALUES ('3', '0', 'callCollectJob', '8688396a48823a0e39b36d24c8b9f5e6');
INSERT INTO `batch_job_instance` VALUES ('4', '0', 'callCollectJob', 'cd95ca7d39ed7797edecfbe9d0ef3f37');

-- ----------------------------
-- Table structure for batch_job_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_seq`;
CREATE TABLE `batch_job_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于BATCH_JOB_INSTNCE和BATCH_JOB_EXECUTION_PARAMS提供主键生成';

-- ----------------------------
-- Records of batch_job_seq
-- ----------------------------
INSERT INTO `batch_job_seq` VALUES ('4', '0');

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
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业步执行器，存放每个Step执行器的信息：开始时间、执行完成时间、读/写次数等';

-- ----------------------------
-- Records of batch_step_execution
-- ----------------------------
INSERT INTO `batch_step_execution` VALUES ('1', '2', 'callCollectStep', '1', '2018-07-19 15:57:10', '2018-07-19 15:57:10', 'FAILED', '0', '1', '0', '0', '0', '0', '0', '1', 'FAILED', 'java.lang.NumberFormatException: null\r\n	at java.lang.Integer.parseInt(Integer.java:542)\r\n	at java.lang.Integer.<init>(Integer.java:867)\r\n	at com.bluemine.batch.job.cycle.CallCollectConfiguration.write(CallCollectConfiguration.java:106)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\r\n	at org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.support.DelegatingIntroductionInte', '2018-07-19 15:57:10');
INSERT INTO `batch_step_execution` VALUES ('2', '2', 'callCollectStep', '2', '2018-07-19 15:58:16', '2018-07-19 15:58:17', 'FAILED', '0', '1', '0', '0', '0', '0', '0', '1', 'FAILED', 'java.lang.NumberFormatException: null\r\n	at java.lang.Integer.parseInt(Integer.java:542)\r\n	at java.lang.Integer.<init>(Integer.java:867)\r\n	at com.bluemine.batch.job.cycle.CallCollectConfiguration.write(CallCollectConfiguration.java:106)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\r\n	at org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.support.DelegatingIntroductionInte', '2018-07-19 15:58:17');
INSERT INTO `batch_step_execution` VALUES ('3', '2', 'callCollectStep', '3', '2018-07-19 16:10:43', '2018-07-19 16:10:44', 'FAILED', '0', '1', '0', '0', '0', '0', '0', '1', 'FAILED', 'org.springframework.dao.DataIntegrityViolationException: could not execute statement; SQL [n/a]; constraint [PRIMARY]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement\r\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.convertHibernateAccessException(HibernateJpaDialect.java:278)\r\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:244)\r\n	at org.springframework.orm.jpa.JpaTransactionManager.doCommit(JpaTransactionManager.java:521)\r\n	at org.springframework.transaction.support.AbstractPlatformTransactionManager.processCommit(AbstractPlatformTransactionManager.java:761)\r\n	at org.springframework.transaction.support.AbstractPlatformTransactionManager.commit(AbstractPlatformTransactionManager.java:730)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.batch.core.configuration.annotation.SimpleBatchConfiguration$PassthruAdvice.invoke(SimpleBatchConfiguration.java:127)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:213)\r\n	at com.sun.proxy.$Proxy129.commit(Unknown Source)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:150)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.b', '2018-07-19 16:10:44');
INSERT INTO `batch_step_execution` VALUES ('4', '4', 'callCollectStep', '4', '2018-07-19 16:12:02', '2018-07-19 16:12:03', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-07-19 16:12:03');
INSERT INTO `batch_step_execution` VALUES ('5', '4', 'callCollectStep', '6', '2018-07-19 17:17:36', '2018-07-19 17:17:36', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-07-19 17:17:36');
INSERT INTO `batch_step_execution` VALUES ('6', '4', 'callCollectStep', '7', '2018-07-19 17:23:20', '2018-07-19 17:23:25', 'COMPLETED', '2', '1', '0', '1', '0', '0', '0', '0', 'COMPLETED', '', '2018-07-19 17:23:25');
INSERT INTO `batch_step_execution` VALUES ('7', '2', 'callCollectStep', '8', '2018-07-19 19:23:36', '2018-07-19 19:23:36', 'FAILED', '0', '1', '0', '0', '0', '0', '0', '1', 'FAILED', 'java.lang.NumberFormatException: null\r\n	at java.lang.Integer.parseInt(Integer.java:542)\r\n	at java.lang.Integer.<init>(Integer.java:867)\r\n	at com.bluemine.batch.job.cycle.CallCollectConfiguration.write(CallCollectConfiguration.java:107)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\r\n	at org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:333)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:190)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.support.DelegatingIntroductionInte', '2018-07-19 19:23:36');

-- ----------------------------
-- Table structure for batch_step_execution_context
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution_context`;
CREATE TABLE `batch_step_execution_context` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL COMMENT '作业步执行器ID',
  `SHORT_CONTEXT` varchar(2500) NOT NULL COMMENT '作业步执行器上下文字符串格式',
  `SERIALIZED_CONTEXT` text COMMENT '序列化作业步执行器上下文',
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `batch_step_execution` (`STEP_EXECUTION_ID`)
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

-- ----------------------------
-- Table structure for batch_step_execution_seq
-- ----------------------------
DROP TABLE IF EXISTS `batch_step_execution_seq`;
CREATE TABLE `batch_step_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于BATCH_STEP_EXECUTION和BATCH_STEP_EXECUTION_CONTEXT提供主键';

-- ----------------------------
-- Records of batch_step_execution_seq
-- ----------------------------
INSERT INTO `batch_step_execution_seq` VALUES ('7', '0');

-- ----------------------------
-- Table structure for call_collect_trigger
-- ----------------------------
DROP TABLE IF EXISTS `call_collect_trigger`;
CREATE TABLE `call_collect_trigger` (
  `CALL_NO` varchar(64) NOT NULL COMMENT '会话单号',
  `TRIGGER_DATE` int(8) NOT NULL COMMENT '触发时间',
  `CHANNEL_NO` varchar(64) NOT NULL COMMENT '渠道标识编号',
  `SEAT_NO` varchar(64) NOT NULL COMMENT '坐席编号',
  `PROCESSED_FLAG` char(1) NOT NULL COMMENT '处理标识',
  `TRIGGER_TYPE` char(4) NOT NULL COMMENT '触发类型',
  `REQUEST_TIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '请求时间',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CALL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话汇总跑批触发表';

-- ----------------------------
-- Records of call_collect_trigger
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
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`CHANNEL_ID`),
  UNIQUE KEY `UX_CHANNEL` (`CHANNEL_CODE`,`CHANNEL_TYPE`) USING BTREE COMMENT '唯一性',
  UNIQUE KEY `UX_CHANNEL_NO` (`CHANNEL_NO`) COMMENT '唯一性'
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
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
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
  `SEAT_NO` varchar(16) NOT NULL COMMENT '坐席编号',
  `START_TIME` int(8) NOT NULL COMMENT '工作开始时间',
  `END_TIME` int(8) NOT NULL COMMENT '工作结束时间',
  `DESC_TEXT` varchar(120) NOT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `UX_ID` (`SEAT_NO`) USING BTREE COMMENT '唯一标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('49070939912015872', '000001', '2', '1', 'TEST', 'PR01', '测试员工1', 'test@bluemine.com', '1', '90000', '170000', '', 'SYS', '2018-06-26 15:22:17', 'SYS', '2018-06-26 15:22:17', '0', '33000');

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
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('49706274247443456', '49252889384718336', 'AUD', 'ALL', '198819111277563904', '0', '(脑子&慢)|傻|没希望|笨', null, 'SYS', '2018-07-03 15:39:57', 'SYS', '2018-07-03 15:39:57', '0', '33000');
INSERT INTO `rule` VALUES ('49706345314681856', '49252889384718336', 'AUD', 'ALL', '198819179812491264', '0', '(保证&考过)|(保证&前三)|(保证&考上&大学)', null, 'SYS', '2018-07-03 15:41:05', 'SYS', '2018-07-03 15:41:05', '0', '33000');
INSERT INTO `rule` VALUES ('49706426338149376', '49252889384718336', 'AUD', 'ALL', '198819213316591616', '0', '(老师&不好)|(老师&不&负责)|(投诉&老师)', null, 'SYS', '2018-07-03 15:42:22', 'SYS', '2018-07-03 15:42:22', '0', '33000');
INSERT INTO `rule` VALUES ('49706454618244096', '49252889384718336', 'AUD', 'ALL', '198819246732611584', '0', '太贵|(学费&高)|优惠|(有没有&活动)|折扣', null, 'SYS', '2018-07-03 15:42:49', 'SYS', '2018-07-03 15:42:49', '0', '33000');
INSERT INTO `rule` VALUES ('49706479720104960', '49252889384718336', 'AUD', 'ALL', '198819304509149184', '0', '试听|(感觉&不错)|(怎么&报名)', null, 'SYS', '2018-07-03 15:43:13', 'SYS', '2018-07-03 15:43:13', '0', '33000');

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
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
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
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
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
  `ACTIVATED_FLAG` char(1) NOT NULL COMMENT '激活标识',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `TAG_NO` int(11) NOT NULL COMMENT '标签编号',
  `TAG_TEXT` varchar(255) NOT NULL COMMENT '标签文本',
  `PARENT_ID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `PROPERTY_FLAG` char(1) NOT NULL COMMENT '规则属性标识',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`TAG_ID`),
  UNIQUE KEY `IU_CHANNEL_TAG` (`CHANNEL_ID`,`TAG_NO`) USING BTREE COMMENT '唯一性',
  KEY `IX_SRCH_ONE` (`TAG_ID`,`CHANNEL_ID`) COMMENT '搜索'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('198818809124098048', 'N', '49252889384718336', '1', '业务类', '0', 'Y', null, 'SYS', '2018-06-28 15:53:00', 'SYS', '2018-06-28 15:53:00', '0');
INSERT INTO `tag` VALUES ('198818923355967488', 'Y', '49252889384718336', '2', '产品类', '0', 'Y', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-06-28 15:54:18', '0');
INSERT INTO `tag` VALUES ('198818966817345536', 'N', '49252889384718336', '3', '用户类', '0', 'Y', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-06-28 15:54:18', '0');
INSERT INTO `tag` VALUES ('198819027139825664', 'N', '49252889384718336', '4', '评价类', '0', 'Y', null, 'SYS', '2018-06-28 15:54:18', 'SYS', '2018-06-28 15:54:18', '0');
INSERT INTO `tag` VALUES ('198819111277563904', 'Y', '49252889384718336', '5', '电视', '198818923355967488', 'N', null, 'SYS', '2018-06-29 12:00:54', 'SYS', '2018-06-29 12:00:54', '0');
INSERT INTO `tag` VALUES ('198819179812491264', 'Y', '49252889384718336', '6', '手机', '198818923355967488', 'N', null, 'SYS', '2018-06-29 12:57:41', 'SYS', '2018-06-29 14:27:38', '1');
INSERT INTO `tag` VALUES ('198819213316591616', 'Y', '49252889384718336', '7', '三星', '198819179812491264', 'N', null, 'SYS', '2018-06-29 12:57:48', 'SYS', '2018-06-29 14:33:43', '2');
INSERT INTO `tag` VALUES ('198819246732611584', 'Y', '49252889384718336', '8', '苹果', '198819179812491264', 'N', null, 'SYS', '2018-07-03 15:08:11', 'SYS', '2018-07-03 15:08:11', '0');
INSERT INTO `tag` VALUES ('198819304509149184', 'Y', '49252889384718336', '9', '夏普', '198819111277563904', 'N', null, 'SYS', '2018-07-03 15:09:14', 'SYS', '2018-07-03 15:09:14', '0');

-- ----------------------------
-- Table structure for tag_collect
-- ----------------------------
DROP TABLE IF EXISTS `tag_collect`;
CREATE TABLE `tag_collect` (
  `TAG_ID` bigint(20) NOT NULL COMMENT '标签ID',
  `RULE_ID` bigint(20) NOT NULL COMMENT '碰撞规则ID',
  `CALL_NO` varchar(64) NOT NULL COMMENT '会话单号',
  `CHANNEL_ID` bigint(20) NOT NULL COMMENT '渠道ID',
  `CALL_DATE` int(8) NOT NULL COMMENT '会话日期',
  `SEAT_ID` bigint(20) NOT NULL COMMENT '坐席ID',
  `FREQUENCY` int(11) NOT NULL COMMENT '碰撞发生次数',
  `SUB_FREQUENCY` int(11) NOT NULL COMMENT '碰撞发生次数',
  `SUB_TOTAL` int(11) NOT NULL COMMENT '成功碰撞的子级总数',
  `DESC_TEXT` varchar(120) DEFAULT NULL COMMENT '描述',
  `CREATED_BY` varchar(32) NOT NULL COMMENT '创建用户',
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIED_BY` varchar(32) NOT NULL COMMENT '更新用户',
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  `PARTITION_KEY` mediumint(10) NOT NULL COMMENT '数据库分区Key',
  PRIMARY KEY (`TAG_ID`,`RULE_ID`,`CALL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签汇总表';

-- ----------------------------
-- Records of tag_collect
-- ----------------------------
INSERT INTO `tag_collect` VALUES ('198818809124098048', '49706345314681856', '13', '49252889384718336', '20180720', '49238845276819456', '0', '46', '1', null, 'SYS', '2018-07-19 16:12:02', 'SYS', '2018-07-19 16:12:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198818809124098048', '49706454618244096', '13', '49252889384718336', '20180720', '49238845276819456', '0', '49', '1', null, 'SYS', '2018-07-19 16:12:02', 'SYS', '2018-07-19 16:12:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198818923355967488', '49706274247443456', '14', '49252889384718336', '20180722', '204647654448304128', '0', '14', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198818923355967488', '49706345314681856', '14', '49252889384718336', '20180722', '204647654448304128', '0', '13', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198818923355967488', '49706426338149376', '14', '49252889384718336', '20180722', '204647654448304128', '0', '32', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198818923355967488', '49706454618244096', '14', '49252889384718336', '20180722', '204647654448304128', '0', '41', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198818923355967488', '49706479720104960', '14', '49252889384718336', '20180722', '204647654448304128', '0', '58', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819111277563904', '49706274247443456', '14', '49252889384718336', '20180722', '204647654448304128', '14', '0', '0', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819111277563904', '49706479720104960', '14', '49252889384718336', '20180722', '204647654448304128', '0', '58', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819179812491264', '49706345314681856', '13', '49252889384718336', '20180720', '49238845276819456', '46', '0', '0', null, 'SYS', '2018-07-19 16:12:02', 'SYS', '2018-07-19 16:12:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819179812491264', '49706345314681856', '14', '49252889384718336', '20180722', '204647654448304128', '13', '0', '0', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819179812491264', '49706426338149376', '14', '49252889384718336', '20180722', '204647654448304128', '0', '32', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819179812491264', '49706454618244096', '13', '49252889384718336', '20180720', '49238845276819456', '0', '49', '1', null, 'SYS', '2018-07-19 16:12:02', 'SYS', '2018-07-19 16:12:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819179812491264', '49706454618244096', '14', '49252889384718336', '20180722', '204647654448304128', '0', '41', '1', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819213316591616', '49706426338149376', '14', '49252889384718336', '20180722', '204647654448304128', '32', '0', '0', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819246732611584', '49706454618244096', '13', '49252889384718336', '20180720', '49238845276819456', '49', '0', '0', null, 'SYS', '2018-07-19 16:12:02', 'SYS', '2018-07-19 16:12:02', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819246732611584', '49706454618244096', '14', '49252889384718336', '20180722', '204647654448304128', '41', '0', '0', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');
INSERT INTO `tag_collect` VALUES ('198819304509149184', '49706479720104960', '14', '49252889384718336', '20180722', '204647654448304128', '58', '0', '0', null, 'SYS', '2018-07-19 17:23:24', 'SYS', '2018-07-19 17:23:24', '0', '33000');

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
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `MODIFIED_NO` int(8) NOT NULL DEFAULT '0' COMMENT '更新次数',
  PRIMARY KEY (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签控制表';

-- ----------------------------
-- Records of tag_control
-- ----------------------------
INSERT INTO `tag_control` VALUES ('49252889384718336', '16', null, 'SYS', '2018-06-28 15:58:10', 'SYS', '2018-07-03 15:09:14', '6');
SET FOREIGN_KEY_CHECKS=1;
