/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : fujia

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-11-09 18:00:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lin_auth
-- ----------------------------
DROP TABLE IF EXISTS `lin_auth`;
CREATE TABLE `lin_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `auth` varchar(60) NOT NULL,
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4723 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_auth
-- ----------------------------
INSERT INTO `lin_auth` VALUES ('2323', '9', '卡片列表', '卡片管理');
INSERT INTO `lin_auth` VALUES ('2324', '9', '卡片流水明细', '卡片管理');
INSERT INTO `lin_auth` VALUES ('2325', '9', '合同列表', '合同管理');
INSERT INTO `lin_auth` VALUES ('2326', '9', '商户列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('2327', '9', '商户合同列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('2328', '9', '房源列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('2329', '9', '区域列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('2330', '10', '卡片列表', '卡片管理');
INSERT INTO `lin_auth` VALUES ('2331', '10', '卡片流水明细', '卡片管理');
INSERT INTO `lin_auth` VALUES ('2332', '10', '合同列表', '合同管理');
INSERT INTO `lin_auth` VALUES ('2333', '10', '启用合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('2334', '10', '终止合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('2335', '10', '商户列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('2336', '10', '商户合同列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('2337', '10', '房源列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('2338', '10', '区域列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4101', '1', '每日流水', '数据统计');
INSERT INTO `lin_auth` VALUES ('4102', '1', '每日流水详情', '数据统计');
INSERT INTO `lin_auth` VALUES ('4103', '1', '每日对账', '数据统计');
INSERT INTO `lin_auth` VALUES ('4104', '1', '广告列表', '广告管理');
INSERT INTO `lin_auth` VALUES ('4105', '1', '添加广告', '广告管理');
INSERT INTO `lin_auth` VALUES ('4106', '1', '编辑广告', '广告管理');
INSERT INTO `lin_auth` VALUES ('4107', '1', '广告详情', '广告管理');
INSERT INTO `lin_auth` VALUES ('4108', '1', '删除广告', '广告管理');
INSERT INTO `lin_auth` VALUES ('4109', '1', '启用视频', '广告管理');
INSERT INTO `lin_auth` VALUES ('4110', '1', '文章分类ID查询', '文章管理');
INSERT INTO `lin_auth` VALUES ('4111', '1', '文章分类列表', '文章管理');
INSERT INTO `lin_auth` VALUES ('4112', '1', '添加文章分类', '文章管理');
INSERT INTO `lin_auth` VALUES ('4113', '1', '编辑文章分类', '文章管理');
INSERT INTO `lin_auth` VALUES ('4114', '1', '删除文章分类', '文章管理');
INSERT INTO `lin_auth` VALUES ('4115', '1', '文章ID查询', '文章管理');
INSERT INTO `lin_auth` VALUES ('4116', '1', '文章列表', '文章管理');
INSERT INTO `lin_auth` VALUES ('4117', '1', '添加文章', '文章管理');
INSERT INTO `lin_auth` VALUES ('4118', '1', '编辑文章', '文章管理');
INSERT INTO `lin_auth` VALUES ('4119', '1', '删除文章', '文章管理');
INSERT INTO `lin_auth` VALUES ('4120', '1', '后台文章排序', '文章管理');
INSERT INTO `lin_auth` VALUES ('4121', '1', '卡片列表', '卡片管理');
INSERT INTO `lin_auth` VALUES ('4122', '1', '卡片流水明细', '卡片管理');
INSERT INTO `lin_auth` VALUES ('4123', '1', '合同列表', '合同管理');
INSERT INTO `lin_auth` VALUES ('4124', '1', '启用合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('4125', '1', '终止合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('4126', '1', '商户列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4127', '1', '商户合同列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4128', '1', '添加DTU设备', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4129', '1', '编辑DTU设备', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4130', '1', '删除DTU设备', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4131', '1', '电表绑定列表', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4132', '1', '绑定电表', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4133', '1', '投诉列表', '投诉反馈');
INSERT INTO `lin_auth` VALUES ('4134', '1', '房源列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4135', '1', '区域列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4136', '1', '查询所有日志', '日志');
INSERT INTO `lin_auth` VALUES ('4137', '1', '搜索日志', '日志');
INSERT INTO `lin_auth` VALUES ('4138', '1', '查询日志记录的用户', '日志');
INSERT INTO `lin_auth` VALUES ('4139', '1', '添加水控机', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4140', '1', '更新水控机', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4141', '1', '设置机器二维码', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4142', '1', '设置水费单价', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4143', '1', '水控设备列表', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4144', '1', '用户列表', '小程序用户管理');
INSERT INTO `lin_auth` VALUES ('4145', '1', '设置市场人员', '小程序用户管理');
INSERT INTO `lin_auth` VALUES ('4146', '1', '仪表列表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4147', '1', '添加仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4148', '1', '编辑仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4149', '1', '删除仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4150', '1', '虚拟电表绑定', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4151', '1', '取消虚拟表绑定', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4152', '1', '启用仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4153', '1', '停用仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4154', '1', '仪表开关', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4155', '1', '查询未绑定虚拟表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4156', '1', '仪表变更', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4157', '1', '设备变更记录', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4158', '1', '报修列表', '报修管理');
INSERT INTO `lin_auth` VALUES ('4159', '1', '报修派单', '报修管理');
INSERT INTO `lin_auth` VALUES ('4160', '1', '完成报修', '报修管理');
INSERT INTO `lin_auth` VALUES ('4161', '1', '取消报修', '报修管理');
INSERT INTO `lin_auth` VALUES ('4561', '14', '每日流水', '数据统计');
INSERT INTO `lin_auth` VALUES ('4562', '14', '流水明细', '数据统计');
INSERT INTO `lin_auth` VALUES ('4563', '14', '流水明细详情', '数据统计');
INSERT INTO `lin_auth` VALUES ('4564', '14', '每日对账', '数据统计');
INSERT INTO `lin_auth` VALUES ('4565', '14', '广告列表', '广告管理');
INSERT INTO `lin_auth` VALUES ('4566', '14', '添加广告', '广告管理');
INSERT INTO `lin_auth` VALUES ('4567', '14', '编辑广告', '广告管理');
INSERT INTO `lin_auth` VALUES ('4568', '14', '广告详情', '广告管理');
INSERT INTO `lin_auth` VALUES ('4569', '14', '删除广告', '广告管理');
INSERT INTO `lin_auth` VALUES ('4570', '14', '启用视频', '广告管理');
INSERT INTO `lin_auth` VALUES ('4571', '14', '文章分类ID查询', '文章管理');
INSERT INTO `lin_auth` VALUES ('4572', '14', '文章分类列表', '文章管理');
INSERT INTO `lin_auth` VALUES ('4573', '14', '添加文章分类', '文章管理');
INSERT INTO `lin_auth` VALUES ('4574', '14', '编辑文章分类', '文章管理');
INSERT INTO `lin_auth` VALUES ('4575', '14', '删除文章分类', '文章管理');
INSERT INTO `lin_auth` VALUES ('4576', '14', '文章ID查询', '文章管理');
INSERT INTO `lin_auth` VALUES ('4577', '14', '文章列表', '文章管理');
INSERT INTO `lin_auth` VALUES ('4578', '14', '添加文章', '文章管理');
INSERT INTO `lin_auth` VALUES ('4579', '14', '编辑文章', '文章管理');
INSERT INTO `lin_auth` VALUES ('4580', '14', '删除文章', '文章管理');
INSERT INTO `lin_auth` VALUES ('4581', '14', '后台文章排序', '文章管理');
INSERT INTO `lin_auth` VALUES ('4582', '14', '卡片列表', '卡片管理');
INSERT INTO `lin_auth` VALUES ('4583', '14', '卡片流水明细', '卡片管理');
INSERT INTO `lin_auth` VALUES ('4584', '14', '合同列表', '合同管理');
INSERT INTO `lin_auth` VALUES ('4585', '14', '启用合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('4586', '14', '终止合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('4587', '14', '商户列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4588', '14', '商户合同列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4589', '14', '商户水电余额流水列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4590', '14', '商户账单流水列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4591', '14', '食堂订单列表', '订单管理');
INSERT INTO `lin_auth` VALUES ('4592', '14', '发放补贴', '员工管理');
INSERT INTO `lin_auth` VALUES ('4593', '14', '员工列表', '员工管理');
INSERT INTO `lin_auth` VALUES ('4594', '14', '添加员工', '员工管理');
INSERT INTO `lin_auth` VALUES ('4595', '14', '修改员工', '员工管理');
INSERT INTO `lin_auth` VALUES ('4596', '14', '管理员设置', '员工管理');
INSERT INTO `lin_auth` VALUES ('4597', '14', '员工状态设置', '员工管理');
INSERT INTO `lin_auth` VALUES ('4598', '14', '删除员工', '员工管理');
INSERT INTO `lin_auth` VALUES ('4599', '14', '员工余额消费记录', '员工管理');
INSERT INTO `lin_auth` VALUES ('4600', '14', '余额消费', '消费统计');
INSERT INTO `lin_auth` VALUES ('4601', '14', '微信消费', '消费统计');
INSERT INTO `lin_auth` VALUES ('4602', '14', '余额消费详情', '消费统计');
INSERT INTO `lin_auth` VALUES ('4603', '14', '微信消费详情', '消费统计');
INSERT INTO `lin_auth` VALUES ('4604', '14', '菜品列表', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4605', '14', '添加菜品', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4606', '14', '修改菜品', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4607', '14', '删除菜品', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4608', '14', 'DTU设备列表', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4609', '14', '添加DTU设备', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4610', '14', '编辑DTU设备', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4611', '14', '删除DTU设备', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4612', '14', '电表绑定列表', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4613', '14', '绑定电表', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4614', '14', 'Dtu设备变更', 'DTU设备管理');
INSERT INTO `lin_auth` VALUES ('4615', '14', '投诉列表', '投诉反馈');
INSERT INTO `lin_auth` VALUES ('4616', '14', '房源列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4617', '14', '区域列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4618', '14', '查询所有日志', '日志');
INSERT INTO `lin_auth` VALUES ('4619', '14', '搜索日志', '日志');
INSERT INTO `lin_auth` VALUES ('4620', '14', '查询日志记录的用户', '日志');
INSERT INTO `lin_auth` VALUES ('4621', '14', '添加水控机', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4622', '14', '更新水控机', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4623', '14', '设置机器二维码', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4624', '14', '设置水费单价', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4625', '14', '设置水费单位倍数', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4626', '14', '水控设备列表', '水控设备管理');
INSERT INTO `lin_auth` VALUES ('4627', '14', '用户列表', '小程序用户管理');
INSERT INTO `lin_auth` VALUES ('4628', '14', '仪表列表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4629', '14', '添加仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4630', '14', '编辑仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4631', '14', '删除仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4632', '14', '虚拟电表绑定', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4633', '14', '取消虚拟表绑定', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4634', '14', '启用仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4635', '14', '停用仪表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4636', '14', '仪表开关', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4637', '14', '查询未绑定虚拟表', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4638', '14', '仪表变更', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4639', '14', '设备变更记录', '仪表管理');
INSERT INTO `lin_auth` VALUES ('4640', '14', '打印机列表', '打印机管理');
INSERT INTO `lin_auth` VALUES ('4641', '14', '添加打印机', '打印机管理');
INSERT INTO `lin_auth` VALUES ('4642', '14', '修改打印机', '打印机管理');
INSERT INTO `lin_auth` VALUES ('4643', '14', '报修列表', '报修管理');
INSERT INTO `lin_auth` VALUES ('4644', '14', '报修派单', '报修管理');
INSERT INTO `lin_auth` VALUES ('4645', '14', '完成报修', '报修管理');
INSERT INTO `lin_auth` VALUES ('4646', '14', '取消报修', '报修管理');
INSERT INTO `lin_auth` VALUES ('4647', '14', '公众号管理登录', '管理员');
INSERT INTO `lin_auth` VALUES ('4648', '15', '发放补贴', '员工管理');
INSERT INTO `lin_auth` VALUES ('4649', '15', '员工列表', '员工管理');
INSERT INTO `lin_auth` VALUES ('4650', '15', '添加员工', '员工管理');
INSERT INTO `lin_auth` VALUES ('4651', '15', '修改员工', '员工管理');
INSERT INTO `lin_auth` VALUES ('4652', '15', '管理员设置', '员工管理');
INSERT INTO `lin_auth` VALUES ('4653', '15', '员工状态设置', '员工管理');
INSERT INTO `lin_auth` VALUES ('4654', '15', '删除员工', '员工管理');
INSERT INTO `lin_auth` VALUES ('4655', '15', '员工余额消费记录', '员工管理');
INSERT INTO `lin_auth` VALUES ('4656', '15', '余额消费', '消费统计');
INSERT INTO `lin_auth` VALUES ('4657', '15', '微信消费', '消费统计');
INSERT INTO `lin_auth` VALUES ('4658', '15', '余额消费详情', '消费统计');
INSERT INTO `lin_auth` VALUES ('4659', '15', '微信消费详情', '消费统计');
INSERT INTO `lin_auth` VALUES ('4660', '15', '菜品列表', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4661', '15', '添加菜品', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4662', '15', '修改菜品', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4663', '15', '删除菜品', '菜品管理');
INSERT INTO `lin_auth` VALUES ('4664', '15', '打印机列表', '打印机管理');
INSERT INTO `lin_auth` VALUES ('4665', '15', '添加打印机', '打印机管理');
INSERT INTO `lin_auth` VALUES ('4666', '15', '修改打印机', '打印机管理');
INSERT INTO `lin_auth` VALUES ('4709', '8', '合同列表', '合同管理');
INSERT INTO `lin_auth` VALUES ('4710', '8', '启用合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('4711', '8', '终止合同', '合同管理');
INSERT INTO `lin_auth` VALUES ('4712', '8', '商户列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4713', '8', '商户合同列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4714', '8', '商户水电余额流水列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4715', '8', '商户账单流水列表', '商户管理');
INSERT INTO `lin_auth` VALUES ('4716', '8', '投诉列表', '投诉反馈');
INSERT INTO `lin_auth` VALUES ('4717', '8', '房源列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4718', '8', '区域列表', '房源管理');
INSERT INTO `lin_auth` VALUES ('4719', '8', '报修列表', '报修管理');
INSERT INTO `lin_auth` VALUES ('4720', '8', '报修派单', '报修管理');
INSERT INTO `lin_auth` VALUES ('4721', '8', '完成报修', '报修管理');
INSERT INTO `lin_auth` VALUES ('4722', '8', '取消报修', '报修管理');

-- ----------------------------
-- Table structure for lin_event
-- ----------------------------
DROP TABLE IF EXISTS `lin_event`;
CREATE TABLE `lin_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `message_events` varchar(250) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_event
-- ----------------------------

-- ----------------------------
-- Table structure for lin_file
-- ----------------------------
DROP TABLE IF EXISTS `lin_file`;
CREATE TABLE `lin_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(500) NOT NULL COMMENT '路径',
  `type` int(6) NOT NULL COMMENT '1 local，其他表示其他地方',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `extension` varchar(50) NOT NULL COMMENT '后缀',
  `size` int(11) NOT NULL COMMENT '大小',
  `md5` varchar(40) NOT NULL COMMENT '图片md5值，防止上传重复图片',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_file
-- ----------------------------
INSERT INTO `lin_file` VALUES ('1', '20200606/e660d58a288c11b48ac6ee3c5fba7d6b.jpg', '1', 'e660d58a288c11b48ac6ee3c5fba7d6b.jpg', '.jpg', '5285', '880906d66c12166a5e64efb79970ace9', '2020-06-06 13:57:11', '2020-06-06 13:57:11', null);
INSERT INTO `lin_file` VALUES ('2', '20200721/a505298abd3dc9d7cbb9b5c71ceab5b0.png', '1', 'a505298abd3dc9d7cbb9b5c71ceab5b0.png', '.png', '468687', '10bfe55018a2cfde15045f735f14c972', '2020-07-21 20:47:36', '2020-07-21 20:47:36', null);
INSERT INTO `lin_file` VALUES ('3', '20200724/fc2e84159d53ad0229611a034c83ff2e.jpg', '1', 'fc2e84159d53ad0229611a034c83ff2e.jpg', '.jpg', '1172377', 'e86ea59ad4876f97b6cf05feff7fb90a', '2020-07-24 21:20:11', '2020-07-24 21:20:11', null);
INSERT INTO `lin_file` VALUES ('4', '20200725/199cadabe83e7d52480c6815a48bc950.jpg', '1', '199cadabe83e7d52480c6815a48bc950.jpg', '.jpg', '49116', 'e7f80d99cb8dae95dea004028524285f', '2020-07-25 09:01:17', '2020-07-25 09:01:17', null);
INSERT INTO `lin_file` VALUES ('5', '20200725/86541b8b4e7fb7a8e5cc43e441ef40f7.png', '1', '86541b8b4e7fb7a8e5cc43e441ef40f7.png', '.png', '105408', '48bfa123420b8aee4cfe3fc9eccd652c', '2020-07-25 09:02:36', '2020-07-25 09:02:36', null);
INSERT INTO `lin_file` VALUES ('6', '20200725/f96fa1061a5d68c88235a72611028a30.png', '1', 'f96fa1061a5d68c88235a72611028a30.png', '.png', '67898', 'f2900c5843256c4ce2971a73febd427a', '2020-07-25 09:03:02', '2020-07-25 09:03:02', null);
INSERT INTO `lin_file` VALUES ('7', '20200725/cf16cced0e107b86e1b34f438c3f40e0.jpg', '1', 'cf16cced0e107b86e1b34f438c3f40e0.jpg', '.jpg', '1587249', 'c065e6076eead62c54721153f4869dc1', '2020-07-25 09:16:37', '2020-07-25 09:16:37', null);
INSERT INTO `lin_file` VALUES ('8', '20200725/46144c0044614e1dae71eb29a7185a90.jpg', '1', '46144c0044614e1dae71eb29a7185a90.jpg', '.jpg', '19250', '21c3d472d9b7e5115411e0ede987dcb8', '2020-07-25 09:16:58', '2020-07-25 09:16:58', null);
INSERT INTO `lin_file` VALUES ('9', '20200725/27aa0e499aca1f404ff667f6e72b1e9c.jpg', '1', '27aa0e499aca1f404ff667f6e72b1e9c.jpg', '.jpg', '1708732', '32e09aa0e22a56749db862fc6c206f3f', '2020-07-25 09:17:32', '2020-07-25 09:17:32', null);
INSERT INTO `lin_file` VALUES ('10', '20200725/d4ca9d90590f54ea11a80fbfb4e68035.jpg', '1', 'd4ca9d90590f54ea11a80fbfb4e68035.jpg', '.jpg', '52952', '37f0ea4f213aeb20f70565e71ee91ad2', '2020-07-25 09:28:33', '2020-07-25 09:28:33', null);
INSERT INTO `lin_file` VALUES ('11', '20200725/7071bc43b8456d411ee04903e1df8fb7.png', '1', '7071bc43b8456d411ee04903e1df8fb7.png', '.png', '3047519', 'a0d2d9e223dd5eadf50c56bdc99108e9', '2020-07-25 09:32:36', '2020-07-25 09:32:36', null);
INSERT INTO `lin_file` VALUES ('12', '20200727/7695da5452464237e846717a83f367c5.jpg', '1', '7695da5452464237e846717a83f367c5.jpg', '.jpg', '198378', 'e39adb88c9e0ddd574717ea62ee98fad', '2020-07-27 18:54:56', '2020-07-27 18:54:56', null);
INSERT INTO `lin_file` VALUES ('13', '20200727/e2d55294df3bcaad9832ef33e7e7f4d8.jpg', '1', 'e2d55294df3bcaad9832ef33e7e7f4d8.jpg', '.jpg', '128774', '28a516a93d48fae21e2e5bfe0b009911', '2020-07-27 18:55:15', '2020-07-27 18:55:15', null);
INSERT INTO `lin_file` VALUES ('14', '20200727/05e8730daed99e36d3471911b4b92677.jpg', '1', '05e8730daed99e36d3471911b4b92677.jpg', '.jpg', '32447', '4147b0b0bea23bc360ef0d81d10e8510', '2020-07-27 18:55:53', '2020-07-27 18:55:53', null);
INSERT INTO `lin_file` VALUES ('15', '20200727/2bad06f88c08b64bc01d033ce59f47d6.jpg', '1', '2bad06f88c08b64bc01d033ce59f47d6.jpg', '.jpg', '191007', '2fb8e26c5d123d9015632606515b570a', '2020-07-27 18:56:57', '2020-07-27 18:56:57', null);
INSERT INTO `lin_file` VALUES ('16', '20200728/2a1ce2a933829136806fe90ea9b91f80.jpg', '1', '2a1ce2a933829136806fe90ea9b91f80.jpg', '.jpg', '458340', '7055b25ad11b4a403d2ea40701386f15', '2020-07-28 10:27:10', '2020-07-28 10:27:10', null);
INSERT INTO `lin_file` VALUES ('17', '20200729/794ee2e4abf858b427a2e25b43989ced.jpg', '1', '794ee2e4abf858b427a2e25b43989ced.jpg', '.jpg', '926410', 'a79bf80cb232c51eeafdcacc651566c2', '2020-07-29 15:52:35', '2020-07-29 15:52:35', null);
INSERT INTO `lin_file` VALUES ('18', '20200730/f8e9a36ed04f9f609e95683967911847.jpg', '1', 'f8e9a36ed04f9f609e95683967911847.jpg', '.jpg', '123772', '82a8985657bb1eabf437c5ef723aaf96', '2020-07-30 15:58:09', '2020-07-30 15:58:09', null);
INSERT INTO `lin_file` VALUES ('19', '20200730/97f4a8d8d0b08a78dac3337663831745.jpg', '1', '97f4a8d8d0b08a78dac3337663831745.jpg', '.jpg', '310331', 'c221d5f3a81d63d4d98973df37fb6849', '2020-07-30 16:00:42', '2020-07-30 16:00:42', null);
INSERT INTO `lin_file` VALUES ('20', '20200730/138513bb58f9758b4212a197127ee0e5.mp4', '1', '138513bb58f9758b4212a197127ee0e5.mp4', '.mp4', '46227', '262a6f94528d80f3ac1fcae44f5b1fa0', '2020-07-30 16:04:50', '2020-07-30 16:04:50', null);
INSERT INTO `lin_file` VALUES ('21', '20200730/f57e4bcc9c063a35fa8d338af942335f.jpg', '1', 'f57e4bcc9c063a35fa8d338af942335f.jpg', '.jpg', '42336', 'a363c4cf14e4181713960549fb45bf31', '2020-07-30 16:08:22', '2020-07-30 16:08:22', null);
INSERT INTO `lin_file` VALUES ('22', '20200730/5ddd82cef358d87b65cd6ee6cfcfcf64.jpg', '1', '5ddd82cef358d87b65cd6ee6cfcfcf64.jpg', '.jpg', '1649968', 'c3ef5e2e08128cc2cb65d6caf0391d54', '2020-07-30 16:09:11', '2020-07-30 16:09:11', null);
INSERT INTO `lin_file` VALUES ('23', '20200730/666ddafc04fad7540803c8697c3df0a6.jpg', '1', '666ddafc04fad7540803c8697c3df0a6.jpg', '.jpg', '135491', '981ebe604d3ae19f04fbc49fe2ce0fc8', '2020-07-30 16:09:53', '2020-07-30 16:09:53', null);
INSERT INTO `lin_file` VALUES ('24', '20200730/8f0327c34b89a9da7d79fe0c63cd3386.jpg', '1', '8f0327c34b89a9da7d79fe0c63cd3386.jpg', '.jpg', '168220', '122f77cc6dc981275705fb211db22510', '2020-07-30 16:10:08', '2020-07-30 16:10:08', null);
INSERT INTO `lin_file` VALUES ('25', '20200730/7aa175ea68e0e026147a6994980b28bf.jpg', '1', '7aa175ea68e0e026147a6994980b28bf.jpg', '.jpg', '175941', 'de14dd3375cfe568de14b027a1db7500', '2020-07-30 16:10:22', '2020-07-30 16:10:22', null);
INSERT INTO `lin_file` VALUES ('26', '20200730/33be899964bcaf24201f5b29261a3b5d.jpg', '1', '33be899964bcaf24201f5b29261a3b5d.jpg', '.jpg', '360421', 'e26c0dbcde9c847a752e03f8903789e2', '2020-07-30 16:10:54', '2020-07-30 16:10:54', null);
INSERT INTO `lin_file` VALUES ('27', '20200730/8ecd8df687c13dab49a6342a8aba1876.jpg', '1', '8ecd8df687c13dab49a6342a8aba1876.jpg', '.jpg', '71915', 'b99e90e7856a32e31614a885fe4f550c', '2020-07-30 16:15:51', '2020-07-30 16:15:51', null);
INSERT INTO `lin_file` VALUES ('28', '20200730/e5036e2a5ff6227c0a5b7eed5b7aaa97.jpg', '1', 'e5036e2a5ff6227c0a5b7eed5b7aaa97.jpg', '.jpg', '46420', '22c1127fb32d94ba687013556a19d8ee', '2020-07-30 16:18:13', '2020-07-30 16:18:13', null);
INSERT INTO `lin_file` VALUES ('29', '20200730/c4e70fb909b276bddcd057c3ea6e09a4.jpg', '1', 'c4e70fb909b276bddcd057c3ea6e09a4.jpg', '.jpg', '44669', 'edf35638fdabf6bdda1ab0b50adb3d7b', '2020-07-30 16:20:15', '2020-07-30 16:20:15', null);
INSERT INTO `lin_file` VALUES ('30', '20200730/f94948c3b67396fb0744cbeaadca12e9.jpg', '1', 'f94948c3b67396fb0744cbeaadca12e9.jpg', '.jpg', '43731', '1e01ac1daceca75f88cc50afbc17b816', '2020-07-30 16:21:35', '2020-07-30 16:21:35', null);
INSERT INTO `lin_file` VALUES ('31', '20200730/51c51a6a79e142d2c87509759f7b65f3.jpg', '1', '51c51a6a79e142d2c87509759f7b65f3.jpg', '.jpg', '852453', '0d4a731b3ca21ed99bb0824d08b97940', '2020-07-30 16:22:53', '2020-07-30 16:22:53', null);
INSERT INTO `lin_file` VALUES ('32', '20200731/bd019b8a7569eec8058cad863cb7f62e.mp4', '1', 'bd019b8a7569eec8058cad863cb7f62e.mp4', '.mp4', '1572640', 'a1b304f4e35c31b7f051224d9ca86158', '2020-07-31 16:53:14', '2020-07-31 16:53:14', null);
INSERT INTO `lin_file` VALUES ('33', '20200731/390f4776af9b90ccd90be5af96fe7f41.jpg', '1', '390f4776af9b90ccd90be5af96fe7f41.jpg', '.jpg', '6851837', '37ccd37b641e6175dbd000859e898187', '2020-07-31 20:35:59', '2020-07-31 20:35:59', null);
INSERT INTO `lin_file` VALUES ('34', '20200806/e0e4f3d85cfa17d00cf9064237cd7be1.png', '1', 'e0e4f3d85cfa17d00cf9064237cd7be1.png', '.png', '5136', '4f4b4a68397b4c5cc3c3c67705313755', '2020-08-06 10:02:08', '2020-08-06 10:02:08', null);
INSERT INTO `lin_file` VALUES ('35', '20200808/1a3b95d44b7b6817d50ab3e1d78df876.jpg', '1', '1a3b95d44b7b6817d50ab3e1d78df876.jpg', '.jpg', '155415', '8df0b9872295e6f8d2f88afc6aadd406', '2020-08-08 16:35:17', '2020-08-08 16:35:17', null);
INSERT INTO `lin_file` VALUES ('36', '20200903/7d65d8896096e7074922bb1caa0a32c9.jpg', '1', '7d65d8896096e7074922bb1caa0a32c9.jpg', '.jpg', '45971', 'bd907e51aaf0dcd69ac75b1f734c3485', '2020-09-03 16:51:50', '2020-09-03 16:51:50', null);
INSERT INTO `lin_file` VALUES ('37', '20200903/1c393963ae371a75152b4fcb438d5c9a.jpg', '1', '1c393963ae371a75152b4fcb438d5c9a.jpg', '.jpg', '33325', '90a99ff467349ee4d6ef6a6b278063d4', '2020-09-03 16:54:56', '2020-09-03 16:54:56', null);
INSERT INTO `lin_file` VALUES ('38', '20200903/dee67c8d21e1d52d77b2fb3f27dfe2a1.jpeg', '1', 'dee67c8d21e1d52d77b2fb3f27dfe2a1.jpeg', '.jpeg', '101878', 'd3556e7cc9ccbfaa13b5aacceb48bffc', '2020-09-03 17:13:55', '2020-09-03 17:13:55', null);
INSERT INTO `lin_file` VALUES ('39', '20200903/f2d3c86549f59f4b74d222eb500a4b26.png', '1', 'f2d3c86549f59f4b74d222eb500a4b26.png', '.png', '294393', '395c195773f6689fe14fbdbe46a78654', '2020-09-03 17:54:35', '2020-09-03 17:54:35', null);
INSERT INTO `lin_file` VALUES ('40', '20200903/22650adcf3bd76948276baca281853a5.png', '1', '22650adcf3bd76948276baca281853a5.png', '.png', '477166', 'ce0ce95f7576194143394514c63ae79b', '2020-09-03 17:57:07', '2020-09-03 17:57:07', null);
INSERT INTO `lin_file` VALUES ('41', '20200904/a62089d34269387cf5e4b9b04c3bc91b.jpeg', '1', 'a62089d34269387cf5e4b9b04c3bc91b.jpeg', '.jpeg', '135574', '57ec2a44b72d45baffb4dd3d9352ac61', '2020-09-04 09:42:25', '2020-09-04 09:42:25', null);
INSERT INTO `lin_file` VALUES ('42', '20200904/13cf5a8cba1b149222b58f3d8fadb85a.jpg', '1', '13cf5a8cba1b149222b58f3d8fadb85a.jpg', '.jpg', '197672', 'd59f5c8deaeca2ca85de7615c7da4553', '2020-09-04 09:47:17', '2020-09-04 09:47:17', null);
INSERT INTO `lin_file` VALUES ('43', '20200904/7957dac80bcc2136d3109359a2d42e16.jpg', '1', '7957dac80bcc2136d3109359a2d42e16.jpg', '.jpg', '242524', '58a3b1411a3e4c473de8aca6c938f277', '2020-09-04 09:52:36', '2020-09-04 09:52:36', null);
INSERT INTO `lin_file` VALUES ('44', '20200904/0ea58271f5b374f8fa47575761bdadc2.jpg', '1', '0ea58271f5b374f8fa47575761bdadc2.jpg', '.jpg', '197567', '52214e45fb04e77ea6ae466e3a0a70cf', '2020-09-04 09:54:32', '2020-09-04 09:54:32', null);
INSERT INTO `lin_file` VALUES ('45', '20200904/7b977d2f8c53db3aad053a3833f4fbcd.jpg', '1', '7b977d2f8c53db3aad053a3833f4fbcd.jpg', '.jpg', '14734', 'f6274c3e1b2af40c2fd9e91d8c139517', '2020-09-04 09:59:02', '2020-09-04 09:59:02', null);
INSERT INTO `lin_file` VALUES ('46', '20200904/9cba42a99237d04048e8ca019c319633.jpg', '1', '9cba42a99237d04048e8ca019c319633.jpg', '.jpg', '91831', '4518fa8ff9dd1e36c0df66c4687c2866', '2020-09-04 10:01:36', '2020-09-04 10:01:36', null);
INSERT INTO `lin_file` VALUES ('47', '20200904/c9e3a23a8cb989232af53fdd4b1f18aa.jpg', '1', 'c9e3a23a8cb989232af53fdd4b1f18aa.jpg', '.jpg', '200130', 'f6251b4df23a8f9b18befc8987972f0a', '2020-09-04 10:03:56', '2020-09-04 10:03:56', null);
INSERT INTO `lin_file` VALUES ('48', '20200904/d7cec7af18b3e6a2856a1ab153dd11dc.png', '1', 'd7cec7af18b3e6a2856a1ab153dd11dc.png', '.png', '1009686', '68c2b66f6ddf27ff8a5415484dd26e8f', '2020-09-04 10:27:54', '2020-09-04 10:27:54', null);
INSERT INTO `lin_file` VALUES ('49', '20201011/5f6a0100b4e335c05098df75682fbe44.png', '1', '5f6a0100b4e335c05098df75682fbe44.png', '.png', '139543', 'aa8833e784fa05233f67990eb93fcd99', '2020-10-11 15:55:46', '2020-10-11 15:55:46', null);
INSERT INTO `lin_file` VALUES ('50', '20201014/11264f6b92f15b67fd38fd3abf8bbc75.png', '1', '11264f6b92f15b67fd38fd3abf8bbc75.png', '.png', '13447', 'e2cd1bb572a1fac087600e3729474f51', '2020-10-14 09:37:00', '2020-10-14 09:37:00', null);

-- ----------------------------
-- Table structure for lin_group
-- ----------------------------
DROP TABLE IF EXISTS `lin_group`;
CREATE TABLE `lin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_group
-- ----------------------------
INSERT INTO `lin_group` VALUES ('1', '普通管理员', '普通管理员');
INSERT INTO `lin_group` VALUES ('8', '市场管理员', '负责市场业务');
INSERT INTO `lin_group` VALUES ('9', '财务客户端', '提供POS端登录用户-有缴费补单功能');
INSERT INTO `lin_group` VALUES ('10', '客服收银', '提供POS端登录用-日常收银');
INSERT INTO `lin_group` VALUES ('14', '管理员', '管理员');
INSERT INTO `lin_group` VALUES ('15', '食堂管理', '食堂管理');

-- ----------------------------
-- Table structure for lin_log
-- ----------------------------
DROP TABLE IF EXISTS `lin_log`;
CREATE TABLE `lin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(450) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `status_code` int(11) NOT NULL,
  `method` varchar(20) NOT NULL,
  `path` varchar(200) NOT NULL,
  `authority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2720 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_log
-- ----------------------------
INSERT INTO `lin_log` VALUES ('1', 'super登陆成功获取了令牌', '2020-09-09 10:11:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2', 'super登陆成功获取了令牌', '2020-09-09 11:31:27', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('3', 'kf01登陆成功获取了令牌', '2020-09-09 14:06:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('4', 'kf01登陆成功获取了令牌', '2020-09-09 14:07:58', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('5', 'kf01登陆成功获取了令牌', '2020-09-09 14:42:21', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('6', '2020-09-09 14:43:40:客户开卡:000006推送到消息队列成功', '2020-09-09 14:43:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_register', '');
INSERT INTO `lin_log` VALUES ('7', '2020-09-09 14:43:40:推送收费单:cc209ac8f26711eab28d5b2b953ac039推送到消息队列成功', '2020-09-09 14:43:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_register', '');
INSERT INTO `lin_log` VALUES ('45', 'super登陆成功获取了令牌', '2020-09-09 16:16:56', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('46', 'super登陆成功获取了令牌', '2020-09-09 16:17:14', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('47', '2020-09-09 16:19:47:推送水控机水卡消费账单:SKL20090916194728791433}推送到消息队列成功', '2020-09-09 16:19:47', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('48', 'super登陆成功获取了令牌', '2020-09-09 17:33:24', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('49', '2020-09-09 17:35:03:推送水控机水卡消费账单:SKL20090917350320483433}推送到消息队列成功', '2020-09-09 17:35:03', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('50', 'super登陆成功获取了令牌', '2020-09-09 17:35:30', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('51', '2020-09-09 17:52:15:推送水控机水卡消费账单:SKL20090917521514368433}推送到消息队列成功', '2020-09-09 17:52:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('52', '2020-09-09 17:52:59:推送水控机水卡消费账单:SKL20090917525931224433}推送到消息队列成功', '2020-09-09 17:52:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('53', 'kf01登陆成功获取了令牌', '2020-09-10 09:31:22', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('54', 'kf01登陆成功获取了令牌', '2020-09-10 09:39:37', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('55', 'kf01登陆成功获取了令牌', '2020-09-10 09:41:19', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('56', 'kf01登陆成功获取了令牌', '2020-09-10 09:41:48', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('57', 'kf01登陆成功获取了令牌', '2020-09-10 09:50:50', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('58', 'kf01登陆成功获取了令牌', '2020-09-10 09:52:14', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('59', 'kf01登陆成功获取了令牌', '2020-09-10 10:08:56', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('60', 'super登陆成功获取了令牌', '2020-09-10 10:11:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('61', 'super登陆成功获取了令牌', '2020-09-10 10:11:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('62', 'kf01登陆成功获取了令牌', '2020-09-10 10:18:29', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('63', 'kf01登陆成功获取了令牌', '2020-09-10 10:26:55', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('64', 'kf01登陆成功获取了令牌', '2020-09-10 10:35:58', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('65', 'kf01登陆成功获取了令牌', '2020-09-10 10:40:17', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('66', 'kf01登陆成功获取了令牌', '2020-09-10 10:43:26', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('67', 'kf01登陆成功获取了令牌', '2020-09-10 10:54:47', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('68', 'kf01登陆成功获取了令牌', '2020-09-10 10:57:20', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('69', 'kf01登陆成功获取了令牌', '2020-09-10 11:06:50', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('70', 'kf01登陆成功获取了令牌', '2020-09-10 11:08:30', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('71', 'kf01登陆成功获取了令牌', '2020-09-10 11:09:53', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('72', 'super登陆成功获取了令牌', '2020-09-10 11:11:08', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('73', 'kf01登陆成功获取了令牌', '2020-09-10 11:12:05', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('74', 'kf01登陆成功获取了令牌', '2020-09-10 11:14:20', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('75', 'kf01登陆成功获取了令牌', '2020-09-10 11:24:59', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('76', 'kf01登陆成功获取了令牌', '2020-09-10 11:28:19', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('77', 'kf01登陆成功获取了令牌', '2020-09-10 11:48:50', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('78', 'kf01登陆成功获取了令牌', '2020-09-10 11:54:38', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('80', 'kf01登陆成功获取了令牌', '2020-09-10 12:00:10', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('83', 'kf01登陆成功获取了令牌', '2020-09-10 13:43:17', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('84', 'kf01登陆成功获取了令牌', '2020-09-10 13:54:00', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('85', 'kf01登陆成功获取了令牌', '2020-09-10 13:55:09', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('86', 'kf01登陆成功获取了令牌', '2020-09-10 13:59:17', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('87', 'kf01登陆成功获取了令牌', '2020-09-10 14:08:12', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('88', 'kf01登陆成功获取了令牌', '2020-09-10 14:11:31', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('89', 'kf01登陆成功获取了令牌', '2020-09-10 14:12:26', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('90', 'kf01登陆成功获取了令牌', '2020-09-10 14:25:06', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('91', 'kf01登陆成功获取了令牌', '2020-09-10 14:37:59', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('92', 'kf01登陆成功获取了令牌', '2020-09-10 14:47:57', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('95', 'kf01登陆成功获取了令牌', '2020-09-10 14:52:41', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('96', 'kf01登陆成功获取了令牌', '2020-09-10 14:54:16', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('97', 'kf01登陆成功获取了令牌', '2020-09-10 15:03:18', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('98', 'kf01登陆成功获取了令牌', '2020-09-10 15:04:38', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('99', 'kf01登陆成功获取了令牌', '2020-09-10 15:10:51', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('100', 'kf01登陆成功获取了令牌', '2020-09-10 15:19:43', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('101', 'kf01登陆成功获取了令牌', '2020-09-10 15:31:33', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('102', 'kf01登陆成功获取了令牌', '2020-09-10 15:45:04', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('103', 'kf01登陆成功获取了令牌', '2020-09-10 15:53:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('104', 'kf01登陆成功获取了令牌', '2020-09-10 16:06:45', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('105', 'kf01登陆成功获取了令牌', '2020-09-10 16:25:19', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('106', 'kf01登陆成功获取了令牌', '2020-09-10 16:32:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('107', 'kf01登陆成功获取了令牌', '2020-09-11 09:57:04', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('108', 'kf01登陆成功获取了令牌', '2020-09-11 10:07:19', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('109', 'super登陆成功获取了令牌', '2020-09-11 10:12:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('110', 'kf01登陆成功获取了令牌', '2020-09-11 10:17:06', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('111', 'kf01登陆成功获取了令牌', '2020-09-11 10:28:08', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('112', 'kf01登陆成功获取了令牌', '2020-09-11 10:29:02', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('113', 'kf01登陆成功获取了令牌', '2020-09-11 10:33:24', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('114', 'kf01登陆成功获取了令牌', '2020-09-11 10:39:27', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('115', 'kf01登陆成功获取了令牌', '2020-09-11 10:53:58', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('116', 'kf01登陆成功获取了令牌', '2020-09-11 11:17:27', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('117', 'kf01登陆成功获取了令牌', '2020-09-11 11:21:54', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('118', 'kf01登陆成功获取了令牌', '2020-09-11 11:36:58', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('119', 'super登陆成功获取了令牌', '2020-09-11 11:56:13', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('120', 'kf01登陆成功获取了令牌', '2020-09-11 13:39:25', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('121', 'kf01登陆成功获取了令牌', '2020-09-11 13:49:42', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('122', 'kf01登陆成功获取了令牌', '2020-09-11 14:02:40', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('123', 'kf01登陆成功获取了令牌', '2020-09-11 14:12:34', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('124', 'kf01登陆成功获取了令牌', '2020-09-11 14:25:49', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('125', 'kf01登陆成功获取了令牌', '2020-09-11 14:29:41', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('126', 'kf01登陆成功获取了令牌', '2020-09-11 14:39:43', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('127', 'kf01登陆成功获取了令牌', '2020-09-11 14:55:01', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('128', 'kf01登陆成功获取了令牌', '2020-09-11 14:55:26', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('129', 'kf01登陆成功获取了令牌', '2020-09-11 14:56:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('130', 'kf01登陆成功获取了令牌', '2020-09-11 15:01:21', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('131', 'kf01登陆成功获取了令牌', '2020-09-11 15:18:25', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('132', 'kf01登陆成功获取了令牌', '2020-09-11 15:38:38', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('133', 'kf01登陆成功获取了令牌', '2020-09-11 15:41:51', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('134', 'kf01登陆成功获取了令牌', '2020-09-11 15:53:01', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('135', 'kf01登陆成功获取了令牌', '2020-09-11 15:56:02', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('136', 'kf01登陆成功获取了令牌', '2020-09-11 15:56:24', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('137', 'kf01登陆成功获取了令牌', '2020-09-11 17:04:19', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('138', 'super登陆成功获取了令牌', '2020-09-11 17:37:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('139', 'super登陆成功获取了令牌', '2020-09-12 09:23:01', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('140', 'super登陆成功获取了令牌', '2020-09-14 17:25:48', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('141', 'super登陆成功获取了令牌', '2020-09-15 11:40:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('142', 'super登陆成功获取了令牌', '2020-09-15 16:23:38', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('143', 'super登陆成功获取了令牌', '2020-09-15 16:40:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('144', 'super登陆成功获取了令牌', '2020-09-15 16:53:39', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('145', 'super登陆成功获取了令牌', '2020-09-15 16:56:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('146', 'tianhuan登陆成功获取了令牌', '2020-09-15 17:35:12', null, '4', 'tianhuan', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('147', 'super登陆成功获取了令牌', '2020-09-16 10:10:01', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('148', 'super登陆成功获取了令牌', '2020-09-16 10:29:40', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('149', 'super登陆成功获取了令牌', '2020-09-16 14:05:11', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('155', 'super登陆成功获取了令牌', '2020-09-16 16:10:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('156', 'super登陆成功获取了令牌', '2020-09-16 16:10:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('157', 'super登陆成功获取了令牌', '2020-09-16 16:10:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('158', 'super登陆成功获取了令牌', '2020-09-16 16:10:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('159', 'super登陆成功获取了令牌', '2020-09-16 16:10:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('174', 'super登陆成功获取了令牌', '2020-09-16 16:15:20', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('175', 'super登陆成功获取了令牌', '2020-09-16 16:15:30', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('230', 'super登陆成功获取了令牌', '2020-09-16 17:43:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('231', 'super登陆成功获取了令牌', '2020-09-16 17:50:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('232', 'super登陆成功获取了令牌', '2020-09-16 18:00:49', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('233', 'super登陆成功获取了令牌', '2020-09-16 18:05:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('234', 'super登陆成功获取了令牌', '2020-09-16 18:06:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('235', 'super登陆成功获取了令牌', '2020-09-16 22:38:04', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('236', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('237', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('238', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('239', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('240', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('241', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('242', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('243', 'Trying to get property \'take_time\' of non-object', '2020-09-17 00:20:00', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('244', 'super登陆成功获取了令牌', '2020-09-17 09:08:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('245', 'super登陆成功获取了令牌', '2020-09-17 09:14:27', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('246', 'super登陆成功获取了令牌', '2020-09-17 09:22:13', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('247', 'super登陆成功获取了令牌', '2020-09-17 09:33:44', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('248', 'super登陆成功获取了令牌', '2020-09-17 09:49:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('249', 'super登陆成功获取了令牌', '2020-09-17 11:24:40', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('250', 'super登陆成功获取了令牌', '2020-09-17 13:37:13', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('251', 'super创建了一个用户', '2020-09-17 13:39:28', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('254', 'super登陆成功获取了令牌', '2020-09-17 13:55:36', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('255', 'kf01登陆成功获取了令牌', '2020-09-17 14:05:56', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('256', '2020-09-17 14:09:03:推送收费单:493c55acf8ac11ea8d2ea3ad30769ea7推送到消息队列成功', '2020-09-17 14:09:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('257', '2020-09-17 14:13:08:推送收费单:db47607cf8ac11eaaf79e94586d3364d推送到消息队列成功', '2020-09-17 14:13:09', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('258', '2020-09-17 14:13:24:推送收费单:e4b1634cf8ac11eaa93f1dd0559eb78e推送到消息队列成功', '2020-09-17 14:13:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('259', '2020-09-17 14:13:43:推送收费单:effc3ecaf8ac11ea8c49cb6821512c78推送到消息队列成功', '2020-09-17 14:13:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('260', '2020-09-17 14:14:05:推送收费单:fcfda12cf8ac11ea915e0b76b536e30f推送到消息队列成功', '2020-09-17 14:14:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('261', '2020-09-17 14:14:22:推送收费单:073c01baf8ad11eaaf02b7ee0c00fc92推送到消息队列成功', '2020-09-17 14:14:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('262', 'super创建了一个用户', '2020-09-17 14:26:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('263', 'kf01登陆成功获取了令牌', '2020-09-17 14:32:15', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('264', 'super创建了一个用户', '2020-09-17 14:41:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('265', 'super登陆成功获取了令牌', '2020-09-17 14:54:55', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('266', 'super登陆成功获取了令牌', '2020-09-17 14:59:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('267', 'super登陆成功获取了令牌', '2020-09-17 15:43:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('268', 'super登陆成功获取了令牌', '2020-09-17 17:06:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('269', 'super登陆成功获取了令牌', '2020-09-17 17:09:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('270', 'super创建了一个用户', '2020-09-17 17:18:54', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('271', 'super创建了一个用户', '2020-09-17 17:21:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('272', '林奕妍01登陆成功获取了令牌', '2020-09-17 17:22:42', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('273', 'super登陆成功获取了令牌', '2020-09-17 17:27:54', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('274', 'super登陆成功获取了令牌', '2020-09-17 17:33:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('275', '2020-09-17 17:43:17:推送收费单:36c3eb9cf8ca11ea87d58b398b22f728推送到消息队列成功', '2020-09-17 17:43:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('276', '2020-09-17 17:46:22:推送收费单:a50f33eaf8ca11eaa2de3392cb95ce08推送到消息队列成功', '2020-09-17 17:46:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('277', '2020-09-17 18:10:54:推送收费单:128ca7a6f8ce11ea88c149bb04fc7ead推送到消息队列成功', '2020-09-17 18:10:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('278', '2020-09-17 18:15:12:推送收费单:ac23f18af8ce11eabed08f1e9adfa60c推送到消息队列成功', '2020-09-17 18:15:12', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('279', '2020-09-17 18:16:19:推送收费单:d45c0f7af8ce11ea8528af438890084b推送到消息队列成功', '2020-09-17 18:16:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('280', '2020-09-17 18:17:01:推送收费单:ed375dbaf8ce11eaabc4917d629c9631推送到消息队列成功', '2020-09-17 18:17:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('281', '2020-09-17 18:17:57:推送收费单:0edc3ee0f8cf11ea8765b5b994689215推送到消息队列成功', '2020-09-17 18:17:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('282', '2020-09-17 18:19:20:推送收费单:4050c20cf8cf11eaa7ed29996fc21e9a推送到消息队列成功', '2020-09-17 18:19:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('283', '2020-09-17 18:28:51:推送收费单:942b6926f8d011eab2bdff3f1b5851c1推送到消息队列成功', '2020-09-17 18:28:51', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('284', '2020-09-17 18:47:42:推送收费单:366af6aaf8d311ea907babf210920727推送到消息队列成功', '2020-09-17 18:47:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('285', '2020-09-17 18:50:33:推送收费单:9ca2bb10f8d311ea9db7b12f1a9b732e推送到消息队列成功', '2020-09-17 18:50:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('286', '2020-09-17 18:51:56:推送收费单:cdbcc6b4f8d311ea9bb48f60dcda2c0e推送到消息队列成功', '2020-09-17 18:51:56', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('287', '2020-09-17 18:53:04:推送收费单:f6a69136f8d311ea9b431b2a0a19e977推送到消息队列成功', '2020-09-17 18:53:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('288', '2020-09-17 18:54:02:推送收费单:18e80ccaf8d411ea98336f4ad7b77714推送到消息队列成功', '2020-09-17 18:54:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('289', '郑会云登陆成功获取了令牌', '2020-09-17 18:55:55', null, '13', '郑会云', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('290', '2020-09-17 18:56:12:推送收费单:66779c6cf8d411ea8c2b9bd7a924be44推送到消息队列成功', '2020-09-17 18:56:12', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('291', '2020-09-17 18:56:48:推送收费单:7bd7087cf8d411eaa660ed4eb6c8be14推送到消息队列成功', '2020-09-17 18:56:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('292', '郑会云登陆成功获取了令牌', '2020-09-17 18:57:03', null, '13', '郑会云', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('293', '郑会云01登陆成功获取了令牌', '2020-09-17 18:58:02', null, '19', '郑会云01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('294', '2020-09-17 18:59:21:推送收费单:d6e2224cf8d411eab99b4f3e08a1c97a推送到消息队列成功', '2020-09-17 18:59:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('295', '2020-09-17 19:00:00:推送收费单:ee813370f8d411eab4c60105ac5778d8推送到消息队列成功', '2020-09-17 19:00:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('296', '2020-09-17 19:00:38:推送收费单:0506065cf8d511eab8607f5c261189eb推送到消息队列成功', '2020-09-17 19:00:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('297', '2020-09-17 19:01:17:推送收费单:1c336c8ef8d511eabdece3d51a398ad2推送到消息队列成功', '2020-09-17 19:01:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('298', '2020-09-17 19:01:41:推送收费单:2ab28722f8d511ea966d2d139e61752a推送到消息队列成功', '2020-09-17 19:01:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('299', '2020-09-17 19:01:43:推送收费单:2bad036ef8d511ea82fd335c2dbc47ef推送到消息队列成功', '2020-09-17 19:01:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('300', '2020-09-17 19:02:08:推送收费单:3ae54238f8d511eab875a72497af1e13推送到消息队列成功', '2020-09-17 19:02:09', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('301', '2020-09-17 19:02:18:推送收费单:40c1b3bcf8d511ea9a33a7e4f65f8d98推送到消息队列成功', '2020-09-17 19:02:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('302', '2020-09-17 19:02:57:推送收费单:57be908af8d511eabe4dbf6d222263e1推送到消息队列成功', '2020-09-17 19:02:57', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('303', '2020-09-17 19:03:03:推送收费单:5b3b0702f8d511ea973fa523b64485d9推送到消息队列成功', '2020-09-17 19:03:03', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('304', '2020-09-17 19:03:22:推送收费单:66ab241ef8d511ea9f8a4988478a2189推送到消息队列成功', '2020-09-17 19:03:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('305', '2020-09-17 19:03:35:推送收费单:6e9ff528f8d511ea9ab9abe8ae84d208推送到消息队列成功', '2020-09-17 19:03:36', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('306', '2020-09-17 19:03:42:推送收费单:73071b5af8d511ea8cdc4dbaeeee3fd5推送到消息队列成功', '2020-09-17 19:03:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('307', '2020-09-17 19:03:59:推送收费单:7c9e63a8f8d511eab466694cbb277e34推送到消息队列成功', '2020-09-17 19:03:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('308', '2020-09-17 19:04:05:推送收费单:805f4552f8d511ea829a0be8b5c292f7推送到消息队列成功', '2020-09-17 19:04:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('309', '2020-09-17 19:04:24:推送收费单:8bd1ca0ef8d511eabab8d1acc80d6455推送到消息队列成功', '2020-09-17 19:04:25', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('310', '2020-09-17 19:04:43:推送收费单:97593ce0f8d511eaa0ab8952c5ec32b3推送到消息队列成功', '2020-09-17 19:04:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('311', '2020-09-17 19:04:46:推送收费单:98d577a0f8d511eab96fa9d1f6ce654c推送到消息队列成功', '2020-09-17 19:04:46', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('312', '2020-09-17 19:05:19:推送收费单:ac5d00e0f8d511ea9c5df977bc3e3440推送到消息队列成功', '2020-09-17 19:05:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('313', '2020-09-17 19:05:36:推送收费单:b6f32278f8d511ea9a94db13e8a0fdae推送到消息队列成功', '2020-09-17 19:05:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('314', '2020-09-17 19:06:45:推送收费单:df9cca76f8d511ea93496321a714b595推送到消息队列成功', '2020-09-17 19:06:45', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('315', '2020-09-17 19:07:29:推送收费单:f9cbc6aef8d511eaba110b71224dba4f推送到消息队列成功', '2020-09-17 19:07:29', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('316', 'super登陆成功获取了令牌', '2020-09-17 19:08:00', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('317', '2020-09-17 19:08:00:推送收费单:0ca9bbbef8d611ea81ec9363524c1ca2推送到消息队列成功', '2020-09-17 19:08:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('318', '2020-09-17 19:08:35:推送收费单:213f1448f8d611ea822cb59ae6cd23fc推送到消息队列成功', '2020-09-17 19:08:35', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('319', '2020-09-17 19:09:40:推送收费单:485356fcf8d611ea867f970516be392d推送到消息队列成功', '2020-09-17 19:09:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('320', '2020-09-17 19:10:47:推送收费单:6fe365eaf8d611eab5b9f103068743b3推送到消息队列成功', '2020-09-17 19:10:47', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('321', '2020-09-17 19:11:04:推送收费单:7a79858ef8d611ea9d83f9cc3c4611b7推送到消息队列成功', '2020-09-17 19:11:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('322', '2020-09-17 19:11:23:推送收费单:85650c0cf8d611eabb3c7769fa1b3ed1推送到消息队列成功', '2020-09-17 19:11:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('323', '2020-09-17 19:11:42:推送收费单:90b2ad6cf8d611eaba72a15044e59c83推送到消息队列成功', '2020-09-17 19:11:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('324', '2020-09-17 19:11:43:推送收费单:9165c96af8d611ea948af327d70ff74f推送到消息队列成功', '2020-09-17 19:11:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('325', '2020-09-17 19:11:59:推送收费单:9b1a7190f8d611ea83119191cf756432推送到消息队列成功', '2020-09-17 19:12:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('326', '2020-09-17 19:12:16:推送收费单:a565e364f8d611eaaee5f9d22dfcf027推送到消息队列成功', '2020-09-17 19:12:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('327', '2020-09-17 19:12:24:推送收费单:a9ca7b68f8d611eabe6d15095299af91推送到消息队列成功', '2020-09-17 19:12:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('328', '2020-09-17 19:12:36:推送收费单:b1497c72f8d611ea94bd7b364e32dc68推送到消息队列成功', '2020-09-17 19:12:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('329', '2020-09-17 19:12:54:推送收费单:bbe526e0f8d611ea86b82547953d24b7推送到消息队列成功', '2020-09-17 19:12:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('330', '2020-09-17 19:13:18:推送收费单:c9c7eee6f8d611eaa6a5b14cceeffdd4推送到消息队列成功', '2020-09-17 19:13:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('331', '2020-09-17 19:14:01:推送收费单:e3f8509ef8d611ea8ed895c85a3b95b7推送到消息队列成功', '2020-09-17 19:14:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('332', '2020-09-17 19:14:05:推送收费单:e5dc3830f8d611eaa19805ef65bc2f3c推送到消息队列成功', '2020-09-17 19:14:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('333', '2020-09-17 19:14:20:推送收费单:ef152376f8d611eab6807b5260e5a9b4推送到消息队列成功', '2020-09-17 19:14:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('334', '2020-09-17 19:14:36:推送收费单:f8484a18f8d611ea8130615fe4487c60推送到消息队列成功', '2020-09-17 19:14:36', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('335', '2020-09-17 19:14:54:推送收费单:0354f460f8d711eabd07ff4e92956c28推送到消息队列成功', '2020-09-17 19:14:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('336', '2020-09-17 19:15:20:推送收费单:128c6bfcf8d711eaa4293de3afdca0df推送到消息队列成功', '2020-09-17 19:15:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('337', '2020-09-17 19:15:36:推送收费单:1c6a9b58f8d711ea82f14d99be01a1dd推送到消息队列成功', '2020-09-17 19:15:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('338', '2020-09-17 19:15:45:推送收费单:21975e2cf8d711ea92abd79f172f898d推送到消息队列成功', '2020-09-17 19:15:45', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('339', '2020-09-17 19:16:15:推送收费单:33447ba0f8d711eaaf8c3d0c3db3a534推送到消息队列成功', '2020-09-17 19:16:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('340', '2020-09-17 19:16:54:推送收费单:4a96b6f6f8d711eaa9ac1d70f7158e5e推送到消息队列成功', '2020-09-17 19:16:54', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('341', '2020-09-17 19:17:26:推送收费单:5e0b34f0f8d711ea87cacff0dd792e14推送到消息队列成功', '2020-09-17 19:17:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('342', '2020-09-17 19:18:20:推送收费单:7e292918f8d711eaae42dde33e3bdd3a推送到消息队列成功', '2020-09-17 19:18:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('343', '2020-09-17 19:18:34:推送收费单:8623b570f8d711eaae70093acb27a2bb推送到消息队列成功', '2020-09-17 19:18:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('344', '2020-09-17 19:18:38:推送收费单:88deebc2f8d711ea93cd8d4fd25ea08f推送到消息队列成功', '2020-09-17 19:18:39', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('345', '2020-09-17 19:19:03:推送收费单:97eed80cf8d711ea88fc6f967ad68a5e推送到消息队列成功', '2020-09-17 19:19:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('346', '2020-09-17 19:19:19:推送收费单:a1161a76f8d711ea94fb5dd5b08e86a9推送到消息队列成功', '2020-09-17 19:19:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('347', '2020-09-17 19:20:01:推送收费单:ba0afe8ef8d711eaabe555ca9d2d6c90推送到消息队列成功', '2020-09-17 19:20:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('348', '2020-09-17 19:20:47:推送收费单:d58cd510f8d711eabe6d0bf5b5c60f1a推送到消息队列成功', '2020-09-17 19:20:47', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('349', '2020-09-17 19:21:04:消息通知成功推送到消息队列成功', '2020-09-17 19:21:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('350', '2020-09-17 19:23:38:推送收费单:3b8e5582f8d811ea96d629f34b756a3b推送到消息队列成功', '2020-09-17 19:23:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('351', '2020-09-17 19:23:45:推送收费单:3fdafafaf8d811ea9d355b717e0e685e推送到消息队列成功', '2020-09-17 19:23:46', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('352', '2020-09-17 19:23:58:推送收费单:4771d04af8d811ea92dd6fabcfd7df83推送到消息队列成功', '2020-09-17 19:23:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('353', '2020-09-17 19:24:15:推送收费单:51cb1a10f8d811ea826f7f3827629ff1推送到消息队列成功', '2020-09-17 19:24:16', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('354', '2020-09-17 19:26:43:推送收费单:aa102f4ef8d811ea965819a43950cf53推送到消息队列成功', '2020-09-17 19:26:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('355', '2020-09-17 19:27:41:推送收费单:cc959a54f8d811ea8091b1ca9d2e96f6推送到消息队列成功', '2020-09-17 19:27:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('356', '2020-09-17 19:28:27:推送收费单:e7968778f8d811ea8518871163bdda92推送到消息队列成功', '2020-09-17 19:28:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('357', '2020-09-17 19:28:38:推送收费单:ee409ec4f8d811ea98caa9bb759d7d8a推送到消息队列成功', '2020-09-17 19:28:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('358', '2020-09-17 19:28:52:推送收费单:f67cf1aaf8d811eaa68cc7a709e67990推送到消息队列成功', '2020-09-17 19:28:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('359', '2020-09-17 19:29:04:推送收费单:fe2f6586f8d811ea93acd50d4c679b08推送到消息队列成功', '2020-09-17 19:29:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('360', '2020-09-17 19:29:22:推送收费单:088dbdfcf8d911eaa7f82382bdd1a480推送到消息队列成功', '2020-09-17 19:29:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('361', '2020-09-17 19:29:45:推送收费单:1647e8a0f8d911eabc6d539eb009ec66推送到消息队列成功', '2020-09-17 19:29:45', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('362', '2020-09-17 19:30:01:推送收费单:200a3816f8d911eab781b7dacac87b59推送到消息队列成功', '2020-09-17 19:30:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('363', '2020-09-17 19:30:35:推送收费单:3473b868f8d911ea9a20818185f96254推送到消息队列成功', '2020-09-17 19:30:36', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('364', '2020-09-17 19:30:49:推送收费单:3c7490dcf8d911ea910f11a3faffab2c推送到消息队列成功', '2020-09-17 19:30:49', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('365', '2020-09-17 19:31:00:推送收费单:42fa33bcf8d911ea96c90b12a8332b14推送到消息队列成功', '2020-09-17 19:31:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('366', '2020-09-17 19:31:18:推送收费单:4db86dbef8d911eab2432b261d585da2推送到消息队列成功', '2020-09-17 19:31:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('367', '2020-09-17 19:31:54:推送收费单:6362293ef8d911eaa8e4a5ed87d507b2推送到消息队列成功', '2020-09-17 19:31:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('368', '2020-09-17 19:32:07:推送收费单:6afbaa4ef8d911ea87f427ec71112ffb推送到消息队列成功', '2020-09-17 19:32:07', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('369', '2020-09-17 19:32:29:推送收费单:783c9a24f8d911ea841b119d7ecee94c推送到消息队列成功', '2020-09-17 19:32:30', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('370', '2020-09-17 19:32:42:推送收费单:7fa6d39cf8d911eabb17dfd404b022e4推送到消息队列成功', '2020-09-17 19:32:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('371', '2020-09-17 19:32:52:推送收费单:86080ee0f8d911ea8fc4bd9b75fc65b7推送到消息队列成功', '2020-09-17 19:32:53', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('372', '2020-09-17 19:33:22:推送收费单:97a7a1e2f8d911ea89e17309c03578db推送到消息队列成功', '2020-09-17 19:33:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('373', '2020-09-17 19:33:23:推送收费单:9816d364f8d911eabd498bb9c6135572推送到消息队列成功', '2020-09-17 19:33:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('374', '2020-09-17 19:33:40:推送收费单:a2aee820f8d911eabf0f593bf728c943推送到消息队列成功', '2020-09-17 19:33:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('375', '2020-09-17 19:33:59:推送收费单:ad824e9af8d911ea95dedde9886d4c07推送到消息队列成功', '2020-09-17 19:33:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('376', '2020-09-17 19:34:16:推送收费单:b7ad4366f8d911ea9773f517b0ef50ac推送到消息队列成功', '2020-09-17 19:34:16', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('377', '2020-09-17 19:35:20:推送收费单:de1c6f0ef8d911ea953983861c53a22d推送到消息队列成功', '2020-09-17 19:35:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('378', '2020-09-17 19:35:31:推送收费单:e4aa0aa2f8d911ea89cbbd6dd3c314e9推送到消息队列成功', '2020-09-17 19:35:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('379', '2020-09-17 19:36:15:推送收费单:fe88c1d4f8d911ea8afe077687b2e44e推送到消息队列成功', '2020-09-17 19:36:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('380', '2020-09-17 19:36:30:推送收费单:07db8be0f8da11eaa4919ff89dc88c89推送到消息队列成功', '2020-09-17 19:36:31', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('381', '2020-09-17 19:36:48:推送收费单:12591e66f8da11eab5130f5c6de94b44推送到消息队列成功', '2020-09-17 19:36:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('382', '2020-09-17 19:37:25:推送收费单:2850e410f8da11ea896e3354ea27e5d4推送到消息队列成功', '2020-09-17 19:37:25', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('383', '2020-09-17 19:37:37:推送收费单:2faefbcaf8da11eab7c94fa3092e49d2推送到消息队列成功', '2020-09-17 19:37:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('384', '2020-09-17 19:37:54:推送收费单:39fbfcc2f8da11ea9ca2e735137d501f推送到消息队列成功', '2020-09-17 19:37:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('385', '2020-09-17 19:37:57:推送收费单:3b8b0984f8da11ea815be79a6ab82ed2推送到消息队列成功', '2020-09-17 19:37:57', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('386', '2020-09-17 19:38:19:推送收费单:4878abb0f8da11ea91da8d62b450423f推送到消息队列成功', '2020-09-17 19:38:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('387', '2020-09-17 19:38:34:推送收费单:516a1222f8da11eaa09c71edceb8e2dd推送到消息队列成功', '2020-09-17 19:38:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('388', '2020-09-17 19:38:39:推送收费单:54eaf2d6f8da11eabdd3634085d78e1e推送到消息队列成功', '2020-09-17 19:38:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('389', '2020-09-17 19:39:17:推送收费单:6b906a02f8da11eaa99ad1cacc312157推送到消息队列成功', '2020-09-17 19:39:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('390', '2020-09-17 19:39:18:推送收费单:6b9fc880f8da11ea92433f75890b593b推送到消息队列成功', '2020-09-17 19:39:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('391', '2020-09-17 19:39:41:推送收费单:79aa72f4f8da11ea9f2b43c03ef2c7b3推送到消息队列成功', '2020-09-17 19:39:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('392', '2020-09-17 19:39:53:推送收费单:810c1534f8da11ea82cd1ba024f83e4e推送到消息队列成功', '2020-09-17 19:39:54', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('393', '2020-09-17 19:40:07:推送收费单:88d71b06f8da11eab202c503e1b98c70推送到消息队列成功', '2020-09-17 19:40:07', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('394', '2020-09-17 19:40:19:推送收费单:907b5c28f8da11eab18bfdeee10e5d7a推送到消息队列成功', '2020-09-17 19:40:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('395', '杨育金登陆成功获取了令牌', '2020-09-17 19:40:39', null, '15', '杨育金', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('396', '2020-09-17 19:40:39:推送收费单:9c3eb6b8f8da11ea8c253f9927cee936推送到消息队列成功', '2020-09-17 19:40:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('397', '2020-09-17 19:40:47:推送收费单:a0a95488f8da11eab040270f23a6cfb5推送到消息队列成功', '2020-09-17 19:40:47', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('398', '2020-09-17 19:40:59:推送收费单:a826a7d8f8da11eaa4b3f5dbe74d30fb推送到消息队列成功', '2020-09-17 19:41:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('399', '2020-09-17 19:41:16:推送收费单:b2507f36f8da11eaa9c8b91e0d625a4d推送到消息队列成功', '2020-09-17 19:41:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('400', '2020-09-17 19:41:53:推送收费单:c80aa3c4f8da11eaa750c317adc627d3推送到消息队列成功', '2020-09-17 19:41:53', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('401', '杨育金登陆成功获取了令牌', '2020-09-17 19:42:24', null, '15', '杨育金', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('402', '2020-09-17 19:42:23:推送收费单:da41531cf8da11ea85cc73ba527be081推送到消息队列成功', '2020-09-17 19:42:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('403', '杨育金登陆成功获取了令牌', '2020-09-17 19:42:42', null, '15', '杨育金', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('404', '2020-09-17 19:42:45:推送收费单:e704a57cf8da11ea8ba2a1323132faf2推送到消息队列成功', '2020-09-17 19:42:45', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('405', '2020-09-17 19:42:55:推送收费单:ed160e92f8da11eab6861f9ee792108f推送到消息队列成功', '2020-09-17 19:42:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('406', 'super登陆成功获取了令牌', '2020-09-17 19:43:04', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('407', 'super登陆成功获取了令牌', '2020-09-17 19:43:37', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('408', '杨育金登陆成功获取了令牌', '2020-09-17 19:43:54', null, '15', '杨育金', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('409', '2020-09-17 19:43:57:推送收费单:11fd837af8db11eaa8c0812f7d8daabf推送到消息队列成功', '2020-09-17 19:43:57', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('410', '2020-09-17 19:44:42:推送收费单:2cd1ff5af8db11eaa9616d6f5b089189推送到消息队列成功', '2020-09-17 19:44:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('411', '2020-09-17 19:45:01:推送收费单:3850aeb2f8db11ea834ddbc0ff27e802推送到消息队列成功', '2020-09-17 19:45:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('412', '2020-09-17 19:45:23:推送收费单:45a98a20f8db11ea8fdd65654b720779推送到消息队列成功', '2020-09-17 19:45:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('413', '2020-09-17 19:45:32:推送收费单:4ac5ead0f8db11ea8a9b954b385b6be7推送到消息队列成功', '2020-09-17 19:45:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('414', '2020-09-17 19:46:00:推送收费单:5bbecd98f8db11eab25981a143f9d0db推送到消息队列成功', '2020-09-17 19:46:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('415', '杨育金登陆成功获取了令牌', '2020-09-17 19:46:05', null, '15', '杨育金', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('416', '2020-09-17 19:46:15:推送收费单:6433618cf8db11ea9666b3f8910e23b5推送到消息队列成功', '2020-09-17 19:46:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('417', '2020-09-17 19:46:22:推送收费单:68c91692f8db11eaa94c03e27c74cd03推送到消息队列成功', '2020-09-17 19:46:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('418', '2020-09-17 19:46:32:推送收费单:6e75c928f8db11ea9bae75dacbcf8e3e推送到消息队列成功', '2020-09-17 19:46:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('419', '2020-09-17 19:46:44:推送收费单:757bd76cf8db11ea9e086f516567c0e5推送到消息队列成功', '2020-09-17 19:46:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('420', '2020-09-17 19:47:04:推送收费单:816a6f52f8db11ea93948bbe58e10818推送到消息队列成功', '2020-09-17 19:47:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('421', '2020-09-17 19:47:15:推送收费单:8811b7caf8db11eaa222475562e1b01b推送到消息队列成功', '2020-09-17 19:47:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('422', '2020-09-17 19:47:19:推送收费单:8a636708f8db11eabf3dcb7975de2085推送到消息队列成功', '2020-09-17 19:47:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('423', '2020-09-17 19:47:33:推送收费单:9333e704f8db11eabfd92913d25db65d推送到消息队列成功', '2020-09-17 19:47:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('424', '2020-09-17 19:47:52:推送收费单:9e268a7cf8db11ea9ec6318fafafc781推送到消息队列成功', '2020-09-17 19:47:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('425', '2020-09-17 19:48:03:推送收费单:a4f3fe16f8db11eaa01bb1e6306cae2f推送到消息队列成功', '2020-09-17 19:48:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('426', '2020-09-17 19:48:31:推送收费单:b5acb752f8db11eab6a3fd771ddb5866推送到消息队列成功', '2020-09-17 19:48:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('427', '2020-09-17 19:49:11:推送收费单:cd774744f8db11ea837e2f7746f4bd91推送到消息队列成功', '2020-09-17 19:49:12', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('428', '2020-09-17 19:49:50:推送收费单:e4af67a2f8db11eaad9eff2ed6ea192a推送到消息队列成功', '2020-09-17 19:49:51', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('429', '2020-09-17 19:49:51:推送收费单:e53f5042f8db11eaa8eb3d2d4cdd62d0推送到消息队列成功', '2020-09-17 19:49:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('430', '2020-09-17 19:50:15:推送收费单:f39ceb86f8db11eaba6a97bf826f6630推送到消息队列成功', '2020-09-17 19:50:16', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('431', '2020-09-17 19:50:34:推送收费单:fea7341ef8db11eab4139ddbe2af155c推送到消息队列成功', '2020-09-17 19:50:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('433', 'super登陆成功获取了令牌', '2020-09-17 19:54:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('434', '2020-09-17 20:02:19:推送收费单:a2e6c6a6f8dd11eab0702b76c1a0e20d推送到消息队列成功', '2020-09-17 20:02:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('435', '2020-09-17 20:03:52:推送收费单:da5d816af8dd11ea84f1977629bbd9e2推送到消息队列成功', '2020-09-17 20:03:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('436', '2020-09-17 20:12:57:推送收费单:1f1365f8f8df11ea9f3999bd2a32bd9c推送到消息队列成功', '2020-09-17 20:12:57', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('437', '2020-09-17 20:14:43:推送收费单:5e441ff6f8df11ea8670dfaae04d8322推送到消息队列成功', '2020-09-17 20:14:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('438', '2020-09-17 20:22:36:消息通知成功推送到消息队列成功', '2020-09-17 20:22:36', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('439', 'super登陆成功获取了令牌', '2020-09-17 20:23:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('440', '2020-09-17 20:24:32:消息通知成功推送到消息队列成功', '2020-09-17 20:24:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('441', '2020-09-17 20:25:06:消息通知成功推送到消息队列成功', '2020-09-17 20:25:07', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('442', '2020-09-17 20:25:36:消息通知成功推送到消息队列成功', '2020-09-17 20:25:36', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('443', '2020-09-17 20:26:18:消息通知成功推送到消息队列成功', '2020-09-17 20:26:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('444', '2020-09-17 20:29:10:推送收费单:62f90564f8e111ea9011f7973d0bec79推送到消息队列成功', '2020-09-17 20:29:10', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('445', 'kf01登陆成功获取了令牌', '2020-09-17 20:31:27', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('446', '2020-09-17 20:32:41:推送收费单:e14c6050f8e111ea954ba307d23730a8推送到消息队列成功', '2020-09-17 20:32:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('447', '2020-09-17 20:45:46:更新合同ID:1774,状态3推送到消息队列成功', '2020-09-17 20:45:47', null, '-1', '系统任务', '200', 'PUT', 'api/v1/manager/exec/3ae99dbef8e011eaba427f7fadb8f62a', '');
INSERT INTO `lin_log` VALUES ('448', '2020-09-17 20:45:46:商户入驻成功推送到消息队列成功', '2020-09-17 20:45:47', null, '-1', '系统任务', '200', 'PUT', 'api/v1/manager/exec/3ae99dbef8e011eaba427f7fadb8f62a', '');
INSERT INTO `lin_log` VALUES ('449', 'super登陆成功获取了令牌', '2020-09-17 20:46:55', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('450', 'kf01登陆成功获取了令牌', '2020-09-17 21:00:29', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('451', 'kf01登陆成功获取了令牌', '2020-09-17 21:09:06', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('452', 'kf01登陆成功获取了令牌', '2020-09-17 21:12:00', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('453', 'kf01登陆成功获取了令牌', '2020-09-17 21:20:00', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('454', 'kf01登陆成功获取了令牌', '2020-09-17 21:31:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('455', 'kf01登陆成功获取了令牌', '2020-09-17 21:32:30', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('456', 'kf01登陆成功获取了令牌', '2020-09-17 21:34:19', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('457', 'kf01登陆成功获取了令牌', '2020-09-17 21:44:12', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('458', 'kf01登陆成功获取了令牌', '2020-09-17 21:46:09', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('459', '2020-09-17 21:53:33:客户开卡:000922推送到消息队列成功', '2020-09-17 21:53:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_register', '');
INSERT INTO `lin_log` VALUES ('460', '2020-09-17 21:53:33:推送收费单:2d42063af8ed11eab95647c03b00d111推送到消息队列成功', '2020-09-17 21:53:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_register', '');
INSERT INTO `lin_log` VALUES ('461', '2020-09-17 21:55:09:推送水控机水卡消费账单:SKL20091721550991155433}推送到消息队列成功', '2020-09-17 21:55:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('462', '2020-09-17 21:55:18:推送水控机水卡消费账单:SKL20091721551806952433}推送到消息队列成功', '2020-09-17 21:55:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('463', '2020-09-17 21:56:01:推送水控机水卡消费账单:SKL20091721560113586433}推送到消息队列成功', '2020-09-17 21:56:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('464', 'super登陆成功获取了令牌', '2020-09-17 21:59:37', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('465', '2020-09-17 22:29:13:推送收费单:284bcc24f8f211eabd150d7ee1e92709推送到消息队列成功', '2020-09-17 22:29:13', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('466', '2020-09-17 22:34:25:推送收费单:e24d64e8f8f211ea95d571d88ca3cdd0推送到消息队列成功', '2020-09-17 22:34:25', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('467', '2020-09-17 22:37:58:推送收费单:61ae56caf8f311ea846475fd8d9e85ca推送到消息队列成功', '2020-09-17 22:37:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('468', '2020-09-17 22:43:37:推送收费单:2ba4a7b8f8f411ea980b418e446c0e1d推送到消息队列成功', '2020-09-17 22:43:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('469', 'Trying to get property \'take_time\' of non-object', '2020-09-18 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('470', 'Trying to get property \'take_time\' of non-object', '2020-09-18 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('471', 'Trying to get property \'take_time\' of non-object', '2020-09-18 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('472', 'Trying to get property \'take_time\' of non-object', '2020-09-18 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('473', '2020-09-18 08:00:01:账单推送:SDL20091808000100730433推送到消息队列成功', '2020-09-18 08:00:01', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('474', '林奕妍01登陆成功获取了令牌', '2020-09-18 09:05:48', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('475', 'super登陆成功获取了令牌', '2020-09-18 09:06:13', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('476', '林奕妍01登陆成功获取了令牌', '2020-09-18 09:24:21', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('477', '郑会云01登陆成功获取了令牌', '2020-09-18 09:25:30', null, '19', '郑会云01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('478', '林晓晖01登陆成功获取了令牌', '2020-09-18 09:29:12', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('479', 'super登陆成功获取了令牌', '2020-09-18 09:43:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('480', '林奕妍01登陆成功获取了令牌', '2020-09-18 10:00:51', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('481', 'super登陆成功获取了令牌', '2020-09-18 10:06:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('482', 'kfadmin登陆成功获取了令牌', '2020-09-18 10:09:33', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('483', '杨育金01登陆成功获取了令牌', '2020-09-18 10:11:09', null, '21', '杨育金01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('484', '林晓晖01登陆成功获取了令牌', '2020-09-18 10:12:03', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('485', '林晓晖01登陆成功获取了令牌', '2020-09-18 10:15:22', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('486', '2020-09-18 10:17:12:更新合同ID:1774,状态3推送到消息队列成功', '2020-09-18 10:17:13', null, '-1', '系统任务', '200', 'PUT', 'api/v1/manager/exec/3ae99dbef8e011eaba427f7fadb8f62a', '');
INSERT INTO `lin_log` VALUES ('487', '2020-09-18 10:17:12:商户入驻成功推送到消息队列成功', '2020-09-18 10:17:13', null, '-1', '系统任务', '200', 'PUT', 'api/v1/manager/exec/3ae99dbef8e011eaba427f7fadb8f62a', '');
INSERT INTO `lin_log` VALUES ('488', '2020-09-18 10:18:04:更新合同ID:1774,状态3推送到消息队列成功', '2020-09-18 10:18:04', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/exec/3ae99dbef8e011eaba427f7fadb8f62a', '');
INSERT INTO `lin_log` VALUES ('489', '2020-09-18 10:18:04:商户入驻成功推送到消息队列成功', '2020-09-18 10:18:04', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/exec/3ae99dbef8e011eaba427f7fadb8f62a', '');
INSERT INTO `lin_log` VALUES ('490', '林奕妍01登陆成功获取了令牌', '2020-09-18 10:44:12', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('491', '林奕妍01登陆成功获取了令牌', '2020-09-18 10:49:28', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('492', '2020-09-18 10:51:28:推送收费单:d952c574f95911eab1df8547da7b983d推送到消息队列成功', '2020-09-18 10:51:28', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('493', '2020-09-18 10:53:38:推送收费单:26e31fbef95a11ea88caa7fa2bbf259a推送到消息队列成功', '2020-09-18 10:53:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('494', '2020-09-18 10:56:00:推送收费单:7be3950cf95a11eaa9807b52b6a6d2ec推送到消息队列成功', '2020-09-18 10:56:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('495', '郑会云01登陆成功获取了令牌', '2020-09-18 11:08:21', null, '19', '郑会云01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('496', 'kfadmin登陆成功获取了令牌', '2020-09-18 11:10:33', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('497', '郑会云01登陆成功获取了令牌', '2020-09-18 11:24:51', null, '19', '郑会云01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('498', 'kf01登陆成功获取了令牌', '2020-09-18 11:25:33', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('499', '林奕妍01登陆成功获取了令牌', '2020-09-18 11:26:34', null, '23', '林奕妍01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('500', '2020-09-18 11:27:28:推送收费单:e0e2f93af95e11ea877717d7f26b8e85推送到消息队列成功', '2020-09-18 11:27:28', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('501', 'kfadmin登陆成功获取了令牌', '2020-09-18 11:27:29', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('502', '郑会云01登陆成功获取了令牌', '2020-09-18 11:38:09', null, '19', '郑会云01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('503', '林晓晖01登陆成功获取了令牌', '2020-09-18 11:39:04', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('504', 'kfadmin登陆成功获取了令牌', '2020-09-18 11:48:45', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('505', '郑会云01登陆成功获取了令牌', '2020-09-18 11:52:20', null, '19', '郑会云01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('506', 'super登陆成功获取了令牌', '2020-09-18 12:12:18', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('507', 'super登陆成功获取了令牌', '2020-09-18 12:21:49', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('508', 'kfadmin登陆成功获取了令牌', '2020-09-18 12:48:45', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('509', 'super登陆成功获取了令牌', '2020-09-18 12:49:33', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('510', '2020-09-18 12:58:55:消息通知成功推送到消息队列成功', '2020-09-18 12:58:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('511', 'super登陆成功获取了令牌', '2020-09-18 13:27:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('512', 'super登陆成功获取了令牌', '2020-09-18 13:38:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('513', 'kfadmin登陆成功获取了令牌', '2020-09-18 13:47:45', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('514', 'super登陆成功获取了令牌', '2020-09-18 14:23:13', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('515', 'kf01登陆成功获取了令牌', '2020-09-18 14:47:24', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('516', 'super登陆成功获取了令牌', '2020-09-18 15:26:50', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('517', 'super登陆成功获取了令牌', '2020-09-18 16:19:03', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('518', 'super登陆成功获取了令牌', '2020-09-18 17:46:38', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('519', 'super登陆成功获取了令牌', '2020-09-19 09:41:11', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('520', 'super登陆成功获取了令牌', '2020-09-19 09:41:56', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('521', '林晓晖01登陆成功获取了令牌', '2020-09-19 11:08:29', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('534', 'Trying to get property \'take_time\' of non-object', '2020-09-19 17:08:56', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('535', 'Trying to get property \'take_time\' of non-object', '2020-09-19 17:08:56', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('536', 'Trying to get property \'take_time\' of non-object', '2020-09-19 17:08:56', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('537', 'Trying to get property \'take_time\' of non-object', '2020-09-19 17:08:56', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('538', '2020-09-19 17:08:56:账单推送:SDL20091917085636768433推送到消息队列成功', '2020-09-19 17:08:56', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('545', 'kf01登陆成功获取了令牌', '2020-09-19 17:21:47', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('546', 'super登陆成功获取了令牌', '2020-09-19 17:30:19', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('547', 'super登陆成功获取了令牌', '2020-09-19 17:30:19', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('556', 'Trying to get property \'take_time\' of non-object', '2020-09-20 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('557', 'Trying to get property \'take_time\' of non-object', '2020-09-20 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('558', 'Trying to get property \'take_time\' of non-object', '2020-09-20 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('559', 'Trying to get property \'take_time\' of non-object', '2020-09-20 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('560', 'Trying to get property \'take_time\' of non-object', '2020-09-21 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('561', 'Trying to get property \'take_time\' of non-object', '2020-09-21 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('562', 'Trying to get property \'take_time\' of non-object', '2020-09-21 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('563', 'Trying to get property \'take_time\' of non-object', '2020-09-21 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('564', '2020-09-21 10:05:00:消息通知成功推送到消息队列成功', '2020-09-21 10:05:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('565', '2020-09-21 10:09:19:消息通知成功推送到消息队列成功', '2020-09-21 10:09:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('566', 'kf01登陆成功获取了令牌', '2020-09-21 10:14:28', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('567', '2020-09-21 10:15:57:推送收费单:62adb5e2fbb011ea8fa0df356112eb8b推送到消息队列成功', '2020-09-21 10:15:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('568', '2020-09-21 10:30:14:推送收费单:612208f2fbb211ea8b1c9385d62fdd9c推送到消息队列成功', '2020-09-21 10:30:14', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('569', '2020-09-21 10:53:01:消息通知成功推送到消息队列成功', '2020-09-21 10:53:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('570', '2020-09-21 10:53:20:推送收费单:9b55fdfafbb511ea848755a81415532e推送到消息队列成功', '2020-09-21 10:53:20', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('571', 'super登陆成功获取了令牌', '2020-09-21 10:54:23', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('572', '2020-09-21 10:56:13:推送收费单:02704126fbb611eaba0d873f3be4aa0b推送到消息队列成功', '2020-09-21 10:56:13', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/recharge_balance', '');
INSERT INTO `lin_log` VALUES ('573', '2020-09-21 11:19:38:客户开卡:000333推送到消息队列成功', '2020-09-21 11:19:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_register', '');
INSERT INTO `lin_log` VALUES ('574', '2020-09-21 11:19:38:推送收费单:47f65f66fbb911eab9e551097346d379推送到消息队列成功', '2020-09-21 11:19:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_register', '');
INSERT INTO `lin_log` VALUES ('575', '2020-09-21 11:20:05:推送收费单:581a5c76fbb911ea88f42d6906b538df推送到消息队列成功', '2020-09-21 11:20:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_recharge', '');
INSERT INTO `lin_log` VALUES ('576', '2020-09-21 11:20:18:推送收费单:600a6a7afbb911ea9bd3a1bd2be746ea推送到消息队列成功', '2020-09-21 11:20:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/finish_overcharge_card', '');
INSERT INTO `lin_log` VALUES ('577', '2020-09-21 11:34:54:终止合同ID:1793}推送到消息队列成功', '2020-09-21 11:34:54', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/stop/2ae91ccafbae11ea87b3ffb64aef8510', '');
INSERT INTO `lin_log` VALUES ('578', '林晓晖01登陆成功获取了令牌', '2020-09-21 13:36:17', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('579', '2020-09-21 13:40:06:推送收费单:e75029c6fbcc11eabf543d67cae9539d推送到消息队列成功', '2020-09-21 13:40:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('580', '2020-09-21 13:48:04:推送收费单:04ba86fefbce11eaa4812d71ce8f99cd推送到消息队列成功', '2020-09-21 13:48:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('591', '2020-09-21 14:16:32:推送收费单:fe6b4488fbd111eab2b0cf26183e4be8推送到消息队列成功', '2020-09-21 14:16:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('592', 'super登陆成功获取了令牌', '2020-09-21 17:08:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('593', 'Trying to get property \'take_time\' of non-object', '2020-09-22 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('594', 'Trying to get property \'take_time\' of non-object', '2020-09-22 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('595', 'Trying to get property \'take_time\' of non-object', '2020-09-22 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('596', 'Trying to get property \'take_time\' of non-object', '2020-09-22 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('597', '2020-09-22 08:00:01:账单推送:SDL20092208000127686433推送到消息队列成功', '2020-09-22 08:00:01', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('598', '郑会云登陆成功获取了令牌', '2020-09-22 08:58:49', null, '13', '郑会云', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('600', '林晓晖01登陆成功获取了令牌', '2020-09-22 10:12:58', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('601', '2020-09-22 10:14:09:推送收费单:4c594bf2fc7911eaaf286b8c72ff083f推送到消息队列成功', '2020-09-22 10:14:09', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('602', '林晓晖01登陆成功获取了令牌', '2020-09-22 10:47:53', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('603', '林晓晖01登陆成功获取了令牌', '2020-09-22 11:08:55', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('604', '2020-09-22 11:10:18:推送收费单:24868f38fc8111eaaf55776b3ba72220推送到消息队列成功', '2020-09-22 11:10:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('605', '林晓晖01登陆成功获取了令牌', '2020-09-22 13:44:18', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('606', '2020-09-22 13:44:53:推送收费单:bce3d28afc9611ea91370bd206a40e71推送到消息队列成功', '2020-09-22 13:44:53', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('607', '林晓晖01登陆成功获取了令牌', '2020-09-22 13:46:19', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('608', '林晓晖01登陆成功获取了令牌', '2020-09-22 14:06:10', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('609', '2020-09-22 14:08:18:推送收费单:02334908fc9a11eaba96abc96f4443f5推送到消息队列成功', '2020-09-22 14:08:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('610', '林晓晖01登陆成功获取了令牌', '2020-09-22 14:28:32', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('611', '林晓晖01登陆成功获取了令牌', '2020-09-22 14:40:08', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('612', '2020-09-22 14:48:30:推送收费单:a01b22dafc9f11ea89d93161a8bd8cd7推送到消息队列成功', '2020-09-22 14:48:30', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('613', 'super登陆成功获取了令牌', '2020-09-22 15:19:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('614', '林晓晖01登陆成功获取了令牌', '2020-09-22 15:31:02', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('615', '2020-09-22 15:31:36:推送收费单:a5b67d1afca511eaaec4e9a0af620dd4推送到消息队列成功', '2020-09-22 15:31:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('616', '林晓晖01登陆成功获取了令牌', '2020-09-22 16:04:01', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('617', 'kf01登陆成功获取了令牌', '2020-09-22 16:53:49', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('618', 'Trying to get property \'take_time\' of non-object', '2020-09-23 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('619', 'Trying to get property \'take_time\' of non-object', '2020-09-23 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('620', 'Trying to get property \'take_time\' of non-object', '2020-09-23 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('621', 'Trying to get property \'take_time\' of non-object', '2020-09-23 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('622', '2020-09-23 08:00:01:账单推送:SDL20092308000144017433推送到消息队列成功', '2020-09-23 08:00:01', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('623', 'super登陆成功获取了令牌', '2020-09-23 09:12:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('624', 'super登陆成功获取了令牌', '2020-09-23 09:17:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('625', 'super登陆成功获取了令牌', '2020-09-23 09:45:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('626', '林晓晖01登陆成功获取了令牌', '2020-09-23 10:34:56', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('627', '2020-09-23 10:42:33:推送收费单:6e86f800fd4611eaba55c5ef8e139419推送到消息队列成功', '2020-09-23 10:42:33', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('628', '2020-09-23 10:44:48:推送水控机水卡消费账单:SKL20092310444814759433}推送到消息队列成功', '2020-09-23 10:44:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('629', '2020-09-23 10:53:20:推送水控机水卡消费账单:SKL20092310532055452433}推送到消息队列成功', '2020-09-23 10:53:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('631', 'super登陆成功获取了令牌', '2020-09-23 14:07:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('632', '2020-09-23 15:17:58:推送水控机水卡消费账单:SKL20092315175810611433}推送到消息队列成功', '2020-09-23 15:17:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('633', '2020-09-23 15:21:24:推送水控机水卡消费账单:SKL20092315212417550433}推送到消息队列成功', '2020-09-23 15:21:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('634', '2020-09-23 16:20:06:推送水控机水卡消费账单:SKL20092316200683496433}推送到消息队列成功', '2020-09-23 16:20:07', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('635', 'super登陆成功获取了令牌', '2020-09-23 16:24:37', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('636', 'super登陆成功获取了令牌', '2020-09-23 16:26:14', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('637', '林晓晖01登陆成功获取了令牌', '2020-09-23 16:27:58', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('638', '2020-09-23 16:29:28:推送收费单:e56d16fefd7611eab8e519a21aba249a推送到消息队列成功', '2020-09-23 16:29:29', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('639', 'super登陆成功获取了令牌', '2020-09-23 16:33:16', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('640', 'super登陆成功获取了令牌', '2020-09-23 16:37:33', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('641', 'super登陆成功获取了令牌', '2020-09-23 16:56:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('642', 'Trying to get property \'take_time\' of non-object', '2020-09-24 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('643', 'Trying to get property \'take_time\' of non-object', '2020-09-24 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('644', 'Trying to get property \'take_time\' of non-object', '2020-09-24 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('645', 'Trying to get property \'take_time\' of non-object', '2020-09-24 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('646', '2020-09-24 11:16:00:推送水控机水卡消费账单:SKL20092411160055763433}推送到消息队列成功', '2020-09-24 11:16:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('647', '林晓晖登陆成功获取了令牌', '2020-09-24 15:49:57', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('648', 'super登陆成功获取了令牌', '2020-09-24 16:10:11', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('649', '林晓晖登陆成功获取了令牌', '2020-09-24 16:15:41', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('650', '2020-09-24 16:17:50:终止合同ID:1769}推送到消息队列成功', '2020-09-24 16:17:50', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/stop/4fff7d4ef8cd11ea85c77135c5672e10', '');
INSERT INTO `lin_log` VALUES ('690', '林晓晖01登陆成功获取了令牌', '2020-09-24 16:49:36', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('695', '2020-09-24 16:49:58:推送收费单:ecfd6956fe4211ea8ae4379d9dba5e50推送到消息队列成功', '2020-09-24 16:49:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('699', '2020-09-24 16:50:13:推送收费单:f6099650fe4211ea8da981eeadc5b0e1推送到消息队列成功', '2020-09-24 16:50:14', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('822', '2020-09-24 16:58:26:推送水控机水卡消费账单:SKL20092416582635083433}推送到消息队列成功', '2020-09-24 16:58:26', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('828', '2020-09-24 16:58:36:推送水控机水卡消费账单:SKL20092416583653862433}推送到消息队列成功', '2020-09-24 16:58:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('831', '2020-09-24 16:58:38:推送水控机水卡消费账单:SKL20092416583821141433}推送到消息队列成功', '2020-09-24 16:58:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('833', '2020-09-24 16:58:41:推送水控机水卡消费账单:SKL20092416584128124433}推送到消息队列成功', '2020-09-24 16:58:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1048', '2020-09-24 17:10:00:推送水控机水卡消费账单:SKL20092417100011238433}推送到消息队列成功', '2020-09-24 17:10:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1050', '2020-09-24 17:10:02:推送水控机水卡消费账单:SKL20092417100291242433}推送到消息队列成功', '2020-09-24 17:10:03', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1368', '2020-09-24 17:24:02:推送水控机水卡消费账单:SKL20092417240232943433}推送到消息队列成功', '2020-09-24 17:24:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1379', '2020-09-24 17:24:18:推送水控机水卡消费账单:SKL20092417241870664433}推送到消息队列成功', '2020-09-24 17:24:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1396', '2020-09-24 17:24:35:推送水控机水卡消费账单:SKL20092417243532989433}推送到消息队列成功', '2020-09-24 17:24:35', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1427', '2020-09-24 17:25:00:推送水控机水卡消费账单:SKL20092417250049625433}推送到消息队列成功', '2020-09-24 17:25:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1561', 'super登陆成功获取了令牌', '2020-09-24 17:40:33', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1617', 'super登陆成功获取了令牌', '2020-09-24 18:48:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1618', 'Trying to get property \'take_time\' of non-object', '2020-09-25 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1619', 'Trying to get property \'take_time\' of non-object', '2020-09-25 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1620', 'Trying to get property \'take_time\' of non-object', '2020-09-25 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1621', 'Trying to get property \'take_time\' of non-object', '2020-09-25 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1622', '2020-09-25 08:00:01:账单推送:SDL20092508000146833433推送到消息队列成功', '2020-09-25 08:00:01', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1623', 'super登陆成功获取了令牌', '2020-09-25 09:06:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1624', 'super登陆成功获取了令牌', '2020-09-25 10:00:41', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1625', 'super登陆成功获取了令牌', '2020-09-25 10:51:42', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1626', 'super登陆成功获取了令牌', '2020-09-25 12:16:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1627', 'super登陆成功获取了令牌', '2020-09-25 13:40:38', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1628', 'super登陆成功获取了令牌', '2020-09-25 14:30:44', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1629', 'super登陆成功获取了令牌', '2020-09-25 14:46:38', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1630', '林晓晖01登陆成功获取了令牌', '2020-09-25 16:17:50', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1631', 'kf01登陆成功获取了令牌', '2020-09-25 16:20:37', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1632', 'super登陆成功获取了令牌', '2020-09-25 16:24:06', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1633', 'kf01登陆成功获取了令牌', '2020-09-25 16:25:33', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1634', 'super登陆成功获取了令牌', '2020-09-25 16:25:37', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1635', '林晓晖01登陆成功获取了令牌', '2020-09-25 16:36:54', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1636', '2020-09-25 16:38:58:推送收费单:8dd73c86ff0a11eaad91ef6404846023推送到消息队列成功', '2020-09-25 16:38:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1637', 'super登陆成功获取了令牌', '2020-09-25 16:49:03', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1638', 'super登陆成功获取了令牌', '2020-09-25 16:51:45', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1639', 'super登陆成功获取了令牌', '2020-09-25 16:52:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1640', 'super登陆成功获取了令牌', '2020-09-25 16:58:51', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1641', 'super登陆成功获取了令牌', '2020-09-25 17:06:45', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1642', 'super登陆成功获取了令牌', '2020-09-25 17:35:55', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1643', 'Trying to get property \'take_time\' of non-object', '2020-09-26 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1644', 'Trying to get property \'take_time\' of non-object', '2020-09-26 00:20:02', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1645', 'Trying to get property \'take_time\' of non-object', '2020-09-26 00:20:02', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1646', 'Trying to get property \'take_time\' of non-object', '2020-09-26 00:20:02', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1647', '2020-09-26 08:00:01:账单推送:SDL20092608000124131433推送到消息队列成功', '2020-09-26 08:00:01', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1648', 'super登陆成功获取了令牌', '2020-09-26 09:13:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1649', 'super登陆成功获取了令牌', '2020-09-26 09:13:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1650', 'kf01登陆成功获取了令牌', '2020-09-26 09:44:59', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1651', 'super登陆成功获取了令牌', '2020-09-26 11:22:38', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1652', 'super登陆成功获取了令牌', '2020-09-26 11:50:48', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1653', 'super登陆成功获取了令牌', '2020-09-26 13:51:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1654', 'kf01登陆成功获取了令牌', '2020-09-26 14:07:39', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1655', 'super登陆成功获取了令牌', '2020-09-26 15:13:59', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1656', 'super登陆成功获取了令牌', '2020-09-26 16:21:32', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1657', '林晓晖01登陆成功获取了令牌', '2020-09-26 16:27:50', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1658', '2020-09-26 16:34:27:推送收费单:16a01caeffd311eabc44b1d87ac0f5b9推送到消息队列成功', '2020-09-26 16:34:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1659', 'kf01登陆成功获取了令牌', '2020-09-26 16:35:51', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1661', 'kf01登陆成功获取了令牌', '2020-09-26 17:05:33', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1662', 'super登陆成功获取了令牌', '2020-09-26 17:37:32', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1663', 'super登陆成功获取了令牌', '2020-09-26 18:03:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1664', 'Trying to get property \'take_time\' of non-object', '2020-09-27 00:20:01', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1665', 'Trying to get property \'take_time\' of non-object', '2020-09-27 00:20:02', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1666', 'Trying to get property \'take_time\' of non-object', '2020-09-27 00:20:02', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1667', 'Trying to get property \'take_time\' of non-object', '2020-09-27 00:20:02', null, '0', '系统定时', '200', 'GET', 'cron/read_meters', '');
INSERT INTO `lin_log` VALUES ('1668', '2020-09-27 08:00:01:账单推送:SDL20092708000189718433推送到消息队列成功', '2020-09-27 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1669', 'super登陆成功获取了令牌', '2020-09-27 09:09:49', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1670', 'super登陆成功获取了令牌', '2020-09-27 09:15:11', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1671', 'super登陆成功获取了令牌', '2020-09-27 10:25:36', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1672', 'super登陆成功获取了令牌', '2020-09-27 11:26:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1673', 'super登陆成功获取了令牌', '2020-09-27 11:50:40', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1674', 'super登陆成功获取了令牌', '2020-09-27 14:52:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1675', 'super登陆成功获取了令牌', '2020-09-27 16:37:15', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1676', 'super登陆成功获取了令牌', '2020-09-27 16:37:15', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1677', '2020-09-28 08:00:01:账单推送:SDL20092808000189668433推送到消息队列成功', '2020-09-28 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1678', 'super登陆成功获取了令牌', '2020-09-28 09:30:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1679', 'super登陆成功获取了令牌', '2020-09-28 10:58:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1681', 'super登陆成功获取了令牌', '2020-09-28 13:31:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1682', '林晓晖01登陆成功获取了令牌', '2020-09-28 14:01:42', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1683', '2020-09-28 14:02:32:推送收费单:328df890015011eb8064f90fa67882b6推送到消息队列成功', '2020-09-28 14:02:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1684', '林晓晖01登陆成功获取了令牌', '2020-09-28 14:43:31', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1685', '2020-09-28 14:45:22:推送收费单:2ed448c0015611ebbb00d98da63df70a推送到消息队列成功', '2020-09-28 14:45:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1686', '2020-09-28 14:46:48:推送收费单:61a5378c015611eb92af0f3ce964c6d1推送到消息队列成功', '2020-09-28 14:46:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1687', '2020-09-28 15:01:12:推送收费单:64977b60015811eba238d12e00055566推送到消息队列成功', '2020-09-28 15:01:12', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1688', '2020-09-28 15:02:55:推送收费单:a21e2a56015811eb81e7134202228d4e推送到消息队列成功', '2020-09-28 15:02:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1689', '林晓晖01登陆成功获取了令牌', '2020-09-28 15:27:46', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1690', '林晓晖登陆成功获取了令牌', '2020-09-28 15:28:13', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1691', 'super登陆成功获取了令牌', '2020-09-28 15:30:50', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1692', 'super登陆成功获取了令牌', '2020-09-28 15:32:32', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1693', '林晓晖01登陆成功获取了令牌', '2020-09-28 15:34:03', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1694', '林晓晖登陆成功获取了令牌', '2020-09-28 15:34:32', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1695', '2020-09-28 15:40:34:终止合同ID:1536}推送到消息队列成功', '2020-09-28 15:40:35', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/stop/e1463d1ef8c411eab11aaf5504f18f30', '');
INSERT INTO `lin_log` VALUES ('1696', 'super修改了id为8的权限', '2020-09-28 15:43:48', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('1697', 'super登陆成功获取了令牌', '2020-09-28 16:39:08', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1698', 'super登陆成功获取了令牌', '2020-09-28 16:48:06', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1699', '2020-09-29 08:00:01:账单推送:SDL20092908000192710433推送到消息队列成功', '2020-09-29 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1700', 'super登陆成功获取了令牌', '2020-09-29 10:15:04', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1701', 'kf01登陆成功获取了令牌', '2020-09-29 10:56:23', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1702', 'kf01登陆成功获取了令牌', '2020-09-29 11:17:42', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1703', 'super登陆成功获取了令牌', '2020-09-29 11:51:10', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1704', '林晓晖登陆成功获取了令牌', '2020-09-29 14:21:55', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1705', '林晓晖01登陆成功获取了令牌', '2020-09-29 14:22:00', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1706', '2020-09-29 14:24:55:推送收费单:7d5fbd78021c11ebb54ac9deddc4db2a推送到消息队列成功', '2020-09-29 14:24:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1707', '2020-09-29 14:26:53:推送收费单:c3b02952021c11eba0f3a3bd574a39b1推送到消息队列成功', '2020-09-29 14:26:53', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1708', 'kf01登陆成功获取了令牌', '2020-09-29 14:28:38', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1709', '2020-09-29 14:34:00:推送收费单:c233b3d6021d11ebbf4e4f8a18ad1f6a推送到消息队列成功', '2020-09-29 14:34:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1710', '2020-09-29 14:34:26:推送收费单:d23b7dcc021d11eba65b37b5d20dbcc4推送到消息队列成功', '2020-09-29 14:34:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1711', '2020-09-29 14:37:31:推送收费单:4047adfe021e11eba839233e3145dd5a推送到消息队列成功', '2020-09-29 14:37:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1712', '2020-09-29 14:38:43:推送收费单:6b08cea6021e11eb9618b9890584b844推送到消息队列成功', '2020-09-29 14:38:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1713', '2020-09-29 14:41:27:推送收费单:ccd8e918021e11ebb7711980f4b9f196推送到消息队列成功', '2020-09-29 14:41:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1714', '2020-09-29 14:41:49:推送收费单:da00926c021e11eba9c63feecfd3e3b2推送到消息队列成功', '2020-09-29 14:41:49', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1715', 'super登陆成功获取了令牌', '2020-09-29 14:48:44', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1716', 'super登陆成功获取了令牌', '2020-09-29 14:55:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1717', 'super登陆成功获取了令牌', '2020-09-29 14:56:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1718', 'super登陆成功获取了令牌', '2020-09-29 14:57:59', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1719', 'super登陆成功获取了令牌', '2020-09-29 15:18:08', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1720', 'super登陆成功获取了令牌', '2020-09-29 15:23:28', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1721', 'super登陆成功获取了令牌', '2020-09-29 15:28:08', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1722', 'kf01登陆成功获取了令牌', '2020-09-29 16:04:44', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1723', 'kf01登陆成功获取了令牌', '2020-09-29 16:11:02', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1724', 'kf01登陆成功获取了令牌', '2020-09-29 16:13:55', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1725', 'kf01登陆成功获取了令牌', '2020-09-29 16:15:38', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1726', 'kf01登陆成功获取了令牌', '2020-09-29 17:41:51', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1727', 'kf01登陆成功获取了令牌', '2020-09-29 17:43:18', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1728', 'kf01登陆成功获取了令牌', '2020-09-29 17:52:34', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1729', 'super登陆成功获取了令牌', '2020-09-29 17:57:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1730', '2020-09-30 08:00:01:账单推送:SDL20093008000187092433推送到消息队列成功', '2020-09-30 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1731', 'super登陆成功获取了令牌', '2020-09-30 09:21:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1732', 'super登陆成功获取了令牌', '2020-09-30 10:02:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1736', 'super登陆成功获取了令牌', '2020-09-30 11:04:46', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1737', 'super登陆成功获取了令牌', '2020-09-30 13:38:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1738', 'super登陆成功获取了令牌', '2020-09-30 13:38:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1739', 'super登陆成功获取了令牌', '2020-09-30 13:47:16', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1740', 'super登陆成功获取了令牌', '2020-09-30 14:04:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1741', '林晓晖01登陆成功获取了令牌', '2020-09-30 14:07:36', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1742', '林晓晖01登陆成功获取了令牌', '2020-09-30 14:11:58', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1743', 'super登陆成功获取了令牌', '2020-09-30 14:24:03', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1744', 'super登陆成功获取了令牌', '2020-09-30 14:33:06', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1745', 'kf01登陆成功获取了令牌', '2020-09-30 14:47:13', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1746', 'super登陆成功获取了令牌', '2020-09-30 15:42:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1747', 'kf01登陆成功获取了令牌', '2020-09-30 15:57:00', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1748', 'super登陆成功获取了令牌', '2020-09-30 17:12:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1749', 'super登陆成功获取了令牌', '2020-09-30 17:15:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1750', 'super登陆成功获取了令牌', '2020-09-30 17:36:54', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1751', 'super登陆成功获取了令牌', '2020-09-30 18:04:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1752', '2020-10-01 08:00:01:账单推送:SDL20100108000193097433推送到消息队列成功', '2020-10-01 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1753', '2020-10-02 08:00:01:账单推送:SDL20100208000193478433推送到消息队列成功', '2020-10-02 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1754', '2020-10-03 08:00:01:账单推送:SDL20100308000171972433推送到消息队列成功', '2020-10-03 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1755', '2020-10-04 08:00:02:账单推送:SDL20100408000223817433推送到消息队列成功', '2020-10-04 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1756', '2020-10-05 08:00:01:账单推送:SDL20100508000184031433推送到消息队列成功', '2020-10-05 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1757', '2020-10-06 08:00:01:账单推送:SDL20100608000186666433推送到消息队列成功', '2020-10-06 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1758', '林晓晖01登陆成功获取了令牌', '2020-10-06 08:58:42', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1759', '林晓晖01登陆成功获取了令牌', '2020-10-06 09:58:58', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1760', '林晓晖01登陆成功获取了令牌', '2020-10-06 10:00:32', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1761', '2020-10-06 10:01:10:推送收费单:ce00ec7e077711ebaf34c900d93e2762推送到消息队列成功', '2020-10-06 10:01:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1762', 'super登陆成功获取了令牌', '2020-10-06 10:11:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1763', 'super登陆成功获取了令牌', '2020-10-06 10:13:19', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1764', 'super登陆成功获取了令牌', '2020-10-06 11:55:45', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1765', 'super登陆成功获取了令牌', '2020-10-06 12:04:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1766', 'super登陆成功获取了令牌', '2020-10-06 12:09:38', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1767', '林晓晖01登陆成功获取了令牌', '2020-10-06 15:57:20', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1768', 'super登陆成功获取了令牌', '2020-10-06 16:00:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1769', '2020-10-07 08:00:01:账单推送:SDL20100708000185541433推送到消息队列成功', '2020-10-07 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1770', 'super登陆成功获取了令牌', '2020-10-07 09:00:24', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1771', 'super登陆成功获取了令牌', '2020-10-07 09:18:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1772', 'super登陆成功获取了令牌', '2020-10-07 10:31:20', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1773', 'super登陆成功获取了令牌', '2020-10-07 10:37:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1774', '林晓晖01登陆成功获取了令牌', '2020-10-07 10:44:17', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1775', '2020-10-07 10:44:41:推送收费单:0cebbf34084711eb9c99771e2446b82e推送到消息队列成功', '2020-10-07 10:44:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1776', 'super登陆成功获取了令牌', '2020-10-07 13:43:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1777', 'super登陆成功获取了令牌', '2020-10-07 14:23:39', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1778', 'super登陆成功获取了令牌', '2020-10-07 14:53:23', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1779', 'super登陆成功获取了令牌', '2020-10-07 15:04:39', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1780', 'super登陆成功获取了令牌', '2020-10-07 15:11:36', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1781', 'super登陆成功获取了令牌', '2020-10-07 16:34:50', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1782', 'super登陆成功获取了令牌', '2020-10-07 16:50:49', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1786', 'super登陆成功获取了令牌', '2020-10-07 17:16:51', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1787', '2020-10-08 08:00:02:账单推送:SDL20100808000210976433推送到消息队列成功', '2020-10-08 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1788', 'super登陆成功获取了令牌', '2020-10-08 09:09:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1789', '林晓晖01登陆成功获取了令牌', '2020-10-08 09:18:08', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1790', '林晓晖登陆成功获取了令牌', '2020-10-08 09:19:45', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1791', 'super登陆成功获取了令牌', '2020-10-08 09:31:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1792', 'super登陆成功获取了令牌', '2020-10-08 09:33:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1793', 'super登陆成功获取了令牌', '2020-10-08 10:04:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1794', 'kf01登陆成功获取了令牌', '2020-10-08 13:32:10', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1795', 'super登陆成功获取了令牌', '2020-10-08 14:00:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1796', 'super登陆成功获取了令牌', '2020-10-08 17:00:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1797', 'kf01登陆成功获取了令牌', '2020-10-08 17:24:29', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1798', 'kf01登陆成功获取了令牌', '2020-10-08 17:30:23', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1799', 'kf01登陆成功获取了令牌', '2020-10-08 17:32:42', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1800', '2020-10-09 08:00:02:账单推送:SDL20100908000223533433推送到消息队列成功', '2020-10-09 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1801', 'super登陆成功获取了令牌', '2020-10-09 09:35:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1802', 'super删除了用户id为2的用户', '2020-10-09 09:37:49', null, '1', 'super', '200', 'DELETE', 'admin/v1/manager/2', '');
INSERT INTO `lin_log` VALUES ('1803', 'super修改了id为14的权限', '2020-10-09 09:38:48', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('1804', 'super创建了一个用户', '2020-10-09 09:39:23', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('1805', '郑灿伟登陆成功获取了令牌', '2020-10-09 09:39:39', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1806', 'super登陆成功获取了令牌', '2020-10-09 09:41:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1807', 'kf01登陆成功获取了令牌', '2020-10-09 09:51:06', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1808', 'super登陆成功获取了令牌', '2020-10-09 10:44:03', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1809', '郑灿伟登陆成功获取了令牌', '2020-10-09 11:00:54', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1810', '2020-10-09 11:24:20:报修通知推送到消息队列成功', '2020-10-09 11:24:21', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1811', '2020-10-09 11:24:20:报修通知推送到消息队列成功', '2020-10-09 11:24:21', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1812', '2020-10-09 11:24:20:报修通知推送到消息队列成功', '2020-10-09 11:24:21', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1813', '2020-10-09 11:24:20:报修通知推送到消息队列成功', '2020-10-09 11:24:21', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1814', '2020-10-09 11:24:20:报修通知推送到消息队列成功', '2020-10-09 11:24:21', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1815', 'super登陆成功获取了令牌', '2020-10-09 11:30:51', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1816', '2020-10-09 11:42:56:报修通知推送到消息队列成功', '2020-10-09 11:42:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1817', '2020-10-09 11:42:56:报修通知推送到消息队列成功', '2020-10-09 11:42:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1818', '2020-10-09 11:42:56:报修通知推送到消息队列成功', '2020-10-09 11:42:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1819', '2020-10-09 11:42:56:报修通知推送到消息队列成功', '2020-10-09 11:42:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1820', '2020-10-09 11:42:56:报修通知推送到消息队列成功', '2020-10-09 11:42:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1821', '2020-10-09 11:42:56:报修通知推送到消息队列成功', '2020-10-09 11:42:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1822', 'super登陆成功获取了令牌', '2020-10-09 11:46:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1823', '2020-10-09 11:48:23:报修状态通知推送到消息队列成功', '2020-10-09 11:48:24', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1824', '2020-10-09 11:48:23:报修状态通知推送到消息队列成功', '2020-10-09 11:48:24', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1825', '2020-10-09 11:48:23:报修状态通知推送到消息队列成功', '2020-10-09 11:48:24', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1826', '2020-10-09 11:48:23:报修状态通知推送到消息队列成功', '2020-10-09 11:48:24', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1827', 'super登陆成功获取了令牌', '2020-10-09 11:59:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1828', '郑灿伟登陆成功获取了令牌', '2020-10-09 13:29:56', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1829', '2020-10-09 13:44:12:报修状态通知推送到消息队列成功', '2020-10-09 13:44:12', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1830', '2020-10-09 13:44:12:报修状态通知推送到消息队列成功', '2020-10-09 13:44:12', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1831', '2020-10-09 13:44:12:报修状态通知推送到消息队列成功', '2020-10-09 13:44:12', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1832', '2020-10-09 13:44:12:报修状态通知推送到消息队列成功', '2020-10-09 13:44:12', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1833', '2020-10-09 13:44:12:报修状态通知推送到消息队列成功', '2020-10-09 13:44:12', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1834', '2020-10-09 13:45:54:报修状态通知推送到消息队列成功', '2020-10-09 13:45:55', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1835', '2020-10-09 13:45:54:报修状态通知推送到消息队列成功', '2020-10-09 13:45:55', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1836', '2020-10-09 13:45:54:报修状态通知推送到消息队列成功', '2020-10-09 13:45:55', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1837', '2020-10-09 13:45:54:报修状态通知推送到消息队列成功', '2020-10-09 13:45:55', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1838', '2020-10-09 13:45:54:报修状态通知推送到消息队列成功', '2020-10-09 13:45:55', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1839', '2020-10-09 13:46:59:报修状态通知推送到消息队列成功', '2020-10-09 13:47:00', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1840', '2020-10-09 13:46:59:报修状态通知推送到消息队列成功', '2020-10-09 13:47:00', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1841', '2020-10-09 13:46:59:报修状态通知推送到消息队列成功', '2020-10-09 13:47:00', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1842', '2020-10-09 13:46:59:报修状态通知推送到消息队列成功', '2020-10-09 13:47:00', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1843', '2020-10-09 13:46:59:报修状态通知推送到消息队列成功', '2020-10-09 13:47:00', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/84d9758609e111eb9f08b1242cb95a41', '');
INSERT INTO `lin_log` VALUES ('1844', '2020-10-09 13:48:18:报修状态通知推送到消息队列成功', '2020-10-09 13:48:19', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1845', '2020-10-09 13:48:18:报修状态通知推送到消息队列成功', '2020-10-09 13:48:19', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1846', '2020-10-09 13:48:18:报修状态通知推送到消息队列成功', '2020-10-09 13:48:19', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1847', '2020-10-09 13:48:18:报修状态通知推送到消息队列成功', '2020-10-09 13:48:19', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1848', '2020-10-09 13:48:18:报修状态通知推送到消息队列成功', '2020-10-09 13:48:19', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/complete/eb980b0009de11ebbba969f7cf52403e', '');
INSERT INTO `lin_log` VALUES ('1849', '2020-10-09 13:53:39:投诉建议通知推送到消息队列成功', '2020-10-09 13:53:39', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1850', '2020-10-09 13:53:39:投诉建议通知推送到消息队列成功', '2020-10-09 13:53:39', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1851', '2020-10-09 13:53:39:投诉建议通知推送到消息队列成功', '2020-10-09 13:53:39', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1852', '2020-10-09 13:53:39:投诉建议通知推送到消息队列成功', '2020-10-09 13:53:39', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1853', '2020-10-09 13:53:39:投诉建议通知推送到消息队列成功', '2020-10-09 13:53:39', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1854', '2020-10-09 13:53:39:投诉建议通知推送到消息队列成功', '2020-10-09 13:53:39', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1855', '2020-10-09 13:55:22:投诉建议通知推送到消息队列成功', '2020-10-09 13:55:22', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1856', '2020-10-09 13:55:22:投诉建议通知推送到消息队列成功', '2020-10-09 13:55:22', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1857', '2020-10-09 13:55:22:投诉建议通知推送到消息队列成功', '2020-10-09 13:55:22', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1858', '2020-10-09 13:55:22:投诉建议通知推送到消息队列成功', '2020-10-09 13:55:22', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1859', '2020-10-09 13:55:22:投诉建议通知推送到消息队列成功', '2020-10-09 13:55:22', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1860', '2020-10-09 13:55:22:投诉建议通知推送到消息队列成功', '2020-10-09 13:55:22', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/feedback_add', '');
INSERT INTO `lin_log` VALUES ('1861', 'super登陆成功获取了令牌', '2020-10-09 13:55:44', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1862', '2020-10-09 14:20:34:报修通知推送到消息队列成功', '2020-10-09 14:20:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1863', '2020-10-09 14:20:34:报修通知推送到消息队列成功', '2020-10-09 14:20:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1864', '2020-10-09 14:20:34:报修通知推送到消息队列成功', '2020-10-09 14:20:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1865', '2020-10-09 14:20:34:报修通知推送到消息队列成功', '2020-10-09 14:20:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1866', '2020-10-09 14:20:34:报修通知推送到消息队列成功', '2020-10-09 14:20:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1867', '2020-10-09 14:20:34:报修通知推送到消息队列成功', '2020-10-09 14:20:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1868', '2020-10-09 14:21:07:报修状态通知推送到消息队列成功', '2020-10-09 14:21:07', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/8a59df1209f711ebafeeb5553493c925', '');
INSERT INTO `lin_log` VALUES ('1869', '2020-10-09 14:21:07:报修状态通知推送到消息队列成功', '2020-10-09 14:21:07', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/8a59df1209f711ebafeeb5553493c925', '');
INSERT INTO `lin_log` VALUES ('1870', '2020-10-09 14:21:07:报修状态通知推送到消息队列成功', '2020-10-09 14:21:07', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/8a59df1209f711ebafeeb5553493c925', '');
INSERT INTO `lin_log` VALUES ('1871', '2020-10-09 14:21:07:报修状态通知推送到消息队列成功', '2020-10-09 14:21:07', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/8a59df1209f711ebafeeb5553493c925', '');
INSERT INTO `lin_log` VALUES ('1872', '2020-10-09 14:21:07:报修状态通知推送到消息队列成功', '2020-10-09 14:21:07', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/8a59df1209f711ebafeeb5553493c925', '');
INSERT INTO `lin_log` VALUES ('1873', 'super登陆成功获取了令牌', '2020-10-09 14:30:44', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1874', 'super登陆成功获取了令牌', '2020-10-09 16:11:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1875', 'super登陆成功获取了令牌', '2020-10-09 17:01:57', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1876', '2020-10-10 08:00:02:账单推送:SDL20101008000209040433推送到消息队列成功', '2020-10-10 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1877', 'super登陆成功获取了令牌', '2020-10-10 09:21:46', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1878', '林晓晖登陆成功获取了令牌', '2020-10-10 09:31:08', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1879', '郑灿伟登陆成功获取了令牌', '2020-10-10 09:43:51', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1880', 'super登陆成功获取了令牌', '2020-10-10 09:49:54', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1881', '郑灿伟登陆成功获取了令牌', '2020-10-10 10:57:12', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1882', '2020-10-10 11:29:39:推送水控机水卡消费账单:SKL20101011293962593433}推送到消息队列成功', '2020-10-10 11:29:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1883', 'super登陆成功获取了令牌', '2020-10-10 11:30:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1884', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:30:42', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1885', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:58:32', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1886', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:58:43', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1887', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:58:46', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1888', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:58:50', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1889', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:59:00', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1890', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:59:04', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1891', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:59:08', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1892', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:59:12', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1893', '郑灿伟登陆成功获取了令牌', '2020-10-10 13:59:13', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1894', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:00:59', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1895', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:01', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1896', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:04', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1897', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:32', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1898', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:42', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1899', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:43', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1900', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:45', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1901', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:47', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1902', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:49', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1903', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:51', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1904', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:01:54', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1905', '2020-10-10 14:05:47:报修通知推送到消息队列成功', '2020-10-10 14:05:48', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1906', '2020-10-10 14:05:47:报修通知推送到消息队列成功', '2020-10-10 14:05:48', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1907', '2020-10-10 14:05:47:报修通知推送到消息队列成功', '2020-10-10 14:05:48', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1908', '2020-10-10 14:05:47:报修通知推送到消息队列成功', '2020-10-10 14:05:48', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1909', '2020-10-10 14:05:47:报修通知推送到消息队列成功', '2020-10-10 14:05:48', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1910', '郑灿伟登陆成功获取了令牌', '2020-10-10 14:08:52', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1911', '2020-10-10 14:10:06:报修通知推送到消息队列成功', '2020-10-10 14:10:07', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1912', '2020-10-10 14:10:06:报修通知推送到消息队列成功', '2020-10-10 14:10:07', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1913', '2020-10-10 14:10:06:报修通知推送到消息队列成功', '2020-10-10 14:10:07', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1914', '2020-10-10 14:10:06:报修通知推送到消息队列成功', '2020-10-10 14:10:07', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1915', '2020-10-10 14:10:06:报修通知推送到消息队列成功', '2020-10-10 14:10:07', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('1916', 'super登陆成功获取了令牌', '2020-10-10 14:11:56', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1917', 'super登陆成功获取了令牌', '2020-10-10 14:33:23', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1918', '2020-10-10 15:08:50:推送水控机水卡消费账单:SKL20101015085030134433}推送到消息队列成功', '2020-10-10 15:08:50', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('1919', '2020-10-11 08:00:02:账单推送:SDL20101108000235189433推送到消息队列成功', '2020-10-11 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1920', 'super登陆成功获取了令牌', '2020-10-11 10:36:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1921', 'super登陆成功获取了令牌', '2020-10-11 11:30:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1922', 'super登陆成功获取了令牌', '2020-10-11 15:37:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1923', 'super登陆成功获取了令牌', '2020-10-11 15:55:33', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1924', 'super登陆成功获取了令牌', '2020-10-11 17:03:27', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1925', '2020-10-12 08:00:01:账单推送:SDL20101208000197099433推送到消息队列成功', '2020-10-12 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1926', '郑灿伟登陆成功获取了令牌', '2020-10-12 09:00:01', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1927', 'super登陆成功获取了令牌', '2020-10-12 11:06:20', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1928', 'super登陆成功获取了令牌', '2020-10-12 12:52:30', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1929', '陈志伟登陆成功获取了令牌', '2020-10-12 12:53:41', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1930', '陈志伟登陆成功获取了令牌', '2020-10-12 12:53:49', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1931', '陈志伟登陆成功获取了令牌', '2020-10-12 12:53:50', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1932', '陈志伟登陆成功获取了令牌', '2020-10-12 12:53:55', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1933', '陈志伟登陆成功获取了令牌', '2020-10-12 12:53:58', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1934', '陈志伟登陆成功获取了令牌', '2020-10-12 13:05:19', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1935', '陈志伟登陆成功获取了令牌', '2020-10-12 13:06:18', null, '18', '陈志伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1936', 'super登陆成功获取了令牌', '2020-10-12 13:32:59', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1937', 'kf01登陆成功获取了令牌', '2020-10-12 13:43:56', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1938', 'kf01登陆成功获取了令牌', '2020-10-12 13:44:51', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1939', 'kf01登陆成功获取了令牌', '2020-10-12 13:46:47', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1940', 'kf01登陆成功获取了令牌', '2020-10-12 13:47:33', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1941', 'kf01登陆成功获取了令牌', '2020-10-12 13:52:24', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1942', '郑灿伟登陆成功获取了令牌', '2020-10-12 14:15:57', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1943', '郑灿伟登陆成功获取了令牌', '2020-10-12 16:50:43', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1944', 'super登陆成功获取了令牌', '2020-10-12 17:57:01', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1945', '2020-10-13 08:00:01:账单推送:SDL20101308000191285433推送到消息队列成功', '2020-10-13 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1946', 'super登陆成功获取了令牌', '2020-10-13 09:21:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1947', 'super登陆成功获取了令牌', '2020-10-13 10:46:00', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1948', '郑灿伟登陆成功获取了令牌', '2020-10-13 14:44:54', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1949', 'super登陆成功获取了令牌', '2020-10-13 15:31:14', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1950', '2020-10-14 08:00:02:账单推送:SDL20101408000208660433推送到消息队列成功', '2020-10-14 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1951', 'super登陆成功获取了令牌', '2020-10-14 09:26:40', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1952', 'super登陆成功获取了令牌', '2020-10-14 09:36:39', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1953', '林晓晖01登陆成功获取了令牌', '2020-10-14 11:13:06', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1954', '2020-10-14 11:16:03:推送收费单:97a154980dcb11eb8562f3732ebca9ec推送到消息队列成功', '2020-10-14 11:16:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1955', 'super登陆成功获取了令牌', '2020-10-14 14:05:32', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1956', '郑灿伟登陆成功获取了令牌', '2020-10-14 14:39:56', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1957', 'super登陆成功获取了令牌', '2020-10-14 15:20:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1958', 'super登陆成功获取了令牌', '2020-10-14 16:11:46', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1959', '2020-10-15 08:00:01:账单推送:SDL20101508000158134433推送到消息队列成功', '2020-10-15 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1960', '林晓晖01登陆成功获取了令牌', '2020-10-15 10:18:59', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1961', '2020-10-15 10:19:30:推送收费单:db296c7a0e8c11eb8d515b21ba1cabe0推送到消息队列成功', '2020-10-15 10:19:30', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1962', 'super登陆成功获取了令牌', '2020-10-15 11:06:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1963', 'super登陆成功获取了令牌', '2020-10-15 11:09:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1964', '林晓晖01登陆成功获取了令牌', '2020-10-15 12:59:22', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1965', '2020-10-15 13:00:11:推送收费单:4dd219e60ea311eb84dd5ba213f7edb8推送到消息队列成功', '2020-10-15 13:00:11', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1966', '郑灿伟登陆成功获取了令牌', '2020-10-15 13:48:12', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1967', '林晓晖登陆成功获取了令牌', '2020-10-15 16:16:26', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1968', 'kf01登陆成功获取了令牌', '2020-10-15 22:15:31', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1969', '2020-10-16 08:00:01:账单推送:SDL20101608000188911433推送到消息队列成功', '2020-10-16 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1970', 'super登陆成功获取了令牌', '2020-10-16 09:37:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1971', 'super登陆成功获取了令牌', '2020-10-16 09:40:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1972', '林晓晖01登陆成功获取了令牌', '2020-10-16 10:14:25', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1973', '2020-10-16 10:15:25:推送收费单:73f1900e0f5511ebadd48b93ca0c91fc推送到消息队列成功', '2020-10-16 10:15:26', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1974', '林晓晖01登陆成功获取了令牌', '2020-10-16 10:52:59', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1975', 'kf01登陆成功获取了令牌', '2020-10-16 11:01:56', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1976', 'super登陆成功获取了令牌', '2020-10-16 11:11:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1977', '林晓晖01登陆成功获取了令牌', '2020-10-16 11:28:48', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1978', '2020-10-16 13:51:54:推送收费单:b1f85b260f7311eba310d95c71d6d44e推送到消息队列成功', '2020-10-16 13:51:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1979', '2020-10-16 13:52:17:推送收费单:bf82146c0f7311eb90b219f37f60cbd7推送到消息队列成功', '2020-10-16 13:52:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1980', '2020-10-16 13:52:33:推送收费单:c8d72cbe0f7311eb8bd47f0aee2614f0推送到消息队列成功', '2020-10-16 13:52:33', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1981', '林晓晖登陆成功获取了令牌', '2020-10-16 14:02:28', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1982', '郑灿伟登陆成功获取了令牌', '2020-10-16 14:19:57', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1983', '2020-10-17 08:00:01:账单推送:SDL20101708000170021433推送到消息队列成功', '2020-10-17 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1984', '林晓晖登陆成功获取了令牌', '2020-10-17 13:47:46', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1985', '林晓晖01登陆成功获取了令牌', '2020-10-17 13:53:22', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1986', '2020-10-17 13:55:18:推送收费单:559f3d34103d11eb843a05aac68262b6推送到消息队列成功', '2020-10-17 13:55:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1987', '林晓晖01登陆成功获取了令牌', '2020-10-17 14:53:15', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1988', '2020-10-17 14:54:09:推送收费单:8e4f0a30104511ebac367dac26ac6ba3推送到消息队列成功', '2020-10-17 14:54:09', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1989', '林晓晖01登陆成功获取了令牌', '2020-10-17 15:38:29', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1990', '2020-10-17 16:12:07:推送收费单:72b4e5a0105011eba9d45f6f247e81fc推送到消息队列成功', '2020-10-17 16:12:07', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1991', '2020-10-17 17:16:55:推送收费单:800c8df8105911eb809307cd03380e08推送到消息队列成功', '2020-10-17 17:16:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1992', '2020-10-18 08:00:01:账单推送:SDL20101808000180648433推送到消息队列成功', '2020-10-18 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1993', '2020-10-19 08:00:02:账单推送:SDL20101908000262249433推送到消息队列成功', '2020-10-19 08:00:03', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('1994', '林晓晖01登陆成功获取了令牌', '2020-10-19 08:42:00', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1995', '2020-10-19 08:43:57:推送收费单:2c2db30a11a411ebaf4f63d72371812a推送到消息队列成功', '2020-10-19 08:43:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1996', '林晓晖01登陆成功获取了令牌', '2020-10-19 14:20:30', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1997', '2020-10-19 14:22:40:推送收费单:7d853e2411d311eba582f5be9d8545bf推送到消息队列成功', '2020-10-19 14:22:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('1998', '林晓晖01登陆成功获取了令牌', '2020-10-19 14:40:09', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('1999', '2020-10-19 14:47:10:推送收费单:e9cf1b9c11d611eba3a85f487ee7fff7推送到消息队列成功', '2020-10-19 14:47:11', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2000', '2020-10-20 08:00:01:账单推送:SDL20102008000196833433推送到消息队列成功', '2020-10-20 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2001', '郑灿伟登陆成功获取了令牌', '2020-10-20 09:05:34', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2002', 'super登陆成功获取了令牌', '2020-10-20 09:44:03', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2003', '林晓晖01登陆成功获取了令牌', '2020-10-20 09:58:35', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2004', '2020-10-20 10:04:32:推送收费单:98094fd8127811eb8fa7b33f937f2551推送到消息队列成功', '2020-10-20 10:04:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2005', '林晓晖01登陆成功获取了令牌', '2020-10-20 11:34:15', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2006', '2020-10-20 11:35:06:推送收费单:3ee3ff22128511ebb07f9188656d92e1推送到消息队列成功', '2020-10-20 11:35:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2007', 'super登陆成功获取了令牌', '2020-10-20 14:04:01', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2008', 'super登陆成功获取了令牌', '2020-10-20 17:53:32', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2009', 'super登陆成功获取了令牌', '2020-10-20 20:43:59', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2010', 'super登陆成功获取了令牌', '2020-10-20 20:44:00', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2011', '2020-10-21 08:00:01:账单推送:SDL20102108000172666433推送到消息队列成功', '2020-10-21 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2012', '郑灿伟登陆成功获取了令牌', '2020-10-21 10:11:18', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2013', 'super登陆成功获取了令牌', '2020-10-21 10:25:04', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2014', 'super登陆成功获取了令牌', '2020-10-21 16:16:27', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2015', '2020-10-22 08:00:02:账单推送:SDL20102208000209158433推送到消息队列成功', '2020-10-22 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2016', 'super登陆成功获取了令牌', '2020-10-22 09:43:36', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2017', 'super登陆成功获取了令牌', '2020-10-22 09:57:56', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2018', 'super登陆成功获取了令牌', '2020-10-22 10:45:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2019', 'kf01登陆成功获取了令牌', '2020-10-22 10:55:47', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2020', 'super登陆成功获取了令牌', '2020-10-22 10:58:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2021', '2020-10-22 18:09:47:消息通知成功推送到消息队列成功', '2020-10-22 18:09:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2022', '2020-10-22 18:09:47:消息通知成功推送到消息队列成功', '2020-10-22 18:09:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2023', '2020-10-22 18:09:47:消息通知成功推送到消息队列成功', '2020-10-22 18:09:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2024', '2020-10-22 18:09:47:消息通知成功推送到消息队列成功', '2020-10-22 18:09:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2025', '2020-10-22 18:09:47:消息通知成功推送到消息队列成功', '2020-10-22 18:09:48', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2026', 'kf01登陆成功获取了令牌', '2020-10-22 18:13:32', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2027', '2020-10-22 18:14:03:推送收费单:4fad35a0144f11ebaa396f7b41ee5d65推送到消息队列成功', '2020-10-22 18:14:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2028', 'kf01登陆成功获取了令牌', '2020-10-22 18:22:57', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2029', '2020-10-22 18:30:35:推送收费单:9eabf86a145111ebba2c276ab49ef319推送到消息队列成功', '2020-10-22 18:30:35', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2030', '2020-10-23 08:00:02:账单推送:SDL20102308000210471433推送到消息队列成功', '2020-10-23 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2031', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2032', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2033', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2034', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2035', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2036', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2037', 'super登陆成功获取了令牌', '2020-10-23 09:11:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2038', '2020-10-23 09:14:36:消息通知成功推送到消息队列成功', '2020-10-23 09:14:36', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2039', 'kf01登陆成功获取了令牌', '2020-10-23 09:16:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2040', '2020-10-23 09:30:51:消息通知成功推送到消息队列成功', '2020-10-23 09:30:51', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2041', '2020-10-23 09:32:51:推送收费单:aa36ebee14cf11eb9c08936961d4e52d推送到消息队列成功', '2020-10-23 09:32:51', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/recharge_balance', '');
INSERT INTO `lin_log` VALUES ('2042', 'kf01登陆成功获取了令牌', '2020-10-23 09:34:09', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2043', '2020-10-23 09:34:57:推送收费单:f5ac8ac014cf11eb9903bf84b40ed56c推送到消息队列成功', '2020-10-23 09:34:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2044', '2020-10-23 09:37:33:推送收费单:528c6c7e14d011ebb14d2933c51d25d0推送到消息队列成功', '2020-10-23 09:37:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2045', '2020-10-23 09:41:05:推送收费单:d0c55bb414d011ebba58a9698e5ae40e推送到消息队列成功', '2020-10-23 09:41:05', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2046', '2020-10-23 09:45:16:推送收费单:6662400614d111ebad3c972e96bc595c推送到消息队列成功', '2020-10-23 09:45:16', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2047', '2020-10-23 09:54:54:消息通知成功推送到消息队列成功', '2020-10-23 09:54:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2048', 'kf01登陆成功获取了令牌', '2020-10-23 09:57:39', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2049', 'kf01登陆成功获取了令牌', '2020-10-23 10:05:22', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2050', '2020-10-23 10:06:42:推送收费单:6507b87814d411eb89cf59a637408a5e推送到消息队列成功', '2020-10-23 10:06:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2051', '2020-10-23 10:07:51:推送收费单:8e24963614d411eb8fc18d578d33058f推送到消息队列成功', '2020-10-23 10:07:52', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('2052', 'kf01登陆成功获取了令牌', '2020-10-23 10:13:38', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2053', 'super登陆成功获取了令牌', '2020-10-23 10:22:28', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2054', 'kf01登陆成功获取了令牌', '2020-10-23 10:36:06', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2055', 'super登陆成功获取了令牌', '2020-10-23 10:36:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2056', '郑灿伟登陆成功获取了令牌', '2020-10-23 10:46:58', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2057', '2020-10-23 11:28:20:消息通知成功推送到消息队列成功', '2020-10-23 11:28:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2058', '2020-10-23 11:52:15:推送收费单:23dd4bf614e311eb844fefda28977077推送到消息队列成功', '2020-10-23 11:52:16', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2059', 'super登陆成功获取了令牌', '2020-10-23 13:35:32', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2060', 'super登陆成功获取了令牌', '2020-10-23 13:57:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2061', 'super登陆成功获取了令牌', '2020-10-23 13:57:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2062', 'super修改了id为14的权限', '2020-10-23 13:58:32', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('2063', 'super修改了id为15的权限', '2020-10-23 14:00:10', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('2269', 'super登陆成功获取了令牌', '2020-10-23 15:32:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2270', '2020-10-23 15:42:19:推送水控机水卡消费账单:SKL20102315421923210433}推送到消息队列成功', '2020-10-23 15:42:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2271', '2020-10-23 15:42:28:推送水控机水卡消费账单:SKL20102315422825128433}推送到消息队列成功', '2020-10-23 15:42:28', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2272', '2020-10-23 15:42:47:推送水控机水卡消费账单:SKL20102315424746681433}推送到消息队列成功', '2020-10-23 15:42:47', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2273', '2020-10-23 15:43:32:推送水控机水卡消费账单:SKL20102315433298780433}推送到消息队列成功', '2020-10-23 15:43:33', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2276', '2020-10-23 15:51:16:推送水控机水卡消费账单:SKL20102315511690548433}推送到消息队列成功', '2020-10-23 15:51:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2277', '2020-10-23 15:52:34:推送水控机水卡消费账单:SKL20102315523446013433}推送到消息队列成功', '2020-10-23 15:52:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2278', '2020-10-23 15:52:34:推送水控机水卡消费账单:SKL20102315523457794433}推送到消息队列成功', '2020-10-23 15:52:35', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2279', '2020-10-23 15:54:36:推送水控机水卡消费账单:SKL20102315543658613433}推送到消息队列成功', '2020-10-23 15:54:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2280', '2020-10-23 15:59:21:推送水控机水卡消费账单:SKL20102315592159885433}推送到消息队列成功', '2020-10-23 15:59:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2281', '2020-10-23 15:59:45:推送水控机水卡消费账单:SKL20102315594599384433}推送到消息队列成功', '2020-10-23 15:59:46', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2282', '2020-10-23 16:01:18:推送水控机水卡消费账单:SKL20102316011853658433}推送到消息队列成功', '2020-10-23 16:01:19', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2283', '2020-10-23 16:02:23:推送水控机水卡消费账单:SKL20102316022341955433}推送到消息队列成功', '2020-10-23 16:02:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2284', '2020-10-23 16:02:59:推送水控机水卡消费账单:SKL20102316025987923433}推送到消息队列成功', '2020-10-23 16:03:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2285', '2020-10-23 16:03:56:推送水控机水卡消费账单:SKL20102316035603875433}推送到消息队列成功', '2020-10-23 16:03:56', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2286', '2020-10-23 16:05:55:推送水控机水卡消费账单:SKL20102316055516342433}推送到消息队列成功', '2020-10-23 16:05:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2287', '2020-10-23 16:06:31:推送水控机水卡消费账单:SKL20102316063103369433}推送到消息队列成功', '2020-10-23 16:06:31', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2288', '2020-10-23 16:06:38:推送水控机水卡消费账单:SKL20102316063894731433}推送到消息队列成功', '2020-10-23 16:06:39', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2289', '2020-10-23 16:09:22:推送水控机水卡消费账单:SKL20102316092282369433}推送到消息队列成功', '2020-10-23 16:09:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2290', '2020-10-23 16:12:35:推送水控机水卡消费账单:SKL20102316123546365433}推送到消息队列成功', '2020-10-23 16:12:35', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2291', '2020-10-23 16:12:48:推送水控机水卡消费账单:SKL20102316124883416433}推送到消息队列成功', '2020-10-23 16:12:49', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2292', '2020-10-23 16:13:31:推送水控机水卡消费账单:SKL20102316133134891433}推送到消息队列成功', '2020-10-23 16:13:31', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2293', '2020-10-23 16:14:14:推送水控机水卡消费账单:SKL20102316141462450433}推送到消息队列成功', '2020-10-23 16:14:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2294', 'super登陆成功获取了令牌', '2020-10-23 17:46:08', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2295', '2020-10-24 08:00:02:账单推送:SDL20102408000205824433推送到消息队列成功', '2020-10-24 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2296', 'super登陆成功获取了令牌', '2020-10-24 09:22:07', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2297', 'super登陆成功获取了令牌', '2020-10-24 09:55:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2298', 'super登陆成功获取了令牌', '2020-10-24 15:02:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2299', 'super登陆成功获取了令牌', '2020-10-24 15:03:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2300', 'super登陆成功获取了令牌', '2020-10-24 15:53:54', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2301', '2020-10-25 08:00:01:账单推送:SDL20102508000177143433推送到消息队列成功', '2020-10-25 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2302', '2020-10-26 08:00:01:账单推送:SDL20102608000180923433推送到消息队列成功', '2020-10-26 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2303', 'kfadmin登陆成功获取了令牌', '2020-10-26 09:16:33', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2304', '2020-10-26 09:18:00:推送收费单:1682b930172911eb9d53cba2c75440e3推送到消息队列成功', '2020-10-26 09:18:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2305', '郑灿伟登陆成功获取了令牌', '2020-10-26 10:30:22', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2306', 'kfadmin登陆成功获取了令牌', '2020-10-26 11:30:02', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2307', '2020-10-26 11:30:37:推送收费单:9d2a65fc173b11ebab8bafc5f9722a24推送到消息队列成功', '2020-10-26 11:30:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2308', 'kfadmin登陆成功获取了令牌', '2020-10-26 12:56:42', null, '6', 'kfadmin', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2309', '郑灿伟登陆成功获取了令牌', '2020-10-26 13:44:53', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2310', 'super登陆成功获取了令牌', '2020-10-26 13:46:06', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2311', '2020-10-26 14:17:00:推送水控机水卡消费账单:SKL20102614170024797433}推送到消息队列成功', '2020-10-26 14:17:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2312', '2020-10-26 14:17:08:推送水控机水卡消费账单:SKL20102614170811994433}推送到消息队列成功', '2020-10-26 14:17:08', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2313', '2020-10-26 14:19:39:推送水控机水卡消费账单:SKL20102614193999047433}推送到消息队列成功', '2020-10-26 14:19:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2314', '2020-10-26 14:19:40:推送水控机水卡消费账单:SKL20102614194011568433}推送到消息队列成功', '2020-10-26 14:19:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2315', '杨育金登陆成功获取了令牌', '2020-10-26 14:21:32', null, '15', '杨育金', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2316', '2020-10-26 14:22:20:推送水控机水卡消费账单:SKL20102614222089264433}推送到消息队列成功', '2020-10-26 14:22:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2317', '2020-10-26 14:22:30:推送水控机水卡消费账单:SKL20102614223004747433}推送到消息队列成功', '2020-10-26 14:22:30', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2318', '2020-10-26 14:22:34:推送水控机水卡消费账单:SKL20102614223411440433}推送到消息队列成功', '2020-10-26 14:22:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2319', '2020-10-26 14:23:45:推送水控机水卡消费账单:SKL20102614234535242433}推送到消息队列成功', '2020-10-26 14:23:45', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2320', '2020-10-26 14:26:53:推送水控机水卡消费账单:SKL20102614265334537433}推送到消息队列成功', '2020-10-26 14:26:53', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2321', '2020-10-26 14:29:44:推送水控机水卡消费账单:SKL20102614294402849433}推送到消息队列成功', '2020-10-26 14:29:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2322', '2020-10-26 14:31:23:推送水控机水卡消费账单:SKL20102614312320273433}推送到消息队列成功', '2020-10-26 14:31:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2323', '2020-10-26 14:53:58:推送水控机水卡消费账单:SKL20102614535834461433}推送到消息队列成功', '2020-10-26 14:53:58', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2324', '2020-10-26 14:54:32:推送水控机水卡消费账单:SKL20102614543237331433}推送到消息队列成功', '2020-10-26 14:54:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2325', '2020-10-26 14:54:33:推送水控机水卡消费账单:SKL20102614543375449433}推送到消息队列成功', '2020-10-26 14:54:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2326', '2020-10-26 14:54:39:推送水控机水卡消费账单:SKL20102614543972699433}推送到消息队列成功', '2020-10-26 14:54:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2327', '2020-10-26 14:54:43:推送水控机水卡消费账单:SKL20102614544397091433}推送到消息队列成功', '2020-10-26 14:54:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2328', '2020-10-26 14:54:47:推送水控机水卡消费账单:SKL20102614544737091433}推送到消息队列成功', '2020-10-26 14:54:47', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2329', '2020-10-26 14:54:53:推送水控机水卡消费账单:SKL20102614545333779433}推送到消息队列成功', '2020-10-26 14:54:53', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2330', '2020-10-26 14:55:09:推送水控机水卡消费账单:SKL20102614550941149433}推送到消息队列成功', '2020-10-26 14:55:09', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2331', '2020-10-26 14:55:15:推送水控机水卡消费账单:SKL20102614551500158433}推送到消息队列成功', '2020-10-26 14:55:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2332', '2020-10-26 15:08:05:推送水控机水卡消费账单:SKL20102615080552772433}推送到消息队列成功', '2020-10-26 15:08:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2333', '2020-10-26 15:17:01:推送水控机水卡消费账单:SKL20102615170155227433}推送到消息队列成功', '2020-10-26 15:17:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2334', '2020-10-26 15:17:39:推送水控机水卡消费账单:SKL20102615173920783433}推送到消息队列成功', '2020-10-26 15:17:39', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2335', '2020-10-26 15:17:52:推送水控机水卡消费账单:SKL20102615175242750433}推送到消息队列成功', '2020-10-26 15:17:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2336', '2020-10-26 15:19:22:推送水控机水卡消费账单:SKL20102615192220547433}推送到消息队列成功', '2020-10-26 15:19:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2337', '林晓晖01登陆成功获取了令牌', '2020-10-26 15:29:11', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2338', '2020-10-26 15:30:06:推送水控机水卡消费账单:SKL20102615300671238433}推送到消息队列成功', '2020-10-26 15:30:07', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2339', '2020-10-26 15:30:27:推送水控机水卡消费账单:SKL20102615302703712433}推送到消息队列成功', '2020-10-26 15:30:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2340', '2020-10-26 15:31:09:推送水控机水卡消费账单:SKL20102615310902775433}推送到消息队列成功', '2020-10-26 15:31:09', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2341', '2020-10-26 15:32:18:推送水控机水卡消费账单:SKL20102615321814581433}推送到消息队列成功', '2020-10-26 15:32:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2342', '2020-10-26 15:32:18:推送水控机水卡消费账单:SKL20102615321826712433}推送到消息队列成功', '2020-10-26 15:32:18', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2343', '2020-10-26 15:40:36:推送收费单:899c7b6a175e11eb805f69264dad975a推送到消息队列成功', '2020-10-26 15:40:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2344', '2020-10-26 15:40:45:推送水控机水卡消费账单:SKL20102615404500394433}推送到消息队列成功', '2020-10-26 15:40:45', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2345', '2020-10-26 15:47:59:推送水控机水卡消费账单:SKL20102615475904875433}推送到消息队列成功', '2020-10-26 15:47:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2346', '2020-10-26 15:47:59:推送水控机水卡消费账单:SKL20102615475916947433}推送到消息队列成功', '2020-10-26 15:47:59', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2347', 'super登陆成功获取了令牌', '2020-10-26 16:20:30', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2348', 'super登陆成功获取了令牌', '2020-10-26 16:20:30', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2349', '林晓晖登陆成功获取了令牌', '2020-10-26 17:12:45', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2350', '2020-10-27 08:00:01:账单推送:SDL20102708000190150433推送到消息队列成功', '2020-10-27 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2351', 'super登陆成功获取了令牌', '2020-10-27 09:08:10', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2352', 'kf01登陆成功获取了令牌', '2020-10-27 09:23:55', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2353', '郑灿伟登陆成功获取了令牌', '2020-10-27 09:53:17', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2354', 'super登陆成功获取了令牌', '2020-10-27 09:59:00', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2355', 'kf01登陆成功获取了令牌', '2020-10-27 10:28:31', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2356', 'kf01登陆成功获取了令牌', '2020-10-27 10:31:27', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2357', 'kf01登陆成功获取了令牌', '2020-10-27 10:33:05', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2358', 'kf01登陆成功获取了令牌', '2020-10-27 10:39:35', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2359', 'kf01登陆成功获取了令牌', '2020-10-27 10:41:57', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2360', 'kf01登陆成功获取了令牌', '2020-10-27 10:44:22', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2361', 'kf01登陆成功获取了令牌', '2020-10-27 10:56:25', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2362', 'kf01登陆成功获取了令牌', '2020-10-27 11:00:20', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2363', 'kf01登陆成功获取了令牌', '2020-10-27 11:02:44', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2364', 'kf01登陆成功获取了令牌', '2020-10-27 11:08:11', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2365', 'kf01登陆成功获取了令牌', '2020-10-27 11:11:22', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2366', 'kf01登陆成功获取了令牌', '2020-10-27 11:13:36', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2367', 'kf01登陆成功获取了令牌', '2020-10-27 11:15:28', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2368', 'kf01登陆成功获取了令牌', '2020-10-27 13:33:14', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2369', 'kf01登陆成功获取了令牌', '2020-10-27 13:35:37', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2370', 'kf01登陆成功获取了令牌', '2020-10-27 13:35:53', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2371', 'kf01登陆成功获取了令牌', '2020-10-27 13:39:42', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2372', 'kf01登陆成功获取了令牌', '2020-10-27 13:40:42', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2373', 'kf01登陆成功获取了令牌', '2020-10-27 13:42:00', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2374', 'kf01登陆成功获取了令牌', '2020-10-27 13:42:48', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2375', 'kf01登陆成功获取了令牌', '2020-10-27 13:47:57', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2376', '2020-10-27 13:48:51:推送收费单:17265d20181811eba8885b07effdfb23推送到消息队列成功', '2020-10-27 13:48:51', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2377', '2020-10-27 13:49:14:推送收费单:2555249e181811eba157f7d0d986c510推送到消息队列成功', '2020-10-27 13:49:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2378', 'super登陆成功获取了令牌', '2020-10-27 13:52:42', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2379', '2020-10-27 13:59:24:推送收费单:909d08b0181911eb940311bdf1b1fd44推送到消息队列成功', '2020-10-27 13:59:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2380', 'super登陆成功获取了令牌', '2020-10-27 13:59:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2381', 'kf01登陆成功获取了令牌', '2020-10-27 14:00:20', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2382', '林晓晖登陆成功获取了令牌', '2020-10-27 14:03:49', null, '16', '林晓晖', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2383', '2020-10-27 14:04:29:推送收费单:4628e334181a11ebbf48b9a95361d491推送到消息队列成功', '2020-10-27 14:04:29', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2384', 'super修改了id为8的权限', '2020-10-27 14:10:41', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('2385', 'super登陆成功获取了令牌', '2020-10-27 14:16:45', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2386', 'kf01登陆成功获取了令牌', '2020-10-27 14:17:39', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2387', 'super创建了一个用户', '2020-10-27 14:24:27', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('2388', '陈少佳登陆成功获取了令牌', '2020-10-27 14:25:03', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2389', 'super修改了id为8的权限', '2020-10-27 14:25:23', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('2390', 'super登陆成功获取了令牌', '2020-10-27 14:27:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2391', '2020-10-27 14:27:43:推送收费单:85805ad2181d11eb91ff03b0f4886f76推送到消息队列成功', '2020-10-27 14:27:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2392', 'super修改了id为8的权限', '2020-10-27 14:30:18', null, '1', 'super', '200', 'POST', 'admin/v1/manager/dispatch/patch', '');
INSERT INTO `lin_log` VALUES ('2393', '陈少佳登陆成功获取了令牌', '2020-10-27 14:31:06', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2394', '2020-10-27 14:31:39:消息通知成功推送到消息队列成功', '2020-10-27 14:31:40', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2395', 'kf01登陆成功获取了令牌', '2020-10-27 14:32:10', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2396', '陈少佳登陆成功获取了令牌', '2020-10-27 14:32:12', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2397', 'kf01登陆成功获取了令牌', '2020-10-27 14:33:43', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2398', '郑灿伟登陆成功获取了令牌', '2020-10-27 14:35:43', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2399', 'kf01登陆成功获取了令牌', '2020-10-27 14:37:59', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2400', 'kf01登陆成功获取了令牌', '2020-10-27 14:39:56', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2401', '陈少佳登陆成功获取了令牌', '2020-10-27 14:41:19', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2402', 'super登陆成功获取了令牌', '2020-10-27 14:41:44', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2403', 'kf01登陆成功获取了令牌', '2020-10-27 14:42:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2404', 'kf01登陆成功获取了令牌', '2020-10-27 14:43:39', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2405', 'super登陆成功获取了令牌', '2020-10-27 14:44:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2406', 'kf01登陆成功获取了令牌', '2020-10-27 14:45:29', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2407', '郑灿伟登陆成功获取了令牌', '2020-10-27 14:46:20', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2408', 'kf01登陆成功获取了令牌', '2020-10-27 14:46:55', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2409', 'kf01登陆成功获取了令牌', '2020-10-27 14:48:04', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2410', 'kf01登陆成功获取了令牌', '2020-10-27 14:50:07', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2411', 'super创建了一个用户', '2020-10-27 14:52:24', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('2412', '测试收银员登陆成功获取了令牌', '2020-10-27 14:52:43', null, '26', '测试收银员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2413', 'kf01登陆成功获取了令牌', '2020-10-27 14:53:26', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2414', 'super登陆成功获取了令牌', '2020-10-27 14:54:01', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2415', 'kf01登陆成功获取了令牌', '2020-10-27 14:57:43', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2416', '郑灿伟登陆成功获取了令牌', '2020-10-27 15:11:32', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2417', '2020-10-27 15:13:03:消息通知成功推送到消息队列成功', '2020-10-27 15:13:03', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2418', '郑灿伟登陆成功获取了令牌', '2020-10-27 15:21:24', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2419', '陈少佳登陆成功获取了令牌', '2020-10-27 15:21:57', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2420', '郑灿伟登陆成功获取了令牌', '2020-10-27 15:23:25', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2421', '陈少佳登陆成功获取了令牌', '2020-10-27 15:24:31', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2422', 'super登陆成功获取了令牌', '2020-10-27 15:25:10', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2423', '陈少佳登陆成功获取了令牌', '2020-10-27 15:26:09', null, '25', '陈少佳', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2424', '2020-10-27 15:27:51:推送收费单:ec132c9a182511eba2587fc5a081c002推送到消息队列成功', '2020-10-27 15:27:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2425', '2020-10-27 15:32:25:推送收费单:8efa0de8182611ebb29811f6b7f538f9推送到消息队列成功', '2020-10-27 15:32:25', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2426', '2020-10-27 15:34:31:推送水控机水卡消费账单:SKL20102715343176722433}推送到消息队列成功', '2020-10-27 15:34:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2427', 'kf01登陆成功获取了令牌', '2020-10-27 15:35:08', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2428', '2020-10-27 15:38:22:推送水控机水卡消费账单:SKL20102715382273674433}推送到消息队列成功', '2020-10-27 15:38:23', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2429', '2020-10-27 15:45:51:推送收费单:6fa1ab7a182811eb88125708225172f2推送到消息队列成功', '2020-10-27 15:45:52', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/card_recharge', '');
INSERT INTO `lin_log` VALUES ('2430', '2020-10-27 15:47:09:推送水控机水卡消费账单:SKL20102715470987061433}推送到消息队列成功', '2020-10-27 15:47:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2431', '2020-10-27 15:47:20:推送水控机水卡消费账单:SKL20102715472021928433}推送到消息队列成功', '2020-10-27 15:47:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2432', '郑灿伟登陆成功获取了令牌', '2020-10-27 15:54:17', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2433', 'kf01登陆成功获取了令牌', '2020-10-27 15:59:42', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2434', 'super登陆成功获取了令牌', '2020-10-27 16:07:18', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2435', '2020-10-27 16:44:41:推送收费单:a7966248183011eb8ad2d13dd68a07dc推送到消息队列成功', '2020-10-27 16:44:41', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2436', '2020-10-27 17:00:22:推送收费单:d86a6b7e183211ebb694d551dfc2ce52推送到消息队列成功', '2020-10-27 17:00:22', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2437', '测试收银员登陆成功获取了令牌', '2020-10-27 17:07:35', null, '26', '测试收银员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2438', '测试收银员登陆成功获取了令牌', '2020-10-27 17:26:16', null, '26', '测试收银员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2439', '郑灿伟登陆成功获取了令牌', '2020-10-27 18:10:20', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2440', 'super登陆成功获取了令牌', '2020-10-27 18:19:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2441', '2020-10-28 08:00:02:账单推送:SDL20102808000239037433推送到消息队列成功', '2020-10-28 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2442', 'super登陆成功获取了令牌', '2020-10-28 09:20:06', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2443', 'super登陆成功获取了令牌', '2020-10-28 11:09:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2445', 'super登陆成功获取了令牌', '2020-10-28 17:38:19', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2446', '郑灿伟登陆成功获取了令牌', '2020-10-28 19:18:48', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2447', 'super登陆成功获取了令牌', '2020-10-28 22:17:15', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2448', '2020-10-29 08:00:01:账单推送:SDL20102908000198376433推送到消息队列成功', '2020-10-29 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2449', '郑灿伟登陆成功获取了令牌', '2020-10-29 09:40:26', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2450', '林泽珍登陆成功获取了令牌', '2020-10-29 09:44:31', null, '12', '林泽珍', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2451', '郑灿伟登陆成功获取了令牌', '2020-10-29 09:45:21', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2452', 'super登陆成功获取了令牌', '2020-10-29 09:57:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2453', '林泽珍登陆成功获取了令牌', '2020-10-29 10:10:20', null, '12', '林泽珍', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2454', '2020-10-29 10:42:12:推送水控机水卡消费账单:SKL20102910421228418433}推送到消息队列成功', '2020-10-29 10:42:12', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2455', '2020-10-29 10:42:17:推送水控机水卡消费账单:SKL20102910421722228433}推送到消息队列成功', '2020-10-29 10:42:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2456', '2020-10-29 11:36:24:推送水控机水卡消费账单:SKL20102911362476357433}推送到消息队列成功', '2020-10-29 11:36:25', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2457', '2020-10-29 14:00:03:推送水控机水卡消费账单:SKL20102914000368720433}推送到消息队列成功', '2020-10-29 14:00:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2458', '郑灿伟登陆成功获取了令牌', '2020-10-29 14:32:55', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2459', 'super登陆成功获取了令牌', '2020-10-29 15:09:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2460', '2020-10-29 15:16:24:推送水控机水卡消费账单:SKL20102915162402186433}推送到消息队列成功', '2020-10-29 15:16:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2461', '2020-10-29 15:16:24:推送水控机水卡消费账单:SKL20102915162413087433}推送到消息队列成功', '2020-10-29 15:16:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2462', '2020-10-29 15:16:24:推送水控机水卡消费账单:SKL20102915162424785433}推送到消息队列成功', '2020-10-29 15:16:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2463', '2020-10-29 15:17:33:推送水控机水卡消费账单:SKL20102915173356141433}推送到消息队列成功', '2020-10-29 15:17:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2464', '2020-10-29 15:17:33:推送水控机水卡消费账单:SKL20102915173367327433}推送到消息队列成功', '2020-10-29 15:17:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2465', '2020-10-29 15:17:33:推送水控机水卡消费账单:SKL20102915173377783433}推送到消息队列成功', '2020-10-29 15:17:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2466', '2020-10-29 15:17:34:推送水控机水卡消费账单:SKL20102915173417386433}推送到消息队列成功', '2020-10-29 15:17:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2467', '2020-10-29 15:17:34:推送水控机水卡消费账单:SKL20102915173428841433}推送到消息队列成功', '2020-10-29 15:17:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2468', '2020-10-29 15:17:34:推送水控机水卡消费账单:SKL20102915173439713433}推送到消息队列成功', '2020-10-29 15:17:34', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2469', '2020-10-29 15:17:34:推送水控机水卡消费账单:SKL20102915173465646433}推送到消息队列成功', '2020-10-29 15:17:35', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2470', '2020-10-29 15:17:54:推送水控机水卡消费账单:SKL20102915175496977433}推送到消息队列成功', '2020-10-29 15:17:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2471', '2020-10-29 15:18:02:推送水控机水卡消费账单:SKL20102915180242246433}推送到消息队列成功', '2020-10-29 15:18:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2472', '2020-10-29 15:34:23:推送水控机水卡消费账单:SKL20102915342361780433}推送到消息队列成功', '2020-10-29 15:34:24', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2473', '2020-10-29 15:42:04:推送水控机水卡消费账单:SKL20102915420409877433}推送到消息队列成功', '2020-10-29 15:42:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2474', '2020-10-29 15:42:04:推送水控机水卡消费账单:SKL20102915420420280433}推送到消息队列成功', '2020-10-29 15:42:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2475', '2020-10-29 15:42:04:推送水控机水卡消费账单:SKL20102915420431510433}推送到消息队列成功', '2020-10-29 15:42:04', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2476', '2020-10-29 15:43:12:推送水控机水卡消费账单:SKL20102915431255387433}推送到消息队列成功', '2020-10-29 15:43:13', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2477', '2020-10-29 15:43:12:推送水控机水卡消费账单:SKL20102915431266998433}推送到消息队列成功', '2020-10-29 15:43:13', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2478', '2020-10-29 15:43:19:推送水控机水卡消费账单:SKL20102915431966254433}推送到消息队列成功', '2020-10-29 15:43:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2479', '2020-10-29 15:55:20:推送水控机水卡消费账单:SKL20102915552048275433}推送到消息队列成功', '2020-10-29 15:55:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2480', '2020-10-29 15:55:20:推送水控机水卡消费账单:SKL20102915552059656433}推送到消息队列成功', '2020-10-29 15:55:21', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2481', '2020-10-29 15:57:15:推送水控机水卡消费账单:SKL20102915571587734433}推送到消息队列成功', '2020-10-29 15:57:16', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2482', '2020-10-29 15:57:16:推送水控机水卡消费账单:SKL20102915571650747433}推送到消息队列成功', '2020-10-29 15:57:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2483', '2020-10-29 15:57:16:推送水控机水卡消费账单:SKL20102915571661827433}推送到消息队列成功', '2020-10-29 15:57:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2484', '2020-10-29 15:57:16:推送水控机水卡消费账单:SKL20102915571672541433}推送到消息队列成功', '2020-10-29 15:57:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2485', '2020-10-29 15:57:17:推送水控机水卡消费账单:SKL20102915571716168433}推送到消息队列成功', '2020-10-29 15:57:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2486', '2020-10-29 15:57:17:推送水控机水卡消费账单:SKL20102915571727636433}推送到消息队列成功', '2020-10-29 15:57:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2487', '2020-10-29 15:57:17:推送水控机水卡消费账单:SKL20102915571738174433}推送到消息队列成功', '2020-10-29 15:57:17', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2488', '2020-10-29 15:57:55:推送水控机水卡消费账单:SKL20102915575543217433}推送到消息队列成功', '2020-10-29 15:57:55', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2489', '2020-10-29 16:01:59:推送水控机水卡消费账单:SKL20102916015973048433}推送到消息队列成功', '2020-10-29 16:02:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2490', '2020-10-29 16:01:59:推送水控机水卡消费账单:SKL20102916015983719433}推送到消息队列成功', '2020-10-29 16:02:00', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2491', '2020-10-29 16:03:37:推送水控机水卡消费账单:SKL20102916033780117433}推送到消息队列成功', '2020-10-29 16:03:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2492', '2020-10-29 16:03:38:推送水控机水卡消费账单:SKL20102916033840125433}推送到消息队列成功', '2020-10-29 16:03:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2493', '2020-10-29 16:03:38:推送水控机水卡消费账单:SKL20102916033851041433}推送到消息队列成功', '2020-10-29 16:03:39', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2494', 'kf01登陆成功获取了令牌', '2020-10-29 16:16:14', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2495', '郑灿伟登陆成功获取了令牌', '2020-10-29 16:22:51', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2496', 'super登陆成功获取了令牌', '2020-10-29 17:13:14', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2497', 'super登陆成功获取了令牌', '2020-10-29 17:13:28', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2498', '2020-10-29 17:34:16:报修通知推送到消息队列成功', '2020-10-29 17:34:17', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2499', '2020-10-29 17:35:42:报修状态通知推送到消息队列成功', '2020-10-29 17:35:42', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2500', '2020-10-29 17:35:42:报修状态通知推送到消息队列成功', '2020-10-29 17:35:42', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2501', '2020-10-29 17:35:42:报修状态通知推送到消息队列成功', '2020-10-29 17:35:42', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2502', '2020-10-29 17:35:42:报修状态通知推送到消息队列成功', '2020-10-29 17:35:42', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2503', '2020-10-29 17:35:42:报修状态通知推送到消息队列成功', '2020-10-29 17:35:42', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2504', '2020-10-29 17:35:42:报修通知推送到消息队列成功', '2020-10-29 17:35:42', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2505', '2020-10-29 17:37:56:推送报修账单:BXD20102917341668782433推送到消息队列成功', '2020-10-29 17:37:56', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2506', '2020-10-29 17:38:01:消息通知成功推送到消息队列成功', '2020-10-29 17:38:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2507', '2020-10-29 17:38:01:消息通知成功推送到消息队列成功', '2020-10-29 17:38:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2508', '2020-10-29 17:38:01:消息通知成功推送到消息队列成功', '2020-10-29 17:38:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2509', '2020-10-29 17:38:01:消息通知成功推送到消息队列成功', '2020-10-29 17:38:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2510', '2020-10-29 17:38:01:消息通知成功推送到消息队列成功', '2020-10-29 17:38:01', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2511', '2020-10-29 17:39:19:推送报修申请取消:4189推送到消息队列成功', '2020-10-29 17:39:20', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2512', '2020-10-29 17:39:19:报修进度通知推送到消息队列成功', '2020-10-29 17:39:20', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e9d2dbe219c911ebaec125a6e64016c1', '');
INSERT INTO `lin_log` VALUES ('2513', '2020-10-30 08:00:02:账单推送:SDL20103008000266548433推送到消息队列成功', '2020-10-30 08:00:03', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2514', '郑灿伟登陆成功获取了令牌', '2020-10-30 09:13:04', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2515', 'super登陆成功获取了令牌', '2020-10-30 09:18:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2516', 'super登陆成功获取了令牌', '2020-10-30 09:23:28', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2517', 'super登陆成功获取了令牌', '2020-10-30 09:25:31', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2518', '测试收银员登陆成功获取了令牌', '2020-10-30 09:36:46', null, '26', '测试收银员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2519', 'super登陆成功获取了令牌', '2020-10-30 09:36:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2520', '郑灿伟登陆成功获取了令牌', '2020-10-30 10:01:26', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2521', 'super登陆成功获取了令牌', '2020-10-30 10:01:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2522', '郑灿伟登陆成功获取了令牌', '2020-10-30 10:04:35', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2523', 'super登陆成功获取了令牌', '2020-10-30 10:07:51', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2524', '2020-10-30 10:28:29:报修通知推送到消息队列成功', '2020-10-30 10:28:29', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2525', '2020-10-30 10:32:09:报修状态通知推送到消息队列成功', '2020-10-30 10:32:10', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/98a9bc7a1a5711ebbffcffd7ccbe36c6', '');
INSERT INTO `lin_log` VALUES ('2526', '2020-10-30 10:32:09:报修状态通知推送到消息队列成功', '2020-10-30 10:32:10', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/98a9bc7a1a5711ebbffcffd7ccbe36c6', '');
INSERT INTO `lin_log` VALUES ('2527', '2020-10-30 10:32:09:报修状态通知推送到消息队列成功', '2020-10-30 10:32:10', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/98a9bc7a1a5711ebbffcffd7ccbe36c6', '');
INSERT INTO `lin_log` VALUES ('2528', '2020-10-30 10:32:09:报修状态通知推送到消息队列成功', '2020-10-30 10:32:10', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/98a9bc7a1a5711ebbffcffd7ccbe36c6', '');
INSERT INTO `lin_log` VALUES ('2529', '2020-10-30 10:32:09:报修状态通知推送到消息队列成功', '2020-10-30 10:32:10', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/98a9bc7a1a5711ebbffcffd7ccbe36c6', '');
INSERT INTO `lin_log` VALUES ('2530', '2020-10-30 10:32:09:报修通知推送到消息队列成功', '2020-10-30 10:32:10', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/98a9bc7a1a5711ebbffcffd7ccbe36c6', '');
INSERT INTO `lin_log` VALUES ('2531', '2020-10-30 10:37:02:推送报修账单:BXD20103010282905842433推送到消息队列成功', '2020-10-30 10:37:03', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2532', '2020-10-30 10:37:06:消息通知成功推送到消息队列成功', '2020-10-30 10:37:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2533', '2020-10-30 10:37:06:消息通知成功推送到消息队列成功', '2020-10-30 10:37:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2534', '2020-10-30 10:37:06:消息通知成功推送到消息队列成功', '2020-10-30 10:37:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2535', '2020-10-30 10:37:06:消息通知成功推送到消息队列成功', '2020-10-30 10:37:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2536', '2020-10-30 10:37:06:消息通知成功推送到消息队列成功', '2020-10-30 10:37:06', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2537', 'super登陆成功获取了令牌', '2020-10-30 10:39:43', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2538', '2020-10-30 10:47:57:报修通知推送到消息队列成功', '2020-10-30 10:47:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2539', '2020-10-30 10:48:56:报修通知推送到消息队列成功', '2020-10-30 10:48:56', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2540', '2020-10-30 10:48:56:报修通知推送到消息队列成功', '2020-10-30 10:48:56', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2541', '2020-10-30 10:49:22:报修状态通知推送到消息队列成功', '2020-10-30 10:49:22', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/740f33d81a5a11ebb8ec2b88fa72fd4f', '');
INSERT INTO `lin_log` VALUES ('2542', '2020-10-30 10:49:22:报修状态通知推送到消息队列成功', '2020-10-30 10:49:22', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/740f33d81a5a11ebb8ec2b88fa72fd4f', '');
INSERT INTO `lin_log` VALUES ('2543', '2020-10-30 10:49:22:报修状态通知推送到消息队列成功', '2020-10-30 10:49:22', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/740f33d81a5a11ebb8ec2b88fa72fd4f', '');
INSERT INTO `lin_log` VALUES ('2544', '2020-10-30 10:49:22:报修状态通知推送到消息队列成功', '2020-10-30 10:49:22', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/740f33d81a5a11ebb8ec2b88fa72fd4f', '');
INSERT INTO `lin_log` VALUES ('2545', '2020-10-30 10:49:22:报修状态通知推送到消息队列成功', '2020-10-30 10:49:22', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/740f33d81a5a11ebb8ec2b88fa72fd4f', '');
INSERT INTO `lin_log` VALUES ('2546', '2020-10-30 10:49:22:报修通知推送到消息队列成功', '2020-10-30 10:49:22', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/740f33d81a5a11ebb8ec2b88fa72fd4f', '');
INSERT INTO `lin_log` VALUES ('2547', '2020-10-30 10:52:07:推送报修账单:BXD20103010485613744433推送到消息队列成功', '2020-10-30 10:52:07', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2548', '2020-10-30 10:52:10:消息通知成功推送到消息队列成功', '2020-10-30 10:52:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2549', '2020-10-30 10:52:10:消息通知成功推送到消息队列成功', '2020-10-30 10:52:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2550', '2020-10-30 10:52:10:消息通知成功推送到消息队列成功', '2020-10-30 10:52:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2551', '2020-10-30 10:52:10:消息通知成功推送到消息队列成功', '2020-10-30 10:52:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2552', '2020-10-30 10:52:10:消息通知成功推送到消息队列成功', '2020-10-30 10:52:10', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2553', '2020-10-30 10:53:19:报修进度通知推送到消息队列成功', '2020-10-30 10:53:19', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('2554', '2020-10-30 10:53:19:推送收费单:10d6d0a41a5b11eba15173d84c7bff8a推送到消息队列成功', '2020-10-30 10:53:19', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('2555', 'super登陆成功获取了令牌', '2020-10-30 10:58:43', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2556', 'super登陆成功获取了令牌', '2020-10-30 10:59:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2557', '2020-10-30 11:19:58:报修通知推送到消息队列成功', '2020-10-30 11:19:59', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2558', '2020-10-30 11:19:58:报修通知推送到消息队列成功', '2020-10-30 11:19:59', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2559', '2020-10-30 11:20:45:报修状态通知推送到消息队列成功', '2020-10-30 11:20:46', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/ca4ff7d81a5e11eba08445e6437df2c7', '');
INSERT INTO `lin_log` VALUES ('2560', '2020-10-30 11:20:45:报修状态通知推送到消息队列成功', '2020-10-30 11:20:46', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/ca4ff7d81a5e11eba08445e6437df2c7', '');
INSERT INTO `lin_log` VALUES ('2561', '2020-10-30 11:20:45:报修状态通知推送到消息队列成功', '2020-10-30 11:20:46', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/ca4ff7d81a5e11eba08445e6437df2c7', '');
INSERT INTO `lin_log` VALUES ('2562', '2020-10-30 11:20:45:报修状态通知推送到消息队列成功', '2020-10-30 11:20:46', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/ca4ff7d81a5e11eba08445e6437df2c7', '');
INSERT INTO `lin_log` VALUES ('2563', '2020-10-30 11:20:45:报修状态通知推送到消息队列成功', '2020-10-30 11:20:46', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/ca4ff7d81a5e11eba08445e6437df2c7', '');
INSERT INTO `lin_log` VALUES ('2564', '2020-10-30 11:20:45:报修通知推送到消息队列成功', '2020-10-30 11:20:46', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/ca4ff7d81a5e11eba08445e6437df2c7', '');
INSERT INTO `lin_log` VALUES ('2565', 'super登陆成功获取了令牌', '2020-10-30 14:09:45', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2566', '2020-10-30 14:21:11:推送水控机水卡消费账单:SKL20103014211134364433}推送到消息队列成功', '2020-10-30 14:21:11', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2567', '2020-10-30 14:21:19:推送水控机水卡消费账单:SKL20103014211966789433}推送到消息队列成功', '2020-10-30 14:21:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2568', 'super登陆成功获取了令牌', '2020-10-30 14:22:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2569', '2020-10-30 14:22:19:推送水控机水卡消费账单:SKL20103014221964835433}推送到消息队列成功', '2020-10-30 14:22:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2570', '2020-10-30 14:22:32:推送水控机水卡消费账单:SKL20103014223253243433}推送到消息队列成功', '2020-10-30 14:22:33', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2571', '2020-10-30 14:22:46:推送水控机水卡消费账单:SKL20103014224613020433}推送到消息队列成功', '2020-10-30 14:22:46', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2572', '2020-10-30 14:23:43:推送水控机水卡消费账单:SKL20103014234346211433}推送到消息队列成功', '2020-10-30 14:23:43', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2573', '2020-10-30 14:24:19:推送水控机水卡消费账单:SKL20103014241978691433}推送到消息队列成功', '2020-10-30 14:24:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2574', '2020-10-30 14:25:30:推送水控机水卡消费账单:SKL20103014253015757433}推送到消息队列成功', '2020-10-30 14:25:30', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2575', '2020-10-30 14:26:37:推送水控机水卡消费账单:SKL20103014263705563433}推送到消息队列成功', '2020-10-30 14:26:37', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/machine/add_card_log', '');
INSERT INTO `lin_log` VALUES ('2576', '郑灿伟登陆成功获取了令牌', '2020-10-30 14:41:44', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2577', 'super登陆成功获取了令牌', '2020-10-30 14:42:56', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2578', 'super登陆成功获取了令牌', '2020-10-30 14:59:51', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2579', '郑灿伟登陆成功获取了令牌', '2020-10-30 16:15:54', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2580', 'super登陆成功获取了令牌', '2020-10-30 17:42:59', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2581', 'super登陆成功获取了令牌', '2020-10-30 20:16:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2582', 'super登陆成功获取了令牌', '2020-10-30 20:16:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2583', 'super登陆成功获取了令牌', '2020-10-30 23:12:43', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2584', '2020-10-31 08:00:02:账单推送:SDL20103108000294685433推送到消息队列成功', '2020-10-31 08:00:03', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2585', '郑灿伟登陆成功获取了令牌', '2020-10-31 09:03:55', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2586', 'super登陆成功获取了令牌', '2020-10-31 09:09:47', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2587', 'super登陆成功获取了令牌', '2020-10-31 10:07:39', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2588', 'super登陆成功获取了令牌', '2020-10-31 10:23:35', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2589', 'super登陆成功获取了令牌', '2020-10-31 10:25:01', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2590', 'super登陆成功获取了令牌', '2020-10-31 10:35:25', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2591', '2020-10-31 11:16:43:消息通知成功推送到消息队列成功', '2020-10-31 11:16:44', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2592', '2020-10-31 11:32:52:更新合同ID:1843,状态3推送到消息队列成功', '2020-10-31 11:32:52', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/exec/723326b41b2711eb8213a3b0439b139e', '');
INSERT INTO `lin_log` VALUES ('2593', '2020-10-31 11:32:52:商户入驻成功推送到消息队列成功', '2020-10-31 11:32:52', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/contract/exec/723326b41b2711eb8213a3b0439b139e', '');
INSERT INTO `lin_log` VALUES ('2594', '2020-10-31 11:38:42:报修通知推送到消息队列成功', '2020-10-31 11:38:42', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2595', '2020-10-31 11:38:42:报修通知推送到消息队列成功', '2020-10-31 11:38:42', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2596', '2020-10-31 11:38:42:报修通知推送到消息队列成功', '2020-10-31 11:38:42', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2597', '2020-10-31 11:40:03:报修进度通知推送到消息队列成功', '2020-10-31 11:40:03', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/cancel/923350801b2a11eb9c3b0d5d2004026c', '');
INSERT INTO `lin_log` VALUES ('2598', '2020-10-31 11:41:02:报修通知推送到消息队列成功', '2020-10-31 11:41:03', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2599', '2020-10-31 11:41:02:报修通知推送到消息队列成功', '2020-10-31 11:41:03', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2600', '2020-10-31 11:41:02:报修通知推送到消息队列成功', '2020-10-31 11:41:03', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2601', '2020-10-31 11:41:26:报修状态通知推送到消息队列成功', '2020-10-31 11:41:26', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2602', '2020-10-31 11:41:26:报修通知推送到消息队列成功', '2020-10-31 11:41:26', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2603', '2020-10-31 11:41:51:推送报修账单:BXD20103111410281356643推送到消息队列成功', '2020-10-31 11:41:51', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2604', '2020-10-31 11:41:53:消息通知成功推送到消息队列成功', '2020-10-31 11:41:54', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2605', '2020-10-31 11:42:34:推送报修申请取消:4190推送到消息队列成功', '2020-10-31 11:42:34', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2606', '2020-10-31 11:42:34:报修进度通知推送到消息队列成功', '2020-10-31 11:42:34', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2607', '2020-10-31 11:42:34:报修进度通知推送到消息队列成功', '2020-10-31 11:42:34', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2608', '2020-10-31 11:42:34:报修进度通知推送到消息队列成功', '2020-10-31 11:42:34', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2609', 'super登陆成功获取了令牌', '2020-10-31 11:46:03', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2610', '2020-10-31 11:59:49:报修通知推送到消息队列成功', '2020-10-31 11:59:50', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2611', '2020-10-31 11:59:49:报修通知推送到消息队列成功', '2020-10-31 11:59:50', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2612', '2020-10-31 11:59:49:报修通知推送到消息队列成功', '2020-10-31 11:59:50', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2613', '2020-10-31 12:00:04:报修状态通知推送到消息队列成功', '2020-10-31 12:00:05', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/85e58b381b2d11ebb0e8192700db24d1', '');
INSERT INTO `lin_log` VALUES ('2614', '2020-10-31 12:00:04:报修通知推送到消息队列成功', '2020-10-31 12:00:05', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/85e58b381b2d11ebb0e8192700db24d1', '');
INSERT INTO `lin_log` VALUES ('2615', '2020-10-31 12:00:23:推送报修账单:BXD20103111594987136643推送到消息队列成功', '2020-10-31 12:00:24', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2616', '2020-10-31 12:00:26:消息通知成功推送到消息队列成功', '2020-10-31 12:00:27', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2617', '2020-10-31 12:01:12:报修进度通知推送到消息队列成功', '2020-10-31 12:01:12', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('2618', '2020-10-31 12:01:12:推送收费单:b6e963441b2d11eb8294a39247d44911推送到消息队列成功', '2020-10-31 12:01:12', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('2619', 'super登陆成功获取了令牌', '2020-10-31 13:33:59', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2620', 'super登陆成功获取了令牌', '2020-10-31 13:35:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2621', '2020-10-31 13:43:52:报修进度通知推送到消息队列成功', '2020-10-31 13:43:53', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2622', '2020-10-31 13:43:52:报修进度通知推送到消息队列成功', '2020-10-31 13:43:53', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2623', '2020-10-31 13:43:52:报修进度通知推送到消息队列成功', '2020-10-31 13:43:53', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2624', 'kf01登陆成功获取了令牌', '2020-10-31 13:58:35', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2625', '2020-10-31 14:59:46:推送报修申请取消:4623推送到消息队列成功', '2020-10-31 14:59:46', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2626', '2020-10-31 14:59:46:报修进度通知推送到消息队列成功', '2020-10-31 14:59:46', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2627', '2020-10-31 14:59:46:报修进度通知推送到消息队列成功', '2020-10-31 14:59:46', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2628', '2020-10-31 14:59:46:报修进度通知推送到消息队列成功', '2020-10-31 14:59:46', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/e61dfd581b2a11eb84224167b78eb0b5', '');
INSERT INTO `lin_log` VALUES ('2629', '2020-10-31 15:06:56:报修通知推送到消息队列成功', '2020-10-31 15:06:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2630', '2020-10-31 15:06:56:报修通知推送到消息队列成功', '2020-10-31 15:06:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2631', '2020-10-31 15:06:56:报修通知推送到消息队列成功', '2020-10-31 15:06:57', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2632', '2020-10-31 15:07:30:报修进度通知推送到消息队列成功', '2020-10-31 15:07:31', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/a9a4ad461b4711eb87ffa7e81edcd5f4', '');
INSERT INTO `lin_log` VALUES ('2633', '2020-10-31 15:07:30:报修进度通知推送到消息队列成功', '2020-10-31 15:07:31', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/a9a4ad461b4711eb87ffa7e81edcd5f4', '');
INSERT INTO `lin_log` VALUES ('2634', '2020-10-31 15:07:30:报修进度通知推送到消息队列成功', '2020-10-31 15:07:31', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/a9a4ad461b4711eb87ffa7e81edcd5f4', '');
INSERT INTO `lin_log` VALUES ('2635', '2020-10-31 15:08:11:报修通知推送到消息队列成功', '2020-10-31 15:08:11', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2636', '2020-10-31 15:08:11:报修通知推送到消息队列成功', '2020-10-31 15:08:11', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2637', '2020-10-31 15:08:11:报修通知推送到消息队列成功', '2020-10-31 15:08:11', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2638', '2020-10-31 15:08:19:报修状态通知推送到消息队列成功', '2020-10-31 15:08:20', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/d61d13e01b4711eb90fc41aaae1e28e8', '');
INSERT INTO `lin_log` VALUES ('2639', '2020-10-31 15:08:19:报修通知推送到消息队列成功', '2020-10-31 15:08:20', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/d61d13e01b4711eb90fc41aaae1e28e8', '');
INSERT INTO `lin_log` VALUES ('2640', '2020-10-31 15:08:40:推送报修账单:BXD20103115081136723643推送到消息队列成功', '2020-10-31 15:08:41', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2641', '2020-10-31 15:08:41:消息通知成功推送到消息队列成功', '2020-10-31 15:08:42', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2642', '2020-10-31 15:09:17:推送报修申请取消:4625推送到消息队列成功', '2020-10-31 15:09:18', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/d61d13e01b4711eb90fc41aaae1e28e8', '');
INSERT INTO `lin_log` VALUES ('2643', '2020-10-31 15:09:17:报修进度通知推送到消息队列成功', '2020-10-31 15:09:18', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/d61d13e01b4711eb90fc41aaae1e28e8', '');
INSERT INTO `lin_log` VALUES ('2644', '2020-10-31 15:09:17:报修进度通知推送到消息队列成功', '2020-10-31 15:09:18', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/d61d13e01b4711eb90fc41aaae1e28e8', '');
INSERT INTO `lin_log` VALUES ('2645', '2020-10-31 15:09:17:报修进度通知推送到消息队列成功', '2020-10-31 15:09:18', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/d61d13e01b4711eb90fc41aaae1e28e8', '');
INSERT INTO `lin_log` VALUES ('2646', '2020-10-31 15:11:53:报修通知推送到消息队列成功', '2020-10-31 15:11:53', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2647', '2020-10-31 15:11:53:报修通知推送到消息队列成功', '2020-10-31 15:11:53', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2648', '2020-10-31 15:11:53:报修通知推送到消息队列成功', '2020-10-31 15:11:53', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2649', '2020-10-31 15:12:05:报修状态通知推送到消息队列成功', '2020-10-31 15:12:06', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/5a4f9a161b4811ebb1a3d7765fad6f24', '');
INSERT INTO `lin_log` VALUES ('2650', '2020-10-31 15:12:05:报修通知推送到消息队列成功', '2020-10-31 15:12:06', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/processing/5a4f9a161b4811ebb1a3d7765fad6f24', '');
INSERT INTO `lin_log` VALUES ('2651', '2020-10-31 15:12:35:推送报修账单:BXD20103115115315983643推送到消息队列成功', '2020-10-31 15:12:36', null, '-1', '系统任务', '200', 'PUT', 'api/v1/maintainer/repair/quotedPrice', '');
INSERT INTO `lin_log` VALUES ('2652', '2020-10-31 15:12:37:消息通知成功推送到消息队列成功', '2020-10-31 15:12:38', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/gateway/sync', '');
INSERT INTO `lin_log` VALUES ('2653', '郑灿伟登陆成功获取了令牌', '2020-10-31 15:43:17', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2654', 'super登陆成功获取了令牌', '2020-10-31 16:23:23', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2655', '测试收银员登陆成功获取了令牌', '2020-10-31 16:50:04', null, '26', '测试收银员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2656', '2020-10-31 17:25:16:报修进度通知推送到消息队列成功', '2020-10-31 17:25:16', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/50fcae981a5a11eba41f39bfb21a0526', '');
INSERT INTO `lin_log` VALUES ('2657', '2020-10-31 17:25:16:报修进度通知推送到消息队列成功', '2020-10-31 17:25:16', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/50fcae981a5a11eba41f39bfb21a0526', '');
INSERT INTO `lin_log` VALUES ('2658', '2020-10-31 17:25:16:报修进度通知推送到消息队列成功', '2020-10-31 17:25:16', null, '-1', '系统任务', '200', 'PUT', 'api/v1/customer/repair_cancel/50fcae981a5a11eba41f39bfb21a0526', '');
INSERT INTO `lin_log` VALUES ('2659', 'super登陆成功获取了令牌', '2020-10-31 17:41:49', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2660', '2020-11-01 08:00:01:账单推送:SDL20110108000112574643推送到消息队列成功', '2020-11-01 08:00:01', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2661', '2020-11-01 08:00:01:账单推送:SDL20110108000179846433推送到消息队列成功', '2020-11-01 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2662', '郑灿伟登陆成功获取了令牌', '2020-11-02 09:28:03', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2663', 'super登陆成功获取了令牌', '2020-11-02 10:02:22', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2664', 'super登陆成功获取了令牌', '2020-11-02 13:41:34', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2665', 'super登陆成功获取了令牌', '2020-11-02 13:54:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2666', '郑灿伟登陆成功获取了令牌', '2020-11-02 15:04:52', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2667', '郑灿伟登陆成功获取了令牌', '2020-11-02 15:07:01', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2668', 'super登陆成功获取了令牌', '2020-11-02 17:35:55', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2669', 'super登陆成功获取了令牌', '2020-11-02 18:01:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2670', '郑灿伟登陆成功获取了令牌', '2020-11-03 09:20:21', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2671', 'super登陆成功获取了令牌', '2020-11-03 10:15:17', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2672', '2020-11-03 10:19:53:账单推送:SDL20110310195372651643推送到消息队列成功', '2020-11-03 10:19:54', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2673', '2020-11-03 10:19:53:账单推送:SDL20110310195386135433推送到消息队列成功', '2020-11-03 10:19:54', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2674', 'super登陆成功获取了令牌', '2020-11-03 14:41:39', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2675', 'super登陆成功获取了令牌', '2020-11-03 14:42:53', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2676', 'super登陆成功获取了令牌', '2020-11-03 15:17:48', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2677', 'super登陆成功获取了令牌', '2020-11-03 15:34:06', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2678', 'super登陆成功获取了令牌', '2020-11-03 15:48:58', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2679', 'super登陆成功获取了令牌', '2020-11-03 16:43:11', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2680', '郑灿伟登陆成功获取了令牌', '2020-11-03 17:23:11', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2681', 'super登陆成功获取了令牌', '2020-11-03 17:31:02', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2682', 'super创建了一个用户', '2020-11-03 17:32:24', null, '1', 'super', '200', 'POST', 'admin/v1/user/register', '');
INSERT INTO `lin_log` VALUES ('2683', '食堂管理员登陆成功获取了令牌', '2020-11-03 17:32:43', null, '27', '食堂管理员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2684', '2020-11-04 08:00:01:账单推送:SDL20110408000149840643推送到消息队列成功', '2020-11-04 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2685', '2020-11-04 08:00:02:账单推送:SDL20110408000222668433推送到消息队列成功', '2020-11-04 08:00:02', null, '-1', '系统任务', '200', 'GET', 'cron/daily_charge', '');
INSERT INTO `lin_log` VALUES ('2686', '郑灿伟登陆成功获取了令牌', '2020-11-04 10:23:39', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2687', 'super登陆成功获取了令牌', '2020-11-04 10:31:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2688', '2020-11-04 10:33:34:报修通知推送到消息队列成功', '2020-11-04 10:33:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2689', '2020-11-04 10:33:34:报修通知推送到消息队列成功', '2020-11-04 10:33:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2690', '2020-11-04 10:33:34:报修通知推送到消息队列成功', '2020-11-04 10:33:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2691', '2020-11-04 10:33:34:报修通知推送到消息队列成功', '2020-11-04 10:33:35', null, '-1', '系统任务', '200', 'POST', 'api/v1/customer/repair_add', '');
INSERT INTO `lin_log` VALUES ('2692', '2020-11-04 10:41:27:报修取消通知推送到消息队列成功', '2020-11-04 10:41:28', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/cancel/22dd707a1e4611eb918ed70b5ff869d4', '');
INSERT INTO `lin_log` VALUES ('2693', '2020-11-04 10:41:27:报修取消通知推送到消息队列成功', '2020-11-04 10:41:28', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/cancel/22dd707a1e4611eb918ed70b5ff869d4', '');
INSERT INTO `lin_log` VALUES ('2694', '2020-11-04 10:41:27:报修取消通知推送到消息队列成功', '2020-11-04 10:41:28', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/cancel/22dd707a1e4611eb918ed70b5ff869d4', '');
INSERT INTO `lin_log` VALUES ('2695', '2020-11-04 10:41:27:报修取消通知推送到消息队列成功', '2020-11-04 10:41:28', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/cancel/22dd707a1e4611eb918ed70b5ff869d4', '');
INSERT INTO `lin_log` VALUES ('2696', '2020-11-04 10:41:27:报修取消通知推送到消息队列成功', '2020-11-04 10:41:28', null, '-1', '系统任务', '200', 'PUT', 'admin/v1/repair/cancel/22dd707a1e4611eb918ed70b5ff869d4', '');
INSERT INTO `lin_log` VALUES ('2697', '2020-11-04 11:12:14:推送收费单:897174d01e4b11eb9771fd5ad86dc58b推送到消息队列成功', '2020-11-04 11:12:14', null, '-1', '系统任务', '200', 'POST', 'pay/ccb_notify', '');
INSERT INTO `lin_log` VALUES ('2698', '郑灿伟登陆成功获取了令牌', '2020-11-04 13:41:24', null, '24', '郑灿伟', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2699', 'super登陆成功获取了令牌', '2020-11-04 14:00:10', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2700', 'super登陆成功获取了令牌', '2020-11-04 15:04:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2701', '林晓晖01登陆成功获取了令牌', '2020-11-04 15:36:14', null, '20', '林晓晖01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2702', '2020-11-04 15:37:01:推送收费单:87187ede1e7011ebb6f6333997dbddae推送到消息队列成功', '2020-11-04 15:37:02', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2703', '2020-11-04 15:40:08:推送收费单:f646ea0c1e7011ebb8fa3755bcc20a80推送到消息队列成功', '2020-11-04 15:40:08', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2704', '2020-11-04 15:46:15:推送收费单:d11009341e7111eb9f668bca71b5fa70推送到消息队列成功', '2020-11-04 15:46:15', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2705', '2020-11-04 15:48:19:推送收费单:1b4c3bf81e7211ebb1901f97d992b061推送到消息队列成功', '2020-11-04 15:48:20', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2706', '食堂管理员登陆成功获取了令牌', '2020-11-04 16:20:49', null, '27', '食堂管理员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2707', '2020-11-04 16:23:31:推送收费单:062d17921e7711eb81993f11cdb4b0bc推送到消息队列成功', '2020-11-04 16:23:32', null, '-1', '系统任务', '200', 'POST', 'consumer/v1/client/paid_from_bills', '');
INSERT INTO `lin_log` VALUES ('2708', 'super登陆成功获取了令牌', '2020-11-04 16:25:13', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2709', '食堂管理员登陆成功获取了令牌', '2020-11-04 16:33:25', null, '27', '食堂管理员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2710', 'super登陆成功获取了令牌', '2020-11-04 16:36:52', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2711', 'super登陆成功获取了令牌', '2020-11-04 16:39:29', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2712', '食堂管理员登陆成功获取了令牌', '2020-11-04 16:42:24', null, '27', '食堂管理员', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2713', 'super登陆成功获取了令牌', '2020-11-06 16:39:21', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2714', 'super登陆成功获取了令牌', '2020-11-09 10:33:05', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2715', 'super登陆成功获取了令牌', '2020-11-09 13:32:49', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2716', 'super登陆成功获取了令牌', '2020-11-09 13:47:09', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2717', 'super登陆成功获取了令牌', '2020-11-09 13:47:26', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2718', 'kf01登陆成功获取了令牌', '2020-11-09 14:11:58', null, '5', 'kf01', '200', 'POST', 'admin/v1/user/login', '');
INSERT INTO `lin_log` VALUES ('2719', 'super登陆成功获取了令牌', '2020-11-09 17:51:28', null, '1', 'super', '200', 'POST', 'admin/v1/user/login', '');

-- ----------------------------
-- Table structure for lin_poem
-- ----------------------------
DROP TABLE IF EXISTS `lin_poem`;
CREATE TABLE `lin_poem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `dynasty` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_poem
-- ----------------------------

-- ----------------------------
-- Table structure for lin_user
-- ----------------------------
DROP TABLE IF EXISTS `lin_user`;
CREATE TABLE `lin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(24) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `admin` int(6) NOT NULL DEFAULT '1' COMMENT '是否为超级管理员 ; 1 -> 普通管理员 | 2 -> 超级管理员',
  `active` int(6) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(24) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `nickname` (`nickname`,`email`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lin_user
-- ----------------------------
INSERT INTO `lin_user` VALUES ('1', '超级管理员', 'acb608649d93216d97a5f2fc0b0dc50a', '', '2', '1', '0', '2020-02-28 09:50:36', '2020-08-05 16:57:55', null, '20200606/e660d58a288c11b48ac6ee3c5fba7d6b.jpg', 'super');
INSERT INTO `lin_user` VALUES ('2', null, 'e10adc3949ba59abbe56e057f20f883e', '376767089@qq.com', '1', '1', '8', '2020-06-04 17:00:03', '2020-10-09 09:37:49', '2020-10-09 09:37:49', null, 'zero');
INSERT INTO `lin_user` VALUES ('4', '天环管理', 'e10adc3949ba59abbe56e057f20f883e', '', '1', '1', '10', '2020-06-04 17:06:09', '2020-07-22 16:41:18', null, null, 'tianhuan');
INSERT INTO `lin_user` VALUES ('5', '天环客服', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '10', '2020-07-20 11:00:24', '2020-07-20 11:00:24', null, null, 'kf01');
INSERT INTO `lin_user` VALUES ('6', '客服超管', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '9', '2020-07-20 11:00:49', '2020-07-20 11:00:49', null, null, 'kfadmin');
INSERT INTO `lin_user` VALUES ('12', '林泽珍', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '14', '2020-08-03 16:00:02', '2020-10-29 09:58:07', null, null, '林泽珍');
INSERT INTO `lin_user` VALUES ('13', '郑会云', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '10', '2020-08-03 16:01:45', '2020-09-17 19:45:13', null, null, '郑会云');
INSERT INTO `lin_user` VALUES ('14', '郑紫仪', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '10', '2020-08-03 16:02:09', '2020-09-17 19:45:08', null, null, '郑紫仪');
INSERT INTO `lin_user` VALUES ('15', '杨育金', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '10', '2020-08-03 16:02:29', '2020-09-17 19:45:05', null, null, '杨育金');
INSERT INTO `lin_user` VALUES ('16', '林晓晖', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '8', '2020-08-03 16:02:53', '2020-09-28 15:43:55', null, null, '林晓晖');
INSERT INTO `lin_user` VALUES ('18', '陈志伟', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '8', '2020-08-20 08:59:19', '2020-10-12 13:04:13', null, null, '陈志伟');
INSERT INTO `lin_user` VALUES ('19', '郑会云01', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '9', '2020-09-17 13:39:28', '2020-09-17 13:39:28', null, null, '郑会云01');
INSERT INTO `lin_user` VALUES ('20', '林晓晖01', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '9', '2020-09-17 14:26:52', '2020-09-17 14:26:52', null, null, '林晓晖01');
INSERT INTO `lin_user` VALUES ('21', '杨育金01', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '9', '2020-09-17 14:41:47', '2020-09-17 14:41:47', null, null, '杨育金01');
INSERT INTO `lin_user` VALUES ('22', '郑紫仪01', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '9', '2020-09-17 17:18:54', '2020-09-17 17:18:54', null, null, '郑紫仪01');
INSERT INTO `lin_user` VALUES ('23', '林奕妍01', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '9', '2020-09-17 17:21:35', '2020-09-17 17:21:35', null, null, '林奕妍01');
INSERT INTO `lin_user` VALUES ('24', '郑灿伟', '75e266f182b4fa3625d4a4f4f779af54', null, '1', '1', '14', '2020-10-09 09:39:23', '2020-10-09 09:39:23', null, null, '郑灿伟');
INSERT INTO `lin_user` VALUES ('25', '陈少佳', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '8', '2020-10-27 14:24:27', '2020-10-27 14:24:27', null, null, '陈少佳');
INSERT INTO `lin_user` VALUES ('26', '测试收银员', '25d55ad283aa400af464c76d713c07ad', null, '1', '1', '10', '2020-10-27 14:52:24', '2020-10-27 14:52:24', null, null, '测试收银员');
INSERT INTO `lin_user` VALUES ('27', '食堂管理员', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '1', '15', '2020-11-03 17:32:24', '2020-11-03 17:32:24', null, null, '食堂管理员');

-- ----------------------------
-- Table structure for t_adv
-- ----------------------------
DROP TABLE IF EXISTS `t_adv`;
CREATE TABLE `t_adv` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1 图片 2 公告消息',
  `adsense` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '广告位 1-首页 2-子页',
  `file_id` int(11) NOT NULL DEFAULT '0' COMMENT '外键FILE.ID',
  `cover_file_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `content` varchar(300) NOT NULL DEFAULT '' COMMENT '公告消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：1 启用  0关闭',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '排序：值越大越靠前 0-255',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表';

-- ----------------------------
-- Records of t_adv
-- ----------------------------
INSERT INTO `t_adv` VALUES ('02bf6566d2fe11ea9c546329d6cdeed6', '3', '1', '20', '4', '', '0', '1', '2020-07-31 15:18:20', '2020-07-31 16:38:23', null);
INSERT INTO `t_adv` VALUES ('02c45c9cd2fe11ea8fe4a10477a5a3b7', '3', '1', '20', '5', '', '0', '1', '2020-07-31 15:18:20', '2020-08-08 15:38:58', null);
INSERT INTO `t_adv` VALUES ('06aafcccd94c11eaa28ec7c744880e65', '3', '1', '32', '5', '', '0', '1', '2020-08-08 15:51:54', '2020-08-08 15:53:02', '2020-08-08 15:53:02');
INSERT INTO `t_adv` VALUES ('10ca60b8d22f11ea93888fc5787c4d58', '2', '1', '0', '0', '测试', '1', '1', '2020-07-30 14:36:58', '2020-08-15 16:45:31', '2020-08-15 16:45:31');
INSERT INTO `t_adv` VALUES ('359310f4d25a11ea80dbb77cf76a2887', '3', '1', '20', '17', '', '0', '10', '2020-07-30 19:45:48', '2020-07-31 16:38:21', null);
INSERT INTO `t_adv` VALUES ('488b9ca6d30b11eaa69a6bc75d34c931', '3', '2', '32', '5', '', '1', '1', '2020-07-31 16:53:20', '2020-08-11 13:34:19', null);
INSERT INTO `t_adv` VALUES ('4e040bded32211ea99a1aff6945507f7', '2', '2', '0', '0', '测试测试', '1', '1', '2020-07-31 19:38:08', '2020-08-15 16:45:35', '2020-08-15 16:45:35');
INSERT INTO `t_adv` VALUES ('8907ddb8d31e11ea8cfd636c51425fd0', '2', '2', '0', '0', '我我我', '1', '1', '2020-07-31 19:11:09', '2020-08-15 16:45:33', '2020-08-15 16:45:33');
INSERT INTO `t_adv` VALUES ('a335f02acbea11eab21c0343508bb0de', '2', '2', '0', '0', '现小程序处于内测阶段，若有疑问请联系技术处理！', '1', '0', '2020-07-22 15:12:01', '2020-07-31 19:11:29', null);
INSERT INTO `t_adv` VALUES ('ada5391ee0fb11eaa97445c77fa7db7d', '2', '1', '0', '0', '热烈欢迎各位商家入驻天环水产！！！', '1', '1', '2020-08-18 10:36:54', '2020-08-18 10:37:01', null);
INSERT INTO `t_adv` VALUES ('d40ec4e4d23c11eaa4f77f4473ae6f8c', '1', '1', '19', '0', '', '1', '4', '2020-07-30 16:15:29', '2020-07-30 16:15:29', null);
INSERT INTO `t_adv` VALUES ('d9169eecd23e11ea881f15e6bc02bca2', '1', '2', '30', '0', '', '1', '2', '2020-07-30 16:29:56', '2020-07-31 16:42:19', null);
INSERT INTO `t_adv` VALUES ('de4e4a28d23311eabb843dbea926bcf3', '2', '2', '0', '0', '热烈庆祝天环水产市场盛大开业！', '1', '1', '2020-07-30 15:11:20', '2020-07-31 15:08:02', null);
INSERT INTO `t_adv` VALUES ('debe9e30d23e11eaa551a7dae7149f8e', '1', '1', '31', '0', '', '1', '1', '2020-07-30 16:30:05', '2020-07-31 15:08:16', null);
INSERT INTO `t_adv` VALUES ('eac50c8ed23c11ea9bfa51af086fdddf', '1', '1', '25', '0', '', '1', '8', '2020-07-30 16:16:07', '2020-07-30 16:16:07', null);

-- ----------------------------
-- Table structure for t_art_category
-- ----------------------------
DROP TABLE IF EXISTS `t_art_category`;
CREATE TABLE `t_art_category` (
  `id` char(32) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '分类名称',
  `en_name` varchar(60) NOT NULL DEFAULT '' COMMENT '英文名',
  `thumb_file_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目图片',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1-启用 0-禁用',
  `sort` int(11) unsigned NOT NULL DEFAULT '50' COMMENT '排序 越大越高前',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_art_category
-- ----------------------------
INSERT INTO `t_art_category` VALUES ('0131b85ad26511eaa06739007ac4522c', '其他资讯', '', '5', '0', '1', '2020-07-30 21:03:04', '2020-07-30 21:03:09', '2020-07-30 21:03:09');
INSERT INTO `t_art_category` VALUES ('0756b0f6d25f11eab9f58da6f87462d0', '测试112', 'ceshi123123', '4', '1', '112', '2020-07-30 20:20:17', '2020-07-30 20:22:30', '2020-07-30 20:22:30');
INSERT INTO `t_art_category` VALUES ('59f5ab92d32111ea83db7f5e0a689679', '政策法律', '', '9', '1', '1', '2020-07-31 19:31:18', '2020-07-31 20:22:53', null);
INSERT INTO `t_art_category` VALUES ('88f6477cd25811ea97192daa7a84fdc0', '体育竞技', 'gym', '17', '0', '1', '2020-07-30 19:33:48', '2020-07-30 20:23:11', '2020-07-30 20:23:11');
INSERT INTO `t_art_category` VALUES ('b5430130d25811eaada92f716bad4669', '其他资讯', '', '4', '1', '50', '2020-07-30 19:35:03', '2020-07-30 21:02:47', '2020-07-30 21:02:47');
INSERT INTO `t_art_category` VALUES ('b7b4c534d25811ea831cfb8c9096479f', '天环资讯', '', '6', '1', '50', '2020-07-30 19:35:07', '2020-08-03 15:08:54', null);
INSERT INTO `t_art_category` VALUES ('b958055ed25811eab056eb3c0fd49ec3', '最新通知2', '', '10', '1', '50', '2020-07-30 19:35:10', '2020-08-17 15:25:10', null);

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` char(32) NOT NULL,
  `category_id` char(32) NOT NULL COMMENT '文章分类ID',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '文章标题',
  `title_en` varchar(30) NOT NULL DEFAULT '' COMMENT '英文标题',
  `description` text NOT NULL COMMENT '文章描述',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `template_no` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '文章模板 1-默认',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-发布 0-未发布',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0-否 1-是',
  `sort` int(5) unsigned NOT NULL DEFAULT '50' COMMENT '排序 后台文章排序',
  `hits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `big_thumb_file_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '缩略图大图ID',
  `thumb_file_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '缩略图ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('06d2da4eee5011eab5e71574b075133e', '59f5ab92d32111ea83db7f5e0a689679', '辽宁农产品集团：打造冷链体系 守护食品安全 ', '', '', '<p>编辑制作｜ 陈玮琇</p><p>来 源｜中华合作时报</p><p><img src=\"https://api.tianhuan0754.com/uploads/20200904/a62089d34269387cf5e4b9b04c3bc91b.jpeg\"></p><p>自2015年以来，辽宁农产品交易中心（集团）有限公司立足解决农产品“买贵卖贱”、流通方式落后、食品安全三大难题，狠抓生产基地建设，积极开展冷链物流配送，以多种方式推进产销衔接，初步建成集生产基地、仓储集配、冷链物流、智慧终端、电子商务、质检溯源为一体的农产品现代流通闭环体系，在今年疫情防控、北京保供及军民融合应急保障中发挥了积极作用。</p><p><strong>以冷链为核心</strong></p><p><strong>打造农产品现代流通闭环体系</strong></p><p><strong>（一）立足生产环节，整合冷链基础资源</strong></p><p>农产品集团结合辽宁农业产业结构，通过土地流转、订单农业方式，在辽宁锦州、朝阳、辽阳等重点区域开展标准化基地种植，部分优质农产品已出口到美国、日本、加拿大以及欧洲等地区。围绕生产环节加大冷链基础设施建设力度，升级改造冷链存量设施，整合集聚冷链物流市场供需及农产品流通、生产加工等上下游产业资源，提高了冷链物流规模化、集约化、组织化、网络化水平，较好地促进了生鲜农产品产地化发展。</p><p><strong>（二）创新经营方式，推进产销衔接</strong></p><p>农产品集团注重创新经营与品牌建设，孵化自有品牌“供销农产品”，并通过多种形式推进产销衔接。在零售端，打造农产品线上销售平台“供销云集”“供喜”，在线下开设社区门店，创新食品移动售卖模式。通过自有冷链物流配送，有效缩短了流通环节，完成“最后一公里”服务功能。在团体配送端，依托集团集中采购及冷链优势，为政府机关、金融机构、学校、医院、监狱等200余家大型机关、企事业单位提供高品质食品团配服务，为武警辽宁省总队等提供日常及紧急情况下后勤保障，积极践行中央“军民融合”号召。</p><p><strong>（三）先进科技检测，保证安全可追溯</strong></p><p>为保证农产品质量安全，农产品集团成立供销检测中心，配备200余套国际最先进仪器设备、130余位专业技术人员，开展农产品检测、国际资质认证等，实现了农产品“生产可记录、信息可查询、流向可追踪、质量可追溯”。</p><p><strong>“农网”“城网”双管齐下</strong></p><p><strong>保证农产品一路鲜活</strong></p><p><strong>（一）发挥农批市场“蓄水池”作用，立足“农网”优化供给</strong></p><p>农产品集团充分发挥扎根农村的独特优势，积极在农产品产地开展冷链深加工及农批市场建设，在生产环节强化冷餐保鲜，优化农产品供给。先后在辽宁康平建设沈阳恒生食用菌基地（日产食用菌120吨），打造东北最大的食用菌基地；在辽宁兴城建设农产品海产品加工基地，推进菊花女牌海鲜水饺畅销全国。在辽宁阜新、铁岭、锦州、营口等地打造集分拣、预冷、初加工、交易为一体的产地农产品批发市场，冷链仓储总面积达到12.44万平方米。农产品集团下属的辽宁供销窟窿台农产品批发市场，辐射周边五县100万亩棚菜基地，年交易量约20亿公斤，是东北最大的产地型专业蔬菜批发市场，被评为“全国公益性农产品批发市场”。市场正在升级改造中，计划投资5亿元。升级改造完成后，市场预计占地面积700亩，年交易量与交易额增幅20%，增加千余个就业岗位。</p><p><strong>（二）建设城市集配中心，开展“城网”冷链物流配送，保证流通环节无二次污染</strong></p><p>目前，农产品集团正在省内重点县域冷链物流节点城市建设20个现代化冷链集配中心，承接农产品全程冷链的分拣、深加工、贴标及包装、仓储、质量安全检测、配送等多项功能。其中，已建成的沈阳集配中心占地面积60亩，内有3000平方米的中央厨房，蔬菜加工车间4条生产线，日加工量30吨；肉品加工车间2条生产线，日加工量600公斤。中央厨房达到10万级净化标准，保证了半成品切配菜的安全性。此外，为实现农产品运输全程冷链化，农产品集团采购280辆±18℃的冷链物流车，统一形象、统一标识，集中开展城市统一配送。农产品从产地端冷库分拣、预冷后发出，通过城际冷链物流车运送，到达城市集配中心，再通过城市冷链物流车配送到百姓餐桌，保证了农产品一路鲜活。</p><p><strong>疫情期间保供稳价、支援北京</strong></p><p><strong>充分发挥应急保障“国家队”作用</strong></p><p>新冠肺炎疫情期间，农产品集团坚决贯彻执行省政府提出的农产品保供要求，积极履行社会责任，对线上线下客户公开承诺农产品价格不涨、质量不降、供应不断，并被纳入首批“全国疫情防控重点保障企业”。在疫情最迅猛的2月，发挥集中采购优势，与上游基地、供应商对接，利用公司在各地的冷链仓储设施，储备大量食品、防疫用品，每日为政府、部队、医院和监狱系统及复工复产的企事业单位约100万人配送食品及日用品、防疫用品，团体配送业务覆盖100余单位，其中包含中国医科大学附属第一医院等多所新冠肺炎定点医院，日配送量达2万吨。</p><p>6月份北京疫情突发，为保障首都蔬菜市场供应，按照总社统一部署，辽宁农产品集团仅用48小时，成功组织285吨新鲜蔬菜通过冷链运输配送到北京岳各庄、石门及水屯3个批发市场。截至7月23日，已累计调运701.48吨辽宁优质蔬菜进京，累计车次92辆，为首都疫情防控物资保供稳价贡献力量。</p><p>下一步，辽宁农产品集团将在全国供销合作总社，辽宁省委、省政府的领导下，在中国供销集团、辽宁省供销合作社等股东单位的支持下，不懈努力，继续建设完善鲜活农产品冷链体系，做食品安全的守护者。</p><p>责编｜陆璐</p><p>监制｜李彩</p>', '1', '1', '1', '2', '168', '0', '41', '2020-09-04 09:43:27', '2020-09-04 09:43:27', null);
INSERT INTO `t_article` VALUES ('093a2b26edc811ea9c765de1053bd38b', 'b7b4c534d25811ea831cfb8c9096479f', '“百企帮百村”暨“乡村振兴 村企共建”人居环境提升工程', '', '', '<p>今天上午，濠区举办“百企帮百村”暨“乡村振兴 村企共建”人居环境提升工程（首期）签约仪式，启动总投资额18270万元的12宗人居环境提升项目。市委副书记钟挥锷，市委农办主任、市农业农村局局长谢宋彪，区领导吴文兵、秦波、郑少玲、李小峰等区各套班子领导，各街道社区、区直有关单位负责人，以及全区“百企帮百村”企业（乡贤）代表等参加了活动。</p><p><br></p><p>濠江区全面贯彻落实***总书记关于实施乡村振兴战略的重要论述，按照省委、省政府推进“万企帮万村”和市委、市政府推进“千企帮千村”的工作部署，积极组织“百企帮百村”工作，动员全区65家企业与54个涉农社区自愿结对帮扶，实现结对帮扶全覆盖。阶段来企业界朋友和在外乡贤积极响应省委、市委和区委号召，积极参与结对帮扶，踊跃捐资支持乡村建设。</p><p><br></p><p>据悉，濠江区“百企帮百村”暨“乡村振兴 村企共建”人居环境提升工程（首期）总投资额达18270万元，涵道路升级改造、人行天桥、体育公园、文化公园、水体整治、农民公寓、广场建设工程等 12宗项目，将有助补短板、优环境，为实现乡村振兴夯实软硬基础。</p><p><br></p><p>回首阶段来走过的乡村振兴路，濠区收获满满、成效迭加。据悉，濠江区坚持高站位、深谋划，制定实施《关于推进乡村振兴战略的实施方案》，明确6项整体规划、42项重点建设任务和20项政策措施，绘好全区乡村振兴的发展蓝图；坚持细部署、强推动，乡村振兴工作取得实质性进展，农村“颜值”和“气质”持续提升；坚持抓落实、重实效，基本完成超10亿元、超600项项目的“乡村振兴·七彩濠江”民心工程，美丽乡村建设亮点频现，第一批10个美丽乡村示范村建设全面完成；坚持以产兴农，加快发展现代农业，创建丹樱、金寿两家省级农业公园，推动东湖菊花、益母草、东京薯等10大特色农产品品牌竞相发展，“金色东湖乡”“濠江建设”“达濠工艺”等3件集体商标获国家核准注册。同时，濠江区坚持以人为本，实现建档立卡扶贫对象全部脱贫，加快推进“厕所革命”、“四好农村路”建设，不断补齐民生短板。但与此同时，濠江乡村发展依然存在不少短板。</p><p><br></p><p>为集中力量全力攻坚，签约仪式后，濠区迅速召开全区实施乡村振兴战略工作推进会暨“百企帮百村”行动动员会，深入学习贯彻***总书记关于“三农”工作和实施乡村振兴战略的重要指示精神，中央农村工作会议和省、市乡村振兴战略工作推进会议精神，总结我区实施乡村振兴战略工作，研究落实今明两年“三农”工作必须完成的硬任务，部署2019年农业农村工作，全面组织动员企业结对帮扶我区54个涉农社区，实现结对帮扶全覆盖，助力乡村振兴。会议强调，要对标对表全面建成小康社会和实施乡村振兴战略“3年取得重大进展”目标必须完成的硬任务，全以赴实现濠江城乡和谐和美、百姓共治共享，奋力在加快汕头经济特区发展、建设省域副中心城市中谱写壮丽的濠江篇章。</p><p><br></p><p>濠区“百企帮百村”暨“乡村振兴 村企共建”</p><p>人居环境提升工程（首期）项目</p><p><br></p><p>濠江区廉政文化公园选址玉新街道岗背社区鸣岗路西侧、魏征纪念馆南侧，占地26亩，计划建设文化长廊、凉亭、莲塘、同心镜、休闲广场等主题景观。</p><p>滨街道建设项目：东陇社区村前大池项目、东陇社区东辉路北段项目、东陇社区农民公寓项目、东陇社区田园升级改造项目、钱塘社区莲花公园项目</p><p>捐单位：广东阳柳集团、<a href=\"#/article/_blank\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">汕头天环冷链物流有限公司</a></p><p><br></p><p>﻿	<span style=\"color: rgb(51, 51, 51);\">来源：区党政办、区农业农村和水务局，河浦、玉新、滨海等街道</span></p>', '1', '1', '1', '4', '162', '0', '39', '2020-09-03 17:29:59', '2020-09-03 18:00:07', null);
INSERT INTO `t_article` VALUES ('0da8994ad25c11eaafe19f1e980347d1', 'b958055ed25811eab056eb3c0fd49ec3', '天环冷链水产市场正式开业2', '', '热烈祝贺汕头天环水产市场招商推介会圆满成功！', '<p>天环冷链水厂市场正式开业2<img src=\"https://api.tianhuan0754.com/uploads/20200729/794ee2e4abf858b427a2e25b43989ced.jpg\"></p>', '1', '1', '1', '1', '435', '12', '12', '2020-07-30 19:59:00', '2020-09-04 10:11:47', null);
INSERT INTO `t_article` VALUES ('13993c92d25c11ea843dabeee174b777', 'b958055ed25811eab056eb3c0fd49ec3', '天环冷链水产市场正式开业', '', '天环冷链水厂市场正式开业', '<p><span style=\"color: rgb(51, 51, 51);\">项目一期将建成粤东地区最大型水产肉类集散中心，交易大厅设置了综合区、熟食区、壳类区、冰鲜区、活鲜区、活虾交易区等六大区域，并根据实际运营情况不断调整优化，届时将配备有大型制冰厂房、加工车间、餐厅、超市、自助银行、物流配载中心等设施，设置2000个停车位满足市场经营需求。</span><img src=\"https://api.tianhuan0754.com/uploads/20200727/7695da5452464237e846717a83f367c5.jpg\"></p><p>项目一期将建成粤东地区最大型水产肉类集散中心，交易大厅设置了综合区、熟食区、壳类区、冰鲜区、活鲜区、活虾交易区等六大区域，并根据实际运营情况不断调整优化，届时将配备有大型制冰厂房、加工车间、餐厅、超市、自助银行、物流配载中心等设施，设置2000个停车位满足市场经营需求。</p><p><br></p><p><br></p><p><br></p><p class=\"ql-align-center\"><strong>选择天环的十大理由</strong></p><p><br></p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">区位优势</strong></p><p>天环市场地处潮汕三市交界、潮汕环线高速大学路出口处，距市场大门不到百米，17/21/41路公交车终点站到达市场门口，且金砂路及海滨路西延至市场附近，形成快捷的交通网络。政府规划未来周边将有多家专业市场建成集群，市场辐射周边人口超千万。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">交通便捷</strong></p><p>今年11月潮汕环线高速开通后，潮阳、潮南、揭阳、潮州等周边至天环市场均在半小时都市圈范围，市区各主要农贸市场到天环市场仅需20分钟车程。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">规模体量</strong></p><p>天环市场总用地300亩（50年自主用地，商户可放心长期经营），一期占地160亩，可容纳1200户商家入驻，为潮汕三市最大型水产品集散中心；二期冻品市场运营后和水产市场相互促进，将进一步提升市场人气和物流配载能力。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">规划先进</strong></p><p>天环市场由国内知名专业设计院全盘设计，规划人性化、多样化，分区板块紧凑、清晰、标识一目了然，大大节省进场选购产品的时间，商铺、摊位规格多样化、无死角、设施完善、方便经营且环境舒适。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">配套齐全</strong></p><p>建有制冰厂房、加工车间，配有大容量供电系统，配置2000个停车位方便进出、避免堵车。还配套有餐厅、超市、自助银行、物流配载中心，同时我司已和相关部门达成约定，市场开业后相关部门将派员进驻市场为需要的商户办理执照及其它相关业务。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">优惠力度</strong></p><p>第一、第二年免租金。第三、第四年商铺、交易摊位均价不高于60元/平方米，对进场购物客户给予运费补贴，对进场经营户给予营业补贴，初期免收水电费、停车费、物业费，并设立免费专线车对交通不便的经营户进行定点定时接送。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">线上交易</strong></p><p>市场将引进苏州天环已运营多年的线上交易平台，并免费提供给本市场商户做线上交易，辅助提升商户的营业额和利润。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">运营优势</strong></p><p>天环公司具有运营多年专业市场的经验，具备相当实力，在国内同业中享有较高的荣誉，跟随天环运营市场的商户绝大多数年年获利、稳步壮大。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">经营理念</strong></p><p>让商户赚钱企业才能盈利，天环为你创造一个优良舒适的营商环境，让大家落地生根、生意红火、大展宏图，让我们一起共同努力、携手并进、共创双赢。</p><p><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(155, 187, 89);\">公司定位</strong></p><p>将汕头天环市场建成具有区域竞争力和产业推动力的专业型、多功能、现代化的水产肉类集散中心。</p>', '1', '1', '1', '2', '508', '35', '11', '2020-07-30 19:59:10', '2020-09-04 10:12:02', null);
INSERT INTO `t_article` VALUES ('1e4763b6edc411eabe34a7c5a72f72ba', 'b958055ed25811eab056eb3c0fd49ec3', '啊哈哈', '', '', '<p>123123123哈哈哈</p>', '1', '0', '1', '23', '123123', '5', '6', '2020-09-03 17:01:57', '2020-09-03 17:09:28', '2020-09-03 17:09:28');
INSERT INTO `t_article` VALUES ('51b83b66d32b11eab1bb0d744040933e', 'b7b4c534d25811ea831cfb8c9096479f', '天环水产批发市场8月投入运营，超前钜惠火热招商中！', '', '', '<p>01</p><p>商铺优惠</p><p><span style=\"color: rgb(0, 0, 0);\">商铺、交易摊位第一年、第二年免租金，第三年、第四年商铺一楼、交易摊位：每月每平方米均价不高于60元；商铺二楼：每月每平方米均价不高于25元。</span></p><p><span style=\"color: rgb(0, 0, 0);\">天环同时承诺：在汕头城区范围内同类市场租金最低。</span></p><p><span style=\"color: rgb(0, 0, 0);\">商铺面积：每间二层楼，楼上楼下面积相同，每层建筑面积有48平方米（4米×12米，二层共96平方米）和32平方米（4米×8米，二层共64平方米），一期合计180间；</span></p><p><span style=\"color: rgb(0, 0, 0);\">交易大厅：分为六大区域：综合区、熟食区、壳类区、冰鲜区、活鲜区、活虾交易区,一期合计420个摊位，每个摊位32平方米（4米×8米）。</span></p><p><br></p><p>02</p><p>运费补贴</p><p><span style=\"color: rgb(0, 0, 0);\">对进入天环水产市场购货的客户提供运费补贴。</span></p><p><br></p><p>03</p><p>营业补贴</p><p><span style=\"color: rgb(0, 0, 0);\">对进场经营的商户给予营业补贴，对活虾经营车给予运费补贴。</span></p><p><br></p><p>04</p><p>水电物业</p><p><span style=\"color: rgb(0, 0, 0);\">营业初期对进场经营商户的水、电、停车、物业免收费。</span></p><p><br></p><p>05</p><p>商铺定金</p><p><span style=\"color: rgb(0, 0, 0);\">商铺定金分别为2万/间（32平方摊位）、3万/间（二层64平方米商铺）、5万/间（二层96平方米商铺），所缴纳商铺、摊位定金自缴纳之日起至缴交第三个租赁年度租金的时间止，定金按年利率10% 计息，所计利息冲抵商户第三个租赁年度应缴费用。</span></p><p><br></p><p>06</p><p>金融扶持</p><p><span style=\"color: rgb(0, 0, 0);\">公司携手相关银行为商户提供资金支持。</span></p><p><br></p><p>07</p><p>特别提示</p><p><span style=\"color: rgb(0, 0, 0);\">①选择商铺位置按商户签约认筹缴交定金前后，确定选择商铺顺序。</span></p><p><span style=\"color: rgb(0, 0, 0);\">②项目介绍详见汕头天环项目简介宣传册或关注天环水产市场微信号。</span></p><p><span style=\"color: rgb(0, 0, 0);\">③本次招商政策最终解释权归汕头天环冷链物流有限公司所有。</span></p>', '1', '1', '1', '1', '192', '3', '3', '2020-07-31 20:42:40', '2020-07-31 20:45:16', null);
INSERT INTO `t_article` VALUES ('64f86494ee5111ea9d261154ef6328c1', '59f5ab92d32111ea83db7f5e0a689679', '国家卫计委整合清理食品安全国家标准目录和食品相关标准', '', '', '<p><img src=\"https://api.tianhuan0754.com/uploads/20200904/7957dac80bcc2136d3109359a2d42e16.jpg\"></p><p>工业和信息化部、农业部、质检总局、食品药品监管总局(国务院食品安全办)办公厅，粮食局、标准委、认监委办公室，各有关单位:</p><p>根据《2017年食品安全重点工作安排》，为进一步强化标准制定、执行和监管的衔接，经征求你部门意见，现将食品安全国家标准目录和食品相关标准清理整合结论通报如下:</p><p>一、食品安全国家标准目录</p><p>截至目前，我委会同农业部、食品药品监管总局制定发布食品安全国家标准1224项，包括:通用标准11项、食品产品标准64项、<strong>特殊膳食食品标准9项</strong>、食品添加剂质量规格及相关标准586项、<strong>食品营养强化剂质量规格标准29项</strong>、食品相关产品标准15项、生产经营规范标准25项、理化检验方法标准227项、微生物检验方法标准30项、毒理学检验方法与规程标准26项、兽药残留检测方法标准29项、农药残留检测方法标准106项、被替代和已废止(待废止)标准67项(详见附件1)。具体标准文本可在食品安全国家标准数据检索平台(http://bz.cfsa.net.cn/db)查询。</p><p>二、食品相关标准清理整合结论</p><p>按照食品相关标准清理和整合工作安排，我委组织专家和各相关单位对我国食用农产品质量安全标准、食品卫生标准、食品质量以及行业标准进行清理，重点解决标准重复、交叉和矛盾的问题。经清理，1082项农药兽药残留相关标准转交农业部进行进一步清理整合。对另外3310项食品标准作出了以下清理整合结论:一是通过继续有效、转化、修订、整合等方式形成现行食品安全国家标准(详见附件2)，二是建议适时废止的标准(详见附件3)，三是不纳入食品安全国家标准体系的标准(详见附件4)。以上结论由专家组研究提出，并征求了各相关部门意见，请各相关部门根据清理整合结论，对相关标准作出调整。</p><p>附件:</p><p>1.食品安全国家标准目录(截至2017年4月).pdf</p><p>2.食品安全国家标准整合名单.pdf</p><p>3.建议适时废止的标准名单.pdf</p><p>4.不纳入食品安全国家标准体系的标准名单.pdf</p>', '1', '1', '1', '3', '182', '0', '43', '2020-09-04 09:53:14', '2020-09-04 10:12:39', null);
INSERT INTO `t_article` VALUES ('659df86eee5611eaa793c7e4396149e7', '59f5ab92d32111ea83db7f5e0a689679', '亚美科技与广东省冷链协会达成战略合作关系', '', '', '<p><span style=\"color: rgb(51, 51, 51);\">7月8日上午，广东省冷链协会与广州亚美信息科技有限公司(简称“亚美科技”)在广州正式签署战略合作协议。签约仪式上，广东省冷链协会创会会长李健华与亚美科技董事长江勇分别代表双方签署战略协议并达成合作，同时就今后的战略合作进行了深入的探讨。</span></p><p><br></p><p><img src=\"https://api.tianhuan0754.com/uploads/20200904/d7cec7af18b3e6a2856a1ab153dd11dc.png\"></p><p><span style=\"color: rgb(51, 51, 51);\">　(图片说明：广东省冷链协会创会会长李健华与亚美科技董事长江勇分别代表双方签署战略协议并达成合作)</span></p><p><br></p><p>广东省冷链协会创会会长李健华、广州风行乳业股份有限公司运输部部长林瑞珏、镇江康飞汽车制造股份有限公司华南区销售总监董伟、亚美科技董事长江勇、副总裁张津和市场营销中心总监徐娃林等领导出席了签约仪式。</p><p>据介绍，冷链行业要求严格控制运输过程的质量和安全问题，冷链物流需要及时监控车辆运输动态、车厢温度信息采集和超温提前预警处理，为此冷链车普遍需具备冷链监控、实时定位、载重监控和全运输节点监控，以保障货物的品质，降低经营风险。冷链车队运营管理关注成本、管理和安全。而传统的GPS类管理平台存在系统单一、成本高昂、成本核算欠精准、管理考核粗放和行车安全缺乏保障等弊端，而亚美科技提供的冷链物流车辆管理解决方案，是通过“YM702车载智能无线终端+温度传感器+载重传感器+RFID温度标签”的智能车载终端技术，搭配可量化冷链车辆智能管理平台，获取车辆数据，行驶轨迹、货厢内温度、载重数据等，提高行驶安全，保障货物的品质，降低经营风险。</p><p>广东省冷链协会创会会长李健华在仪式上提及，广东省冷链协会建立了全国首个省级冷链平台，实时在线向监管部门、社会公示，该平台的数据直接对接国家商务部全国农产品冷链流通监控平台。她希望此次双方合作能通过“智能终端+大数据”，解决目前冷链运输的痛点，并对冷链全链条进行监控和源头的追溯，树立全国冷链行业数据监管的标杆。广东是全国最大的冷链消费地，李会长认为广东冷链必须依靠智能化、数据化，她希望此次战略合作能助力广东冷链产业发展得更加顺利。</p><p>亚美科技董事长江勇表示，近年，亚美科技在广东营运车辆监管领域树立了典型的监管标杆，亚美将用更快的速度和更强的服务力度，助力推动全国的交通信息化建设。随着公司区域化管理建设的推进，亚美将逐步在各专业化领域深化大数据运营，不仅满足国家和行业的需求，更重要是在精细化的监管领域提供精准的行业管理方案。江总希望亚美科技和省冷链协会建立战略合作后，能在广东省，乃至全国的冷链行业都树立起数据监管标杆。</p><p>此次战略合作标志着亚美科技的业务发展进入了一个新阶段，通过大数据将车联网行业和冷链产业有机结合，并上升到新高度。大数据平台能为广东省冷链运输协会更好地对产业进行监管，实现互利共赢，发挥1+1&gt;2的效果。亚美科技希望今后能扩大双方合作的深度和广度，通过其自主研发的硬件和大数据平台为广东省冷链运输行业进一步赋能。</p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">来源：中国网财经</span></p>', '1', '1', '1', '5', '126', '0', '48', '2020-09-04 10:29:03', '2020-09-04 10:30:28', null);
INSERT INTO `t_article` VALUES ('690e63a2ee5211eaaa72b1c4fed86959', 'b958055ed25811eab056eb3c0fd49ec3', '大连：组织冷链食品企业以及相关联企业签订疫情防控承诺书', '', '', '<p>中国经济导报、中国发展网记者 白雪 见习记者施文郁</p><p>大连市市场监督管理局	副局长王文涛	表示，	“7•22”疫情发生以来，大连市市场监管部门围绕主责主业和战时状态疫情防控指挥部部署要求，以食品安全监督检查为重点，切实推动“四方责任”落实。</p><p><img src=\"https://api.tianhuan0754.com/uploads/20200904/7b977d2f8c53db3aad053a3833f4fbcd.jpg\"></p><p>	<strong>监督经营者：	停止销售、下架封存涉事产品</strong></p><p>	第一时间排查凯洋公司经营门店及进口、销售情况，采取停止销售、下架封存等措施，按规定程序将大连凯洋公司销售信息通报省内其他市、其他省区市。</p><p>	对厄瓜多尔冻南美白虾贮存、销售各环节进行再排查、再处置，全面掌握进货渠道、进货查验手续和销售去向，监督经销商停售、封存涉事3家企业3月12日以后生产的冻虾，并配合卫生健康部门对下架封存的冻南美白虾外包装、虾体、存放环境、销售环境等进行新冠病毒核酸检测采样，全部检测结果均为阴性。</p><p>	目前，12315平台诉求总量平稳，未见剧烈波动，涉凯洋、厄瓜多尔冻南美白虾日诉求量呈下降趋势。</p><p>	<strong>加强冷链食品企业（单位）监管</strong></p><p>	截至7月27日，完成类似凯洋水产品生产加工企业，销售海鲜的农贸市场、生鲜超市、集市等市场主体以及食品相关冷库从业人员核酸检测工作；截至8月4日，组织冷链食品企业以及相关联企业签订疫情防控承诺书4023份。</p><p>	围绕进口水产品和进口肉品质量安全监管，截至8月2日，排查销售单位2422家，在售进口水产品、肉品1065种，在售其他进口食品（含保健食品）2123种。</p><p>	<strong>加强督导检查</strong></p><p>	以大连市食品安全委员会办公室名义印发文件，按战时状态紧急动员、全员动员各地区、各成员单位，强化疫情防控期间食品安全工作责任制落实。分管副市长研判调度，多次赴市场监管局调研指导，推动各项工作日结日清。</p><p>	7月31日至8月2日，以“7•22”疫情防控指挥部市场监管组名义，成立4个督导组，对11个区市县（先导区）疫情防控“四方责任”落实情况开展督导检查，实地检查经营进口水产品、肉类及冷链食品企业（单位）落实进货查验制度等情况。</p><p>	协同开展重点场所疫情防控，全市市场监管部门累计出动检查人员7414人次，检查市场、超市、餐饮等经营单位9027个次，检查网站1070个次，重点检查食品生产经营单位进货查验等食品安全制度和消杀、测温、卡码双测等疫情防控措施落实情况，并每日通报问题点位，累计通报492家次。</p><p>	强化防疫物资、重点民生领域价格监管，严厉打击囤货居奇、哄抬价格、串通涨价、价格欺诈等价格违法行为。</p><p>	<strong>保障中超联赛食品安全</strong></p><p>	按照奥运保障标准，制定工作方案、应急预案、任务分解表和清单式工作手册，遴选精干力量驻点保障，对接待酒店开展风险评估审查及风险监测，对酒店的食品安全管理流程再造，对酒店从业人员进行培训，对食品原料采购、无交接配送验收、餐品加工制作等环节全程监督检查。</p><p>	7月22日至8月4日，累计出动保障人员409人次，保障52753人次、211餐次；快速检测食品原材料1840批次，其中ATP不合格2批次，累计排除隐患28点次。</p><p>	<strong>加强退热类药品销售监管</strong></p><p>	印发《关于进一步做好零售企业退热类药品销售监管工作的通知》，监督药品零售企业停售、管控有关药品，实行购药登记、日报告等制度。</p><p>	截至8月4日，全市市场监管部门累计检查药品零售企业1225家，重点检查药品零售企业禁售类退热药品是否下架、是否按规定对购药个人信息进行登记、是否执行日报送制度等，累计登记报送退热类药品购药信息合计53500人次，总体情况良好。</p><p>	下一步，全市市场监管部门将坚决贯彻上级部署要求，保持战时状态，密切联动协作，进一步加强食品安全监管，严格监督进口水产品、肉品相关企业落实进货查验、购销记录等制度，继续做好冷链食品企业（单位）监管，严厉查处来源不明冷链食品，会同相关部门开展冷链食品新冠病毒核酸检测，协同做好农贸（集贸）市场、商超等市场主体的疫情防控工作，切实推动“四方责任”落实。</p><p class=\"ql-align-right\">责任编辑：白雪</p><p><br></p>', '1', '1', '1', '4', '169', '0', '45', '2020-09-04 10:00:31', '2020-09-04 10:11:58', null);
INSERT INTO `t_article` VALUES ('69c270e4ee5311ea943727014d4a066f', '59f5ab92d32111ea83db7f5e0a689679', '央视 《新闻联播》关注贵阳冷链物流系统建设', '', '', '<p><img src=\"https://api.tianhuan0754.com/uploads/20200904/13cf5a8cba1b149222b58f3d8fadb85a.jpg\"></p><p>8月2日晚，央视《新闻联播》播出《贵州：加强冷链建设 助力脱贫攻坚》，围绕贵州省决战决胜脱贫攻坚，大力开展农村产业革命的中心工作。</p><p>报道从贵阳市乌当区在建的20万吨冷库为切入点，展现了开展农村产业革命以来，贵州农村进入新的发展阶段后，优质农产品泉涌而出，农业从单一种养殖向一二三产融合发展，为农民增收、脱贫攻坚提供强大动力。</p><p>贵州省找准制约特色优势产业发展的短板，通过打造冷链物流体系，为农民增收、脱贫攻坚助力。</p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">在贵州省贵阳市乌当区的农副产品交易中心，一个容量20万吨的新冷库正加紧建设，年底建成后，交易中心的总库容将从2010年的5万吨变成40万吨。</span></p><p><br></p><p><img src=\"https://api.tianhuan0754.com/uploads/20200904/c9e3a23a8cb989232af53fdd4b1f18aa.jpg\"></p><p>贵州瀑布冷链农副产品交易中心董事长 陈瑞国：贵州农副产品质量比较好，我们看中这个市场，之前就投资了20万吨冷库，通过几年的运作，冷库供不应求，所以我们再继续投资20万吨冷库。</p><p>十年前，贵州的冷库容量仅占全国的1.07%，即使是这么小的库容，因为农产品类型单一、商品化程度低，也还有大量闲置。</p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">随着近年来贵州加大脱贫攻坚的力度，贵州农业实现从单一种养殖向一二三产业融合发展，销售方式从“提篮小卖”向现代商贸物流转变。茶叶、辣椒、刺梨等特色产业的迅速发展，粮油、豆类、中药材、肉类、果蔬等众多品种的出现，都使得冷链设施越来越供不应求，冷链设施的不足大大限制了生鲜产品的销售半径。</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">找准短板，精准发力，从2017年起，贵州实施冷链物流助推脱贫攻坚三年行动，逐步优化冷链基础设施布局。</span></p><p><br></p><p>贵州省仁怀市东升农场商超包装负责人 林菊：以前没有冷链，所以说菜一般送到外面都坏了，现在的蔬菜就卖得比较广，比如说广东、香港、澳门、台湾这些地方，今年产值应该在一百多万。</p><p>三年来，贵州省冷库设施增长368%。截至今年6月底，贵州省已建成冷库1235个，库容386.36万立方米。农产品销售半径从平均不到300公里延伸至北上广、粤港澳以及东南亚、迪拜等地。</p><p><br></p><p>今年上半年，贵州省农产品销售额达到200多亿元，同比增长70%以上，外销生鲜蔬菜有半数以上通过冷链运输，农产品损耗降低7亿元。</p><p>来源：央视新闻、知知贵阳</p><p>编辑 侯川川/编审 邓文盈</p>', '1', '1', '1', '4', '224', '42', '42', '2020-09-04 10:07:41', '2020-09-04 10:17:28', null);
INSERT INTO `t_article` VALUES ('76d92302d32a11eab82201bf3b486f03', '59f5ab92d32111ea83db7f5e0a689679', '每园年补助500万！我市首批7个市级现代农业产业园启动建设', '', '', '<p><span style=\"color: rgb(62, 62, 62);\">记者今天从市农业农村局了解到，我市今年启动创建市级现代农业产业园，计划从2020年起筹措1.5亿元支持建设15个市级现代农业产业园。目前，我市已启动首批金平区水产、龙湖区酱腌菜、濠江区乳业等7个市级园区建设。</span></p><p><img src=\"https://api.tianhuan0754.com/uploads/20200731/390f4776af9b90ccd90be5af96fe7f41.jpg\"></p><p><span style=\"color: rgb(62, 62, 62);\">建设市级现代农业产业园是我市推进乡村产业振兴的主要抓手。记者了解到，我市已首批认定金平区水产、龙湖区酱腌菜、龙湖区桑椹、濠江区乳业、濠江区花卉、澄海区狮头鹅、潮南区蔬菜等7个市级现代农业园（建设年限为2020-2021年），市财政已按每园500万元的标准下达首批市级现代农业产业园年度补助扶持资金，着力加快建设市级现代农业产业园，推动我市现代农业高质量发展，助力农业变强、农村变美、农民变富。</span></p><p class=\"ql-align-justify\">阶段来，我市积极协调，主动作为，及时全面掌握产业园建设工作动态，及时解决建设过程中遇到的困难问题，帮助产业园实施主体理清思路、对准目标、解决问题、倒排工期，加快推动产业园项目加快建设，按时保质完成各项任务。</p><p class=\"ql-align-justify\">同时，鼓励各区结合实际制定出台扶持市级园的政策措施，鼓励各区将涉农统筹资金投入到现代农业产业园建设。</p>', '1', '1', '1', '1', '192', '12', '12', '2020-07-31 20:36:32', '2020-09-04 10:31:42', null);
INSERT INTO `t_article` VALUES ('83073e3cd2e111eab9f9ab766217b78c', 'b7b4c534d25811ea831cfb8c9096479f', '测试商家资讯1', '', '测试商家资讯1测试商家资讯1', '<h2>测试商家资讯1</h2><p>测试商家资讯1</p><p><br></p><p><br></p><p>测试商家资讯1测试商家资讯1测试商家资讯1测试商家资讯1</p><p><br></p><p><img src=\"http://api.tianhuan0754.com/uploads/20200725/f96fa1061a5d68c88235a72611028a30.png\"></p><p><br></p><p><br></p><p><br></p><h1>测试商家资讯1</h1>', '1', '1', '0', '2', '124', '0', '10', '2020-07-31 11:54:20', '2020-07-31 14:03:12', '2020-07-31 14:03:12');
INSERT INTO `t_article` VALUES ('a30b2c12d2db11eabb3e879659d18638', 'b958055ed25811eab056eb3c0fd49ec3', '测试资讯1', '', '测试资讯1测试资讯1', '<p>1231测试资讯1测试资讯1测试资讯1<img src=\"https://api.tianhuan0754.com/uploads/20200725/f96fa1061a5d68c88235a72611028a30.png\"></p>', '1', '0', '0', '2', '165', '0', '4', '2020-07-31 11:12:16', '2020-07-31 14:02:17', '2020-07-31 14:02:17');
INSERT INTO `t_article` VALUES ('a5b20728ee5211ea8da7e99087e25ae6', 'b958055ed25811eab056eb3c0fd49ec3', '广州加强冷冻食品进货查验 冷链企业相关人员每周一次核酸检测', '', '', '<p><img src=\"https://api.tianhuan0754.com/uploads/20200904/9cba42a99237d04048e8ca019c319633.jpg\"></p><p><span style=\"color: rgb(86, 86, 86);\">　商超加强日常防疫工作。（图片由家乐福提供）</span></p><p><br></p><p><span class=\"ql-cursor\">﻿</span>广州日报讯 （全媒体记者 赵方圆）昨日，记者从广州市各大商超了解到，目前各主体防疫措施再升级。在继续严格执行门店的消毒、防疫和监测工作的同时，商超自觉排查进口冷冻品的溯源，重新梳理进口冻肉和冻水产入境货物检验检疫证明和核酸检测报告，对相关员工实行每周一次核酸检测，卖场散装即食即加工食品禁止裸卖。</p><p>与此同时，广州冷链行业协会已要求暂停进口来自疫区的冷冻肉制品和水产品，并对所有接触冷冻肉食、水产品的从业人员立即进行核酸检测，并坚持做到每周一次。</p><p><strong>加强冷冻食品进货查验</strong></p><p><strong> 禁散装即食即加工食品裸卖</strong></p><p>记者了解到，目前华润万家超市已对冷冻食品的进货查验进行强化，要求确保来源可追溯，做到源头管控，严防疫情风险。“我们全面检查门店的原料进货、加工制作、餐器具清洗消毒，门店水产区域每隔两个小时消杀一次，所有门店员工必须佩戴口罩，定时进行测温登记。”</p><p>家乐福要求所有员工在到岗前进行体温测量并登记，口罩佩戴必须完全遮住鼻子，生鲜员工操作即食即加工食品时必须佩戴一次性手套，避免直接接触食品。卖场中，散装即食即加工食品必须有所遮盖，禁止裸卖；需要冷藏冷冻的产品禁止常温销售。与此同时，再次重新梳理进口冻肉和冻水产入境货物检验检疫证明和核酸检测报告。</p><p>永辉超市组织员工分批次进行核酸检测，同时对所有冷冻生鲜、肉类商品展开全面风险排查，加强对供应商的资质审查、检疫检验报告审查等环节，切实保障供应商及商品的合规性和安全性。</p><p><strong>暂停进口疫区</strong></p><p><strong> 冷冻肉制品和水产品</strong></p><p>值得注意的是，华润万家目前已暂停深圳地区所有门店的堂食服务，正进行人员活动轨迹调查，要求近期前往过水贝IBC环球商务中心的员工、促销员进行核酸检测；针对供应商促销员情况进行了调查，安排交叉顶场人员进行核酸检查；并对员工每天进行体温测量，要求所有员工必须佩戴口罩，建立体温检测登记表，每天跟进员工身体健康状况。</p><p>胜佳超市相关负责人也告诉记者，目前超市正在排查进口冷冻品的溯源，并对近期接触冷冻品的同事每周都安排一次核酸检测。</p><p>记者从广州冷链行业协会了解到，广州冷链行业协会已发布紧急通知，要求协会全体冷链企业，必须严格按照广东省市场监督管理局《关于加强冷藏冷冻食品质量安全监督管理的通知》的要求，严格落实冷藏冷冻食品安全主体责任，严格落实进货查验和记录制度，切实加强冷藏冷冻食品生产经营过程管理，暂停进口来自疫区的冷冻肉制品和水产品。对所有接触冷冻肉食、水产品的从业人员马上进行新冠病毒核酸检测并坚持做到每周一次。</p><p><strong>接触进口冷冻肉和水产品的员工须佩戴手套、口罩</strong></p><p>记者了解到，广州市商务局已于昨日最新发布了《关于加强超市疫情防控工作的紧急通知》，要求各区商务主管部门尽快开展摸查工作，摸清辖区内经营进口冷冻肉制品和水产品的超市（含超市配送仓库），并迅速在辖区开展巡查工作，引导企业配合市、区两级卫生健康、市场监督管理局等部门做好进口冷冻肉制品和水产品食品安全和检验检疫工作。 同时要求全市超市企业切实落实主体责任，严格执行《商业服务企业新冠肺炎疫情常态化防控工作指引（第二版）》，及时更新企业员工在岗名录，继续加大力度落实企业员工健康监测管理、个人防护等常态化的防控措施，特别是接触进口冷冻肉制品和水产品环境和产品的员工，必须佩戴手套、口罩进行操作。</p><p>商超日常防疫工作仍不松懈，永旺天河城表示，7月下旬开始，每周冷链肉类和水产岗位的员工接受核酸检测，疾控部门还对环境、商品、商品外包装进行每周定期检测。</p><p>责任编辑：任洁</p>', '1', '1', '1', '3', '138', '0', '46', '2020-09-04 10:02:12', '2020-09-04 10:11:54', null);
INSERT INTO `t_article` VALUES ('a69615a4ee5111ea86dc5b17b13af9e0', 'b958055ed25811eab056eb3c0fd49ec3', '从北京进口的冷链食品必须进行“双100%”检测', '', '', '<p>	<span style=\"color: rgb(51, 51, 51);\">记者9月2日从北京市新冠肺炎疫情新闻发布会上获悉，北京海关将对所有从北京口岸进口的冷链食品以及来自高风险国家（地区）的其他商品，100%对外包装、货物采样并进行新冠病毒核酸检测；对所有入境交通运输工具、进口货物及海关监管作业场所、进口冷链货物储存场所，100%进行预防性消杀处理。（吴文诩 侠克）</span></p><p><img src=\"https://api.tianhuan0754.com/uploads/20200904/0ea58271f5b374f8fa47575761bdadc2.jpg\"></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">图片来源 视觉中国</span></p>', '1', '1', '1', '6', '209', '0', '44', '2020-09-04 09:55:04', '2020-09-04 10:22:32', null);
INSERT INTO `t_article` VALUES ('b5208dd0edc411ea9e2b81a51fbf3dca', 'b7b4c534d25811ea831cfb8c9096479f', '汕头未来大爆发！', '', '', '<p class=\"ql-align-justify\"><img src=\"https://api.tianhuan0754.com/uploads/20200903/22650adcf3bd76948276baca281853a5.png\"></p><ul><li class=\"ql-align-justify\"><strong>今天好消息多到爆炸！！！</strong></li><li class=\"ql-align-justify\">交通、民生、医疗.....</li><li class=\"ql-align-justify\">都是与大家生活息息相关的大事</li><li class=\"ql-align-justify\">纷纷相继启动、签约、竣工</li><li class=\"ql-align-justify\">汕头将开启全面开挂模式！</li><li class=\"ql-align-justify\">新一轮升级大改造！</li><li class=\"ql-align-justify\">简直是要称霸的节奏！</li><li><span style=\"color: rgb(34, 34, 34);\">据了解，根据市委、市政府的工作部署，重点项目启动、竣工、签约仪式今天在各区县同时举行。</span></li><li><span style=\"color: rgb(34, 34, 34);\">根据市发改局提供的数字，截至12月26日，</span><strong style=\"color: rgb(34, 34, 34);\">年底前启动、竣工、签约项目共171个（不含房地产项目），总投资673亿元。</strong></li><li><span style=\"color: rgb(34, 34, 34);\">其中，启动项目75个，总投资363亿元；竣工项目77个，总投资82亿元；签约项目19个，总投资228亿元。这些项目涵盖产业发展、基础设施、民生实事等多个领域，体量大、质态优、产业关联度强，</span></li><li><span style=\"color: rgb(34, 34, 34);\">必将为汕头高质量发展注入强劲动力、提供坚实支撑。</span></li><li class=\"ql-align-justify\"><strong>金平区</strong></li><li class=\"ql-align-justify\"><strong>金平区在莲塘工业区举行14个重点项目的集中启动（开工）仪式，总投资额超过80亿元。</strong></li></ul><p><br></p><p><br></p><ul><li class=\"ql-align-justify\">汕头天环冷链物流有限公司——汕头天环冷链物流仓储项目</li><li class=\"ql-align-justify\">该项目由南京天环食品集团有限公司投资建设，选址于金平区鮀莲街道福岛社区（大学路与潮汕环线交界处），总投资18.09亿元，占地约160亩，总建筑面积35.42万平方米。</li></ul><p><img src=\"https://api.tianhuan0754.com/uploads/20200903/f2d3c86549f59f4b74d222eb500a4b26.png\"></p><p><span style=\"color: rgb(34, 34, 34);\">来源：汕头橄榄台、汕头日报</span></p>', '1', '1', '1', '2', '144', '37', '36', '2020-09-03 17:06:10', '2020-09-03 17:57:12', null);
INSERT INTO `t_article` VALUES ('c174a102ee5011ea8cb6b9926485a57a', '59f5ab92d32111ea83db7f5e0a689679', '央视《新闻联播》关注贵阳冷链物流系统建设', '', '', '<p><img src=\"https://api.tianhuan0754.com/uploads/20200904/13cf5a8cba1b149222b58f3d8fadb85a.jpg\"></p><p>8月2日晚，央视《新闻联播》播出《贵州：加强冷链建设 助力脱贫攻坚》，围绕贵州省决战决胜脱贫攻坚，大力开展农村产业革命的中心工作。</p><p>报道从贵阳市乌当区在建的20万吨冷库为切入点，展现了开展农村产业革命以来，贵州农村进入新的发展阶段后，优质农产品泉涌而出，农业从单一种养殖向一二三产融合发展，为农民增收、脱贫攻坚提供强大动力。</p><p>贵州省找准制约特色优势产业发展的短板，通过打造冷链物流体系，为农民增收、脱贫攻坚助力。</p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">在贵州省贵阳市乌当区的农副产品交易中心，一个容量20万吨的新冷库正加紧建设，年底建成后，交易中心的总库容将从2010年的5万吨变成40万吨。</span></p><p>贵州瀑布冷链农副产品交易中心董事长 陈瑞国：贵州农副产品质量比较好，我们看中这个市场，之前就投资了20万吨冷库，通过几年的运作，冷库供不应求，所以我们再继续投资20万吨冷库。</p><p>十年前，贵州的冷库容量仅占全国的1.07%，即使是这么小的库容，因为农产品类型单一、商品化程度低，也还有大量闲置。</p><p><span style=\"color: rgb(51, 51, 51);\">随着近年来贵州加大脱贫攻坚的力度，贵州农业实现从单一种养殖向一二三产业融合发展，销售方式从“提篮小卖”向现代商贸物流转变。茶叶、辣椒、刺梨等特色产业的迅速发展，粮油、豆类、中药材、肉类、果蔬等众多品种的出现，都使得冷链设施越来越供不应求，冷链设施的不足大大限制了生鲜产品的销售半径。</span></p><p><span style=\"color: rgb(51, 51, 51);\">找准短板，精准发力，从2017年起，贵州实施冷链物流助推脱贫攻坚三年行动，逐步优化冷链基础设施布局。</span></p><p>贵州省仁怀市东升农场商超包装负责人 林菊：以前没有冷链，所以说菜一般送到外面都坏了，现在的蔬菜就卖得比较广，比如说广东、香港、澳门、台湾这些地方，今年产值应该在一百多万。</p><p>三年来，贵州省冷库设施增长368%。截至今年6月底，贵州省已建成冷库1235个，库容386.36万立方米。农产品销售半径从平均不到300公里延伸至北上广、粤港澳以及东南亚、迪拜等地。</p><p>今年上半年，贵州省农产品销售额达到200多亿元，同比增长70%以上，外销生鲜蔬菜有半数以上通过冷链运输，农产品损耗降低7亿元。</p><p>来源：央视新闻、知知贵阳</p><p>编辑 侯川川/编审 邓文盈</p>', '1', '1', '1', '3', '205', '0', '47', '2020-09-04 09:48:40', '2020-09-04 10:06:04', '2020-09-04 10:06:04');
INSERT INTO `t_article` VALUES ('cc41f214edc511ea93ed511375e1080a', 'b7b4c534d25811ea831cfb8c9096479f', '解读省重点建设项目“藏”着的发展密码', '', '', '<p>日前，备受关注的国内最大直径盾构越海隧道——汕头市苏埃通道工程（又称汕头海湾隧道）取得阶段性重要进展，其东线盾构机已完成千米掘进，为工程后续推进奠定良好基础。</p><p>这是国内首条地处8度地震烈度区的盾构隧道，该工程列入今年省重点建设项目计划。</p><p>苏埃通道工程是汕头市众多列入省重点建设项目计划的其中一项。记者获悉，2019年我省共安排省重点项目1170个，总投资5.93万亿元，年度计划投资6500亿元，</p><p>安排开展前期工作的省重点建设前期预备项目628个，估算总投资3.18万亿元。</p><p>其中，据不完全统计，汕头市共有50项工程列入省重点建设项目计划，另有24项工程列入省重点建设前期预备项目计划。</p><p>汕头项目呈现什么特点，涵盖哪些领域，从中可以看出哪些新的发展机遇？南方日报记者梳理涉汕有关省重点建设项目，探寻更为丰富的发展内涵。</p><p><br></p><p>关键词 现代服务业</p><p>培育壮大高端现代服务业 加快省域副中心城市建设</p><p>与交通基础设施项目数量“并肩”的是现代服务业。</p><p>在我省2019年重点建设项目计划中，汕头有12个项目列入“现代服务业”一栏，包括1个总部经济项目、1个金融服务项目、2个商务服务项目、5个商贸物流项目、3个综合生产服务项目。</p><p><br></p><p>商贸物流项目方面，包括1个投产项目——汕头粤东物流新城项目一期，2个续建项目——汕头广澳国际集装箱物流中心、宝能（汕头）国际供应链物流中心项目，2个新开工项目——汕头天环冷链物流仓储项目、</p><p>汕头濠江冷链物流生态圈产业园，这5个项目计划总投资共893219万元。</p><p><br></p><p>	<span style=\"color: rgb(27, 27, 27);\">&nbsp;●文/南方日报记者&nbsp;黄嘉锋</span></p>', '1', '1', '1', '3', '182', '0', '38', '2020-09-03 17:13:58', '2020-09-03 18:01:45', null);
INSERT INTO `t_article` VALUES ('db743a02d2dc11ea86a4ef64756291a9', 'b7b4c534d25811ea831cfb8c9096479f', '测试商家资讯1', '', '测试商家资讯1测试商家资讯1', '<p>测试商家资讯1测试商家资讯1测试商家资讯1测试商家资讯1</p><p><br></p><p><br></p><h2>测试商家资讯1</h2><p><img src=\"https://api.tianhuan0754.com/uploads/20200725/f96fa1061a5d68c88235a72611028a30.png\"></p>', '1', '1', '1', '3', '654', '0', '4', '2020-07-31 11:21:00', '2020-07-31 16:28:01', '2020-07-31 16:28:01');
INSERT INTO `t_article` VALUES ('f5287472edc611eab9d1c11c4e04ee95', 'b7b4c534d25811ea831cfb8c9096479f', '“百企帮百村”暨“乡村振兴 村企共建”', '', '', '<p>今天上午，濠区举办“百企帮百村”暨“乡村振兴 村企共建”人居环境提升工程（首期）签约仪式，启动总投资额18270万元的12宗人居环境提升项目。市委副书记钟挥锷，市委农办主任、市农业农村局局长谢宋彪，</p><p>区领导<a href=\"#/article/_blank\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">吴文兵</a>、秦波、<a href=\"#/article/_blank\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">郑少玲</a>、<a href=\"#/article/_blank\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">李小锋</a>等区各套班子领导，各街道社区、区直有关单位负责人，以及全区“百企帮百村”企业（乡贤）代表等参加了活动。</p><p><br></p><p>濠江区全面贯彻落实***总书记关于实施乡村振兴战略的重要论述，按照省委、省政府推进“万企帮万村”和市委、市政府推进“千企帮千村”的工作部署，积极组织“百企帮百村”工作，动员全区65家企业与54个涉农</p><p>社区自愿结对帮扶，实现结对帮扶全覆盖。阶段来企业界朋友和在外乡贤积极响应省委、市委和区委号召，积极参与结对帮扶，踊跃捐资支持乡村建设。</p><p><br></p><p>据悉，濠江区“百企帮百村”暨“乡村振兴 村企共建”人居环境提升工程（首期）总投资额达18270万元，涵道路升级改造、人行天桥、体育公园、文化公园、水体整治、农民公寓、广场建设工程等 12宗项目，将有</p><p>助补短板、优环境，为实现乡村振兴夯实软硬基础。</p><p><br></p><p>回首阶段来走过的乡村振兴路，濠区收获满满、成效迭加。据悉，濠江区坚持高站位、深谋划，制定实施《关于推进乡村振兴战略的实施方案》，明确6项整体规划、42项重点建设任务和20项政策措施，绘好全</p><p>区乡村振兴的发展蓝图；坚持细部署、强推动，乡村振兴工作取得实质性进展，农村“颜值”和“气质”持续提升；坚持抓落实、重实效，基本完成超10亿元、超600项项目的“乡村振兴·七彩濠江”民心工程，美丽乡村</p><p>建设亮点频现，第一批10个美丽乡村示范村建设全面完成；坚持以产兴农，加快发展现代农业，创建丹樱、<span style=\"color: rgb(0, 41, 102);\">金寿</span>两家省级农业公园，推动东湖菊花、益母草、东京薯等10大特色农产品品牌竞相发展，“金色东湖乡</p><p>”“濠江建设”“达濠工艺”等3件集体商标获国家核准注册。同时，濠江区坚持以人为本，实现建档立卡扶贫对象全部脱贫，加快推进“厕所革命”、“四好农村路”建设，不断补齐民生短板。但与此同时，濠江乡村发展依</p><p>然存在不少短板。</p><p><br></p><p><br></p><p>为集中力量全力攻坚，签约仪式后，濠区迅速召开全区实施乡村振兴战略工作推进会暨“百企帮百村”行动动员会，深入学习贯彻***总书记关于“三农”工作和实施乡村振兴战略的重要指示精神，中央农村工作会议和</p><p>省、市乡村振兴战略工作推进会议精神，总结我区实施乡村振兴战略工作，研究落实今明两年“三农”工作必须完成的硬任务，部署2019年农业农村工作，全面组织动员企业结对帮扶我区54个涉农社区，实现结对帮</p><p>扶全覆盖，助力乡村振兴。会议强调，要对标对表全面建成小康社会和实施乡村振兴战略“3年取得重大进展”目标必须完成的硬任务，全以赴实现濠江城乡和谐和美、百姓共治共享，奋力在加快汕头经济特区发展、</p><p>建设省域副中心城市中谱写壮丽的濠江篇章。</p><p><br></p><p>濠区“百企帮百村”暨“乡村振兴 村企共建”</p><p>人居环境提升工程（首期）项目</p><p><br></p><p>濠江区廉政文化公园选址玉新街道岗背社区鸣岗路西侧、魏征纪念馆南侧，占地26亩，计划建设文化长廊、凉亭、莲塘、同心镜、休闲广场等主题景观。</p><p>滨街道建设项目：东陇社区村前大池项目、东陇社区东辉路北段项目、东陇社区农民公寓项目、东陇社区田园升级改造项目、钱塘社区莲花公园项目</p><p>捐单位：广东阳柳集团、<a href=\"#/article/_blank\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\">汕头天环冷链物流有限公司</a></p>', '1', '1', '1', '4', '149', '0', '37', '2020-09-03 17:22:16', '2020-09-03 17:28:46', '2020-09-03 17:28:46');

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `fid` int(11) NOT NULL COMMENT '金蝶应收单主键ID',
  `bill_no` varchar(50) NOT NULL COMMENT '单据编号',
  `customer_fid` int(11) NOT NULL COMMENT '客户ID',
  `housing_fid` int(11) NOT NULL COMMENT '房源ID',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1已支付 2作废关闭',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1应收单据 2应退单据 3减免单据',
  `paid_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已缴金额',
  `unpaid_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '未缴金额',
  `other_no` varchar(25) NOT NULL DEFAULT '' COMMENT '其他关联单号',
  `bill_date` int(11) NOT NULL COMMENT '制单日期',
  `fee_month` varchar(255) NOT NULL DEFAULT '' COMMENT '费用月份',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_FID` (`fid`) USING BTREE,
  KEY `IX_BILL_NO` (`bill_no`) USING BTREE,
  KEY `IX_CUSTOMER_FID` (`customer_fid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据费用表-金蝶';

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES ('8a7267f4223311ebb31304922610d54b', '3399', 'THYS-2020100010', '643', '2310', '2333.00', '0', '1', '0.00', '2333.00', 'BXD2349I2903I4092I3904', '1604937600', '', '2020-11-09 10:30:33', '2020-11-09 10:30:33', null);

-- ----------------------------
-- Table structure for t_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_detail`;
CREATE TABLE `t_bill_detail` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `fid` int(11) unsigned NOT NULL COMMENT '映射金蝶应收单主键ID ',
  `bill_fid` int(11) NOT NULL COMMENT '外键，对应金蝶应收单主键ID',
  `charge_items_fid` int(11) NOT NULL COMMENT '收费项目->Fsfxm',
  `amount` decimal(10,2) NOT NULL COMMENT '应收金额',
  `remark` varchar(300) NOT NULL,
  `paid_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已缴金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `last_month_reading` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上月读数',
  `current_month_reading` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本月读数',
  `calc_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '计算说明',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_FID` (`fid`) USING BTREE,
  KEY `IX_BILL_FID` (`bill_fid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单据费用详情表-金蝶';

-- ----------------------------
-- Records of t_bill_detail
-- ----------------------------
INSERT INTO `t_bill_detail` VALUES ('8a8552c4223311eb83d404922610d54b', '1311', '3399', '643', '1111.00', '', '0.00', '2020-11-09 10:30:33', '2020-11-09 10:30:33', null, '0.00', '0.00', '');
INSERT INTO `t_bill_detail` VALUES ('8a86659c223311eb960f04922610d54b', '1312', '3399', '643', '1222.00', '', '0.00', '2020-11-09 10:30:33', '2020-11-09 10:30:33', null, '0.00', '0.00', '');

-- ----------------------------
-- Table structure for t_charge_type
-- ----------------------------
DROP TABLE IF EXISTS `t_charge_type`;
CREATE TABLE `t_charge_type` (
  `id` char(32) NOT NULL,
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '金蝶fid',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '收费名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_charge_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_contract
-- ----------------------------
DROP TABLE IF EXISTS `t_contract`;
CREATE TABLE `t_contract` (
  `id` char(32) NOT NULL,
  `fid` int(11) unsigned NOT NULL,
  `bill_no` varchar(30) NOT NULL COMMENT '合同号',
  `customer_fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '金蝶客户FID',
  `housing_fid` int(11) NOT NULL COMMENT '房源关联FID',
  `start_date` int(11) NOT NULL COMMENT '合同起始日期 制单日期',
  `end_date` int(11) NOT NULL COMMENT '合同终止日期',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1=执行中 2终止 3作废',
  `remark` varchar(300) NOT NULL DEFAULT '' COMMENT '合同备注',
  `power_meter_org_data` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '电表初始行码',
  `water_meter_org_data` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '水表初始行码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  `is_ithhold` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否银行代扣 默认0不是 1是',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_FID` (`fid`) USING BTREE,
  KEY `IX_HOUSING_FID` (`housing_fid`) USING BTREE,
  KEY `IX_CUSTOMER_FID` (`customer_fid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_contract
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT '系统主键',
  `fid` int(11) unsigned NOT NULL COMMENT '主键-对应金蝶FITEMID',
  `name` varchar(30) NOT NULL COMMENT '姓名-对应金蝶FName',
  `address` varchar(255) DEFAULT NULL COMMENT '地址-对应金蝶FAddress',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人-对应金蝶FContact',
  `number` varchar(30) DEFAULT NULL COMMENT '编号-对应金蝶FNumber',
  `help_code` varchar(30) DEFAULT NULL COMMENT '助记码-对应金蝶FHelpCode',
  `mobile_phone` varchar(11) DEFAULT NULL COMMENT '手机号码-对应金蝶FMobilePhone',
  `identity_no` varchar(25) DEFAULT NULL COMMENT '身份证号-对应金蝶F_102',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_FID` (`fid`) USING BTREE,
  KEY `IX_mobile_phone` (`mobile_phone`) USING BTREE,
  KEY `IX_help_code` (`help_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_customer
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT 'ID',
  `feedback_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '反馈类型',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '问题描述',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系电话',
  `customer_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='投诉反馈表';

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('04bf46f609f411ebb31b3f1b027813a7', '2', 'A03商铺占位经营', '13531196203', '6d636834f26311eaa53f33297a78e3b2', '0', '2020-10-09 13:55:22', '2020-10-09 13:55:22', null);
INSERT INTO `t_feedback` VALUES ('c7559ae009f311ebb35bc5c0ba334097', '2', 'A02商铺', '13531196203', '6d636834f26311eaa53f33297a78e3b2', '1', '2020-10-09 13:53:39', '2020-10-09 13:58:03', null);

-- ----------------------------
-- Table structure for t_housing
-- ----------------------------
DROP TABLE IF EXISTS `t_housing`;
CREATE TABLE `t_housing` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT '系统主键',
  `fid` int(11) NOT NULL COMMENT '房源内码->FID',
  `parent_fid` int(11) NOT NULL DEFAULT '0' COMMENT '父节点fid  父节点一般是空节点，非房源数据，制作数据分区展示',
  `name` varchar(60) NOT NULL COMMENT '房源备注名->FName',
  `number` varchar(10) NOT NULL COMMENT '房源编号->FNumber',
  `area` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '建筑面积->FMianJI',
  `pool_area` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '公摊面积->FDecimal1',
  `stall_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '房源类型->FComboBox {1=档口,2=商铺}',
  `state` tinyint(2) NOT NULL DEFAULT '2' COMMENT '房源状态->{1=已租用,2=未租用}',
  `posttion` varchar(50) NOT NULL DEFAULT '' COMMENT ' 房源位置 对应->FText',
  `floor` varchar(50) NOT NULL DEFAULT '' COMMENT '楼层',
  `house_type` varchar(50) NOT NULL DEFAULT '' COMMENT '户型',
  `building` varchar(50) NOT NULL DEFAULT '' COMMENT '楼栋（只做备注）',
  `power_meter_last_data` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '电表最新读数',
  `water_meter_last_data` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '水表最新读数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_FID` (`fid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_housing
-- ----------------------------

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nick_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `minipro_openid` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '小程序openid',
  `mp_openid` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '公众号openID',
  `unionid` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'unionid',
  `mobile` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号',
  `is_waiter` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否客服人员 1是0否',
  `is_manager` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否管理員 1是 0否',
  `real_name` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注真实姓名',
  `scope` int(3) NOT NULL DEFAULT '0' COMMENT '管理权限范围',
  `application_id` int(4) unsigned NOT NULL DEFAULT '1' COMMENT '应用ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_minipro_openid` (`minipro_openid`) USING BTREE,
  KEY `IX_mobile` (`mobile`) USING BTREE,
  KEY `IX_union_id` (`unionid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('1', '', '', 'opK0M46dRMkqDqoFvKF3kD2iFLt8', '', '', '13531196203', '0', '0', '', '0', '1', '2020-11-09 10:25:16', '2020-11-09 10:26:50', null);
INSERT INTO `t_member` VALUES ('2', '', '', 'o15_B0vmExm9RzKgffPxrPcjECNg', '', '', '', '0', '0', '', '0', '1', '2020-11-09 16:56:57', '2020-11-09 16:56:57', null);

-- ----------------------------
-- Table structure for t_member_phone_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_member_phone_relation`;
CREATE TABLE `t_member_phone_relation` (
  `member_id` int(11) NOT NULL COMMENT '微信用户ID',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  KEY `IX_MOBILE` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信用户与手机号码关系表';

-- ----------------------------
-- Records of t_member_phone_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_meter_period
-- ----------------------------
DROP TABLE IF EXISTS `t_meter_period`;
CREATE TABLE `t_meter_period` (
  `id` char(255) NOT NULL,
  `year` int(11) DEFAULT NULL COMMENT '账期年',
  `month` int(11) DEFAULT NULL COMMENT '账期月',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_meter_period
-- ----------------------------
INSERT INTO `t_meter_period` VALUES ('008622caf26c11ea94a2876b0942d3b0', '2020', '11', '2020-11-07 16:21:02', null, null);

-- ----------------------------
-- Table structure for t_meter_read_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_meter_read_bill`;
CREATE TABLE `t_meter_read_bill` (
  `id` char(32) NOT NULL,
  `meter_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '表类型:1-电表 | 2-水表',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `meter_last_data` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上期读数',
  `meter_current_data` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前读数',
  `housing_id` char(32) DEFAULT '' COMMENT '房源ID',
  `year` int(11) NOT NULL COMMENT '账期年',
  `month` int(11) NOT NULL COMMENT '账期月',
  `meter_degree` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '度数',
  `state` bit(1) NOT NULL DEFAULT b'0' COMMENT '1不可以修改 0可以修改',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IX_CREATETIME` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_meter_read_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_online_order
-- ----------------------------
DROP TABLE IF EXISTS `t_online_order`;
CREATE TABLE `t_online_order` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT 'ID',
  `order_no` varchar(25) NOT NULL COMMENT '订单号',
  `order_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '第三方返回的订单时间',
  `paytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '第三方返回的用户支付时间',
  `third_orderid` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方支付通道唯一订单号(提供轮询查询)',
  `ccb_orderid` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '建行交易流水号',
  `pay_channel` tinyint(2) NOT NULL COMMENT '支付渠道 | 1-微信 |2-支付宝 |3-其他',
  `pay_type` tinyint(1) NOT NULL COMMENT '支付类型:1- 小程序 | 2-H5 | 3-客戶端',
  `bill_source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '单据来源：1应收单 2水电充值 3水卡充值',
  `bill_remark` text CHARACTER SET utf8 NOT NULL COMMENT '单据备注信息{“customer_fid”:1,"bill_fids":[1,2,3]}',
  `payment_amount` decimal(10,2) NOT NULL COMMENT '支付金额',
  `payment_record_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '外键-payment_record.id',
  `order_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态 0-未支付 | 1-已支付 | 2-已关闭 | 3-已超时',
  `card_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '卡线上充值时候记录卡状态 默认0 不是卡操作记录 1支付成功待充卡 2支付成功充卡成功 3支付成功充值取消 4已退款',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付用户ID H5水卡支付需等插卡充值成功获取卡ID更新',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_ORDER_NO` (`order_no`) USING BTREE,
  KEY `IX_CCB_ORDER_ID` (`ccb_orderid`) USING BTREE COMMENT '建行交易流水单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_online_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_log`;
CREATE TABLE `t_payment_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_no` varchar(64) NOT NULL COMMENT '微信或支付宝订单号',
  `status` int(255) NOT NULL COMMENT '订单状态',
  `amount` decimal(11,2) NOT NULL COMMENT '支付金额',
  `pay_type` varchar(8) NOT NULL COMMENT '微信或支付宝',
  `customer_fid` int(11) NOT NULL COMMENT '客户Id',
  `client_no` char(3) DEFAULT NULL COMMENT '客户端号',
  `transaction_time` datetime NOT NULL COMMENT '事务时间',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_payment_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_payment_record
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_record`;
CREATE TABLE `t_payment_record` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `payment_no` varchar(25) NOT NULL COMMENT '账单号',
  `bill_source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账单来源：1单据费用表 2水电充值 3水卡充值',
  `terminal_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '终端类型：1 微信小程序 2 客户端',
  `operator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `client_no` varchar(10) NOT NULL DEFAULT '' COMMENT '客户端号',
  `customer_fid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID->FCustid',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总单据金额',
  `online_wechat` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '移动支付-微信',
  `offline_cash` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '现金',
  `offline_wechat` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '线下微信',
  `offline_alipay` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '线下支付宝',
  `offline_by_card` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '线下刷卡',
  `online_banking` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '网银',
  `year_months` char(6) NOT NULL DEFAULT '0' COMMENT '年月',
  `charge_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收费日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_PAYMENT_NO` (`payment_no`) USING BTREE,
  KEY `IX_YEAR_MONTH` (`year_months`) USING BTREE,
  KEY `IX_CREATETIME` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账单主表';

-- ----------------------------
-- Records of t_payment_record
-- ----------------------------
INSERT INTO `t_payment_record` VALUES ('02334908fc9a11eaba96abc96f4443f5', 'SFD20092214081802158551', '1', '2', '20', '001', '551', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-07 00:00:00', '2020-09-22 14:08:18', '2020-09-22 14:08:18', null);
INSERT INTO `t_payment_record` VALUES ('02704126fbb611eaba0d873f3be4aa0b', 'SFD20092110561316620643', '2', '2', '5', '001', '643', '7.00', '0.00', '2.00', '0.00', '0.00', '5.00', '0.00', '202009', '2020-09-21 10:56:13', '2020-09-21 10:56:13', '2020-09-21 10:56:13', null);
INSERT INTO `t_payment_record` VALUES ('0354f460f8d711eabd07ff4e92956c28', 'SFD20091719145456947470', '1', '2', '23', '001', '470', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:14:55', '2020-09-17 19:14:55', null);
INSERT INTO `t_payment_record` VALUES ('04ba86fefbce11eaa4812d71ce8f99cd', 'SFD20092113480493094641', '1', '2', '20', '001', '641', '40000.00', '0.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-19 00:00:00', '2020-09-21 13:48:05', '2020-09-21 13:48:05', null);
INSERT INTO `t_payment_record` VALUES ('0506065cf8d511eab8607f5c261189eb', 'SFD20091719003841390506', '1', '2', '23', '001', '506', '90000.00', '0.00', '0.00', '0.00', '0.00', '90000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:00:38', '2020-09-17 19:00:38', null);
INSERT INTO `t_payment_record` VALUES ('062d17921e7711eb81993f11cdb4b0bc', 'SFD20110416233183917459', '1', '2', '20', '001', '459', '10000.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-11-04 16:23:32', '2020-11-04 16:23:32', null);
INSERT INTO `t_payment_record` VALUES ('073c01baf8ad11eaaf02b7ee0c00fc92', 'SFD20091714142225341480', '1', '2', '5', '001', '480', '40000.00', '0.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 14:14:22', '2020-09-17 14:14:22', '2020-09-17 14:14:22', null);
INSERT INTO `t_payment_record` VALUES ('07db8be0f8da11eaa4919ff89dc88c89', 'SFD20091719363065266589', '1', '2', '19', '001', '589', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:36:31', '2020-09-17 19:36:31', null);
INSERT INTO `t_payment_record` VALUES ('088dbdfcf8d911eaa7f82382bdd1a480', 'SFD20091719292232349612', '1', '2', '19', '001', '612', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:29:22', '2020-09-17 19:29:22', null);
INSERT INTO `t_payment_record` VALUES ('0ca9bbbef8d611ea81ec9363524c1ca2', 'SFD20091719080072768496', '1', '2', '23', '001', '496', '150000.00', '0.00', '0.00', '0.00', '0.00', '150000.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-17 19:08:01', '2020-09-17 19:08:01', null);
INSERT INTO `t_payment_record` VALUES ('0cebbf34084711eb9c99771e2446b82e', 'SFD20100710444173281658', '1', '2', '20', '001', '658', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202010', '2020-10-07 00:00:00', '2020-10-07 10:44:42', '2020-10-07 10:44:42', null);
INSERT INTO `t_payment_record` VALUES ('0edc3ee0f8cf11ea8765b5b994689215', 'SFD20091718175793616517', '1', '2', '23', '001', '517', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:17:58', '2020-09-17 18:17:58', null);
INSERT INTO `t_payment_record` VALUES ('10d6d0a41a5b11eba15173d84c7bff8a', 'SFD20103010531917081433', '1', '1', '100005', '', '433', '0.01', '0.01', '0.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-30 10:53:19', '2020-10-30 10:53:19', '2020-10-30 10:53:19', null);
INSERT INTO `t_payment_record` VALUES ('11fd837af8db11eaa8c0812f7d8daabf', 'SFD20091719435714867538', '1', '2', '23', '001', '538', '10000.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 19:43:57', '2020-09-17 19:43:57', null);
INSERT INTO `t_payment_record` VALUES ('128c6bfcf8d711eaa4293de3afdca0df', 'SFD20091719152009846461', '1', '2', '19', '001', '461', '70000.00', '0.00', '20000.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:15:20', '2020-09-17 19:15:20', null);
INSERT INTO `t_payment_record` VALUES ('128ca7a6f8ce11ea88c149bb04fc7ead', 'SFD20091718105462867523', '1', '2', '23', '001', '523', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:10:55', '2020-09-17 18:10:55', null);
INSERT INTO `t_payment_record` VALUES ('1647e8a0f8d911eabc6d539eb009ec66', 'SFD20091719294535321613', '1', '2', '19', '001', '613', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:29:45', '2020-09-17 19:29:45', null);
INSERT INTO `t_payment_record` VALUES ('1682b930172911eb9d53cba2c75440e3', 'SFD20102609180036099643', '1', '2', '6', '001', '643', '0.05', '0.00', '0.00', '0.00', '0.00', '0.05', '0.00', '202010', '2020-10-01 00:00:00', '2020-10-26 09:18:00', '2020-10-26 09:18:00', null);
INSERT INTO `t_payment_record` VALUES ('16a01caeffd311eabc44b1d87ac0f5b9', 'SFD20092616342709011652', '1', '2', '20', '001', '652', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-26 00:00:00', '2020-09-26 16:34:27', '2020-09-26 16:34:27', null);
INSERT INTO `t_payment_record` VALUES ('17265d20181811eba8885b07effdfb23', 'SFD20102713485115145643', '1', '2', '5', '001', '643', '205.00', '0.00', '200.00', '0.00', '0.00', '2.00', '3.00', '202010', '2020-10-27 13:48:51', '2020-10-27 13:48:51', '2020-10-27 13:48:51', null);
INSERT INTO `t_payment_record` VALUES ('18e80ccaf8d411ea98336f4ad7b77714', 'SFD20091718540227561522', '1', '2', '23', '001', '522', '90000.00', '0.00', '90000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:54:02', '2020-09-17 18:54:02', null);
INSERT INTO `t_payment_record` VALUES ('1b4c3bf81e7211ebb1901f97d992b061', 'SFD20110415481979211582', '1', '2', '20', '001', '582', '10000.00', '0.00', '0.00', '0.00', '0.00', '10000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-11-04 15:48:20', '2020-11-04 15:48:20', null);
INSERT INTO `t_payment_record` VALUES ('1c336c8ef8d511eabdece3d51a398ad2', 'SFD20091719011729942507', '1', '2', '23', '001', '507', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:01:17', '2020-09-17 19:01:17', null);
INSERT INTO `t_payment_record` VALUES ('1c6a9b58f8d711ea82f14d99be01a1dd', 'SFD20091719153665432466', '1', '2', '23', '001', '466', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:15:37', '2020-09-17 19:15:37', null);
INSERT INTO `t_payment_record` VALUES ('1f1365f8f8df11ea9f3999bd2a32bd9c', 'SFD20091720125708923525', '1', '2', '23', '001', '525', '20000.00', '0.00', '10000.00', '0.00', '0.00', '10000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 20:12:57', '2020-09-17 20:12:57', null);
INSERT INTO `t_payment_record` VALUES ('200a3816f8d911eab781b7dacac87b59', 'SFD20091719300172659599', '1', '2', '23', '001', '599', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-11 00:00:00', '2020-09-17 19:30:02', '2020-09-17 19:30:02', null);
INSERT INTO `t_payment_record` VALUES ('213f1448f8d611ea822cb59ae6cd23fc', 'SFD20091719083526032493', '1', '2', '23', '001', '493', '60000.00', '0.00', '60000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-17 19:08:35', '2020-09-17 19:08:35', null);
INSERT INTO `t_payment_record` VALUES ('21975e2cf8d711ea92abd79f172f898d', 'SFD20091719154533572460', '1', '2', '19', '001', '460', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:15:45', '2020-09-17 19:15:45', null);
INSERT INTO `t_payment_record` VALUES ('23dd4bf614e311eb844fefda28977077', 'SFD20102311521566859643', '1', '2', '5', '001', '643', '0.01', '0.00', '0.01', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-23 11:52:15', '2020-10-23 11:52:16', '2020-10-23 11:52:16', null);
INSERT INTO `t_payment_record` VALUES ('24868f38fc8111eaaf55776b3ba72220', 'SFD20092211101819160524', '1', '2', '20', '001', '524', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-22 11:10:18', '2020-09-22 11:10:18', null);
INSERT INTO `t_payment_record` VALUES ('2555249e181811eba157f7d0d986c510', 'SFD20102713491494662643', '1', '2', '5', '001', '643', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 13:49:14', '2020-10-27 13:49:15', '2020-10-27 13:49:15', null);
INSERT INTO `t_payment_record` VALUES ('26e31fbef95a11ea88caa7fa2bbf259a', 'SFD20091810533829233459', '1', '2', '23', '001', '459', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-18 10:53:38', '2020-09-18 10:53:38', null);
INSERT INTO `t_payment_record` VALUES ('284bcc24f8f211eabd150d7ee1e92709', 'SFD20091722291299681603', '1', '2', '23', '001', '603', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 22:29:13', '2020-09-17 22:29:13', null);
INSERT INTO `t_payment_record` VALUES ('2850e410f8da11ea896e3354ea27e5d4', 'SFD20091719372510836584', '1', '2', '19', '001', '584', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:37:25', '2020-09-17 19:37:25', null);
INSERT INTO `t_payment_record` VALUES ('2ab28722f8d511ea966d2d139e61752a', 'SFD20091719014161972434', '1', '2', '19', '001', '434', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:01:42', '2020-09-17 19:01:42', null);
INSERT INTO `t_payment_record` VALUES ('2ba4a7b8f8f411ea980b418e446c0e1d', 'SFD20091722433760560484', '1', '2', '23', '001', '484', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 22:43:38', '2020-09-17 22:43:38', null);
INSERT INTO `t_payment_record` VALUES ('2bad036ef8d511ea82fd335c2dbc47ef', 'SFD20091719014326130504', '1', '2', '23', '001', '504', '80000.00', '0.00', '0.00', '0.00', '0.00', '80000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:01:43', '2020-09-17 19:01:43', null);
INSERT INTO `t_payment_record` VALUES ('2c2db30a11a411ebaf4f63d72371812a', 'SFD20101908435783179653', '1', '2', '20', '001', '653', '50000.00', '0.00', '50000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-26 00:00:00', '2020-10-19 08:43:58', '2020-10-19 08:43:58', null);
INSERT INTO `t_payment_record` VALUES ('2d42063af8ed11eab95647c03b00d111', 'SFD20091721533383723433', '3', '2', '5', '001', '433', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 21:53:33', '2020-09-17 21:53:34', '2020-09-17 21:53:34', null);
INSERT INTO `t_payment_record` VALUES ('2ed448c0015611ebbb00d98da63df70a', 'SFD20092814452293173478', '1', '2', '20', '001', '478', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-28 14:45:23', '2020-09-28 14:45:23', null);
INSERT INTO `t_payment_record` VALUES ('2faefbcaf8da11eab7c94fa3092e49d2', 'SFD20091719373746821585', '1', '2', '19', '001', '585', '30000.00', '0.00', '0.00', '0.00', '0.00', '30000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:37:37', '2020-09-17 19:37:37', null);
INSERT INTO `t_payment_record` VALUES ('328df890015011eb8064f90fa67882b6', 'SFD20092814023220163654', '1', '2', '20', '001', '654', '80000.00', '0.00', '0.00', '0.00', '0.00', '80000.00', '0.00', '202009', '2020-09-28 00:00:00', '2020-09-28 14:02:32', '2020-09-28 14:02:32', null);
INSERT INTO `t_payment_record` VALUES ('33447ba0f8d711eaaf8c3d0c3db3a534', 'SFD20091719161499194467', '1', '2', '23', '001', '467', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:16:15', '2020-09-17 19:16:15', null);
INSERT INTO `t_payment_record` VALUES ('3473b868f8d911ea9a20818185f96254', 'SFD20091719303597063609', '1', '2', '19', '001', '609', '170000.00', '0.00', '90000.00', '0.00', '0.00', '80000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:30:36', '2020-09-17 19:30:36', null);
INSERT INTO `t_payment_record` VALUES ('366af6aaf8d311ea907babf210920727', 'SFD20091718474229061592', '1', '2', '23', '001', '592', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 18:47:42', '2020-09-17 18:47:42', null);
INSERT INTO `t_payment_record` VALUES ('36c3eb9cf8ca11ea87d58b398b22f728', 'SFD20091717431740226593', '1', '2', '23', '001', '593', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 17:43:17', '2020-09-17 17:43:17', null);
INSERT INTO `t_payment_record` VALUES ('3850aeb2f8db11ea834ddbc0ff27e802', 'SFD20091719450144751539', '1', '2', '23', '001', '539', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-17 19:45:01', '2020-09-17 19:45:01', null);
INSERT INTO `t_payment_record` VALUES ('39fbfcc2f8da11ea9ca2e735137d501f', 'SFD20091719375475157573', '1', '2', '23', '001', '573', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-17 19:37:55', '2020-09-17 19:37:55', null);
INSERT INTO `t_payment_record` VALUES ('3ae54238f8d511eab875a72497af1e13', 'SFD20091719020879593435', '1', '2', '19', '001', '435', '90000.00', '0.00', '0.00', '0.00', '0.00', '90000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:02:09', '2020-09-17 19:02:09', null);
INSERT INTO `t_payment_record` VALUES ('3b8e5582f8d811ea96d629f34b756a3b', 'SFD20091719233839472590', '1', '2', '23', '001', '590', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 19:23:38', '2020-09-17 19:23:38', null);
INSERT INTO `t_payment_record` VALUES ('3c7490dcf8d911ea910f11a3faffab2c', 'SFD20091719304939998594', '1', '2', '23', '001', '594', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-11 00:00:00', '2020-09-17 19:30:49', '2020-09-17 19:30:49', null);
INSERT INTO `t_payment_record` VALUES ('3ee3ff22128511ebb07f9188656d92e1', 'SFD20102011350599237582', '1', '2', '20', '001', '582', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-04 00:00:00', '2020-10-20 11:35:06', '2020-10-20 11:35:06', null);
INSERT INTO `t_payment_record` VALUES ('3fdafafaf8d811ea9d355b717e0e685e', 'SFD20091719234560714622', '1', '2', '19', '001', '622', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:23:46', '2020-09-17 19:23:46', null);
INSERT INTO `t_payment_record` VALUES ('4047adfe021e11eba839233e3145dd5a', 'SFD20092914373155548560', '1', '2', '20', '001', '560', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-09-29 14:37:32', '2020-09-29 14:37:32', null);
INSERT INTO `t_payment_record` VALUES ('4050c20cf8cf11eaa7ed29996fc21e9a', 'SFD20091718192090812515', '1', '2', '23', '001', '515', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:19:21', '2020-09-17 18:19:21', null);
INSERT INTO `t_payment_record` VALUES ('40c1b3bcf8d511ea9a33a7e4f65f8d98', 'SFD20091719021862911505', '1', '2', '23', '001', '505', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:02:19', '2020-09-17 19:02:19', null);
INSERT INTO `t_payment_record` VALUES ('42fa33bcf8d911ea96c90b12a8332b14', 'SFD20091719310034231611', '1', '2', '19', '001', '611', '80000.00', '0.00', '0.00', '0.00', '0.00', '80000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:31:00', '2020-09-17 19:31:00', null);
INSERT INTO `t_payment_record` VALUES ('45a98a20f8db11ea8fdd65654b720779', 'SFD20091719452384017552', '1', '2', '19', '001', '552', '40000.00', '0.00', '20000.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:45:24', '2020-09-17 19:45:24', null);
INSERT INTO `t_payment_record` VALUES ('4628e334181a11ebbf48b9a95361d491', 'SFD20102714042901461643', '1', '2', '5', '001', '643', '11.00', '0.00', '11.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 14:04:29', '2020-10-27 14:04:29', '2020-10-27 14:04:29', null);
INSERT INTO `t_payment_record` VALUES ('4771d04af8d811ea92dd6fabcfd7df83', 'SFD20091719235834058621', '1', '2', '19', '001', '621', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:23:58', '2020-09-17 19:23:58', null);
INSERT INTO `t_payment_record` VALUES ('47f65f66fbb911eab9e551097346d379', 'SFD20092111193829874643', '3', '2', '5', '001', '643', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-21 11:19:38', '2020-09-21 11:19:38', '2020-09-21 11:19:38', null);
INSERT INTO `t_payment_record` VALUES ('485356fcf8d611ea867f970516be392d', 'SFD20091719094082454490', '1', '2', '23', '001', '490', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202008', '2020-08-31 00:00:00', '2020-09-17 19:09:41', '2020-09-17 19:09:41', null);
INSERT INTO `t_payment_record` VALUES ('493c55acf8ac11ea8d2ea3ad30769ea7', 'SFD20091714090348923484', '1', '2', '5', '001', '484', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 14:09:03', '2020-09-17 14:09:03', '2020-09-17 14:09:03', null);
INSERT INTO `t_payment_record` VALUES ('4a96b6f6f8d711eaa9ac1d70f7158e5e', 'SFD20091719165411851463', '1', '2', '23', '001', '463', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:16:54', '2020-09-17 19:16:54', null);
INSERT INTO `t_payment_record` VALUES ('4ac5ead0f8db11ea8a9b954b385b6be7', 'SFD20091719453241436536', '1', '2', '23', '001', '536', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-04 00:00:00', '2020-09-17 19:45:32', '2020-09-17 19:45:32', null);
INSERT INTO `t_payment_record` VALUES ('4c594bf2fc7911eaaf286b8c72ff083f', 'SFD20092210140902964509', '1', '2', '20', '001', '509', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-22 10:14:09', '2020-09-22 10:14:09', null);
INSERT INTO `t_payment_record` VALUES ('4db86dbef8d911eab2432b261d585da2', 'SFD20091719311836583606', '1', '2', '19', '001', '606', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:31:18', '2020-09-17 19:31:18', null);
INSERT INTO `t_payment_record` VALUES ('4dd219e60ea311eb84dd5ba213f7edb8', 'SFD20101513001129190495', '1', '2', '20', '001', '495', '90000.00', '0.00', '0.00', '0.00', '0.00', '90000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-10-15 13:00:11', '2020-10-15 13:00:11', null);
INSERT INTO `t_payment_record` VALUES ('4fad35a0144f11ebaa396f7b41ee5d65', 'SFD20102218140365612433', '1', '2', '5', '001', '433', '0.04', '0.00', '0.04', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-22 18:14:03', '2020-10-22 18:14:04', '2020-10-22 18:14:04', null);
INSERT INTO `t_payment_record` VALUES ('516a1222f8da11eaa09c71edceb8e2dd', 'SFD20091719383405986562', '1', '2', '23', '001', '562', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-09-17 19:38:34', '2020-09-17 19:38:34', null);
INSERT INTO `t_payment_record` VALUES ('51cb1a10f8d811ea826f7f3827629ff1', 'SFD20091719241570290620', '1', '2', '19', '001', '620', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:24:16', '2020-09-17 19:24:16', null);
INSERT INTO `t_payment_record` VALUES ('528c6c7e14d011ebb14d2933c51d25d0', 'SFD20102309373355331643', '1', '2', '5', '001', '643', '6.01', '0.00', '1.00', '0.00', '0.01', '2.00', '3.00', '202010', '2020-10-23 09:37:33', '2020-10-23 09:37:34', '2020-10-23 09:37:34', null);
INSERT INTO `t_payment_record` VALUES ('54eaf2d6f8da11eabdd3634085d78e1e', 'SFD20091719383993758575', '1', '2', '19', '001', '575', '90000.00', '0.00', '90000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:38:40', '2020-09-17 19:38:40', null);
INSERT INTO `t_payment_record` VALUES ('559f3d34103d11eb843a05aac68262b6', 'SFD20101713551803915619', '1', '2', '20', '001', '619', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-10-17 13:55:18', '2020-10-17 13:55:18', null);
INSERT INTO `t_payment_record` VALUES ('57be908af8d511eabe4dbf6d222263e1', 'SFD20091719025719646436', '1', '2', '19', '001', '436', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:02:57', '2020-09-17 19:02:57', null);
INSERT INTO `t_payment_record` VALUES ('581a5c76fbb911ea88f42d6906b538df', 'SFD20092111200537888643', '3', '2', '5', '001', '643', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-21 11:20:05', '2020-09-21 11:20:05', '2020-09-21 11:20:05', null);
INSERT INTO `t_payment_record` VALUES ('5b3b0702f8d511ea973fa523b64485d9', 'SFD20091719030304597500', '1', '2', '23', '001', '500', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-17 19:03:03', '2020-09-17 19:03:03', null);
INSERT INTO `t_payment_record` VALUES ('5bbecd98f8db11eab25981a143f9d0db', 'SFD20091719460088938553', '1', '2', '19', '001', '553', '50000.00', '0.00', '50000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:46:01', '2020-09-17 19:46:01', null);
INSERT INTO `t_payment_record` VALUES ('5e0b34f0f8d711ea87cacff0dd792e14', 'SFD20091719172675894464', '1', '2', '23', '001', '464', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:17:27', '2020-09-17 19:17:27', null);
INSERT INTO `t_payment_record` VALUES ('600a6a7afbb911ea9bd3a1bd2be746ea', 'SFD20092111201869586643', '3', '2', '5', '001', '643', '-1.00', '0.00', '-1.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-21 11:20:18', '2020-09-21 11:20:19', '2020-09-21 11:20:19', null);
INSERT INTO `t_payment_record` VALUES ('612208f2fbb211ea8b1c9385d62fdd9c', 'SFD20092110301405092643', '1', '2', '5', '001', '643', '200.00', '0.00', '0.00', '0.00', '0.00', '200.00', '0.00', '202009', '2020-09-21 10:30:14', '2020-09-21 10:30:14', '2020-09-21 10:30:14', null);
INSERT INTO `t_payment_record` VALUES ('615db0b8ffd211ea85f0bfd3b2540270', 'SFDH20090001', '1', '1', '0', '', '643', '-19999.00', '0.00', '0.00', '0.00', '0.00', '-19999.00', '0.00', '202009', '2020-09-26 16:29:22', '2020-09-26 16:29:23', '2020-09-26 16:29:23', null);
INSERT INTO `t_payment_record` VALUES ('61a5378c015611eb92af0f3ce964c6d1', 'SFD20092814464818795478', '1', '2', '20', '001', '478', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-28 14:46:48', '2020-09-28 14:46:48', null);
INSERT INTO `t_payment_record` VALUES ('61ae56caf8f311ea846475fd8d9e85ca', 'SFD20091722375876994498', '1', '2', '23', '001', '498', '120000.00', '0.00', '80000.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 22:37:59', '2020-09-17 22:37:59', null);
INSERT INTO `t_payment_record` VALUES ('62adb5e2fbb011ea8fa0df356112eb8b', 'SFD20092110155765059643', '1', '2', '5', '001', '643', '20000.00', '0.00', '15000.00', '0.00', '0.00', '5000.00', '0.00', '202009', '2020-09-21 10:15:57', '2020-09-21 10:15:58', '2020-09-21 10:15:58', null);
INSERT INTO `t_payment_record` VALUES ('6362293ef8d911eaa8e4a5ed87d507b2', 'SFD20091719315471083607', '1', '2', '19', '001', '607', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:31:55', '2020-09-17 19:31:55', null);
INSERT INTO `t_payment_record` VALUES ('6433618cf8db11ea9666b3f8910e23b5', 'SFD20091719461507555554', '1', '2', '19', '001', '554', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:46:15', '2020-09-17 19:46:15', null);
INSERT INTO `t_payment_record` VALUES ('64977b60015811eba238d12e00055566', 'SFD20092815011212466510', '1', '2', '20', '001', '510', '120000.00', '0.00', '0.00', '0.00', '0.00', '120000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-28 15:01:12', '2020-09-28 15:01:12', null);
INSERT INTO `t_payment_record` VALUES ('6507b87814d411eb89cf59a637408a5e', 'SFD20102310064254625643', '1', '2', '5', '001', '643', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-23 10:06:42', '2020-10-23 10:06:43', '2020-10-23 10:06:43', null);
INSERT INTO `t_payment_record` VALUES ('6662400614d111ebad3c972e96bc595c', 'SFD20102309451632763643', '1', '2', '5', '001', '643', '0.01', '0.00', '0.00', '0.00', '0.00', '0.01', '0.00', '202010', '2020-10-23 09:45:16', '2020-10-23 09:45:16', '2020-10-23 09:45:16', null);
INSERT INTO `t_payment_record` VALUES ('66779c6cf8d411ea8c2b9bd7a924be44', 'SFD20091718561240079513', '1', '2', '23', '001', '513', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 18:56:12', '2020-09-17 18:56:12', null);
INSERT INTO `t_payment_record` VALUES ('66ab241ef8d511ea9f8a4988478a2189', 'SFD20091719032223520437', '1', '2', '19', '001', '437', '60000.00', '0.00', '20000.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:03:22', '2020-09-17 19:03:22', null);
INSERT INTO `t_payment_record` VALUES ('68c91692f8db11eaa94c03e27c74cd03', 'SFD20091719462276746532', '1', '2', '23', '001', '532', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-04 00:00:00', '2020-09-17 19:46:23', '2020-09-17 19:46:23', null);
INSERT INTO `t_payment_record` VALUES ('6afbaa4ef8d911ea87f427ec71112ffb', 'SFD20091719320746030608', '1', '2', '19', '001', '608', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:32:07', '2020-09-17 19:32:07', null);
INSERT INTO `t_payment_record` VALUES ('6b08cea6021e11eb9618b9890584b844', 'SFD20092914384328557560', '1', '2', '20', '001', '560', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-29 14:38:43', '2020-09-29 14:38:43', null);
INSERT INTO `t_payment_record` VALUES ('6b9fc880f8da11ea92433f75890b593b', 'SFD20091719391803229559', '1', '2', '23', '001', '559', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-09-17 19:39:18', '2020-09-17 19:39:18', null);
INSERT INTO `t_payment_record` VALUES ('6e75c928f8db11ea9bae75dacbcf8e3e', 'SFD20091719463228693548', '1', '2', '19', '001', '548', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:46:32', '2020-09-17 19:46:32', null);
INSERT INTO `t_payment_record` VALUES ('6e86f800fd4611eaba55c5ef8e139419', 'SFD20092310423320122644', '1', '2', '20', '001', '644', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-21 00:00:00', '2020-09-23 10:42:33', '2020-09-23 10:42:33', null);
INSERT INTO `t_payment_record` VALUES ('6e9ff528f8d511ea9ab9abe8ae84d208', 'SFD20091719033558338501', '1', '2', '23', '001', '501', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:03:36', '2020-09-17 19:03:36', null);
INSERT INTO `t_payment_record` VALUES ('6fa1ab7a182811eb88125708225172f2', 'SFD20102715455154763433', '3', '1', '100501', '', '433', '100.00', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 15:45:51', '2020-10-27 15:45:52', '2020-10-27 15:45:52', null);
INSERT INTO `t_payment_record` VALUES ('6fe365eaf8d611eab5b9f103068743b3', 'SFD20091719104719970487', '1', '2', '23', '001', '487', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202008', '2020-08-31 00:00:00', '2020-09-17 19:10:47', '2020-09-17 19:10:47', null);
INSERT INTO `t_payment_record` VALUES ('72b4e5a0105011eba9d45f6f247e81fc', 'SFD20101716120727339434', '1', '2', '20', '001', '434', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-23 00:00:00', '2020-10-17 16:12:07', '2020-10-17 16:12:07', null);
INSERT INTO `t_payment_record` VALUES ('73071b5af8d511ea8cdc4dbaeeee3fd5', 'SFD20091719034297042438', '1', '2', '19', '001', '438', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:03:43', '2020-09-17 19:03:43', null);
INSERT INTO `t_payment_record` VALUES ('73f1900e0f5511ebadd48b93ca0c91fc', 'SFD20101610152566934561', '1', '2', '20', '001', '561', '110000.00', '0.00', '0.00', '0.00', '0.00', '110000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-10-16 10:15:26', '2020-10-16 10:15:26', null);
INSERT INTO `t_payment_record` VALUES ('757bd76cf8db11ea9e086f516567c0e5', 'SFD20091719464407138549', '1', '2', '19', '001', '549', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:46:44', '2020-09-17 19:46:44', null);
INSERT INTO `t_payment_record` VALUES ('783c9a24f8d911ea841b119d7ecee94c', 'SFD20091719322969622602', '1', '2', '19', '001', '602', '40000.00', '0.00', '20000.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:32:30', '2020-09-17 19:32:30', null);
INSERT INTO `t_payment_record` VALUES ('79aa72f4f8da11ea9f2b43c03ef2c7b3', 'SFD20091719394158986572', '1', '2', '19', '001', '572', '90000.00', '0.00', '0.00', '0.00', '0.00', '90000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:39:42', '2020-09-17 19:39:42', null);
INSERT INTO `t_payment_record` VALUES ('7a79858ef8d611ea9d83f9cc3c4611b7', 'SFD20091719110496143443', '1', '2', '19', '001', '443', '120000.00', '0.00', '0.00', '0.00', '0.00', '120000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:11:05', '2020-09-17 19:11:05', null);
INSERT INTO `t_payment_record` VALUES ('7bd7087cf8d411eaa660ed4eb6c8be14', 'SFD20091718564825861514', '1', '2', '23', '001', '514', '90000.00', '0.00', '90000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:56:48', '2020-09-17 18:56:48', null);
INSERT INTO `t_payment_record` VALUES ('7be3950cf95a11eaa9807b52b6a6d2ec', 'SFD20091810560090270458', '1', '2', '23', '001', '458', '80000.00', '0.00', '0.00', '0.00', '0.00', '80000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-18 10:56:01', '2020-09-18 10:56:01', null);
INSERT INTO `t_payment_record` VALUES ('7c9e63a8f8d511eab466694cbb277e34', 'SFD20091719035906153439', '1', '2', '19', '001', '439', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:03:59', '2020-09-17 19:03:59', null);
INSERT INTO `t_payment_record` VALUES ('7d5fbd78021c11ebb54ac9deddc4db2a', 'SFD20092914245506016476', '1', '2', '20', '001', '476', '230000.00', '0.00', '0.00', '0.00', '0.00', '230000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-29 14:24:55', '2020-09-29 14:24:55', null);
INSERT INTO `t_payment_record` VALUES ('7d853e2411d311eba582f5be9d8545bf', 'SFD20101914224065038188', '1', '2', '20', '001', '1188', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202010', '2020-10-19 00:00:00', '2020-10-19 14:22:41', '2020-10-19 14:22:41', null);
INSERT INTO `t_payment_record` VALUES ('7e292918f8d711eaae42dde33e3bdd3a', 'SFD20091719182064177473', '1', '2', '19', '001', '473', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:18:21', '2020-09-17 19:18:21', null);
INSERT INTO `t_payment_record` VALUES ('7fa6d39cf8d911eabb17dfd404b022e4', 'SFD20091719324213671586', '1', '2', '23', '001', '586', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 19:32:42', '2020-09-17 19:32:42', null);
INSERT INTO `t_payment_record` VALUES ('800c8df8105911eb809307cd03380e08', 'SFD20101717165512841650', '1', '2', '20', '001', '650', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-25 00:00:00', '2020-10-17 17:16:55', '2020-10-17 17:16:55', null);
INSERT INTO `t_payment_record` VALUES ('805f4552f8d511ea829a0be8b5c292f7', 'SFD20091719040535897502', '1', '2', '23', '001', '502', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:04:05', '2020-09-17 19:04:05', null);
INSERT INTO `t_payment_record` VALUES ('810c1534f8da11ea82cd1ba024f83e4e', 'SFD20091719395397436568', '1', '2', '19', '001', '568', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:39:54', '2020-09-17 19:39:54', null);
INSERT INTO `t_payment_record` VALUES ('816a6f52f8db11ea93948bbe58e10818', 'SFD20091719470408974546', '1', '2', '19', '001', '546', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:47:04', '2020-09-17 19:47:04', null);
INSERT INTO `t_payment_record` VALUES ('85650c0cf8d611eabb3c7769fa1b3ed1', 'SFD20091719112328139444', '1', '2', '19', '001', '444', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:11:23', '2020-09-17 19:11:23', null);
INSERT INTO `t_payment_record` VALUES ('85805ad2181d11eb91ff03b0f4886f76', 'SFD20102714274377486643', '1', '2', '5', '001', '643', '6.01', '0.00', '1.00', '0.01', '0.00', '2.00', '3.00', '202010', '2020-10-27 14:27:43', '2020-10-27 14:27:44', '2020-10-27 14:27:44', null);
INSERT INTO `t_payment_record` VALUES ('86080ee0f8d911ea8fc4bd9b75fc65b7', 'SFD20091719325283736604', '1', '2', '19', '001', '604', '180000.00', '0.00', '30000.00', '0.00', '0.00', '150000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:32:53', '2020-09-17 19:32:53', null);
INSERT INTO `t_payment_record` VALUES ('8623b570f8d711eaae70093acb27a2bb', 'SFD20091719183402714469', '1', '2', '23', '001', '469', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:18:34', '2020-09-17 19:18:34', null);
INSERT INTO `t_payment_record` VALUES ('87187ede1e7011ebb6f6333997dbddae', 'SFD20110415370165329472', '1', '2', '20', '001', '472', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-11-04 15:37:02', '2020-11-04 15:37:02', null);
INSERT INTO `t_payment_record` VALUES ('8811b7caf8db11eaa222475562e1b01b', 'SFD20091719471525299534', '1', '2', '23', '001', '534', '20000.00', '0.00', '2000.00', '0.00', '0.00', '18000.00', '0.00', '202009', '2020-09-04 00:00:00', '2020-09-17 19:47:15', '2020-09-17 19:47:15', null);
INSERT INTO `t_payment_record` VALUES ('88d71b06f8da11eab202c503e1b98c70', 'SFD20091719400704977569', '1', '2', '19', '001', '569', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:40:07', '2020-09-17 19:40:07', null);
INSERT INTO `t_payment_record` VALUES ('88deebc2f8d711ea93cd8d4fd25ea08f', 'SFD20091719183861083468', '1', '2', '19', '001', '468', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:18:39', '2020-09-17 19:18:39', null);
INSERT INTO `t_payment_record` VALUES ('897174d01e4b11eb9771fd5ad86dc58b', 'SFD20110411121421361433', '2', '1', '100005', '', '433', '30.00', '30.00', '0.00', '0.00', '0.00', '0.00', '0.00', '202011', '2020-11-04 11:12:14', '2020-11-04 11:12:14', '2020-11-04 11:12:14', null);
INSERT INTO `t_payment_record` VALUES ('899c7b6a175e11eb805f69264dad975a', 'SFD20102615403679468643', '1', '2', '20', '001', '643', '0.03', '0.00', '0.01', '0.00', '0.00', '0.02', '0.00', '202010', '2020-10-26 00:00:00', '2020-10-26 15:40:37', '2020-10-26 15:40:37', null);
INSERT INTO `t_payment_record` VALUES ('8a636708f8db11eabf3dcb7975de2085', 'SFD20091719471914355541', '1', '2', '19', '001', '541', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:47:19', '2020-09-17 19:47:19', null);
INSERT INTO `t_payment_record` VALUES ('8bd1ca0ef8d511eabab8d1acc80d6455', 'SFD20091719042456348440', '1', '2', '19', '001', '440', '80000.00', '0.00', '0.00', '0.00', '0.00', '80000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:04:25', '2020-09-17 19:04:25', null);
INSERT INTO `t_payment_record` VALUES ('8dd73c86ff0a11eaad91ef6404846023', 'SFD20092516385825883651', '1', '2', '20', '001', '651', '70000.00', '0.00', '40000.00', '0.00', '0.00', '30000.00', '0.00', '202009', '2020-09-25 00:00:00', '2020-09-25 16:38:58', '2020-09-25 16:38:58', null);
INSERT INTO `t_payment_record` VALUES ('8e24963614d411eb8fc18d578d33058f', 'SFD20102310075152370643', '1', '1', '100003', '', '643', '0.03', '0.03', '0.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-23 10:07:51', '2020-10-23 10:07:52', '2020-10-23 10:07:52', null);
INSERT INTO `t_payment_record` VALUES ('8e4f0a30104511ebac367dac26ac6ba3', 'SFD20101714540911785645', '1', '2', '20', '001', '645', '30000.00', '0.00', '0.00', '0.00', '0.00', '30000.00', '0.00', '202009', '2020-09-21 00:00:00', '2020-10-17 14:54:09', '2020-10-17 14:54:09', null);
INSERT INTO `t_payment_record` VALUES ('8efa0de8182611ebb29811f6b7f538f9', 'SFD20102715322514221643', '1', '2', '5', '001', '643', '171.00', '0.00', '100.00', '0.00', '0.00', '70.00', '1.00', '202010', '2020-10-27 15:32:25', '2020-10-27 15:32:25', '2020-10-27 15:32:25', null);
INSERT INTO `t_payment_record` VALUES ('907b5c28f8da11eab18bfdeee10e5d7a', 'SFD20091719401986971570', '1', '2', '19', '001', '570', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:40:20', '2020-09-17 19:40:20', null);
INSERT INTO `t_payment_record` VALUES ('909d08b0181911eb940311bdf1b1fd44', 'SFD20102713592443082643', '1', '2', '5', '001', '643', '200.00', '0.00', '200.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 13:59:24', '2020-10-27 13:59:24', '2020-10-27 13:59:24', null);
INSERT INTO `t_payment_record` VALUES ('90b2ad6cf8d611eaba72a15044e59c83', 'SFD20091719114224575488', '1', '2', '23', '001', '488', '20000.00', '0.00', '8400.00', '0.00', '0.00', '11600.00', '0.00', '202008', '2020-08-31 00:00:00', '2020-09-17 19:11:42', '2020-09-17 19:11:42', null);
INSERT INTO `t_payment_record` VALUES ('9165c96af8d611ea948af327d70ff74f', 'SFD20091719114341910445', '1', '2', '19', '001', '445', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:11:43', '2020-09-17 19:11:43', null);
INSERT INTO `t_payment_record` VALUES ('9333e704f8db11eabfd92913d25db65d', 'SFD20091719473393112544', '1', '2', '19', '001', '544', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:47:34', '2020-09-17 19:47:34', null);
INSERT INTO `t_payment_record` VALUES ('942b6926f8d011eab2bdff3f1b5851c1', 'SFD20091718285108958508', '1', '2', '23', '001', '508', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 18:28:51', '2020-09-17 18:28:51', null);
INSERT INTO `t_payment_record` VALUES ('97593ce0f8d511eaa0ab8952c5ec32b3', 'SFD20091719044390637441', '1', '2', '19', '001', '441', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:04:44', '2020-09-17 19:04:44', null);
INSERT INTO `t_payment_record` VALUES ('97a154980dcb11eb8562f3732ebca9ec', 'SFD20101411160382971495', '1', '2', '20', '001', '495', '40000.00', '0.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-10-14 11:16:04', '2020-10-14 11:16:04', null);
INSERT INTO `t_payment_record` VALUES ('97a7a1e2f8d911ea89e17309c03578db', 'SFD20091719332240726580', '1', '2', '23', '001', '580', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-17 19:33:22', '2020-09-17 19:33:22', null);
INSERT INTO `t_payment_record` VALUES ('97eed80cf8d711ea88fc6f967ad68a5e', 'SFD20091719190388080477', '1', '2', '19', '001', '477', '210000.00', '0.00', '0.00', '0.00', '0.00', '210000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:19:04', '2020-09-17 19:19:04', null);
INSERT INTO `t_payment_record` VALUES ('98094fd8127811eb8fa7b33f937f2551', 'SFD20102010043209631189', '1', '2', '20', '001', '1189', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202010', '2020-10-20 00:00:00', '2020-10-20 10:04:32', '2020-10-20 10:04:32', null);
INSERT INTO `t_payment_record` VALUES ('9816d364f8d911eabd498bb9c6135572', 'SFD20091719332313645601', '1', '2', '19', '001', '601', '100000.00', '0.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:33:23', '2020-09-17 19:33:23', null);
INSERT INTO `t_payment_record` VALUES ('98d577a0f8d511eab96fa9d1f6ce654c', 'SFD20091719044639820497', '1', '2', '23', '001', '497', '150000.00', '0.00', '0.00', '0.00', '0.00', '150000.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-17 19:04:46', '2020-09-17 19:04:46', null);
INSERT INTO `t_payment_record` VALUES ('9b1a7190f8d611ea83119191cf756432', 'SFD20091719115970259446', '1', '2', '19', '001', '446', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:12:00', '2020-09-17 19:12:00', null);
INSERT INTO `t_payment_record` VALUES ('9b55fdfafbb511ea848755a81415532e', 'SFD20092110532018945643', '1', '1', '100003', '', '643', '0.02', '0.02', '0.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-21 10:53:20', '2020-09-21 10:53:20', '2020-09-21 10:53:20', null);
INSERT INTO `t_payment_record` VALUES ('9ca2bb10f8d311ea9db7b12f1a9b732e', 'SFD20091718503378341538', '1', '2', '23', '001', '538', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 18:50:34', '2020-09-17 18:50:34', null);
INSERT INTO `t_payment_record` VALUES ('9d2a65fc173b11ebab8bafc5f9722a24', 'SFD20102611303721511643', '1', '2', '6', '001', '643', '0.01', '0.00', '0.01', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-15 00:00:00', '2020-10-26 11:30:37', '2020-10-26 11:30:37', null);
INSERT INTO `t_payment_record` VALUES ('9e268a7cf8db11ea9ec6318fafafc781', 'SFD20091719475229868530', '1', '2', '23', '001', '530', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-04 00:00:00', '2020-09-17 19:47:52', '2020-09-17 19:47:52', null);
INSERT INTO `t_payment_record` VALUES ('9eabf86a145111ebba2c276ab49ef319', 'SFD20102218303518211433', '1', '2', '5', '001', '433', '0.02', '0.00', '0.02', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-22 18:30:35', '2020-10-22 18:30:35', '2020-10-22 18:30:35', null);
INSERT INTO `t_payment_record` VALUES ('a01b22dafc9f11ea89d93161a8bd8cd7', 'SFD20092214483042687564', '1', '2', '20', '001', '564', '90000.00', '0.00', '20000.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-09-22 14:48:30', '2020-09-22 14:48:30', null);
INSERT INTO `t_payment_record` VALUES ('a0a95488f8da11eab040270f23a6cfb5', 'SFD20091719404701499565', '1', '2', '19', '001', '565', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:40:47', '2020-09-17 19:40:47', null);
INSERT INTO `t_payment_record` VALUES ('a21e2a56015811eb81e7134202228d4e', 'SFD20092815025534758510', '1', '2', '20', '001', '510', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-28 15:02:55', '2020-09-28 15:02:55', null);
INSERT INTO `t_payment_record` VALUES ('a2aee820f8d911eabf0f593bf728c943', 'SFD20091719334090952596', '1', '2', '19', '001', '596', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:33:41', '2020-09-17 19:33:41', null);
INSERT INTO `t_payment_record` VALUES ('a2e6c6a6f8dd11eab0702b76c1a0e20d', 'SFD20091720021926253591', '1', '2', '23', '001', '591', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-11 00:00:00', '2020-09-17 20:02:19', '2020-09-17 20:02:19', null);
INSERT INTO `t_payment_record` VALUES ('a4f3fe16f8db11eaa01bb1e6306cae2f', 'SFD20091719480371138535', '1', '2', '19', '001', '535', '150000.00', '0.00', '0.00', '0.00', '0.00', '150000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:48:04', '2020-09-17 19:48:04', null);
INSERT INTO `t_payment_record` VALUES ('a50f33eaf8ca11eaa2de3392cb95ce08', 'SFD20091717462244511588', '1', '2', '23', '001', '588', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-10 00:00:00', '2020-09-17 17:46:22', '2020-09-17 17:46:22', null);
INSERT INTO `t_payment_record` VALUES ('a565e364f8d611eaaee5f9d22dfcf027', 'SFD20091719121697493451', '1', '2', '19', '001', '451', '150000.00', '0.00', '0.00', '0.00', '0.00', '150000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:12:17', '2020-09-17 19:12:17', null);
INSERT INTO `t_payment_record` VALUES ('a5b67d1afca511eaaec4e9a0af620dd4', 'SFD20092215313681355574', '1', '2', '20', '001', '574', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-22 15:31:37', '2020-09-22 15:31:37', null);
INSERT INTO `t_payment_record` VALUES ('a7966248183011eb8ad2d13dd68a07dc', 'SFD20102716444139943643', '1', '2', '5', '001', '643', '2000.00', '0.00', '2000.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 16:44:41', '2020-10-27 16:44:41', '2020-10-27 16:44:41', null);
INSERT INTO `t_payment_record` VALUES ('a826a7d8f8da11eaa4b3f5dbe74d30fb', 'SFD20091719405958094566', '1', '2', '19', '001', '566', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:41:00', '2020-09-17 19:41:00', null);
INSERT INTO `t_payment_record` VALUES ('a9ca7b68f8d611eabe6d15095299af91', 'SFD20091719122434456489', '1', '2', '23', '001', '489', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202008', '2020-08-31 00:00:00', '2020-09-17 19:12:24', '2020-09-17 19:12:24', null);
INSERT INTO `t_payment_record` VALUES ('aa102f4ef8d811ea965819a43950cf53', 'SFD20091719264379451605', '1', '2', '23', '001', '605', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-12 00:00:00', '2020-09-17 19:26:44', '2020-09-17 19:26:44', null);
INSERT INTO `t_payment_record` VALUES ('aa36ebee14cf11eb9c08936961d4e52d', 'SFD20102309325113533643', '2', '2', '5', '001', '643', '0.31', '0.00', '0.10', '0.01', '0.00', '0.20', '0.00', '202010', '2020-10-23 09:32:51', '2020-10-23 09:32:51', '2020-10-23 09:32:51', null);
INSERT INTO `t_payment_record` VALUES ('ac23f18af8ce11eabed08f1e9adfa60c', 'SFD20091718151231213518', '1', '2', '23', '001', '518', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:15:12', '2020-09-17 18:15:12', null);
INSERT INTO `t_payment_record` VALUES ('ac5d00e0f8d511ea9c5df977bc3e3440', 'SFD20091719051916342455', '1', '2', '19', '001', '455', '70000.00', '0.00', '70000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:05:19', '2020-09-17 19:05:19', null);
INSERT INTO `t_payment_record` VALUES ('ad824e9af8d911ea95dedde9886d4c07', 'SFD20091719335906856577', '1', '2', '23', '001', '577', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-17 19:33:59', '2020-09-17 19:33:59', null);
INSERT INTO `t_payment_record` VALUES ('b1497c72f8d611ea94bd7b364e32dc68', 'SFD20091719123692062450', '1', '2', '19', '001', '450', '150000.00', '0.00', '150000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:12:37', '2020-09-17 19:12:37', null);
INSERT INTO `t_payment_record` VALUES ('b1f85b260f7311eba310d95c71d6d44e', 'SFD20101613515463437578', '1', '2', '20', '001', '578', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-10-16 13:51:55', '2020-10-16 13:51:55', null);
INSERT INTO `t_payment_record` VALUES ('b2507f36f8da11eaa9c8b91e0d625a4d', 'SFD20091719411663184563', '1', '2', '19', '001', '563', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:41:17', '2020-09-17 19:41:17', null);
INSERT INTO `t_payment_record` VALUES ('b6e963441b2d11eb8294a39247d44911', 'SFD20103112011210579643', '1', '1', '100003', '', '643', '0.01', '0.01', '0.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-31 12:01:12', '2020-10-31 12:01:12', '2020-10-31 12:01:12', null);
INSERT INTO `t_payment_record` VALUES ('b6f32278f8d511ea9a94db13e8a0fdae', 'SFD20091719053692411456', '1', '2', '19', '001', '456', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:05:37', '2020-09-17 19:05:37', null);
INSERT INTO `t_payment_record` VALUES ('b7ad4366f8d911ea9773f517b0ef50ac', 'SFD20091719341613134597', '1', '2', '19', '001', '597', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:34:16', '2020-09-17 19:34:16', null);
INSERT INTO `t_payment_record` VALUES ('ba0afe8ef8d711eaabe555ca9d2d6c90', 'SFD20091719200110760475', '1', '2', '23', '001', '475', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:20:01', '2020-09-17 19:20:01', null);
INSERT INTO `t_payment_record` VALUES ('bbe526e0f8d611ea86b82547953d24b7', 'SFD20091719125471854449', '1', '2', '19', '001', '449', '180000.00', '0.00', '0.00', '0.00', '0.00', '180000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:12:55', '2020-09-17 19:12:55', null);
INSERT INTO `t_payment_record` VALUES ('bce3d28afc9611ea91370bd206a40e71', 'SFD20092213445324716540', '1', '2', '20', '001', '540', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-22 13:44:53', '2020-09-22 13:44:53', null);
INSERT INTO `t_payment_record` VALUES ('bf82146c0f7311eb90b219f37f60cbd7', 'SFD20101613521734781485', '1', '2', '20', '001', '485', '30000.00', '0.00', '0.00', '0.00', '0.00', '30000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-10-16 13:52:17', '2020-10-16 13:52:17', null);
INSERT INTO `t_payment_record` VALUES ('c233b3d6021d11ebbf4e4f8a18ad1f6a', 'SFD20092914340003199537', '1', '2', '20', '001', '537', '120000.00', '0.00', '0.00', '0.00', '0.00', '120000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-29 14:34:00', '2020-09-29 14:34:00', null);
INSERT INTO `t_payment_record` VALUES ('c3b02952021c11eba0f3a3bd574a39b1', 'SFD20092914265302811476', '1', '2', '20', '001', '476', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-29 14:26:53', '2020-09-29 14:26:53', null);
INSERT INTO `t_payment_record` VALUES ('c80aa3c4f8da11eaa750c317adc627d3', 'SFD20091719415308316555', '1', '2', '23', '001', '555', '80000.00', '0.00', '20000.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-07 00:00:00', '2020-09-17 19:41:53', '2020-09-17 19:41:53', null);
INSERT INTO `t_payment_record` VALUES ('c8d72cbe0f7311eb8bd47f0aee2614f0', 'SFD20101613523300452579', '1', '2', '20', '001', '579', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-10-16 13:52:33', '2020-10-16 13:52:33', null);
INSERT INTO `t_payment_record` VALUES ('c9c7eee6f8d611eaa6a5b14cceeffdd4', 'SFD20091719131801440448', '1', '2', '19', '001', '448', '90000.00', '0.00', '0.00', '0.00', '0.00', '90000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:13:18', '2020-09-17 19:13:18', null);
INSERT INTO `t_payment_record` VALUES ('cc959a54f8d811ea8091b1ca9d2e96f6', 'SFD20091719274171198619', '1', '2', '19', '001', '619', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:27:42', '2020-09-17 19:27:42', null);
INSERT INTO `t_payment_record` VALUES ('ccd8e918021e11ebb7711980f4b9f196', 'SFD20092914412738444556', '1', '2', '20', '001', '556', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-07 00:00:00', '2020-09-29 14:41:27', '2020-09-29 14:41:27', null);
INSERT INTO `t_payment_record` VALUES ('cd774744f8db11ea837e2f7746f4bd91', 'SFD20091719491168088533', '1', '2', '19', '001', '533', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:49:12', '2020-09-17 19:49:12', null);
INSERT INTO `t_payment_record` VALUES ('cdbcc6b4f8d311ea9bb48f60dcda2c0e', 'SFD20091718515616248526', '1', '2', '23', '001', '526', '90000.00', '0.00', '0.00', '0.00', '0.00', '90000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:51:56', '2020-09-17 18:51:56', null);
INSERT INTO `t_payment_record` VALUES ('ce00ec7e077711ebaf34c900d93e2762', 'SFD20100610011035141442', '1', '2', '20', '001', '442', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-10-06 10:01:10', '2020-10-06 10:01:10', null);
INSERT INTO `t_payment_record` VALUES ('d0c55bb414d011ebba58a9698e5ae40e', 'SFD20102309410531935643', '1', '2', '5', '001', '643', '0.05', '0.00', '0.05', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-23 09:41:05', '2020-10-23 09:41:05', '2020-10-23 09:41:05', null);
INSERT INTO `t_payment_record` VALUES ('d11009341e7111eb9f668bca71b5fa70', 'SFD20110415461524648582', '1', '2', '20', '001', '582', '50000.00', '0.00', '50000.00', '0.00', '0.00', '0.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-11-04 15:46:15', '2020-11-04 15:46:15', null);
INSERT INTO `t_payment_record` VALUES ('d23b7dcc021d11eba65b37b5d20dbcc4', 'SFD20092914342692677537', '1', '2', '20', '001', '537', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-29 14:34:27', '2020-09-29 14:34:27', null);
INSERT INTO `t_payment_record` VALUES ('d45c0f7af8ce11ea8528af438890084b', 'SFD20091718161978787520', '1', '2', '23', '001', '520', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:16:20', '2020-09-17 18:16:20', null);
INSERT INTO `t_payment_record` VALUES ('d86a6b7e183211ebb694d551dfc2ce52', 'SFD20102717002231274643', '1', '2', '5', '001', '643', '1.00', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 17:00:22', '2020-10-27 17:00:22', '2020-10-27 17:00:22', null);
INSERT INTO `t_payment_record` VALUES ('d952c574f95911eab1df8547da7b983d', 'SFD20091810512816210457', '1', '2', '23', '001', '457', '80000.00', '0.00', '0.00', '0.00', '0.00', '80000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-18 10:51:28', '2020-09-18 10:51:28', null);
INSERT INTO `t_payment_record` VALUES ('da00926c021e11eba9c63feecfd3e3b2', 'SFD20092914414945961556', '1', '2', '20', '001', '556', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-09-29 14:41:49', '2020-09-29 14:41:49', null);
INSERT INTO `t_payment_record` VALUES ('da41531cf8da11ea85cc73ba527be081', 'SFD20091719422364024542', '1', '2', '23', '001', '542', '50000.00', '0.00', '0.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-17 19:42:24', '2020-09-17 19:42:24', null);
INSERT INTO `t_payment_record` VALUES ('da5d816af8dd11ea84f1977629bbd9e2', 'SFD20091720035231594453', '1', '2', '23', '001', '453', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 20:03:52', '2020-09-17 20:03:52', null);
INSERT INTO `t_payment_record` VALUES ('db296c7a0e8c11eb8d515b21ba1cabe0', 'SFD20101510192999754503', '1', '2', '20', '001', '503', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-10-15 10:19:30', '2020-10-15 10:19:30', null);
INSERT INTO `t_payment_record` VALUES ('db47607cf8ac11eaaf79e94586d3364d', 'SFD20091714130850839485', '1', '2', '5', '001', '485', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 14:13:08', '2020-09-17 14:13:09', '2020-09-17 14:13:09', null);
INSERT INTO `t_payment_record` VALUES ('de1c6f0ef8d911ea953983861c53a22d', 'SFD20091719352061230576', '1', '2', '23', '001', '576', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-08 00:00:00', '2020-09-17 19:35:21', '2020-09-17 19:35:21', null);
INSERT INTO `t_payment_record` VALUES ('df9cca76f8d511ea93496321a714b595', 'SFD20091719064514575499', '1', '2', '23', '001', '499', '30000.00', '0.00', '0.00', '0.00', '0.00', '30000.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-17 19:06:45', '2020-09-17 19:06:45', null);
INSERT INTO `t_payment_record` VALUES ('e14c6050f8e111ea954ba307d23730a8', 'SFD20091720324193468433', '1', '2', '5', '001', '433', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 20:32:41', '2020-09-17 20:32:42', '2020-09-17 20:32:42', null);
INSERT INTO `t_payment_record` VALUES ('e24d64e8f8f211ea95d571d88ca3cdd0', 'SFD20091722342506389557', '1', '2', '23', '001', '557', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-17 22:34:25', '2020-09-17 22:34:25', null);
INSERT INTO `t_payment_record` VALUES ('e3f8509ef8d611ea8ed895c85a3b95b7', 'SFD20091719140195211454', '1', '2', '19', '001', '454', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:14:02', '2020-09-17 19:14:02', null);
INSERT INTO `t_payment_record` VALUES ('e4aa0aa2f8d911ea89cbbd6dd3c314e9', 'SFD20091719353160747598', '1', '2', '19', '001', '598', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:35:32', '2020-09-17 19:35:32', null);
INSERT INTO `t_payment_record` VALUES ('e4af67a2f8db11eaad9eff2ed6ea192a', 'SFD20091719495063521531', '1', '2', '23', '001', '531', '60000.00', '0.00', '50000.00', '0.00', '0.00', '10000.00', '0.00', '202009', '2020-09-04 00:00:00', '2020-09-17 19:49:51', '2020-09-17 19:49:51', null);
INSERT INTO `t_payment_record` VALUES ('e4b1634cf8ac11eaa93f1dd0559eb78e', 'SFD20091714132430237481', '1', '2', '5', '001', '481', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 14:13:24', '2020-09-17 14:13:24', '2020-09-17 14:13:24', null);
INSERT INTO `t_payment_record` VALUES ('e53f5042f8db11eaa8eb3d2d4cdd62d0', 'SFD20091719495157980529', '1', '2', '19', '001', '529', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:49:52', '2020-09-17 19:49:52', null);
INSERT INTO `t_payment_record` VALUES ('e56d16fefd7611eab8e519a21aba249a', 'SFD20092316292852360509', '1', '2', '20', '001', '509', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-23 16:29:29', '2020-09-23 16:29:29', null);
INSERT INTO `t_payment_record` VALUES ('e5dc3830f8d611eaa19805ef65bc2f3c', 'SFD20091719140512464479', '1', '2', '23', '001', '479', '70000.00', '0.00', '0.00', '0.00', '0.00', '70000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-09-17 19:14:05', '2020-09-17 19:14:05', null);
INSERT INTO `t_payment_record` VALUES ('e704a57cf8da11ea8ba2a1323132faf2', 'SFD20091719424505344558', '1', '2', '19', '001', '558', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:42:45', '2020-09-17 19:42:45', null);
INSERT INTO `t_payment_record` VALUES ('e75029c6fbcc11eabf543d67cae9539d', 'SFD20092113400608268642', '1', '2', '20', '001', '642', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-20 00:00:00', '2020-09-21 13:40:06', '2020-09-21 13:40:06', null);
INSERT INTO `t_payment_record` VALUES ('e7968778f8d811ea8518871163bdda92', 'SFD20091719282701685618', '1', '2', '19', '001', '618', '40000.00', '0.00', '0.00', '0.00', '0.00', '40000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:28:27', '2020-09-17 19:28:27', null);
INSERT INTO `t_payment_record` VALUES ('e9cf1b9c11d611eba3a85f487ee7fff7', 'SFD20101914471081863486', '1', '2', '20', '001', '486', '100000.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '0.00', '202008', '2020-08-31 00:00:00', '2020-10-19 14:47:11', '2020-10-19 14:47:11', null);
INSERT INTO `t_payment_record` VALUES ('ec132c9a182511eba2587fc5a081c002', 'SFD20102715275183759643', '1', '2', '5', '001', '643', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '202010', '2020-10-27 15:27:51', '2020-10-27 15:27:52', '2020-10-27 15:27:52', null);
INSERT INTO `t_payment_record` VALUES ('ecfd6956fe4211ea8ae4379d9dba5e50', 'SFD20092416495854680648', '1', '2', '20', '001', '648', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-24 00:00:00', '2020-09-24 16:49:59', '2020-09-24 16:49:59', null);
INSERT INTO `t_payment_record` VALUES ('ed160e92f8da11eab6861f9ee792108f', 'SFD20091719425523478543', '1', '2', '23', '001', '543', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-17 19:42:55', '2020-09-17 19:42:55', null);
INSERT INTO `t_payment_record` VALUES ('ed375dbaf8ce11eaabc4917d629c9631', 'SFD20091718170149145516', '1', '2', '23', '001', '516', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-03 00:00:00', '2020-09-17 18:17:01', '2020-09-17 18:17:01', null);
INSERT INTO `t_payment_record` VALUES ('ee409ec4f8d811ea98caa9bb759d7d8a', 'SFD20091719283819756617', '1', '2', '19', '001', '617', '40000.00', '0.00', '40000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:28:38', '2020-09-17 19:28:38', null);
INSERT INTO `t_payment_record` VALUES ('ee813370f8d411eab4c60105ac5778d8', 'SFD20091719000063379511', '1', '2', '23', '001', '511', '50000.00', '0.00', '30000.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-02 00:00:00', '2020-09-17 19:00:01', '2020-09-17 19:00:01', null);
INSERT INTO `t_payment_record` VALUES ('ef152376f8d611eab6807b5260e5a9b4', 'SFD20091719142059618453', '1', '2', '19', '001', '453', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:14:21', '2020-09-17 19:14:21', null);
INSERT INTO `t_payment_record` VALUES ('effc3ecaf8ac11ea8c49cb6821512c78', 'SFD20091714134324896482', '1', '2', '5', '001', '482', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 14:13:43', '2020-09-17 14:13:43', '2020-09-17 14:13:43', null);
INSERT INTO `t_payment_record` VALUES ('f39ceb86f8db11eaba6a97bf826f6630', 'SFD20091719501568030527', '1', '2', '19', '001', '527', '60000.00', '0.00', '10000.00', '0.00', '0.00', '50000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:50:16', '2020-09-17 19:50:16', null);
INSERT INTO `t_payment_record` VALUES ('f5ac8ac014cf11eb9903bf84b40ed56c', 'SFD20102309345773546643', '1', '2', '5', '001', '643', '60.01', '0.00', '10.00', '0.00', '0.01', '20.00', '30.00', '202010', '2020-10-23 09:34:57', '2020-10-23 09:34:58', '2020-10-23 09:34:58', null);
INSERT INTO `t_payment_record` VALUES ('f6099650fe4211ea8da981eeadc5b0e1', 'SFD20092416501372582647', '1', '2', '20', '001', '647', '30000.00', '0.00', '30000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-24 00:00:00', '2020-09-24 16:50:14', '2020-09-24 16:50:14', null);
INSERT INTO `t_payment_record` VALUES ('f646ea0c1e7011ebb8fa3755bcc20a80', 'SFD20110415400818529471', '1', '2', '20', '001', '471', '400000.00', '0.00', '0.00', '0.00', '0.00', '400000.00', '0.00', '202008', '2020-08-30 00:00:00', '2020-11-04 15:40:08', '2020-11-04 15:40:08', null);
INSERT INTO `t_payment_record` VALUES ('f67cf1aaf8d811eaa68cc7a709e67990', 'SFD20091719285201458615', '1', '2', '19', '001', '615', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:28:52', '2020-09-17 19:28:52', null);
INSERT INTO `t_payment_record` VALUES ('f6a69136f8d311ea9b431b2a0a19e977', 'SFD20091718530480341525', '1', '2', '23', '001', '525', '20000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '202009', '2020-09-09 00:00:00', '2020-09-17 18:53:05', '2020-09-17 18:53:05', null);
INSERT INTO `t_payment_record` VALUES ('f8484a18f8d611ea8130615fe4487c60', 'SFD20091719143603183452', '1', '2', '19', '001', '452', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:14:36', '2020-09-17 19:14:36', null);
INSERT INTO `t_payment_record` VALUES ('f9cbc6aef8d511eaba110b71224dba4f', 'SFD20091719072907387494', '1', '2', '23', '001', '494', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-01 00:00:00', '2020-09-17 19:07:29', '2020-09-17 19:07:29', null);
INSERT INTO `t_payment_record` VALUES ('fcfda12cf8ac11ea915e0b76b536e30f', 'SFD20091714140506787483', '1', '2', '5', '001', '483', '20000.00', '0.00', '10000.00', '0.00', '0.00', '10000.00', '0.00', '202009', '2020-09-17 14:14:05', '2020-09-17 14:14:05', '2020-09-17 14:14:05', null);
INSERT INTO `t_payment_record` VALUES ('fe2f6586f8d811ea93acd50d4c679b08', 'SFD20091719290492753616', '1', '2', '19', '001', '616', '60000.00', '0.00', '0.00', '0.00', '0.00', '60000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:29:05', '2020-09-17 19:29:05', null);
INSERT INTO `t_payment_record` VALUES ('fe6b4488fbd111eab2b0cf26183e4be8', 'SFD20092114163233152471', '1', '2', '20', '001', '471', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-05 00:00:00', '2020-09-21 14:16:32', '2020-09-21 14:16:32', null);
INSERT INTO `t_payment_record` VALUES ('fe88c1d4f8d911ea8afe077687b2e44e', 'SFD20091719361501062587', '1', '2', '19', '001', '587', '20000.00', '0.00', '0.00', '0.00', '0.00', '20000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:36:15', '2020-09-17 19:36:15', null);
INSERT INTO `t_payment_record` VALUES ('fea7341ef8db11eab4139ddbe2af155c', 'SFD20091719503420175528', '1', '2', '19', '001', '528', '110000.00', '0.00', '80000.00', '0.00', '0.00', '30000.00', '0.00', '202009', '2020-09-17 00:00:00', '2020-09-17 19:50:34', '2020-09-17 19:50:34', null);

-- ----------------------------
-- Table structure for t_payment_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_record_detail`;
CREATE TABLE `t_payment_record_detail` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `payment_record_id` char(32) NOT NULL DEFAULT '' COMMENT '外键ID',
  `item_name` varchar(200) NOT NULL COMMENT '项目名称',
  `bill_fid` int(11) DEFAULT NULL COMMENT '源单FID',
  `bill_no` varchar(40) DEFAULT NULL COMMENT '源单应收单单号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `detail_data` text COMMENT '收费单明细',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账单子表';

-- ----------------------------
-- Records of t_payment_record_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_queue_tmp
-- ----------------------------
DROP TABLE IF EXISTS `t_queue_tmp`;
CREATE TABLE `t_queue_tmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(255) NOT NULL,
  `job_handler` varchar(255) NOT NULL,
  `job_data` text NOT NULL,
  `is_process` int(1) NOT NULL DEFAULT '0',
  `err_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_queue_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for t_repair_application
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_application`;
CREATE TABLE `t_repair_application` (
  `id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'ID',
  `order_no` varchar(30) NOT NULL DEFAULT '' COMMENT '报修单号',
  `repair_unit` int(11) NOT NULL DEFAULT '0' COMMENT '报修单位',
  `repair_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '报修类型',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '问题描述',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系电话',
  `scheduled_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '预约维修时间',
  `processing_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '受理时间',
  `customer_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '处理进度:  1待受理 2维修中 3完成 9取消',
  `staff` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '维修人员',
  `staff_phone` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '维修人员电话',
  `cancel_operator_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '取消人类型：1-user  2-member',
  `cancel_operator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消者ID type1时为user用户操作  2时为member用户操作',
  `cancel_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '取消原因备注',
  `complete_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IX_ORDER_NO` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='故障报修表';

-- ----------------------------
-- Records of t_repair_application
-- ----------------------------
INSERT INTO `t_repair_application` VALUES ('3e8f92700abf11eb9ea2799af28a30d9', '0000000005', '2371', '1', '2222', '13531196203', '1604937600', '0', '6d636834f26311eaa53f33297a78e3b2', '1', '', '', '0', '0', '', '0', '2020-10-10 14:10:07', '2020-10-10 14:10:07', null);
INSERT INTO `t_repair_application` VALUES ('84d9758609e111eb9f08b1242cb95a41', '0000000002', '2371', '1', '没有电', '13531196203', '1602203400', '1602222354', '6d636834f26311eaa53f33297a78e3b2', '3', '测试2', '13600000002', '0', '0', '', '1602222419', '2020-10-09 11:42:57', '2020-10-09 13:47:00', null);
INSERT INTO `t_repair_application` VALUES ('8a59df1209f711ebafeeb5553493c925', '0000000003', '2371', '4', '不制冷', '13531196203', '1602288780', '1602224467', '6d636834f26311eaa53f33297a78e3b2', '2', '测试3', '13500000000', '0', '0', '', '0', '2020-10-09 14:20:35', '2020-10-09 14:21:07', null);
INSERT INTO `t_repair_application` VALUES ('a3f8bd180abe11eb9759b993da900824', '0000000004', '2371', '5', '111111', '13531196203', '1602259320', '0', '6d636834f26311eaa53f33297a78e3b2', '1', '', '', '0', '0', '', '0', '2020-10-10 14:05:48', '2020-10-10 14:05:48', null);
INSERT INTO `t_repair_application` VALUES ('eb980b0009de11ebbba969f7cf52403e', '0000000001', '2371', '3', '门闸开不起来', '13531196203', '1602226800', '1602215303', '6d636834f26311eaa53f33297a78e3b2', '3', '测试', '13500000000', '0', '0', '', '1602222498', '2020-10-09 11:24:20', '2020-10-09 13:48:19', null);

-- ----------------------------
-- Table structure for t_staff
-- ----------------------------
DROP TABLE IF EXISTS `t_staff`;
CREATE TABLE `t_staff` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `real_name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `no` varchar(30) NOT NULL DEFAULT '' COMMENT '员工编号',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `role` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '角色',
  `mobile` varchar(30) DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1 入职，2 离职',
  `staff_group_id` char(32) NOT NULL DEFAULT '' COMMENT '分组ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IX_REAL_NAME` (`real_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_staff
-- ----------------------------
INSERT INTO `t_staff` VALUES ('f5818e30223311ebab8104922610d54b', '龙王V', '001', null, '0', '13531196203', '1', '', '2020-11-09 10:33:32', '2020-11-09 10:33:32', null);

-- ----------------------------
-- Table structure for t_staff_group
-- ----------------------------
DROP TABLE IF EXISTS `t_staff_group`;
CREATE TABLE `t_staff_group` (
  `id` char(32) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_staff_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `t_sysconfig`;
CREATE TABLE `t_sysconfig` (
  `id` char(32) NOT NULL,
  `field` varchar(60) NOT NULL COMMENT '字段',
  `value` varchar(255) NOT NULL COMMENT '值',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_sysconfig
-- ----------------------------
INSERT INTO `t_sysconfig` VALUES ('63467d72ed9611ea907c05818f6b124c', 'bill_generate_period', 'day', '', '2020-09-03 11:34:35', '2020-09-03 11:36:20', null);
INSERT INTO `t_sysconfig` VALUES ('66ec3d5ae5d911eaaf27dbbddb79c104', 'machine_pay_switch', '1', '', '2020-08-24 15:14:09', '2020-09-28 15:52:30', null);
INSERT INTO `t_sysconfig` VALUES ('74884f94e5d911eaa6deb193155624e7', 'pay_channels', 'CCB', '', '2020-08-24 15:14:31', '2020-08-27 15:01:46', null);
INSERT INTO `t_sysconfig` VALUES ('7d85245ae5d911ea8e8b0d03209fd4c0', 'balance_alarm_quota', '-100000', '', '2020-08-24 15:14:46', '2020-08-25 14:51:55', null);
INSERT INTO `t_sysconfig` VALUES ('9030dd58140811ebadf7d78354ab2431', 'dinning_is_print', '0', '', '2020-10-22 09:47:38', '2020-11-04 16:31:50', null);
INSERT INTO `t_sysconfig` VALUES ('a7c71388e83e11eaa707f92dfac262b6', 'card_balance_gift', '1', '', '2020-08-27 16:23:59', '2020-08-27 16:25:18', null);

-- ----------------------------
-- Table structure for t_wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_fans`;
CREATE TABLE `t_wechat_fans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '昵称',
  `headimgurl` varchar(500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_sys_weixin_fans_openid` (`openid`) USING BTREE,
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=sjis AVG_ROW_LENGTH=1638 ROW_FORMAT=COMPACT COMMENT='微信公众号获取粉丝列表';

-- ----------------------------
-- Records of t_wechat_fans
-- ----------------------------
