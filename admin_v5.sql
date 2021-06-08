/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : admin_v5

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-06-08 14:33:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company_user
-- ----------------------------
DROP TABLE IF EXISTS `company_user`;
CREATE TABLE `company_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT '' COMMENT '员工姓名',
  `svn_username` varchar(50) DEFAULT '' COMMENT '员工账号',
  `svn_password` varchar(32) DEFAULT '' COMMENT '员工密码',
  `svn_authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `user_type` varchar(20) DEFAULT '' COMMENT '员工身份',
  `entry_date` varchar(30) DEFAULT '' COMMENT '入职日期',
  `leave_date` varchar(30) DEFAULT '' COMMENT '离职日期',
  `become_date` varchar(30) DEFAULT '' COMMENT '转正日期',
  `contact_qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `contact_mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `contact_phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `mobile_macs` text COMMENT '打卡手机',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1正常,2离职)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_company_user_nickname` (`nickname`) USING BTREE,
  KEY `idx_company_user_svn_username` (`svn_username`) USING BTREE,
  KEY `idx_company_user_deleted` (`is_deleted`) USING BTREE,
  KEY `idx_company_user_status` (`status`) USING BTREE,
  KEY `idx_company_user_type` (`user_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业-员工信息';

-- ----------------------------
-- Records of company_user
-- ----------------------------

-- ----------------------------
-- Table structure for company_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `company_user_auth`;
CREATE TABLE `company_user_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '权限名称',
  `path` varchar(500) DEFAULT '' COMMENT '权限路径',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1正常)',
  `desc` varchar(500) DEFAULT '' COMMENT '权限描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_company_user_auth_status` (`status`) USING BTREE,
  KEY `idx_company_user_auth_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业-仓库权限';

-- ----------------------------
-- Records of company_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for company_user_clock
-- ----------------------------
DROP TABLE IF EXISTS `company_user_clock`;
CREATE TABLE `company_user_clock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `ip` varchar(15) NOT NULL COMMENT '权限名称',
  `mac` char(17) DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `date` date DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_company_user_clock_date` (`date`) USING BTREE,
  KEY `idx_company_user_clock_uid` (`uid`) USING BTREE,
  KEY `idx_company_user_clock_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业-打卡记录';

-- ----------------------------
-- Records of company_user_clock
-- ----------------------------

-- ----------------------------
-- Table structure for store_express_company
-- ----------------------------
DROP TABLE IF EXISTS `store_express_company`;
CREATE TABLE `store_express_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `express_title` varchar(50) DEFAULT '' COMMENT '快递公司名称',
  `express_code` varchar(50) DEFAULT '' COMMENT '快递公司代码',
  `express_desc` varchar(512) DEFAULT '' COMMENT '快递公司描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.有效)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='商城-快递-公司';

-- ----------------------------
-- Records of store_express_company
-- ----------------------------
INSERT INTO `store_express_company` VALUES ('5', 'AAE全球专递', 'aae', null, '0', '0', '0', '2017-09-12 11:53:40');
INSERT INTO `store_express_company` VALUES ('6', '安捷快递', 'anjie', '', '0', '0', '0', '2017-09-13 15:27:26');
INSERT INTO `store_express_company` VALUES ('7', '安信达快递', 'anxindakuaixi', null, '0', '0', '0', '2017-09-13 16:05:19');
INSERT INTO `store_express_company` VALUES ('8', '彪记快递', 'biaojikuaidi', null, '0', '0', '0', '2017-09-13 16:05:26');
INSERT INTO `store_express_company` VALUES ('9', 'BHT', 'bht', '', '0', '0', '0', '2017-09-13 16:05:37');
INSERT INTO `store_express_company` VALUES ('10', '百福东方国际物流', 'baifudongfang', null, '0', '0', '0', '2017-09-13 16:05:41');
INSERT INTO `store_express_company` VALUES ('11', '中国东方（COE）', 'coe', null, '0', '0', '0', '2017-09-13 16:05:48');
INSERT INTO `store_express_company` VALUES ('12', '长宇物流', 'changyuwuliu', null, '0', '0', '0', '2017-09-13 16:05:58');
INSERT INTO `store_express_company` VALUES ('13', '大田物流', 'datianwuliu', null, '0', '0', '0', '2017-09-13 16:06:06');
INSERT INTO `store_express_company` VALUES ('14', '德邦物流', 'debangwuliu', '', '0', '1', '0', '2017-09-13 16:06:14');
INSERT INTO `store_express_company` VALUES ('15', 'DHL', 'dhl', null, '0', '0', '0', '2017-09-13 16:06:24');
INSERT INTO `store_express_company` VALUES ('16', 'DPEX', 'dpex', null, '0', '0', '0', '2017-09-13 16:06:29');
INSERT INTO `store_express_company` VALUES ('17', 'd速快递', 'dsukuaidi', null, '0', '0', '0', '2017-09-13 16:06:34');
INSERT INTO `store_express_company` VALUES ('18', '递四方', 'disifang', null, '0', '0', '0', '2017-09-13 16:06:40');
INSERT INTO `store_express_company` VALUES ('19', 'EMS快递', 'ems', '', '1', '0', '0', '2017-09-13 16:06:47');
INSERT INTO `store_express_company` VALUES ('20', 'FEDEX（国外）', 'fedex', null, '0', '0', '0', '2017-09-13 16:06:56');
INSERT INTO `store_express_company` VALUES ('21', '飞康达物流', 'feikangda', null, '0', '0', '0', '2017-09-13 16:07:03');
INSERT INTO `store_express_company` VALUES ('22', '凤凰快递', 'fenghuangkuaidi', null, '0', '0', '0', '2017-09-13 16:07:10');
INSERT INTO `store_express_company` VALUES ('23', '飞快达', 'feikuaida', null, '0', '0', '0', '2017-09-13 16:07:16');
INSERT INTO `store_express_company` VALUES ('24', '国通快递', 'guotongkuaidi', null, '0', '0', '0', '2017-09-13 16:07:27');
INSERT INTO `store_express_company` VALUES ('25', '港中能达物流', 'ganzhongnengda', null, '0', '0', '0', '2017-09-13 16:07:33');
INSERT INTO `store_express_company` VALUES ('26', '广东邮政物流', 'guangdongyouzhengwuliu', null, '0', '0', '0', '2017-09-13 16:08:22');
INSERT INTO `store_express_company` VALUES ('27', '共速达', 'gongsuda', null, '0', '0', '0', '2017-09-13 16:08:48');
INSERT INTO `store_express_company` VALUES ('28', '汇通快运', 'huitongkuaidi', null, '0', '0', '0', '2017-09-13 16:08:56');
INSERT INTO `store_express_company` VALUES ('29', '恒路物流', 'hengluwuliu', null, '0', '0', '0', '2017-09-13 16:09:02');
INSERT INTO `store_express_company` VALUES ('30', '华夏龙物流', 'huaxialongwuliu', null, '0', '0', '0', '2017-09-13 16:09:12');
INSERT INTO `store_express_company` VALUES ('31', '海红', 'haihongwangsong', null, '0', '0', '0', '2017-09-13 16:09:20');
INSERT INTO `store_express_company` VALUES ('32', '海外环球', 'haiwaihuanqiu', null, '0', '0', '0', '2017-09-13 16:09:27');
INSERT INTO `store_express_company` VALUES ('33', '佳怡物流', 'jiayiwuliu', null, '0', '0', '0', '2017-09-13 16:09:35');
INSERT INTO `store_express_company` VALUES ('34', '京广速递', 'jinguangsudikuaijian', null, '0', '0', '0', '2017-09-13 16:09:42');
INSERT INTO `store_express_company` VALUES ('35', '急先达', 'jixianda', null, '0', '0', '0', '2017-09-13 16:09:49');
INSERT INTO `store_express_company` VALUES ('36', '佳吉物流', 'jjwl', null, '0', '0', '0', '2017-09-13 16:10:01');
INSERT INTO `store_express_company` VALUES ('37', '加运美物流', 'jymwl', null, '0', '0', '0', '2017-09-13 16:10:13');
INSERT INTO `store_express_company` VALUES ('38', '金大物流', 'jindawuliu', null, '0', '0', '0', '2017-09-13 16:10:22');
INSERT INTO `store_express_company` VALUES ('39', '嘉里大通', 'jialidatong', null, '0', '0', '0', '2017-09-13 16:10:33');
INSERT INTO `store_express_company` VALUES ('40', '晋越快递', 'jykd', null, '0', '0', '0', '2017-09-13 16:10:40');
INSERT INTO `store_express_company` VALUES ('41', '快捷速递', 'kuaijiesudi', null, '0', '0', '0', '2017-09-13 16:10:49');
INSERT INTO `store_express_company` VALUES ('42', '联邦快递（国内）', 'lianb', null, '0', '0', '0', '2017-09-13 16:10:58');
INSERT INTO `store_express_company` VALUES ('43', '联昊通物流', 'lianhaowuliu', null, '0', '0', '0', '2017-09-13 16:11:07');
INSERT INTO `store_express_company` VALUES ('44', '龙邦物流', 'longbanwuliu', null, '0', '0', '0', '2017-09-13 16:11:15');
INSERT INTO `store_express_company` VALUES ('45', '立即送', 'lijisong', null, '0', '0', '0', '2017-09-13 16:11:25');
INSERT INTO `store_express_company` VALUES ('46', '乐捷递', 'lejiedi', null, '0', '0', '0', '2017-09-13 16:11:36');
INSERT INTO `store_express_company` VALUES ('47', '民航快递', 'minghangkuaidi', null, '0', '0', '0', '2017-09-13 16:11:45');
INSERT INTO `store_express_company` VALUES ('48', '美国快递', 'meiguokuaidi', null, '0', '0', '0', '2017-09-13 16:11:53');
INSERT INTO `store_express_company` VALUES ('49', '门对门', 'menduimen', null, '0', '0', '0', '2017-09-13 16:12:01');
INSERT INTO `store_express_company` VALUES ('50', 'OCS', 'ocs', null, '0', '0', '0', '2017-09-13 16:12:10');
INSERT INTO `store_express_company` VALUES ('51', '配思货运', 'peisihuoyunkuaidi', null, '0', '0', '0', '2017-09-13 16:12:18');
INSERT INTO `store_express_company` VALUES ('52', '全晨快递', 'quanchenkuaidi', null, '0', '0', '0', '2017-09-13 16:12:26');
INSERT INTO `store_express_company` VALUES ('53', '全峰快递', 'quanfengkuaidi', null, '0', '0', '0', '2017-09-13 16:12:34');
INSERT INTO `store_express_company` VALUES ('54', '全际通物流', 'quanjitong', null, '0', '0', '0', '2017-09-13 16:12:41');
INSERT INTO `store_express_company` VALUES ('55', '全日通快递', 'quanritongkuaidi', null, '0', '0', '0', '2017-09-13 16:12:49');
INSERT INTO `store_express_company` VALUES ('56', '全一快递', 'quanyikuaidi', null, '0', '0', '0', '2017-09-13 16:12:56');
INSERT INTO `store_express_company` VALUES ('57', '如风达', 'rufengda', null, '0', '0', '0', '2017-09-13 16:13:03');
INSERT INTO `store_express_company` VALUES ('58', '三态速递', 'santaisudi', null, '0', '0', '0', '2017-09-13 16:13:15');
INSERT INTO `store_express_company` VALUES ('59', '盛辉物流', 'shenghuiwuliu', null, '0', '0', '0', '2017-09-13 16:13:22');
INSERT INTO `store_express_company` VALUES ('60', '申通', 'shentong', null, '0', '0', '0', '2017-09-13 16:13:34');
INSERT INTO `store_express_company` VALUES ('61', '顺丰', 'shunfeng', '', '0', '0', '0', '2017-09-13 16:13:41');
INSERT INTO `store_express_company` VALUES ('62', '速尔物流', 'sue', null, '0', '0', '0', '2017-09-13 16:13:48');
INSERT INTO `store_express_company` VALUES ('63', '盛丰物流', 'shengfeng', null, '0', '0', '0', '2017-09-13 16:13:55');
INSERT INTO `store_express_company` VALUES ('64', '赛澳递', 'saiaodi', null, '0', '0', '0', '2017-09-13 16:14:02');
INSERT INTO `store_express_company` VALUES ('65', '天地华宇', 'tiandihuayu', null, '0', '0', '0', '2017-09-13 16:14:11');
INSERT INTO `store_express_company` VALUES ('66', '天天快递', 'tiantian', null, '0', '0', '0', '2017-09-13 16:14:19');
INSERT INTO `store_express_company` VALUES ('67', 'TNT', 'tnt', null, '0', '0', '0', '2017-09-13 16:14:26');
INSERT INTO `store_express_company` VALUES ('68', 'UPS', 'ups', null, '0', '0', '0', '2017-09-13 16:14:29');
INSERT INTO `store_express_company` VALUES ('69', '万家物流', 'wanjiawuliu', null, '0', '0', '0', '2017-09-13 16:14:37');
INSERT INTO `store_express_company` VALUES ('70', '文捷航空速递', 'wenjiesudi', null, '0', '0', '0', '2017-09-13 16:14:46');
INSERT INTO `store_express_company` VALUES ('71', '伍圆', 'wuyuan', null, '0', '0', '0', '2017-09-13 16:14:52');
INSERT INTO `store_express_company` VALUES ('72', '万象物流', 'wxwl', null, '0', '0', '0', '2017-09-13 16:15:00');
INSERT INTO `store_express_company` VALUES ('73', '新邦物流', 'xinbangwuliu', null, '0', '0', '0', '2017-09-13 16:15:06');
INSERT INTO `store_express_company` VALUES ('74', '信丰物流', 'xinfengwuliu', null, '0', '0', '0', '2017-09-13 16:15:15');
INSERT INTO `store_express_company` VALUES ('75', '亚风速递', 'yafengsudi', null, '0', '0', '0', '2017-09-13 16:15:23');
INSERT INTO `store_express_company` VALUES ('76', '一邦速递', 'yibangwuliu', null, '0', '0', '0', '2017-09-13 16:15:30');
INSERT INTO `store_express_company` VALUES ('77', '优速物流', 'youshuwuliu', null, '0', '0', '0', '2017-09-13 16:15:36');
INSERT INTO `store_express_company` VALUES ('78', '邮政包裹挂号信', 'youzhengguonei', null, '0', '3', '0', '2017-09-13 16:15:44');
INSERT INTO `store_express_company` VALUES ('79', '邮政国际包裹挂号信', 'youzhengguoji', null, '0', '2', '0', '2017-09-13 16:15:51');
INSERT INTO `store_express_company` VALUES ('80', '远成物流', 'yuanchengwuliu', null, '0', '0', '0', '2017-09-13 16:15:57');
INSERT INTO `store_express_company` VALUES ('81', '圆通速递', 'yuantong', '', '1', '1', '0', '2017-09-13 16:16:03');
INSERT INTO `store_express_company` VALUES ('82', '源伟丰快递', 'yuanweifeng', null, '0', '0', '0', '2017-09-13 16:16:10');
INSERT INTO `store_express_company` VALUES ('83', '元智捷诚快递', 'yuanzhijiecheng', null, '0', '0', '0', '2017-09-13 16:16:17');
INSERT INTO `store_express_company` VALUES ('84', '韵达快运', 'yunda', null, '0', '0', '0', '2017-09-13 16:16:24');
INSERT INTO `store_express_company` VALUES ('85', '运通快递', 'yuntongkuaidi', null, '0', '0', '0', '2017-09-13 16:16:33');
INSERT INTO `store_express_company` VALUES ('86', '越丰物流', 'yuefengwuliu', null, '0', '0', '0', '2017-09-13 16:16:40');
INSERT INTO `store_express_company` VALUES ('87', '源安达', 'yad', null, '0', '0', '0', '2017-09-13 16:16:47');
INSERT INTO `store_express_company` VALUES ('88', '银捷速递', 'yinjiesudi', null, '0', '0', '0', '2017-09-13 16:16:56');
INSERT INTO `store_express_company` VALUES ('89', '宅急送', 'zhaijisong', null, '0', '0', '0', '2017-09-13 16:17:03');
INSERT INTO `store_express_company` VALUES ('90', '中铁快运', 'zhongtiekuaiyun', null, '0', '0', '0', '2017-09-13 16:17:10');
INSERT INTO `store_express_company` VALUES ('91', '中通速递', 'zhongtong', '', '0', '0', '0', '2017-09-13 16:17:16');
INSERT INTO `store_express_company` VALUES ('92', '中邮物流', 'zhongyouwuliu', null, '0', '0', '0', '2017-09-13 16:17:27');
INSERT INTO `store_express_company` VALUES ('93', '忠信达', 'zhongxinda', null, '0', '0', '0', '2017-09-13 16:17:34');
INSERT INTO `store_express_company` VALUES ('94', '芝麻开门', 'zhimakaimen', '', '1', '0', '0', '2017-09-13 16:17:41');

-- ----------------------------
-- Table structure for store_express_template
-- ----------------------------
DROP TABLE IF EXISTS `store_express_template`;
CREATE TABLE `store_express_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rule` longtext COMMENT '省份规则内容',
  `order_reduction_state` tinyint(1) unsigned DEFAULT '0' COMMENT '订单满减状态',
  `order_reduction_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '订单满减金额',
  `first_number` bigint(20) unsigned DEFAULT '0' COMMENT '首件数量',
  `first_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '首件邮费',
  `next_number` bigint(20) unsigned DEFAULT '0' COMMENT '续件数量',
  `next_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '续件邮费',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认规则',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_express_template_is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城-快递-模板';

-- ----------------------------
-- Records of store_express_template
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods
-- ----------------------------
DROP TABLE IF EXISTS `store_goods`;
CREATE TABLE `store_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类',
  `title` text COMMENT '商品标题',
  `logo` text COMMENT '商品图标',
  `specs` text COMMENT '商品规格JSON',
  `lists` text COMMENT '商品列表JSON',
  `image` text COMMENT '商品图片',
  `content` longtext COMMENT '商品内容',
  `number_sales` bigint(20) unsigned DEFAULT '0' COMMENT '销售数量',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '库库数量',
  `price_rate` decimal(20,4) unsigned DEFAULT '0.0000' COMMENT '返利比例',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '统一运费',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '销售状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_goods_status` (`status`) USING BTREE,
  KEY `idx_store_goods_cate_id` (`cate_id`) USING BTREE,
  KEY `idx_store_goods_is_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-记录';

-- ----------------------------
-- Records of store_goods
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_cate`;
CREATE TABLE `store_goods_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(500) DEFAULT '' COMMENT '分类图标',
  `title` varchar(255) DEFAULT '' COMMENT '分类名称',
  `desc` varchar(1024) DEFAULT '' COMMENT '分类描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '销售状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_goods_cate_is_deleted` (`is_deleted`) USING BTREE,
  KEY `idx_store_goods_cate_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-分类';

-- ----------------------------
-- Records of store_goods_cate
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_list`;
CREATE TABLE `store_goods_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(20) DEFAULT '' COMMENT 'sku',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `price_market` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品标价',
  `price_selling` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品售价',
  `number_sales` bigint(20) unsigned DEFAULT '0' COMMENT '销售数量',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `number_virtual` bigint(20) unsigned DEFAULT '0' COMMENT '虚拟销量',
  `number_express` bigint(20) unsigned DEFAULT '1' COMMENT '快递数量',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '商品状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_goods_list_id` (`goods_id`) USING BTREE,
  KEY `idx_store_goods_list_spec` (`goods_spec`) USING BTREE,
  KEY `idx_store_goods_list_status` (`status`) USING BTREE,
  KEY `idx_store_goods_list_sku` (`sku`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-详情';

-- ----------------------------
-- Records of store_goods_list
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_stock`;
CREATE TABLE `store_goods_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(200) DEFAULT '' COMMENT '商品规格',
  `number_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_goods_stock_gid` (`goods_id`) USING BTREE,
  KEY `idx_store_goods_stock_spec` (`goods_spec`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品-入库';

-- ----------------------------
-- Records of store_goods_stock
-- ----------------------------

-- ----------------------------
-- Table structure for store_member
-- ----------------------------
DROP TABLE IF EXISTS `store_member`;
CREATE TABLE `store_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT '' COMMENT '微信OPENID',
  `headimg` varchar(512) DEFAULT '' COMMENT '头像地址',
  `nickname` varchar(100) DEFAULT '' COMMENT '微信昵称',
  `phone` varchar(20) DEFAULT '' COMMENT '联系手机',
  `username` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `vip_level` tinyint(1) unsigned DEFAULT '0' COMMENT '会员级别(0游客,1为临时,2为VIP1,3为VIP2)',
  `vip_date` date DEFAULT NULL COMMENT '保级日期',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_member_openid` (`openid`) USING BTREE,
  KEY `idx_store_member_phone` (`phone`) USING BTREE,
  KEY `idx_store_member_vip_level` (`vip_level`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员-记录';

-- ----------------------------
-- Records of store_member
-- ----------------------------

-- ----------------------------
-- Table structure for store_member_address
-- ----------------------------
DROP TABLE IF EXISTS `store_member_address`;
CREATE TABLE `store_member_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `name` varchar(100) DEFAULT '' COMMENT '收货姓名',
  `phone` varchar(20) DEFAULT '' COMMENT '收货手机',
  `province` varchar(100) DEFAULT '' COMMENT '地址-省份',
  `city` varchar(100) DEFAULT '' COMMENT '地址-城市',
  `area` varchar(100) DEFAULT '' COMMENT '地址-区域',
  `address` varchar(255) DEFAULT '' COMMENT '地址-详情',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '默认地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_member_address_mid` (`mid`) USING BTREE,
  KEY `idx_store_member_address_is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员-地址';

-- ----------------------------
-- Records of store_member_address
-- ----------------------------

-- ----------------------------
-- Table structure for store_member_sms_history
-- ----------------------------
DROP TABLE IF EXISTS `store_member_sms_history`;
CREATE TABLE `store_member_sms_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `phone` varchar(20) DEFAULT '' COMMENT '目标手机',
  `content` varchar(512) DEFAULT '' COMMENT '短信内容',
  `region` varchar(100) DEFAULT '' COMMENT '区域编码',
  `result` varchar(100) DEFAULT '' COMMENT '返回结果',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_member_sms_history_phone` (`phone`) USING BTREE,
  KEY `idx_store_member_sms_history_mid` (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员-短信';

-- ----------------------------
-- Records of store_member_sms_history
-- ----------------------------

-- ----------------------------
-- Table structure for store_order
-- ----------------------------
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE `store_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` bigint(20) unsigned DEFAULT '0' COMMENT '订单单号',
  `from_mid` bigint(20) unsigned DEFAULT '0' COMMENT '推荐会员ID',
  `price_total` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '待付金额统计',
  `price_goods` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品费用统计',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费用统计',
  `price_rate_amount` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '返利金额统计',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态(0未支付,1已支付)',
  `pay_type` varchar(10) DEFAULT '' COMMENT '支付方式',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '支付金额',
  `pay_no` varchar(100) DEFAULT '' COMMENT '支付单号',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `cancel_state` tinyint(1) unsigned DEFAULT '0' COMMENT '取消状态',
  `cancel_at` datetime DEFAULT NULL COMMENT '取消时间',
  `cancel_desc` varchar(500) DEFAULT '' COMMENT '取消描述',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态(0未退款,1待退款,2已退款)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `refund_no` varchar(100) DEFAULT '' COMMENT '退款单号',
  `refund_price` decimal(20,2) DEFAULT '0.00' COMMENT '退款金额',
  `refund_desc` varchar(500) DEFAULT '' COMMENT '退款描述',
  `express_state` tinyint(1) unsigned DEFAULT '0' COMMENT '发货状态(0未发货,1已发货,2已签收)',
  `express_company_code` varchar(255) DEFAULT '' COMMENT '发货快递公司编码',
  `express_company_title` varchar(255) DEFAULT '' COMMENT '发货快递公司名称',
  `express_send_no` varchar(50) DEFAULT '' COMMENT '发货单号',
  `express_send_at` datetime DEFAULT NULL COMMENT '发货时间',
  `express_address_id` bigint(20) unsigned DEFAULT '0' COMMENT '收货地址ID',
  `express_name` varchar(255) DEFAULT '' COMMENT '收货人姓名',
  `express_phone` varchar(11) DEFAULT '' COMMENT '收货人手机',
  `express_province` varchar(255) DEFAULT '' COMMENT '收货地址省份',
  `express_city` varchar(255) DEFAULT '' COMMENT '收货地址城市',
  `express_area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `express_address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '订单状态(0已取消,1预订单待补全,2新订单待支付,3已支付待发货,4已发货待签收,5已完成)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_groups_order_mid` (`mid`) USING BTREE,
  KEY `idx_store_groups_order_order_no` (`order_no`) USING BTREE,
  KEY `idx_store_groups_order_pay_state` (`pay_state`) USING BTREE,
  KEY `idx_store_groups_order_cancel_state` (`cancel_state`) USING BTREE,
  KEY `idx_store_groups_order_refund_state` (`refund_state`) USING BTREE,
  KEY `idx_store_groups_order_status` (`status`) USING BTREE,
  KEY `idx_store_groups_order_pay_no` (`pay_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单-记录';

-- ----------------------------
-- Records of store_order
-- ----------------------------

-- ----------------------------
-- Table structure for store_order_list
-- ----------------------------
DROP TABLE IF EXISTS `store_order_list`;
CREATE TABLE `store_order_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `from_id` bigint(20) unsigned DEFAULT '0' COMMENT '推荐会员',
  `order_no` bigint(20) unsigned DEFAULT '0' COMMENT '订单单号',
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品标识',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标题',
  `goods_logo` varchar(500) DEFAULT '' COMMENT '商品图标',
  `goods_spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `price_real` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '交易金额',
  `price_selling` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '销售价格',
  `price_market` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '市场价格',
  `price_express` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费用',
  `price_rate` decimal(20,4) unsigned DEFAULT '0.0000' COMMENT '分成比例',
  `price_rate_amount` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '分成金额',
  `number_goods` bigint(20) unsigned DEFAULT '0' COMMENT '商品数量',
  `number_express` bigint(20) unsigned DEFAULT '0' COMMENT '快递数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_goods_list_id` (`goods_id`) USING BTREE,
  KEY `idx_store_goods_list_spec` (`goods_spec`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单-详情';

-- ----------------------------
-- Records of store_order_list
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_auth_status` (`status`) USING BTREE,
  KEY `idx_system_auth_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限';

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES ('1', '电影管理者', '1', '0', '创建电影管理者', '2021-01-09 20:09:49');

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_auth_auth` (`auth`) USING BTREE,
  KEY `idx_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限-授权';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------
INSERT INTO `system_auth_node` VALUES ('73', '1', 'wechatpunchin');
INSERT INTO `system_auth_node` VALUES ('74', '1', 'wechatpunchin/allmovie');
INSERT INTO `system_auth_node` VALUES ('75', '1', 'wechatpunchin/allmovie/index');
INSERT INTO `system_auth_node` VALUES ('76', '1', 'wechatpunchin/allmovie/edit');
INSERT INTO `system_auth_node` VALUES ('77', '1', 'wechatpunchin/allmovie/remove');
INSERT INTO `system_auth_node` VALUES ('78', '1', 'wechatpunchin/allmovie/add');
INSERT INTO `system_auth_node` VALUES ('79', '1', 'wechatpunchin/allmovie/save');
INSERT INTO `system_auth_node` VALUES ('80', '1', 'wechatpunchin/allmovieactor');
INSERT INTO `system_auth_node` VALUES ('81', '1', 'wechatpunchin/allmovieactor/index');
INSERT INTO `system_auth_node` VALUES ('82', '1', 'wechatpunchin/allmovieactor/edit');
INSERT INTO `system_auth_node` VALUES ('83', '1', 'wechatpunchin/allmovieactor/add');
INSERT INTO `system_auth_node` VALUES ('84', '1', 'wechatpunchin/allmovieactor/save');
INSERT INTO `system_auth_node` VALUES ('85', '1', 'wechatpunchin/allmovieactor/remove');
INSERT INTO `system_auth_node` VALUES ('86', '1', 'wechatpunchin/allorder');
INSERT INTO `system_auth_node` VALUES ('87', '1', 'wechatpunchin/allorder/index');
INSERT INTO `system_auth_node` VALUES ('88', '1', 'wechatpunchin/allorder/edit');
INSERT INTO `system_auth_node` VALUES ('89', '1', 'wechatpunchin/allorder/remove');
INSERT INTO `system_auth_node` VALUES ('90', '1', 'wechatpunchin/allsingin');
INSERT INTO `system_auth_node` VALUES ('91', '1', 'wechatpunchin/allsingin/index');
INSERT INTO `system_auth_node` VALUES ('92', '1', 'wechatpunchin/allsingin/edit');
INSERT INTO `system_auth_node` VALUES ('93', '1', 'wechatpunchin/allsingin/remove');
INSERT INTO `system_auth_node` VALUES ('94', '1', 'wechatpunchin/allsingin/add');
INSERT INTO `system_auth_node` VALUES ('95', '1', 'wechatpunchin/allsingin/save');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(500) DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_config_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COMMENT='系统-配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'app_name', 'ThinkAdmin');
INSERT INTO `system_config` VALUES ('2', 'site_name', 'ThinkAdmin');
INSERT INTO `system_config` VALUES ('3', 'app_version', 'dev');
INSERT INTO `system_config` VALUES ('4', 'site_copy', '©版权所有 2014-2018 楚才科技');
INSERT INTO `system_config` VALUES ('5', 'site_icon', '/upload/decb0fe26fa3f486/b3f6521bf29403c8.png');
INSERT INTO `system_config` VALUES ('7', 'miitbeian', '粤ICP备16006642号-2');
INSERT INTO `system_config` VALUES ('8', 'storage_type', 'local');
INSERT INTO `system_config` VALUES ('9', 'storage_local_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar');
INSERT INTO `system_config` VALUES ('10', 'storage_qiniu_bucket', 'https');
INSERT INTO `system_config` VALUES ('11', 'storage_qiniu_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('12', 'storage_qiniu_access_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('13', 'storage_qiniu_secret_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('14', 'storage_oss_bucket', 'cuci-mytest');
INSERT INTO `system_config` VALUES ('15', 'storage_oss_endpoint', 'oss-cn-hangzhou.aliyuncs.com');
INSERT INTO `system_config` VALUES ('16', 'storage_oss_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('17', 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES ('18', 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES ('36', 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES ('43', 'storage_qiniu_region', '华东');
INSERT INTO `system_config` VALUES ('44', 'storage_qiniu_is_https', 'https');
INSERT INTO `system_config` VALUES ('45', 'wechat_mch_id', '1332187001');
INSERT INTO `system_config` VALUES ('46', 'wechat_mch_key', 'A82DC5BD1F3359081049C568D8502BC5');
INSERT INTO `system_config` VALUES ('47', 'wechat_mch_ssl_type', 'p12');
INSERT INTO `system_config` VALUES ('48', 'wechat_mch_ssl_p12', '65b8e4f56718182d/1bc857ee646aa15d.p12');
INSERT INTO `system_config` VALUES ('49', 'wechat_mch_ssl_key', 'cc2e3e1345123930/c407d033294f283d.pem');
INSERT INTO `system_config` VALUES ('50', 'wechat_mch_ssl_cer', '966eaf89299e9c95/7014872cc109b29a.pem');
INSERT INTO `system_config` VALUES ('51', 'wechat_token', 'mytoken');
INSERT INTO `system_config` VALUES ('52', 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('53', 'wechat_appsecret', '9978422e0e431643d4b42868d183d60b');
INSERT INTO `system_config` VALUES ('54', 'wechat_encodingaeskey', '');
INSERT INTO `system_config` VALUES ('55', 'wechat_push_url', '消息推送地址：http://127.0.0.1:8000/wechat/api.push');
INSERT INTO `system_config` VALUES ('56', 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES ('57', 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('58', 'wechat_thr_appkey', '5caf4b0727f6e46a7e6ccbe773cc955d');
INSERT INTO `system_config` VALUES ('60', 'wechat_thr_appurl', '消息推送地址：http://127.0.0.1:2314/wechat/api.push');
INSERT INTO `system_config` VALUES ('61', 'component_appid', 'wx28b58798480874f9');
INSERT INTO `system_config` VALUES ('62', 'component_appsecret', '8d0e1ec14ea0adc5027dd0ad82c64bc9');
INSERT INTO `system_config` VALUES ('63', 'component_token', 'P8QHTIxpBEq88IrxatqhgpBm2OAQROkI');
INSERT INTO `system_config` VALUES ('64', 'component_encodingaeskey', 'L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx');
INSERT INTO `system_config` VALUES ('65', 'system_message_state', '0');
INSERT INTO `system_config` VALUES ('66', 'sms_zt_username', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('67', 'sms_zt_password', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('68', 'sms_reg_template', '您的验证码为{code}，请在十分钟内完成操作！');
INSERT INTO `system_config` VALUES ('69', 'sms_secure', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('70', 'store_title', '测试商城');
INSERT INTO `system_config` VALUES ('71', 'store_order_wait_time', '0.50');
INSERT INTO `system_config` VALUES ('72', 'store_order_clear_time', '24.00');
INSERT INTO `system_config` VALUES ('73', 'store_order_confirm_time', '60.00');
INSERT INTO `system_config` VALUES ('74', 'sms_zt_username2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('75', 'sms_zt_password2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('76', 'sms_secure2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('77', 'sms_reg_template2', '您的验证码为{code}，请在十分钟内完成操作！2');
INSERT INTO `system_config` VALUES ('78', 'michat_appid', '2882303761518074614');
INSERT INTO `system_config` VALUES ('79', 'michat_appkey', '5861807470614');
INSERT INTO `system_config` VALUES ('80', 'michat_appsecert', 'CP/WUTUgDuyOxgLQ5ztesg==');

-- ----------------------------
-- Table structure for system_data
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `value` longtext COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_data_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统-数据';

-- ----------------------------
-- Records of system_data
-- ----------------------------
INSERT INTO `system_data` VALUES ('1', 'menudata', '[{\"name\":\"请输入名称\",\"type\":\"scancode_push\",\"key\":\"scancode_push\"}]');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8mb4 COMMENT='系统-日志';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('4', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-11-26 11:02:04');
INSERT INTO `system_log` VALUES ('5', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-11-27 15:19:02');
INSERT INTO `system_log` VALUES ('6', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-11-30 15:05:06');
INSERT INTO `system_log` VALUES ('7', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-01 10:52:39');
INSERT INTO `system_log` VALUES ('8', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-02 14:02:09');
INSERT INTO `system_log` VALUES ('9', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-03 10:58:58');
INSERT INTO `system_log` VALUES ('10', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-06 17:48:55');
INSERT INTO `system_log` VALUES ('11', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-07 09:22:16');
INSERT INTO `system_log` VALUES ('12', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-08 20:51:43');
INSERT INTO `system_log` VALUES ('13', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-10 10:30:37');
INSERT INTO `system_log` VALUES ('14', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-14 09:55:56');
INSERT INTO `system_log` VALUES ('15', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-14 16:28:07');
INSERT INTO `system_log` VALUES ('16', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-15 19:37:07');
INSERT INTO `system_log` VALUES ('17', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-17 10:07:09');
INSERT INTO `system_log` VALUES ('18', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-17 21:28:36');
INSERT INTO `system_log` VALUES ('19', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-18 09:42:45');
INSERT INTO `system_log` VALUES ('20', 'admin/login/index', '10.105.32.84', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-19 17:37:44');
INSERT INTO `system_log` VALUES ('21', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-19 19:46:47');
INSERT INTO `system_log` VALUES ('22', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-20 19:45:10');
INSERT INTO `system_log` VALUES ('23', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-21 10:27:42');
INSERT INTO `system_log` VALUES ('24', 'admin/login/index', '10.3.13.44', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-21 13:22:05');
INSERT INTO `system_log` VALUES ('25', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-21 19:25:34');
INSERT INTO `system_log` VALUES ('26', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-22 14:06:45');
INSERT INTO `system_log` VALUES ('27', 'admin/login/index', '10.3.13.44', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-23 11:10:30');
INSERT INTO `system_log` VALUES ('28', 'admin/login/index', '10.3.13.44', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-23 14:18:58');
INSERT INTO `system_log` VALUES ('29', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-23 17:24:57');
INSERT INTO `system_log` VALUES ('30', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-23 17:31:42');
INSERT INTO `system_log` VALUES ('31', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-23 19:26:08');
INSERT INTO `system_log` VALUES ('32', 'admin/login/index', '10.3.13.44', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-24 09:19:26');
INSERT INTO `system_log` VALUES ('33', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-25 11:06:42');
INSERT INTO `system_log` VALUES ('34', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-28 10:52:58');
INSERT INTO `system_log` VALUES ('35', 'admin/login/index', '10.1.53.17', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-28 14:52:36');
INSERT INTO `system_log` VALUES ('36', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-30 20:22:23');
INSERT INTO `system_log` VALUES ('37', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-04 10:40:03');
INSERT INTO `system_log` VALUES ('38', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-05 10:03:32');
INSERT INTO `system_log` VALUES ('39', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-07 10:03:52');
INSERT INTO `system_log` VALUES ('40', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-09 20:09:26');
INSERT INTO `system_log` VALUES ('41', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'kkkk', '2021-01-09 20:12:04');
INSERT INTO `system_log` VALUES ('42', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-10 20:04:32');
INSERT INTO `system_log` VALUES ('43', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'yyyy', '2021-01-10 20:05:42');
INSERT INTO `system_log` VALUES ('44', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-10 20:06:08');
INSERT INTO `system_log` VALUES ('45', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-11 11:34:38');
INSERT INTO `system_log` VALUES ('46', 'admin/login/index', '10.3.13.44', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-11 12:59:00');
INSERT INTO `system_log` VALUES ('47', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-12 16:40:12');
INSERT INTO `system_log` VALUES ('48', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', '黄祖胜s', '2021-01-13 10:57:59');
INSERT INTO `system_log` VALUES ('49', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 10:59:57');
INSERT INTO `system_log` VALUES ('50', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', '黄祖胜s', '2021-01-13 11:00:52');
INSERT INTO `system_log` VALUES ('51', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 11:16:27');
INSERT INTO `system_log` VALUES ('52', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 11:19:41');
INSERT INTO `system_log` VALUES ('53', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华a', '2021-01-13 11:20:53');
INSERT INTO `system_log` VALUES ('54', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 11:29:49');
INSERT INTO `system_log` VALUES ('55', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 11:34:58');
INSERT INTO `system_log` VALUES ('56', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hhhh', '2021-01-13 12:04:53');
INSERT INTO `system_log` VALUES ('57', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hhhh', '2021-01-13 12:20:56');
INSERT INTO `system_log` VALUES ('58', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 12:22:54');
INSERT INTO `system_log` VALUES ('59', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 12:24:54');
INSERT INTO `system_log` VALUES ('60', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hhhh', '2021-01-13 12:25:20');
INSERT INTO `system_log` VALUES ('61', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 12:38:37');
INSERT INTO `system_log` VALUES ('62', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hhhh', '2021-01-13 12:53:38');
INSERT INTO `system_log` VALUES ('63', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 13:31:30');
INSERT INTO `system_log` VALUES ('64', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hhhh', '2021-01-13 13:49:12');
INSERT INTO `system_log` VALUES ('65', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 13:51:30');
INSERT INTO `system_log` VALUES ('66', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-13 13:54:44');
INSERT INTO `system_log` VALUES ('67', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 13:58:13');
INSERT INTO `system_log` VALUES ('68', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-13 15:07:37');
INSERT INTO `system_log` VALUES ('69', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 15:21:47');
INSERT INTO `system_log` VALUES ('70', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-13 15:22:49');
INSERT INTO `system_log` VALUES ('71', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-13 15:23:57');
INSERT INTO `system_log` VALUES ('72', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-14 12:29:23');
INSERT INTO `system_log` VALUES ('73', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-14 12:30:31');
INSERT INTO `system_log` VALUES ('74', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-14 12:31:53');
INSERT INTO `system_log` VALUES ('75', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-14 12:37:39');
INSERT INTO `system_log` VALUES ('76', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-14 12:57:00');
INSERT INTO `system_log` VALUES ('77', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-14 16:51:27');
INSERT INTO `system_log` VALUES ('78', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-14 21:32:45');
INSERT INTO `system_log` VALUES ('79', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-15 13:45:30');
INSERT INTO `system_log` VALUES ('80', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-15 17:03:58');
INSERT INTO `system_log` VALUES ('81', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-15 22:23:50');
INSERT INTO `system_log` VALUES ('82', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 12:50:34');
INSERT INTO `system_log` VALUES ('83', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-16 16:31:20');
INSERT INTO `system_log` VALUES ('84', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 16:31:48');
INSERT INTO `system_log` VALUES ('85', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 16:34:48');
INSERT INTO `system_log` VALUES ('86', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-16 16:40:52');
INSERT INTO `system_log` VALUES ('87', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 16:41:22');
INSERT INTO `system_log` VALUES ('88', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '测试测试', '2021-01-16 18:11:08');
INSERT INTO `system_log` VALUES ('89', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 18:11:38');
INSERT INTO `system_log` VALUES ('90', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '测试测试', '2021-01-16 18:12:48');
INSERT INTO `system_log` VALUES ('91', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 19:12:10');
INSERT INTO `system_log` VALUES ('92', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '测试测试', '2021-01-16 19:12:49');
INSERT INTO `system_log` VALUES ('93', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 19:13:47');
INSERT INTO `system_log` VALUES ('94', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '测试测试', '2021-01-16 19:15:00');
INSERT INTO `system_log` VALUES ('95', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-16 19:57:53');
INSERT INTO `system_log` VALUES ('96', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '测试测试', '2021-01-17 15:09:51');
INSERT INTO `system_log` VALUES ('97', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-17 15:10:13');
INSERT INTO `system_log` VALUES ('98', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-17 15:10:29');
INSERT INTO `system_log` VALUES ('99', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-17 21:54:48');
INSERT INTO `system_log` VALUES ('100', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-17 22:01:48');
INSERT INTO `system_log` VALUES ('101', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-17 22:02:13');
INSERT INTO `system_log` VALUES ('102', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-18 16:59:13');
INSERT INTO `system_log` VALUES ('103', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', '奥特曼s', '2021-01-18 17:22:46');
INSERT INTO `system_log` VALUES ('104', 'admin/login/index', '10.3.16.49', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-18 17:46:51');
INSERT INTO `system_log` VALUES ('105', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-18 21:00:21');
INSERT INTO `system_log` VALUES ('106', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 12:17:56');
INSERT INTO `system_log` VALUES ('107', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 12:42:21');
INSERT INTO `system_log` VALUES ('108', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 12:52:45');
INSERT INTO `system_log` VALUES ('109', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'addd', '2021-01-19 12:57:31');
INSERT INTO `system_log` VALUES ('110', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 12:58:23');
INSERT INTO `system_log` VALUES ('111', 'admin/login/index', '223.74.103.59', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 13:07:59');
INSERT INTO `system_log` VALUES ('112', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-19 13:11:50');
INSERT INTO `system_log` VALUES ('113', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 13:27:48');
INSERT INTO `system_log` VALUES ('114', 'admin/login/index', '223.74.103.59', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 14:31:05');
INSERT INTO `system_log` VALUES ('115', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 14:31:42');
INSERT INTO `system_log` VALUES ('116', 'admin/login/index', '120.229.67.152', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 14:40:48');
INSERT INTO `system_log` VALUES ('117', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 15:32:40');
INSERT INTO `system_log` VALUES ('118', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 16:01:38');
INSERT INTO `system_log` VALUES ('119', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-19 16:11:06');
INSERT INTO `system_log` VALUES ('120', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-19 16:15:18');
INSERT INTO `system_log` VALUES ('121', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 11:40:48');
INSERT INTO `system_log` VALUES ('122', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-20 11:43:05');
INSERT INTO `system_log` VALUES ('123', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 11:43:53');
INSERT INTO `system_log` VALUES ('124', 'admin/login/index', '192.168.2.100', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 11:46:27');
INSERT INTO `system_log` VALUES ('125', 'admin/login/index', '192.168.2.100', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 12:57:18');
INSERT INTO `system_log` VALUES ('126', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 13:17:01');
INSERT INTO `system_log` VALUES ('127', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-20 13:54:59');
INSERT INTO `system_log` VALUES ('128', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 14:01:13');
INSERT INTO `system_log` VALUES ('129', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-20 14:20:17');
INSERT INTO `system_log` VALUES ('130', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-20 14:44:56');
INSERT INTO `system_log` VALUES ('131', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 15:49:02');
INSERT INTO `system_log` VALUES ('132', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 15:56:34');
INSERT INTO `system_log` VALUES ('133', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-20 16:16:02');
INSERT INTO `system_log` VALUES ('134', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 16:16:55');
INSERT INTO `system_log` VALUES ('135', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-20 16:23:21');
INSERT INTO `system_log` VALUES ('136', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 16:31:08');
INSERT INTO `system_log` VALUES ('137', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-20 20:52:06');
INSERT INTO `system_log` VALUES ('138', 'admin/login/index', '120.229.67.213', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 10:12:25');
INSERT INTO `system_log` VALUES ('139', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 10:39:19');
INSERT INTO `system_log` VALUES ('140', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 10:46:02');
INSERT INTO `system_log` VALUES ('141', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 11:07:23');
INSERT INTO `system_log` VALUES ('142', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 11:18:08');
INSERT INTO `system_log` VALUES ('143', 'admin/login/index', '120.229.67.213', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-21 11:21:57');
INSERT INTO `system_log` VALUES ('144', 'admin/login/index', '120.229.67.213', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 11:24:36');
INSERT INTO `system_log` VALUES ('145', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 15:55:40');
INSERT INTO `system_log` VALUES ('146', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 15:59:49');
INSERT INTO `system_log` VALUES ('147', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 16:37:50');
INSERT INTO `system_log` VALUES ('148', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 17:12:01');
INSERT INTO `system_log` VALUES ('149', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 17:13:00');
INSERT INTO `system_log` VALUES ('150', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 17:33:57');
INSERT INTO `system_log` VALUES ('151', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 17:52:16');
INSERT INTO `system_log` VALUES ('152', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 17:52:49');
INSERT INTO `system_log` VALUES ('153', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 18:04:19');
INSERT INTO `system_log` VALUES ('154', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 18:04:57');
INSERT INTO `system_log` VALUES ('155', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 18:11:57');
INSERT INTO `system_log` VALUES ('156', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 18:14:58');
INSERT INTO `system_log` VALUES ('157', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 18:16:20');
INSERT INTO `system_log` VALUES ('158', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 18:16:50');
INSERT INTO `system_log` VALUES ('159', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 18:24:36');
INSERT INTO `system_log` VALUES ('160', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 18:28:02');
INSERT INTO `system_log` VALUES ('161', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 18:30:20');
INSERT INTO `system_log` VALUES ('162', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 18:35:01');
INSERT INTO `system_log` VALUES ('163', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 21:57:11');
INSERT INTO `system_log` VALUES ('164', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 22:00:36');
INSERT INTO `system_log` VALUES ('165', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 22:00:50');
INSERT INTO `system_log` VALUES ('166', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 22:03:41');
INSERT INTO `system_log` VALUES ('167', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 22:05:43');
INSERT INTO `system_log` VALUES ('168', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-21 22:05:57');
INSERT INTO `system_log` VALUES ('169', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 22:06:14');
INSERT INTO `system_log` VALUES ('170', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 22:11:25');
INSERT INTO `system_log` VALUES ('171', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-21 22:12:11');
INSERT INTO `system_log` VALUES ('172', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 22:13:57');
INSERT INTO `system_log` VALUES ('173', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 22:20:18');
INSERT INTO `system_log` VALUES ('174', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-21 22:20:39');
INSERT INTO `system_log` VALUES ('175', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-21 22:23:13');
INSERT INTO `system_log` VALUES ('176', 'admin/login/index', '113.91.55.145', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-21 22:26:23');
INSERT INTO `system_log` VALUES ('177', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 11:05:20');
INSERT INTO `system_log` VALUES ('178', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 11:05:34');
INSERT INTO `system_log` VALUES ('179', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-22 11:08:32');
INSERT INTO `system_log` VALUES ('180', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-22 11:08:50');
INSERT INTO `system_log` VALUES ('181', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 11:09:01');
INSERT INTO `system_log` VALUES ('182', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 11:09:15');
INSERT INTO `system_log` VALUES ('183', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-22 11:09:35');
INSERT INTO `system_log` VALUES ('184', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-22 11:10:00');
INSERT INTO `system_log` VALUES ('185', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 11:10:18');
INSERT INTO `system_log` VALUES ('186', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 13:53:28');
INSERT INTO `system_log` VALUES ('187', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-22 16:16:34');
INSERT INTO `system_log` VALUES ('188', 'admin/login/index', '183.8.8.205', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-22 16:17:12');
INSERT INTO `system_log` VALUES ('189', 'admin/login/index', '120.229.67.186', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-23 10:43:44');
INSERT INTO `system_log` VALUES ('190', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-23 11:04:24');
INSERT INTO `system_log` VALUES ('191', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-23 11:06:47');
INSERT INTO `system_log` VALUES ('192', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-23 11:17:14');
INSERT INTO `system_log` VALUES ('193', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-23 11:17:40');
INSERT INTO `system_log` VALUES ('194', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-23 11:18:22');
INSERT INTO `system_log` VALUES ('195', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-23 11:18:38');
INSERT INTO `system_log` VALUES ('196', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', '肖丽华测试', '2021-01-23 13:42:40');
INSERT INTO `system_log` VALUES ('197', 'admin/login/index', '183.13.107.87', '系统管理', '用户登录系统后台成功', '黄杰辉测试', '2021-01-23 13:44:05');
INSERT INTO `system_log` VALUES ('198', 'admin/login/index', '183.8.11.45', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 12:53:32');
INSERT INTO `system_log` VALUES ('199', 'admin/login/index', '183.8.11.45', '系统管理', '用户登录系统后台成功', 'xiao', '2021-01-24 12:56:34');
INSERT INTO `system_log` VALUES ('200', 'admin/login/index', '183.8.11.45', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 12:58:22');
INSERT INTO `system_log` VALUES ('201', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 13:31:08');
INSERT INTO `system_log` VALUES ('202', 'admin/login/index', '113.91.54.52', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 13:31:32');
INSERT INTO `system_log` VALUES ('203', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 16:15:55');
INSERT INTO `system_log` VALUES ('204', 'admin/login/index', '183.8.11.45', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 17:12:33');
INSERT INTO `system_log` VALUES ('205', 'admin/login/index', '183.8.11.45', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-24 17:43:01');
INSERT INTO `system_log` VALUES ('206', 'admin/login/index', '120.229.67.175', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-26 10:50:37');
INSERT INTO `system_log` VALUES ('207', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-27 18:53:25');
INSERT INTO `system_log` VALUES ('208', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-27 19:40:34');
INSERT INTO `system_log` VALUES ('209', 'admin/login/index', '120.229.67.175', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-27 22:35:39');
INSERT INTO `system_log` VALUES ('210', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-28 10:51:56');
INSERT INTO `system_log` VALUES ('211', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-28 12:50:09');
INSERT INTO `system_log` VALUES ('212', 'admin/login/index', '120.229.9.187', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-28 17:34:13');
INSERT INTO `system_log` VALUES ('213', 'admin/login/index', '120.229.9.187', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-28 22:13:05');
INSERT INTO `system_log` VALUES ('214', 'admin/login/index', '120.229.9.124', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-29 14:56:53');
INSERT INTO `system_log` VALUES ('215', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-29 15:50:34');
INSERT INTO `system_log` VALUES ('216', 'admin/login/index', '120.229.9.124', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-29 21:14:02');
INSERT INTO `system_log` VALUES ('217', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-29 21:48:07');
INSERT INTO `system_log` VALUES ('218', 'admin/login/index', '120.229.67.187', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-29 22:49:42');
INSERT INTO `system_log` VALUES ('219', 'admin/login/index', '183.8.19.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-30 11:00:25');
INSERT INTO `system_log` VALUES ('220', 'admin/login/index', '120.229.67.180', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-30 22:30:41');
INSERT INTO `system_log` VALUES ('221', 'admin/login/index', '120.229.67.180', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-30 22:53:35');
INSERT INTO `system_log` VALUES ('222', 'admin/login/index', '113.91.62.150', '系统管理', '用户登录系统后台成功', 'admin', '2021-01-31 00:00:31');
INSERT INTO `system_log` VALUES ('223', 'admin/login/index', '112.97.61.214', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-02 01:40:47');
INSERT INTO `system_log` VALUES ('224', 'admin/login/index', '183.12.86.34', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-02 03:07:12');
INSERT INTO `system_log` VALUES ('225', 'admin/login/index', '183.12.86.34', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-02 03:08:47');
INSERT INTO `system_log` VALUES ('226', 'admin/login/index', '183.12.86.34', '系统管理', '用户登录系统后台成功', '肖俊宇测试', '2021-02-02 03:10:51');
INSERT INTO `system_log` VALUES ('227', 'admin/login/index', '183.12.86.34', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-02 03:11:44');
INSERT INTO `system_log` VALUES ('228', 'admin/login/index', '183.12.86.34', '系统管理', '用户登录系统后台成功', '肖俊宇测试', '2021-02-02 03:12:26');
INSERT INTO `system_log` VALUES ('229', 'admin/login/index', '183.12.86.34', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-02 03:33:57');
INSERT INTO `system_log` VALUES ('230', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 16:08:52');
INSERT INTO `system_log` VALUES ('231', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'linxianliang', '2021-02-03 16:18:39');
INSERT INTO `system_log` VALUES ('232', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 16:23:22');
INSERT INTO `system_log` VALUES ('233', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 16:42:58');
INSERT INTO `system_log` VALUES ('234', 'admin/login/index', '140.243.170.229', '系统管理', '用户登录系统后台成功', 'linxianliang', '2021-02-03 17:04:39');
INSERT INTO `system_log` VALUES ('235', 'admin/login/index', '140.243.170.229', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 17:06:39');
INSERT INTO `system_log` VALUES ('236', 'admin/login/index', '203.190.105.189', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 19:46:53');
INSERT INTO `system_log` VALUES ('237', 'admin/login/index', '183.12.84.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 20:44:03');
INSERT INTO `system_log` VALUES ('238', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 21:15:16');
INSERT INTO `system_log` VALUES ('239', 'admin/login/index', '203.190.105.15', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 21:57:10');
INSERT INTO `system_log` VALUES ('240', 'admin/login/index', '183.12.84.205', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-03 22:39:46');
INSERT INTO `system_log` VALUES ('241', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-04 09:13:06');
INSERT INTO `system_log` VALUES ('242', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-04 09:14:37');
INSERT INTO `system_log` VALUES ('243', 'admin/login/index', '27.154.2.118', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-04 16:26:05');
INSERT INTO `system_log` VALUES ('244', 'admin/login/index', '203.190.105.236', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-04 18:44:58');
INSERT INTO `system_log` VALUES ('245', 'admin/login/index', '203.190.105.219', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 00:00:09');
INSERT INTO `system_log` VALUES ('246', 'admin/login/index', '27.154.3.88', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 10:12:42');
INSERT INTO `system_log` VALUES ('247', 'admin/login/index', '27.154.3.88', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 10:58:07');
INSERT INTO `system_log` VALUES ('248', 'admin/login/index', '183.12.87.219', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 19:40:50');
INSERT INTO `system_log` VALUES ('249', 'admin/login/index', '120.229.67.232', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 22:20:13');
INSERT INTO `system_log` VALUES ('250', 'admin/login/index', '120.229.67.232', '系统管理', '用户登录系统后台成功', 'xiao', '2021-02-05 22:22:37');
INSERT INTO `system_log` VALUES ('251', 'admin/login/index', '183.12.87.219', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 22:23:39');
INSERT INTO `system_log` VALUES ('252', 'admin/login/index', '120.229.67.232', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 22:24:53');
INSERT INTO `system_log` VALUES ('253', 'admin/login/index', '183.12.87.219', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-05 22:26:16');
INSERT INTO `system_log` VALUES ('254', 'admin/login/index', '120.229.67.232', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-06 09:54:19');
INSERT INTO `system_log` VALUES ('255', 'admin/login/index', '120.229.67.200', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-07 12:37:48');
INSERT INTO `system_log` VALUES ('256', 'admin/login/index', '223.74.103.76', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-08 01:13:27');
INSERT INTO `system_log` VALUES ('257', 'admin/login/index', '223.74.103.76', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-08 10:44:43');
INSERT INTO `system_log` VALUES ('258', 'admin/login/index', '120.229.67.200', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-08 12:39:06');
INSERT INTO `system_log` VALUES ('259', 'admin/login/index', '120.229.67.200', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-08 14:29:36');
INSERT INTO `system_log` VALUES ('260', 'admin/login/index', '120.229.67.200', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-08 16:28:29');
INSERT INTO `system_log` VALUES ('261', 'admin/login/index', '223.74.153.222', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-09 09:43:06');
INSERT INTO `system_log` VALUES ('262', 'admin/login/index', '223.74.153.222', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-10 16:00:12');
INSERT INTO `system_log` VALUES ('263', 'admin/login/index', '223.74.153.222', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-11 09:34:03');
INSERT INTO `system_log` VALUES ('264', 'admin/login/index', '223.74.153.166', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-15 09:57:11');
INSERT INTO `system_log` VALUES ('265', 'admin/login/index', '113.91.62.148', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-15 11:11:57');
INSERT INTO `system_log` VALUES ('266', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-19 20:28:33');
INSERT INTO `system_log` VALUES ('267', 'admin/login/index', '183.13.106.210', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-19 21:27:22');
INSERT INTO `system_log` VALUES ('268', 'admin/login/index', '223.74.106.0', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-21 14:53:00');
INSERT INTO `system_log` VALUES ('269', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-25 14:35:50');
INSERT INTO `system_log` VALUES ('270', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', '测试测试', '2021-02-25 14:40:58');
INSERT INTO `system_log` VALUES ('271', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', '测试测试', '2021-02-25 16:14:38');
INSERT INTO `system_log` VALUES ('272', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', '测试测试', '2021-02-25 16:17:16');
INSERT INTO `system_log` VALUES ('273', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-25 16:18:50');
INSERT INTO `system_log` VALUES ('274', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', '测试测试', '2021-02-25 16:19:24');
INSERT INTO `system_log` VALUES ('275', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '测试测试', '2021-02-25 16:20:43');
INSERT INTO `system_log` VALUES ('276', 'admin/login/index', '183.12.86.72', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-25 17:13:39');
INSERT INTO `system_log` VALUES ('277', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-02-25 17:14:00');
INSERT INTO `system_log` VALUES ('278', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-01 10:23:10');
INSERT INTO `system_log` VALUES ('279', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-01 10:23:17');
INSERT INTO `system_log` VALUES ('280', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-02 08:54:18');
INSERT INTO `system_log` VALUES ('281', 'admin/login/index', '116.25.107.45', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-02 09:09:28');
INSERT INTO `system_log` VALUES ('282', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-02 09:20:07');
INSERT INTO `system_log` VALUES ('283', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-02 09:44:55');
INSERT INTO `system_log` VALUES ('284', 'admin/login/index', '112.48.12.208', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-02 21:36:42');
INSERT INTO `system_log` VALUES ('285', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 09:20:00');
INSERT INTO `system_log` VALUES ('286', 'admin/login/index', '59.57.167.241', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 09:58:22');
INSERT INTO `system_log` VALUES ('287', 'admin/login/index', '113.98.58.138', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 10:36:44');
INSERT INTO `system_log` VALUES ('288', 'admin/login/index', '59.57.167.241', '系统管理', '用户登录系统后台成功', '叁见小助手小月', '2021-03-03 10:49:03');
INSERT INTO `system_log` VALUES ('289', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 10:51:07');
INSERT INTO `system_log` VALUES ('290', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', '测试测试', '2021-03-03 10:53:09');
INSERT INTO `system_log` VALUES ('291', 'admin/login/index', '59.57.167.241', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 10:57:54');
INSERT INTO `system_log` VALUES ('292', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '测试测试', '2021-03-03 10:59:53');
INSERT INTO `system_log` VALUES ('293', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 11:02:03');
INSERT INTO `system_log` VALUES ('294', 'admin/login/index', '59.57.167.241', '系统管理', '用户登录系统后台成功', '叁见丽华', '2021-03-03 11:04:01');
INSERT INTO `system_log` VALUES ('295', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '测试测试', '2021-03-03 11:07:38');
INSERT INTO `system_log` VALUES ('296', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 11:08:26');
INSERT INTO `system_log` VALUES ('297', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '测试测试', '2021-03-03 11:10:52');
INSERT INTO `system_log` VALUES ('298', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 11:11:54');
INSERT INTO `system_log` VALUES ('299', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '测试测试', '2021-03-03 11:13:17');
INSERT INTO `system_log` VALUES ('300', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 11:14:44');
INSERT INTO `system_log` VALUES ('301', 'admin/login/index', '59.57.167.241', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 11:22:15');
INSERT INTO `system_log` VALUES ('302', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 11:28:40');
INSERT INTO `system_log` VALUES ('303', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '叁见丽华', '2021-03-03 12:16:14');
INSERT INTO `system_log` VALUES ('304', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 12:19:46');
INSERT INTO `system_log` VALUES ('305', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '叁见丽华', '2021-03-03 12:20:23');
INSERT INTO `system_log` VALUES ('306', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', '测试测试', '2021-03-03 12:20:57');
INSERT INTO `system_log` VALUES ('307', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 12:24:43');
INSERT INTO `system_log` VALUES ('308', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 12:25:52');
INSERT INTO `system_log` VALUES ('309', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', '叁见丽华', '2021-03-03 12:26:17');
INSERT INTO `system_log` VALUES ('310', 'admin/login/index', '113.98.58.140', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 12:52:15');
INSERT INTO `system_log` VALUES ('311', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 13:43:21');
INSERT INTO `system_log` VALUES ('312', 'admin/login/index', '113.116.239.168', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-03 13:48:08');
INSERT INTO `system_log` VALUES ('313', 'admin/login/index', '116.7.20.168', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-04 10:55:36');
INSERT INTO `system_log` VALUES ('314', 'admin/login/index', '27.154.187.119', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-04 15:00:46');
INSERT INTO `system_log` VALUES ('315', 'admin/login/index', '113.116.239.255', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-06 21:55:10');
INSERT INTO `system_log` VALUES ('316', 'admin/login/index', '122.96.34.164', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-07 13:41:24');
INSERT INTO `system_log` VALUES ('317', 'admin/login/index', '117.136.33.240', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-07 13:43:47');
INSERT INTO `system_log` VALUES ('318', 'admin/login/index', '113.89.80.74', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-08 08:35:46');
INSERT INTO `system_log` VALUES ('319', 'admin/login/index', '61.144.255.81', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-08 15:29:18');
INSERT INTO `system_log` VALUES ('320', 'admin/login/index', '61.144.255.81', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-08 16:16:18');
INSERT INTO `system_log` VALUES ('321', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-10 17:49:19');
INSERT INTO `system_log` VALUES ('322', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-10 18:09:25');
INSERT INTO `system_log` VALUES ('323', 'admin/login/index', '113.98.58.136', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-11 09:52:42');
INSERT INTO `system_log` VALUES ('324', 'admin/login/index', '116.7.21.169', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-11 13:10:13');
INSERT INTO `system_log` VALUES ('325', 'admin/login/index', '10.3.16.50', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-12 09:58:10');
INSERT INTO `system_log` VALUES ('326', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-23 09:09:30');
INSERT INTO `system_log` VALUES ('327', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-23 09:22:02');
INSERT INTO `system_log` VALUES ('328', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 08:51:57');
INSERT INTO `system_log` VALUES ('329', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 11:09:44');
INSERT INTO `system_log` VALUES ('330', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 14:13:09');
INSERT INTO `system_log` VALUES ('331', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 15:15:38');
INSERT INTO `system_log` VALUES ('332', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-29 15:16:45');
INSERT INTO `system_log` VALUES ('333', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 15:17:00');
INSERT INTO `system_log` VALUES ('334', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-29 15:18:27');
INSERT INTO `system_log` VALUES ('335', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-29 15:29:47');
INSERT INTO `system_log` VALUES ('336', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 15:30:02');
INSERT INTO `system_log` VALUES ('337', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-29 15:47:35');
INSERT INTO `system_log` VALUES ('338', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 15:48:51');
INSERT INTO `system_log` VALUES ('339', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 15:50:49');
INSERT INTO `system_log` VALUES ('340', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-29 15:51:09');
INSERT INTO `system_log` VALUES ('341', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-29 15:55:36');
INSERT INTO `system_log` VALUES ('342', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-31 09:40:09');
INSERT INTO `system_log` VALUES ('343', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-31 09:46:13');
INSERT INTO `system_log` VALUES ('344', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-31 09:46:29');
INSERT INTO `system_log` VALUES ('345', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-31 09:48:40');
INSERT INTO `system_log` VALUES ('346', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-31 09:51:15');
INSERT INTO `system_log` VALUES ('347', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-03-31 09:52:12');
INSERT INTO `system_log` VALUES ('348', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-31 09:53:27');
INSERT INTO `system_log` VALUES ('349', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-03-31 17:47:35');
INSERT INTO `system_log` VALUES ('350', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-06 08:46:26');
INSERT INTO `system_log` VALUES ('351', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-06 14:43:49');
INSERT INTO `system_log` VALUES ('352', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-12 10:16:09');
INSERT INTO `system_log` VALUES ('353', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-12 10:49:19');
INSERT INTO `system_log` VALUES ('354', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-12 10:56:02');
INSERT INTO `system_log` VALUES ('355', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-13 15:28:39');
INSERT INTO `system_log` VALUES ('356', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-13 15:29:36');
INSERT INTO `system_log` VALUES ('357', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-13 19:58:44');
INSERT INTO `system_log` VALUES ('358', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-14 12:53:04');
INSERT INTO `system_log` VALUES ('359', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-15 09:45:32');
INSERT INTO `system_log` VALUES ('360', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-16 14:36:12');
INSERT INTO `system_log` VALUES ('361', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-16 14:36:32');
INSERT INTO `system_log` VALUES ('362', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-16 14:39:02');
INSERT INTO `system_log` VALUES ('363', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-16 14:39:24');
INSERT INTO `system_log` VALUES ('364', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-16 14:42:46');
INSERT INTO `system_log` VALUES ('365', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-16 14:43:09');
INSERT INTO `system_log` VALUES ('366', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-16 14:44:48');
INSERT INTO `system_log` VALUES ('367', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-16 14:45:07');
INSERT INTO `system_log` VALUES ('368', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-16 14:48:50');
INSERT INTO `system_log` VALUES ('369', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-16 14:49:53');
INSERT INTO `system_log` VALUES ('370', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-16 14:50:47');
INSERT INTO `system_log` VALUES ('371', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-16 14:51:30');
INSERT INTO `system_log` VALUES ('372', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-19 11:03:53');
INSERT INTO `system_log` VALUES ('373', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-19 11:08:53');
INSERT INTO `system_log` VALUES ('374', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-19 11:09:08');
INSERT INTO `system_log` VALUES ('375', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-19 11:09:41');
INSERT INTO `system_log` VALUES ('376', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-19 11:12:13');
INSERT INTO `system_log` VALUES ('377', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-19 11:19:48');
INSERT INTO `system_log` VALUES ('378', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-19 11:21:05');
INSERT INTO `system_log` VALUES ('379', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-19 11:23:28');
INSERT INTO `system_log` VALUES ('380', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-19 11:27:29');
INSERT INTO `system_log` VALUES ('381', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-19 11:29:59');
INSERT INTO `system_log` VALUES ('382', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-19 11:31:10');
INSERT INTO `system_log` VALUES ('383', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-19 11:31:31');
INSERT INTO `system_log` VALUES ('384', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-19 16:26:33');
INSERT INTO `system_log` VALUES ('385', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-20 09:43:58');
INSERT INTO `system_log` VALUES ('386', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-20 09:52:00');
INSERT INTO `system_log` VALUES ('387', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-20 14:09:25');
INSERT INTO `system_log` VALUES ('388', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-20 15:32:24');
INSERT INTO `system_log` VALUES ('389', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-20 15:40:06');
INSERT INTO `system_log` VALUES ('390', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-20 16:11:14');
INSERT INTO `system_log` VALUES ('391', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 09:18:55');
INSERT INTO `system_log` VALUES ('392', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-21 09:20:13');
INSERT INTO `system_log` VALUES ('393', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 09:20:30');
INSERT INTO `system_log` VALUES ('394', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 09:20:41');
INSERT INTO `system_log` VALUES ('395', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 09:33:06');
INSERT INTO `system_log` VALUES ('396', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-21 09:48:49');
INSERT INTO `system_log` VALUES ('397', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 09:49:26');
INSERT INTO `system_log` VALUES ('398', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 10:06:44');
INSERT INTO `system_log` VALUES ('399', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 10:06:58');
INSERT INTO `system_log` VALUES ('400', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 11:04:45');
INSERT INTO `system_log` VALUES ('401', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 12:22:25');
INSERT INTO `system_log` VALUES ('402', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 15:57:46');
INSERT INTO `system_log` VALUES ('403', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 17:18:27');
INSERT INTO `system_log` VALUES ('404', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-21 17:28:08');
INSERT INTO `system_log` VALUES ('405', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 17:33:53');
INSERT INTO `system_log` VALUES ('406', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-21 19:57:56');
INSERT INTO `system_log` VALUES ('407', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-21 19:58:16');
INSERT INTO `system_log` VALUES ('408', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-21 20:23:09');
INSERT INTO `system_log` VALUES ('409', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-22 09:13:19');
INSERT INTO `system_log` VALUES ('410', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-22 10:42:16');
INSERT INTO `system_log` VALUES ('411', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-22 10:43:47');
INSERT INTO `system_log` VALUES ('412', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-22 14:48:52');
INSERT INTO `system_log` VALUES ('413', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-22 14:51:55');
INSERT INTO `system_log` VALUES ('414', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-04-22 14:52:39');
INSERT INTO `system_log` VALUES ('415', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-04-22 14:53:55');
INSERT INTO `system_log` VALUES ('416', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-23 13:08:06');
INSERT INTO `system_log` VALUES ('417', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-04-27 16:43:03');
INSERT INTO `system_log` VALUES ('418', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-06 09:22:20');
INSERT INTO `system_log` VALUES ('419', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-06 09:23:53');
INSERT INTO `system_log` VALUES ('420', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-06 14:18:42');
INSERT INTO `system_log` VALUES ('421', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-06 15:09:16');
INSERT INTO `system_log` VALUES ('422', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-08 09:37:45');
INSERT INTO `system_log` VALUES ('423', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-10 17:48:23');
INSERT INTO `system_log` VALUES ('424', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-12 08:56:54');
INSERT INTO `system_log` VALUES ('425', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-15 13:15:09');
INSERT INTO `system_log` VALUES ('426', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-15 19:33:45');
INSERT INTO `system_log` VALUES ('427', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-16 16:12:19');
INSERT INTO `system_log` VALUES ('428', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-16 16:47:25');
INSERT INTO `system_log` VALUES ('429', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-16 17:11:13');
INSERT INTO `system_log` VALUES ('430', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-16 17:25:24');
INSERT INTO `system_log` VALUES ('431', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-19 10:04:10');
INSERT INTO `system_log` VALUES ('432', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-20 14:21:09');
INSERT INTO `system_log` VALUES ('433', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'niu120', '2021-05-20 15:28:23');
INSERT INTO `system_log` VALUES ('434', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-20 15:32:48');
INSERT INTO `system_log` VALUES ('435', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-20 15:49:06');
INSERT INTO `system_log` VALUES ('436', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'niu120', '2021-05-20 15:49:31');
INSERT INTO `system_log` VALUES ('437', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-20 15:57:39');
INSERT INTO `system_log` VALUES ('438', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-21 11:11:55');
INSERT INTO `system_log` VALUES ('439', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-05-25 10:06:35');
INSERT INTO `system_log` VALUES ('440', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-25 10:09:23');
INSERT INTO `system_log` VALUES ('441', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-05-25 11:29:14');
INSERT INTO `system_log` VALUES ('442', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-26 13:38:11');
INSERT INTO `system_log` VALUES ('443', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-05-26 14:44:13');
INSERT INTO `system_log` VALUES ('444', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-26 14:44:57');
INSERT INTO `system_log` VALUES ('445', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-05-26 17:10:09');
INSERT INTO `system_log` VALUES ('446', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-26 17:10:20');
INSERT INTO `system_log` VALUES ('447', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-05-26 17:10:55');
INSERT INTO `system_log` VALUES ('448', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-26 17:12:23');
INSERT INTO `system_log` VALUES ('449', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-05-26 17:12:48');
INSERT INTO `system_log` VALUES ('450', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-26 17:15:20');
INSERT INTO `system_log` VALUES ('451', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hjh123', '2021-05-26 17:23:55');
INSERT INTO `system_log` VALUES ('452', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'hcx123', '2021-05-26 17:24:45');
INSERT INTO `system_log` VALUES ('453', 'admin/login/index', '::1', '系统管理', '用户登录系统后台成功', 'admin', '2021-05-26 17:25:00');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `node` varchar(200) DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_menu_node` (`node`(191)) USING BTREE,
  KEY `idx_system_menu_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COMMENT='系统-菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '后台首页', '', '', 'admin/index/main', '', '_self', '500', '0', '2018-09-05 17:59:38');
INSERT INTO `system_menu` VALUES ('2', '0', '系统管理', '', '', '#', '', '_self', '100', '1', '2018-09-05 18:04:52');
INSERT INTO `system_menu` VALUES ('3', '4', '系统菜单管理', '', 'layui-icon layui-icon-layouts', 'admin/menu/index', '', '_self', '1', '1', '2018-09-05 18:05:26');
INSERT INTO `system_menu` VALUES ('4', '2', '系统配置', '', '', '#', '', '_self', '20', '1', '2018-09-05 18:07:17');
INSERT INTO `system_menu` VALUES ('5', '12', '系统用户管理', '', 'layui-icon layui-icon-username', 'admin/user/index', '', '_self', '1', '1', '2018-09-06 11:10:42');
INSERT INTO `system_menu` VALUES ('7', '12', '访问权限管理', '', 'layui-icon layui-icon-vercode', 'admin/auth/index', '', '_self', '2', '1', '2018-09-06 15:17:14');
INSERT INTO `system_menu` VALUES ('11', '4', '系统参数配置', '', 'layui-icon layui-icon-set', 'admin/config/info', '', '_self', '4', '1', '2018-09-06 16:43:47');
INSERT INTO `system_menu` VALUES ('12', '2', '权限管理', '', '', '#', '', '_self', '10', '1', '2018-09-06 18:01:31');
INSERT INTO `system_menu` VALUES ('13', '0', '商城管理', '', '', '#', '', '_self', '400', '0', '2018-10-12 13:56:29');
INSERT INTO `system_menu` VALUES ('16', '0', '微信管理', '', '', '#', '', '_self', '300', '0', '2018-10-31 15:15:27');
INSERT INTO `system_menu` VALUES ('17', '16', '微信管理', '', '', '#', '', '_self', '20', '0', '2018-10-31 15:16:46');
INSERT INTO `system_menu` VALUES ('18', '17', '微信授权配置', '', 'layui-icon layui-icon-set', 'wechat/config/options', '', '_self', '2', '0', '2018-10-31 15:17:11');
INSERT INTO `system_menu` VALUES ('19', '17', '微信支付配置', '', 'layui-icon layui-icon-rmb', 'wechat/config/payment', '', '_self', '1', '0', '2018-10-31 18:28:09');
INSERT INTO `system_menu` VALUES ('27', '4', '系统任务管理', '', 'layui-icon layui-icon-log', 'admin/queue/index', '', '_self', '3', '1', '2018-11-29 11:13:34');
INSERT INTO `system_menu` VALUES ('45', '47', '商城参数配置', '', 'layui-icon layui-icon-set', 'store/config/index', '', '_self', '5', '0', '2019-01-24 16:47:33');
INSERT INTO `system_menu` VALUES ('46', '47', '短信发送记录', '', 'layui-icon layui-icon-console', 'store/message/index', '', '_self', '4', '0', '2019-01-24 18:09:58');
INSERT INTO `system_menu` VALUES ('47', '13', '商城配置', '', '', '#', '', '_self', '20', '0', '2019-01-25 16:47:49');
INSERT INTO `system_menu` VALUES ('49', '4', '系统日志管理', '', 'layui-icon layui-icon-form', 'admin/oplog/index', '', '_self', '2', '1', '2019-02-18 12:56:56');
INSERT INTO `system_menu` VALUES ('62', '0', '小程序API', '', '', '#', '', '_self', '50', '1', '2020-11-25 19:59:42');
INSERT INTO `system_menu` VALUES ('78', '62', '用户信息', '', 'layui-icon layui-icon-login-wechat', 'wechatpunchin/alluser/index', '', '_self', '0', '1', '2021-03-23 09:52:39');
INSERT INTO `system_menu` VALUES ('85', '62', '影院管理员', '', 'layui-icon layui-icon-username', 'wechatpunchin/alladministrators/index', '', '_self', '0', '1', '2021-04-13 20:48:13');
INSERT INTO `system_menu` VALUES ('86', '62', '公告栏管理', '', 'fa fa-bullhorn', 'wechatpunchin/allannouncement/index', '', '_self', '0', '0', '2021-04-14 13:13:11');
INSERT INTO `system_menu` VALUES ('87', '62', '问卷调查管理', '', 'fa fa-check-square-o', 'wechatpunchin/allevaluation/index', '', '_self', '0', '0', '2021-04-14 13:56:43');
INSERT INTO `system_menu` VALUES ('88', '62', '意见反馈管理', '', 'layui-icon layui-icon-help', 'wechatpunchin/allopinion/index', '', '_self', '0', '0', '2021-04-14 14:50:26');
INSERT INTO `system_menu` VALUES ('89', '62', '物业报修管理', '', 'layui-icon layui-icon-close-fill', 'wechatpunchin/allitems/index', '', '_self', '0', '0', '2021-04-14 16:37:02');
INSERT INTO `system_menu` VALUES ('90', '62', '物业缴费管理', '', 'fa fa-jpy', 'wechatpunchin/allpay/index', '', '_self', '0', '0', '2021-04-15 09:46:54');
INSERT INTO `system_menu` VALUES ('91', '62', '疫情登记管理', '', 'fa fa-briefcase', 'wechatpunchin/allreport/index', '', '_self', '0', '0', '2021-04-15 10:39:17');
INSERT INTO `system_menu` VALUES ('92', '62', '打卡记录', '', 'fa fa-calendar-check-o', 'wechatpunchin/allpunchin/index', '', '_self', '0', '0', '2021-04-15 12:48:03');
INSERT INTO `system_menu` VALUES ('93', '62', '留言板', '', 'layui-icon layui-icon-survey', 'wechatpunchin/allmessageboard/index', '', '_self', '0', '0', '2021-04-15 12:49:02');
INSERT INTO `system_menu` VALUES ('94', '62', '老师管理', '', 'fa fa-user', 'wechatpunchin/allteacher/index', '', '_self', '0', '0', '2021-04-15 12:50:34');
INSERT INTO `system_menu` VALUES ('95', '62', '课程管理', '', 'layui-icon layui-icon-table', 'wechatpunchin/allcourse/index', '', '_self', '0', '0', '2021-04-15 12:51:18');
INSERT INTO `system_menu` VALUES ('96', '62', '已选课程', '', 'fa fa-check-square-o', 'wechatpunchin/allcourseorder/index', '', '_self', '0', '0', '2021-04-15 12:52:18');
INSERT INTO `system_menu` VALUES ('97', '62', '添加电影', '', 'layui-icon layui-icon-video', 'wechatpunchin/allmovie/index', '', '_self', '0', '1', '2021-04-15 16:43:32');
INSERT INTO `system_menu` VALUES ('98', '62', '演员添加', '', 'layui-icon layui-icon-user', 'wechatpunchin/allmovieactor/index', '', '_self', '0', '1', '2021-04-16 10:19:27');
INSERT INTO `system_menu` VALUES ('99', '62', '电影影评', '', 'fa fa-comment-o', 'wechatpunchin/allmessage/index', '', '_self', '0', '1', '2021-04-19 14:02:52');
INSERT INTO `system_menu` VALUES ('100', '62', '订单管理', '', 'fa fa-check', 'wechatpunchin/allorder/index', '', '_self', '0', '1', '2021-04-19 15:20:10');
INSERT INTO `system_menu` VALUES ('101', '62', '播放场次', '', 'layui-icon layui-icon-form', 'wechatpunchin/allsingin/index', '', '_self', '0', '1', '2021-04-21 09:13:20');
INSERT INTO `system_menu` VALUES ('102', '62', '电影资讯', '', '', 'wechatpunchin/allinformation/index', '', '_self', '0', '1', '2021-05-15 19:34:34');
INSERT INTO `system_menu` VALUES ('103', '62', '行业新闻', '', 'layui-icon layui-icon-date', 'wechatpunchin/all_news/index', '', '_self', '0', '1', '2021-05-15 19:35:15');
INSERT INTO `system_menu` VALUES ('104', '62', '预售电影', '', 'layui-icon layui-icon-notice', 'wechatpunchin/allnearmovie/index', '', '_self', '0', '1', '2021-05-25 09:27:59');

-- ----------------------------
-- Table structure for system_queue
-- ----------------------------
DROP TABLE IF EXISTS `system_queue`;
CREATE TABLE `system_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `data` longtext NOT NULL COMMENT '执行参数',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `preload` varchar(500) DEFAULT '' COMMENT '执行内容',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `double` tinyint(1) DEFAULT '1' COMMENT '单例模式',
  `desc` varchar(500) DEFAULT '' COMMENT '状态描述',
  `start_at` varchar(20) DEFAULT '' COMMENT '开始时间',
  `end_at` varchar(20) DEFAULT '' COMMENT '结束时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_queue_double` (`double`) USING BTREE,
  KEY `idx_system_queue_time` (`time`) USING BTREE,
  KEY `idx_system_queue_title` (`title`) USING BTREE,
  KEY `idx_system_queue_create_at` (`create_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-任务';

-- ----------------------------
-- Records of system_queue
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `tags` varchar(255) DEFAULT '' COMMENT '用户标签',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_user_username` (`username`) USING BTREE,
  KEY `idx_system_user_status` (`status`) USING BTREE,
  KEY `idx_system_user_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8mb4 COMMENT='系统-用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('10000', 'admin', '21232f297a57a5a743894a0e4a801fc3', '22222222', '', '', '2021-05-26 17:25:00', '::1', '973', '', '', '', '1', '0', '2015-11-13 15:14:22');
INSERT INTO `system_user` VALUES ('10025', 'hjh123', 'f4d2af730c7299015a9fc9bb405661cf', '', '', '13751264512', '2021-04-16 14:36:12', '::1', '10', '1', '', '', '1', '1', '2021-03-29 15:16:07');
INSERT INTO `system_user` VALUES ('10026', 'hjh123', 'f4d2af730c7299015a9fc9bb405661cf', '', '', '13542002644', '2021-04-16 14:42:46', '::1', '2', '1', '', '', '1', '1', '2021-04-16 14:37:56');
INSERT INTO `system_user` VALUES ('10027', 'hjh123', 'f4d2af730c7299015a9fc9bb405661cf', '', '', '13785664220', '2021-05-26 17:23:55', '::1', '24', '1', '', '', '1', '0', '2021-04-16 14:44:14');
INSERT INTO `system_user` VALUES ('10028', 'hcx123', '8316464f7432b92c6bb370316be75cfc', '', '', '13542002644', '2021-05-26 17:24:45', '::1', '14', '1', '', '', '1', '0', '2021-04-16 14:50:16');
INSERT INTO `system_user` VALUES ('10029', 'nyf1', '480ecb0c5b9350c8b9fc0575f71512a6', '', '', '15225512871', null, '', '0', '1', '', '', '1', '0', '2021-05-20 15:24:42');
INSERT INTO `system_user` VALUES ('10030', 'niu120', '6f4739602b45a6584c997c1c2fc20c4d', '', '', '15225512871', '2021-05-20 15:49:31', '127.0.0.1', '2', '1', '', '', '1', '0', '2021-05-20 15:27:42');

-- ----------------------------
-- Table structure for test_class
-- ----------------------------
DROP TABLE IF EXISTS `test_class`;
CREATE TABLE `test_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of test_class
-- ----------------------------
INSERT INTO `test_class` VALUES ('1', 'hjh', '19');
INSERT INTO `test_class` VALUES ('2', 'hzs', '211');
INSERT INTO `test_class` VALUES ('3', 'ggdf', '19');

-- ----------------------------
-- Table structure for wechatsamll_administrators
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_administrators`;
CREATE TABLE `wechatsamll_administrators` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `cinemaname` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `cinemaaddress` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_administrators
-- ----------------------------
INSERT INTO `wechatsamll_administrators` VALUES ('1', 'Jackie', '13785664220', '奥斯卡影城', '郑州市二七区二七广场', null);
INSERT INTO `wechatsamll_administrators` VALUES ('11', '牛云飞', '15225512871', '奥斯卡', '河南省洛阳市', '2021-05-20 15:22:58');
INSERT INTO `wechatsamll_administrators` VALUES ('3', '黄希儿', '13542002644', '万达影城', '中原区中原路146号', null);

-- ----------------------------
-- Table structure for wechatsamll_announcement
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_announcement`;
CREATE TABLE `wechatsamll_announcement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_announcement
-- ----------------------------
INSERT INTO `wechatsamll_announcement` VALUES ('1', '4月14号春节，全场商品买一送一全场商品买一送一全场商品买一送一', '2021-04-14 13:34:55');
INSERT INTO `wechatsamll_announcement` VALUES ('2', '4月15号，全场打五折', '2021-04-14 13:20:01');

-- ----------------------------
-- Table structure for wechatsamll_courseorder
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_courseorder`;
CREATE TABLE `wechatsamll_courseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `coursename` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `teachername` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `classtime` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `classaddress` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `classcredit` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_courseorder
-- ----------------------------
INSERT INTO `wechatsamll_courseorder` VALUES ('18', '2', 'Jackie', '6', '测试测测试', '1', '黄导师', '星期二 3、4节', '教学楼445', '10', '2021-03-31 09:52:34', '2021-03-31 09:52:58');
INSERT INTO `wechatsamll_courseorder` VALUES ('17', '2', 'Jackie', '5', '测试课程', '1', '黄导师', '星期五 5、6节', '教学楼456', '6', '2021-03-31 09:49:07', '2021-03-31 09:49:27');
INSERT INTO `wechatsamll_courseorder` VALUES ('16', '2', 'Jackie', '4', '第一行代码', '1', '黄导师', '星期一 1、2节', '教学楼123', '5', '2021-03-29 15:55:13', '2021-03-31 08:56:03');
INSERT INTO `wechatsamll_courseorder` VALUES ('15', '2', 'Jackie', '1', 'Java高级程序设计', '1', '黄导师', '星期四 5、6节', '天宫楼341', '3', '2021-03-29 11:33:07', '2021-03-31 08:55:53');

-- ----------------------------
-- Table structure for wechatsamll_courseselection
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_courseselection`;
CREATE TABLE `wechatsamll_courseselection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `teachername` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `classtime` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `classaddress` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `classcredit` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `uptate_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_courseselection
-- ----------------------------
INSERT INTO `wechatsamll_courseselection` VALUES ('1', 'Java高级程序设计', '1', '黄导师', '星期四 5、6节', '天宫楼341', '3', '2021-03-29 11:33:07', '2021-03-29 11:33:07');
INSERT INTO `wechatsamll_courseselection` VALUES ('4', '第一行代码', '1', '黄导师', '星期一 1、2节', '教学楼123', '5', '2021-03-29 15:55:13', '2021-03-29 15:55:13');
INSERT INTO `wechatsamll_courseselection` VALUES ('5', '测试课程', '1', '黄导师', '星期五 5、6节', '教学楼456', '6', '2021-03-31 09:49:07', '2021-03-31 09:49:07');
INSERT INTO `wechatsamll_courseselection` VALUES ('6', '测试测测试', '1', '黄导师', '星期二 3、4节', '教学楼445', '10', '2021-03-31 09:52:34', '2021-03-31 09:52:34');

-- ----------------------------
-- Table structure for wechatsamll_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_evaluation`;
CREATE TABLE `wechatsamll_evaluation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_evaluation
-- ----------------------------
INSERT INTO `wechatsamll_evaluation` VALUES ('1', 'Jackie', '非常满意', '2021-04-14 13:59:57');
INSERT INTO `wechatsamll_evaluation` VALUES ('2', 'Jackie', '非常满意', '2021-04-14 14:33:40');
INSERT INTO `wechatsamll_evaluation` VALUES ('3', 'Jackie', '很不满意', '2021-04-14 14:35:25');
INSERT INTO `wechatsamll_evaluation` VALUES ('7', 'Jackie', '比较一般', '2021-04-14 15:12:40');
INSERT INTO `wechatsamll_evaluation` VALUES ('6', 'Jackie', '非常满意', '2021-04-14 14:40:52');
INSERT INTO `wechatsamll_evaluation` VALUES ('8', 'Jackie', '非常满意', '2021-04-15 10:51:41');

-- ----------------------------
-- Table structure for wechatsamll_information
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_information`;
CREATE TABLE `wechatsamll_information` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(255) DEFAULT NULL,
  `content` varchar(2550) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wechatsamll_information
-- ----------------------------
INSERT INTO `wechatsamll_information` VALUES ('1', '特斯拉：已在中国建立数据中心，以实现数据存储本地化', '据@特斯拉 25日晚消息，特斯拉很荣幸与业内专家就《汽车数据安全管理若干规定（征求意见稿）》展开研商，我们坚定支持行业的规范化发展。  我们已经在中国建立数据中心，以实现数据存储本地化，并将陆续增加更多本地数据中心。所有在中国大陆市场销售车辆所产生的数据，都将存储在境内。  同时，我们将向车主开放车辆信息查询平台。此项工作正在紧锣密鼓地进行中，详情及进展将陆续向大家汇报。感谢各位车主的支持，我们会努力不断提升用户体验。  汽车数据安全非常重要，我们坚信，统一规范管理，将更有利于智能汽车的有序长远发展。特斯拉将尽一切努力来贯彻执行汽车数据安全管理工作，确保数据安全。感谢大家！', 'http://localhost:8080/upload/c4088f0894e06a8a/475d38dd02a533e3.jpg', '2021-05-26 14:24:42');
INSERT INTO `wechatsamll_information` VALUES ('3', '白银最后一位退赛选手：跑到晚上8点40分才被拦下', '在黄河石林越野赛悲剧发生三天之后，一段来自赛事摄像师的视频流出：下午4点左右，一位女选手扛过了最恶劣的路段和天气，抵达CP4站点，她显然累坏了，大口吃着站点的补给品。  这位女选手是来自重庆的郭玉婷，在抵达CP4站点后，她本想退出比赛，但在一句“加油”的鼓励下，她选择了继续向前。那时候郭玉婷还不知道，一同来参赛的两个朋友已经遭遇不测。  郭玉婷是这次黄河石林越野赛最后一位退赛选手，直到晚上8点40分，她才被人拦下了奔跑的脚步，被告知这场比赛已经在悲剧中戛然而止。  以下内容根据郭玉婷口述整理。', 'http://localhost:8080/upload/e14f745ac352cfa2/0350339196b7eefa.jpg', '2021-05-26 14:22:54');
INSERT INTO `wechatsamll_information` VALUES ('4', '华谊兄弟：冯小刚等已按期支付完成1.68亿元业绩补偿', '5月24日消息，华谊兄弟发布关于浙江东阳美拉传媒有限公司2020年度业绩承诺补偿完成的公告。  公告显示，根据华谊兄弟与浙江东阳美拉传媒有限公司及老股东冯小刚和陆国强（以下统称“老股东”） 签署的《股权转让协议》，若老股东在业绩承诺期内未能完成某个年度的“业绩目标”， 则老股东同意于该年度的审计报告出具之日起30个工作日内，以现金的方式（或目标公司认可的其他方式）补足目标公司未完成的该年度业绩目标之差额部分。  根据《股权转让协议》约定，2020年度承诺的业绩目标为经审计的税后净利润不低于人民币17,490.06万元。2020年，受到新冠疫情的影响，浙江东阳美拉传媒有限公司的项目进度在一定程度上受到延迟，未能完成业绩目标，按照业绩目标与实现的业绩差额，应补偿金额为16,804.29万元。截至本公告日，老股东已根据协议约定，以现金的方式按期支付完成业绩补偿。', 'http://localhost:8080/upload/284ed1f060538497/4e9cf336813e3d03.jpg', '2021-05-26 14:25:24');
INSERT INTO `wechatsamll_information` VALUES ('5', '俄罗斯总统普京与美国总统拜登将于6月16日举行会晤', '克里姆林宫官方网站当地时间5月25日发布公告称，俄罗斯总统普京与美国总统拜登将于6月16日在瑞士日内瓦举行会晤。  两国元首将讨论俄美关系的现状和发展前景、战略稳定问题，以及合作抗击新冠疫情和解决地区冲突等重大国际问题。  另据白宫消息，两国领导人“将讨论所有紧迫的问题，因为我们寻求恢复美俄关系的可预测性和稳定性”。这也将是自拜登担任美国总统以来，美俄两国领导人首次展开面对面会晤。（总台记者 王斌 宋瑶 许弢）', 'http://localhost:8080/upload/406868a5cbb2c748/70373dc907ee94e1.jpg', '2021-05-26 14:25:43');
INSERT INTO `wechatsamll_information` VALUES ('6', '二五i群殴大家来看什么奶粉看来你的看法', '三家镇农业服务中心一名陈姓主任告诉澎湃新闻，当地35头大牛和7头小牛被雷电劈死。目前，农户为减少损失在卖牛。  网传视频显示，数十头牛倒在地上，身体僵直，地上有血迹。  据东方市气象台5月24日15时许发布的雷雨大风黄色预警信号：该市已经出现雷雨大风天气，风力7-9级并伴有强雷电且将持续，请有关单位和人员做好防范工作。  5月25日，中央气象台转发相关报道称，雷雨天气户外很不安全，牛棚也应该考虑安装防雷设施。', 'http://localhost:8080/upload/e22e723282ffa15e/ee7408499b1b7336.jpg', '2021-05-26 17:20:16');

-- ----------------------------
-- Table structure for wechatsamll_items
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_items`;
CREATE TABLE `wechatsamll_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `items` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_items
-- ----------------------------
INSERT INTO `wechatsamll_items` VALUES ('1', 'Jackie', '2', '空调', '空调没有雪种了，好热啊！', '2021-04-14 16:37:53');
INSERT INTO `wechatsamll_items` VALUES ('2', 'Jackie', '2', '灯', '的躲得掉', '2021-04-14 17:10:50');
INSERT INTO `wechatsamll_items` VALUES ('3', 'Jackie', '2', '墙面', '墙很黑', '2021-04-15 08:42:27');
INSERT INTO `wechatsamll_items` VALUES ('4', 'Jackie', '2', '下水道', '下水道堵住啦', '2021-04-15 10:50:09');

-- ----------------------------
-- Table structure for wechatsamll_message
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_message`;
CREATE TABLE `wechatsamll_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `movieid` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_message
-- ----------------------------
INSERT INTO `wechatsamll_message` VALUES ('1', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '第一条评论', '1', '2021-04-19 13:54:22');
INSERT INTO `wechatsamll_message` VALUES ('2', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '第二条评论', '1', '2021-04-20 10:31:14');
INSERT INTO `wechatsamll_message` VALUES ('3', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '第三条评论', '1', '2021-04-20 10:31:19');
INSERT INTO `wechatsamll_message` VALUES ('4', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '第四条评论', '1', '2021-04-20 10:31:21');
INSERT INTO `wechatsamll_message` VALUES ('5', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '第五条评论', '1', '2021-04-20 10:31:23');
INSERT INTO `wechatsamll_message` VALUES ('6', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', 'dsadasd', '1', '2021-04-20 14:05:06');
INSERT INTO `wechatsamll_message` VALUES ('7', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', 'aaaaaa', '1', '2021-04-20 14:05:41');
INSERT INTO `wechatsamll_message` VALUES ('8', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', 'w', '1', '2021-04-20 14:06:57');
INSERT INTO `wechatsamll_message` VALUES ('9', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', 'wwwqqq', '1', '2021-04-20 14:08:35');
INSERT INTO `wechatsamll_message` VALUES ('10', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', 'q', '5', '2021-04-20 14:08:52');
INSERT INTO `wechatsamll_message` VALUES ('11', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '5555', '8', '2021-04-20 14:09:42');
INSERT INTO `wechatsamll_message` VALUES ('12', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '你好呀', '1', '2021-04-20 17:00:12');
INSERT INTO `wechatsamll_message` VALUES ('13', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '哇哇哇哇', '1', '2021-04-20 17:00:23');
INSERT INTO `wechatsamll_message` VALUES ('14', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '陈曦真笨\n', '1', '2021-04-21 17:35:00');
INSERT INTO `wechatsamll_message` VALUES ('15', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '111', '7', '2021-04-22 10:46:13');
INSERT INTO `wechatsamll_message` VALUES ('16', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '哥斯拉', '10', '2021-04-22 11:24:28');
INSERT INTO `wechatsamll_message` VALUES ('17', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '123', '1', '2021-04-23 17:17:42');
INSERT INTO `wechatsamll_message` VALUES ('18', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '坚守', '20', '2021-04-25 08:59:54');
INSERT INTO `wechatsamll_message` VALUES ('19', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '测试评论功能', '1', '2021-04-28 08:44:38');
INSERT INTO `wechatsamll_message` VALUES ('20', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '测试影评功能', '20', '2021-05-06 14:16:13');
INSERT INTO `wechatsamll_message` VALUES ('23', '2', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '20', '2021-05-10 17:59:59');
INSERT INTO `wechatsamll_message` VALUES ('24', '2', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '20', '2021-05-11 10:05:20');
INSERT INTO `wechatsamll_message` VALUES ('25', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '123', '1', '2021-05-11 10:42:34');
INSERT INTO `wechatsamll_message` VALUES ('26', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 11:26:15');
INSERT INTO `wechatsamll_message` VALUES ('27', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 11:26:54');
INSERT INTO `wechatsamll_message` VALUES ('28', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 11:26:57');
INSERT INTO `wechatsamll_message` VALUES ('29', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 11:29:28');
INSERT INTO `wechatsamll_message` VALUES ('30', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:19:25');
INSERT INTO `wechatsamll_message` VALUES ('31', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:23:31');
INSERT INTO `wechatsamll_message` VALUES ('32', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:24:32');
INSERT INTO `wechatsamll_message` VALUES ('33', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:24:35');
INSERT INTO `wechatsamll_message` VALUES ('34', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:25:39');
INSERT INTO `wechatsamll_message` VALUES ('35', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:27:25');
INSERT INTO `wechatsamll_message` VALUES ('36', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:28:07');
INSERT INTO `wechatsamll_message` VALUES ('37', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:28:25');
INSERT INTO `wechatsamll_message` VALUES ('38', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:28:38');
INSERT INTO `wechatsamll_message` VALUES ('39', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:28:48');
INSERT INTO `wechatsamll_message` VALUES ('40', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:33:50');
INSERT INTO `wechatsamll_message` VALUES ('41', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:34:58');
INSERT INTO `wechatsamll_message` VALUES ('42', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:38:20');
INSERT INTO `wechatsamll_message` VALUES ('43', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:38:59');
INSERT INTO `wechatsamll_message` VALUES ('44', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'web电影影评', '1', '2021-05-11 14:39:33');
INSERT INTO `wechatsamll_message` VALUES ('45', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'qweqwe', '1', '2021-05-11 14:41:44');
INSERT INTO `wechatsamll_message` VALUES ('46', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '是一部不错的电影', '1', '2021-05-11 14:43:58');
INSERT INTO `wechatsamll_message` VALUES ('47', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '不错子', '1', '2021-05-11 14:44:52');
INSERT INTO `wechatsamll_message` VALUES ('48', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '黄文元sb', '1', '2021-05-11 17:17:41');
INSERT INTO `wechatsamll_message` VALUES ('49', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '好看子', '1', '2021-05-11 17:36:21');
INSERT INTO `wechatsamll_message` VALUES ('50', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '哎呦不错哦', '20', '2021-05-11 17:36:44');
INSERT INTO `wechatsamll_message` VALUES ('51', '15', 'hjh', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '好好看！', '1', '2021-05-11 20:53:39');
INSERT INTO `wechatsamll_message` VALUES ('52', '14', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '真不错呀', '1', '2021-05-12 14:52:49');
INSERT INTO `wechatsamll_message` VALUES ('53', '20', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'bjkh', '1', '2021-05-12 19:56:27');
INSERT INTO `wechatsamll_message` VALUES ('54', '20', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '不错', '1', '2021-05-12 20:05:05');
INSERT INTO `wechatsamll_message` VALUES ('55', '20', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '好看', '1', '2021-05-12 20:06:48');
INSERT INTO `wechatsamll_message` VALUES ('56', '20', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '好看', '23', '2021-05-12 20:09:43');
INSERT INTO `wechatsamll_message` VALUES ('57', '20', 'Jackie', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '好看', '23', '2021-05-12 20:09:44');
INSERT INTO `wechatsamll_message` VALUES ('58', '14', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '第一！！！', '21', '2021-05-14 14:29:18');
INSERT INTO `wechatsamll_message` VALUES ('59', '14', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', 'haoka', '1', '2021-05-14 14:34:58');
INSERT INTO `wechatsamll_message` VALUES ('60', '14', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '不错', '10', '2021-05-14 14:36:18');
INSERT INTO `wechatsamll_message` VALUES ('61', '14', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '想看', '10', '2021-05-14 17:08:25');
INSERT INTO `wechatsamll_message` VALUES ('63', '20', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuRVkzOMxNIsicIfzbUOToYGA/132', '这电影预售的怎么样', '5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', '2021-05-25 10:34:32');
INSERT INTO `wechatsamll_message` VALUES ('64', '20', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuRVkzOMxNIsicIfzbUOToYGA/132', '这是预售评论', '360ca092-bd09-11eb-b5e8-a08cfdc101f8', '2021-05-25 11:28:53');
INSERT INTO `wechatsamll_message` VALUES ('65', '27', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '挺好看的', '5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', '2021-05-27 09:07:15');
INSERT INTO `wechatsamll_message` VALUES ('66', '27', 'hcx', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '123', '1', '2021-05-27 15:10:01');
INSERT INTO `wechatsamll_message` VALUES ('67', null, 'nyf', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '你好，啦啦啦', '360ca092-bd09-11eb-b5e8-a08cfdc101f8', '2021-05-30 17:57:04');
INSERT INTO `wechatsamll_message` VALUES ('68', null, 'nyf', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '啦啦啦', '1', '2021-05-30 17:57:34');
INSERT INTO `wechatsamll_message` VALUES ('69', null, 'nyf', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '啦啦啦', '1', '2021-05-30 17:57:36');
INSERT INTO `wechatsamll_message` VALUES ('70', null, 'niu120', 'http://localhost:8080/upload/a14d61f34b317c55/72ac23f5a395aed4.jpg', '啦啦啦', '1', '2021-05-30 17:59:43');

-- ----------------------------
-- Table structure for wechatsamll_movie
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_movie`;
CREATE TABLE `wechatsamll_movie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `introduction` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `lead` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `score` varchar(11) COLLATE utf8_croatian_ci DEFAULT NULL,
  `showtime` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `buynumber` int(255) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_movie
-- ----------------------------
INSERT INTO `wechatsamll_movie` VALUES ('1', '五亿探长雷洛传1:雷老虎', 'http://localhost:8080/upload/2162135cbc2ecbfc/5af7eaef8bad1a1f.png', '惊悚,动作,爱情', '雷洛初到香港,因为学识不多,决定加入警队为生.老警官陈统慧眼识英雄,于是对雷洛亦师亦友,更提拔他为探长.雷洛出道时一身傲骨,并不同流合污,没想到却成为众矢之的.在陈统的寿宴上,雷洛得罪了上司颜同,并与之成为死对头.不久,在一次扫黄行动中,雷洛又逮捕了颜同的舅舅,并将其送入监狱.令颜同面子尽失,颜同随即命令陈统自动退休,更将雷洛调至了偏远的山村,以报私仇……', '中国香港/127分钟', '刘德华,张学友,陈曦', '9.7', '1991-09-19上线', '28', '9号厅（大）', '英语3D', '2', '2021-05-28 11:11:20');
INSERT INTO `wechatsamll_movie` VALUES ('23', '欢乐好声音', 'http://localhost:8080/upload/f39d3df8391ab2f8/49ef89de803645b2.png', '战争,剧情,喜剧', '1934年，主⼒红军战略转移，留下三万多伤病员和留守红军。他们怀着坚定的信念，抱着必死的准备，坚守在⽩⾊恐怖中。完成中央交给的任务。主⼈公罗屏汉、张瑾瑜夫妇为了坚守苏区保护中央 分局的安全，带领留守红军坚持了三年南⽅游击战争，最后为⾰命事业双双壮烈牺牲。', '中国大陆 / 105分钟', '王辉,末尾', '8.8', '2021-04-23中国大陆上映', '25', '2号厅（大）', '国语2D', '1', '2021-05-26 16:52:49');
INSERT INTO `wechatsamll_movie` VALUES ('10', '哥斯拉大战金刚', 'http://localhost:8080/upload/9f352c75df215dc7/cd2f933f8cced394.png', '动作,冒险,科幻', '影片中，这两位宛如神衹一般强大的对手于一场壮观的战争中相遇，彼时世界命运正悬于一线。为了找到真正的家园，金刚与他的保护者们踏上了一次艰难的旅程。与他们一道前行的还有一个年轻的孤儿女孩——吉雅，这个女孩与金刚之间存在着一种独特而强大的紧密联系。但意想不到的是，他们在前行的航道上与愤怒的哥斯拉狭路相逢，也由此在全球引起了一系列破坏。一股无形的力量造成了这两只巨兽之间的巨大冲突，深藏在地心深处的奥秘也由此揭开。', '美国 / 113分钟', '亚当·温加德,亚历山大·斯', '8.5', '2021-03-26 中国大陆上映', '36', '8号厅（IMAX）', '英语3D', '2', '2021-05-28 08:47:54');
INSERT INTO `wechatsamll_movie` VALUES ('22', '乘风破浪', 'http://localhost:8080/upload/684dc939d09e5055/b7f53bfa3091c941.png', '动画,动作,奇幻 ', '改编自J • R • R •托尔金的史诗巨著，在《指环王：双塔奇兵》中，弗罗多·巴金斯和其他“护戒使者”联盟的成员为了熔毁至尊戒而兵分两路，继续着艰难险阻的中土世界护戒之旅。两支小分队的命运都与双塔紧密联系——一塔是被腐败堕落的巫师萨茹曼占据的位于艾森加德的欧尔桑克塔，另一塔则是黑暗魔君索隆的堡垒，位于巴拉督尔要塞的黑暗之地魔多。弗罗多与朋友们要承担巨大的风险，才有可能扭转乾坤。', '新西兰 / 180分钟', '杰克逊,伍德', '8.2', '2021-04-23中国大陆重映', '34', '3号厅-4DX', '英语2D', '1', '2021-05-26 17:14:05');
INSERT INTO `wechatsamll_movie` VALUES ('21', '极限特工', 'http://localhost:8080/upload/5694aeba496dd6a0/b032f92b7ca72043.png', '动作,恐怖,犯罪', '战斗中负伤而下身瘫痪的前海军战士杰克·萨利（萨姆·沃辛顿 饰）决定替死去的同胞哥哥到潘多拉星控操纵格蕾丝博士（西格妮·韦弗 饰）用人类基因与当地纳美部族基因结合创造出的“阿凡达“混血生物。”杰克的目的是打入纳美部落，外交说服他们自愿离开世代居住的家园，从而SecFor公司可砍伐殆尽该地区的原始森林，开采地下昂贵的“不可得”矿。在探索潘多拉星的过程中，杰克遇到了纳美部落的公主娜蒂瑞（佐伊·索尔达娜饰），向她学习了纳美人的生存技能与对待自然的态度。与此同时，SecFor公司的经理和军方代表上校迈尔斯', '英国 / 162分钟', '詹姆斯,佛兰,米切尔', '8.9', '2010-01-04中国大陆上映', '25', '8号厅（大）', '英语2D', '1', '2021-05-27 14:32:47');
INSERT INTO `wechatsamll_movie` VALUES ('20', '生死坚守', 'http://localhost:8080/upload/1d7869cfdd2ea521/2c300899e1b0da3c.png', '战争,剧情,动作', '1934年，主⼒红军战略转移，留下三万多伤病员和留守红军。他们怀着坚定的信念，抱着必死的准备，坚守在⽩⾊恐怖中。完成中央交给的任务。主⼈公罗屏汉、张瑾瑜夫妇为了坚守苏区保护中央 分局的安全，带领留守红军坚持了三年南⽅游击战争，最后为⾰命事业双双壮烈牺牲。', '中国大陆 / 105分钟', '王霙,郑奇,王艺禅', '8.4', '2021-04-23中国大陆上映', '32', '6号厅（大）', '国语2D', '1', '2021-05-27 14:31:47');

-- ----------------------------
-- Table structure for wechatsamll_movieactor
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_movieactor`;
CREATE TABLE `wechatsamll_movieactor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `moviename` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `movieid` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_movieactor
-- ----------------------------
INSERT INTO `wechatsamll_movieactor` VALUES ('15', '帕克森里', 'http://localhost:8080/upload/b3ae707b17783e2b/e07078674f58bca8.jpg', '查尔斯·泽勒', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:24:08');
INSERT INTO `wechatsamll_movieactor` VALUES ('16', '大弗里德曼', 'http://localhost:8080/upload/d88d6419f54203a4/97e24b30b51ba543.jpg', '劳拉·金尼', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:42');
INSERT INTO `wechatsamll_movieactor` VALUES ('13', '詹姆斯·曼德森', 'http://localhost:8080/upload/6a7e042e7637c741/0627cf5839d92807.jpg', '导演', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:05');
INSERT INTO `wechatsamll_movieactor` VALUES ('25', '克劳瑞丝', 'http://localhost:8080/upload/d88d6419f54203a4/97e24b30b51ba543.jpg', '导演', '哥斯拉大战金刚', '10', '2021-04-22 11:22:19');
INSERT INTO `wechatsamll_movieactor` VALUES ('14', '休·杰克曼', 'http://localhost:8080/upload/3f450d2dec1a35f3/1920d854c41f4f07.jpg', '罗根/金刚侠', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:33');
INSERT INTO `wechatsamll_movieactor` VALUES ('17', '波伊森·霍华德', 'http://localhost:8080/upload/f3bf33204ab95fdc/6efff45a26946183.jpg', '唐纳德·里', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:20');
INSERT INTO `wechatsamll_movieactor` VALUES ('18', '帕森斯', 'http://localhost:8080/upload/623c89d6a3526a58/3d6314c1082cc5f4.jpg', '德罗赞·帕特', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:21');
INSERT INTO `wechatsamll_movieactor` VALUES ('19', '亚历桑德拉', 'http://localhost:8080/upload/9e30068c79fd87ef/45adc1b5fa0654f4.jpg', '阿曼达', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:16');
INSERT INTO `wechatsamll_movieactor` VALUES ('20', '安德莉亚', 'http://localhost:8080/upload/ba26a1866a200e11/b3e4ed5495ae5403.jpg', '安吉莉亚', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:11');
INSERT INTO `wechatsamll_movieactor` VALUES ('21', '阿比盖尔', 'http://localhost:8080/upload/1397f60e2a619ad8/dc353a7cab803354.jpg', '艾比', '五亿探长雷洛传1:雷老虎', '1', '2021-04-20 10:23:09');
INSERT INTO `wechatsamll_movieactor` VALUES ('26', '康斯坦斯', 'http://localhost:8080/upload/1397f60e2a619ad8/dc353a7cab803354.jpg', '科拉', '哥斯拉大战金刚', '10', '2021-04-22 11:23:10');
INSERT INTO `wechatsamll_movieactor` VALUES ('27', '夏洛特', 'http://localhost:8080/upload/f3bf33204ab95fdc/6efff45a26946183.jpg', '克里斯蒂娜', '哥斯拉大战金刚', '10', '2021-04-22 11:24:00');
INSERT INTO `wechatsamll_movieactor` VALUES ('28', '科瑞恩', 'http://localhost:8080/upload/b3ae707b17783e2b/e07078674f58bca8.jpg', '戴森', '哥斯拉大战金刚', '10', '2021-04-22 11:25:42');
INSERT INTO `wechatsamll_movieactor` VALUES ('29', '巴泽尔', 'http://localhost:8080/upload/623c89d6a3526a58/3d6314c1082cc5f4.jpg', '巴顿', '哥斯拉大战金刚', '10', '2021-04-22 11:26:59');
INSERT INTO `wechatsamll_movieactor` VALUES ('30', '莫兰', 'http://localhost:8080/upload/6a7e042e7637c741/0627cf5839d92807.jpg', '导演', '欢乐好声音', '23', '2021-04-22 14:45:02');
INSERT INTO `wechatsamll_movieactor` VALUES ('31', '弥斯滴', 'http://localhost:8080/upload/c18ddb97ccb527b0/014fa3d0c02d52c2.jpg', '导演', '乘风破浪', '22', '2021-04-22 14:45:34');
INSERT INTO `wechatsamll_movieactor` VALUES ('32', '无锡', 'http://localhost:8080/upload/ba26a1866a200e11/b3e4ed5495ae5403.jpg', '导演', '极限特工', '21', '2021-04-22 14:45:57');
INSERT INTO `wechatsamll_movieactor` VALUES ('33', '帕克特', 'http://localhost:8080/upload/f3bf33204ab95fdc/6efff45a26946183.jpg', '导演', '生死坚守', '20', '2021-04-22 14:46:40');
INSERT INTO `wechatsamll_movieactor` VALUES ('38', '导演', 'http://localhost:8080/upload/c18ddb97ccb527b0/014fa3d0c02d52c2.jpg', '迪美', '寂静之地2', '5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', '2021-05-25 09:57:46');
INSERT INTO `wechatsamll_movieactor` VALUES ('39', '阿曼达', 'http://localhost:8080/upload/1397f60e2a619ad8/dc353a7cab803354.jpg', '视帝', '寂静之地2', '5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', '2021-05-25 09:58:04');
INSERT INTO `wechatsamll_movieactor` VALUES ('40', '导演', 'http://localhost:8080/upload/f3bf33204ab95fdc/6efff45a26946183.jpg', '安陆府', '龙虎劫之激战归来', '600cae1b-bcf9-11eb-b5e8-a08cfdc101f8', '2021-05-25 09:58:22');
INSERT INTO `wechatsamll_movieactor` VALUES ('41', '帕斯特', 'http://localhost:8080/upload/3f450d2dec1a35f3/1920d854c41f4f07.jpg', '安德玛', '龙虎劫之激战归来', '600cae1b-bcf9-11eb-b5e8-a08cfdc101f8', '2021-05-25 09:59:33');
INSERT INTO `wechatsamll_movieactor` VALUES ('42', '25', 'http://localhost:8080/upload/b3ae707b17783e2b/e07078674f58bca8.jpg', '45', '24724', '360ca092-bd09-11eb-b5e8-a08cfdc101f8', '2021-05-25 11:28:23');

-- ----------------------------
-- Table structure for wechatsamll_nearmovie
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_nearmovie`;
CREATE TABLE `wechatsamll_nearmovie` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `introduction` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `lead` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `score` varchar(11) COLLATE utf8_croatian_ci DEFAULT NULL,
  `showtime` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_nearmovie
-- ----------------------------
INSERT INTO `wechatsamll_nearmovie` VALUES ('360ca092-bd09-11eb-b5e8-a08cfdc101f8', '24724', 'http://localhost:8080/upload/738980ea2fedc9a6/e4a4acbb513587d1.png', '254', '25', '252', '5252', '525', '252', '525', '25', '252', '2021-05-25 11:28:04');
INSERT INTO `wechatsamll_nearmovie` VALUES ('5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', '寂静之地2', 'http://localhost:8080/upload/5694aeba496dd6a0/b032f92b7ca72043.png', '动作,科幻,冒险', '《寂静之地2》故事紧承上一部展开。在丈夫为保护家人牺牲后，伊芙琳（艾米莉·布朗特 饰）不得不独自带着孩子们（米莉森·西蒙斯、诺亚·尤佩 饰）面对全新的生存挑战。他们将被迫离开家园，踏上一段未知的旅途。在无声的世界里，除了要躲避“猎声怪物”的捕杀，铺满细沙的道路尽头还暗藏着新的危机。', '英国 / 162分钟', '詹姆斯,佛兰,米切尔', '8.9', '2010-01-04中国大陆上映', '25', '8号厅（大）', '英语2D', '2021-05-25 09:38:11');
INSERT INTO `wechatsamll_nearmovie` VALUES ('600cae1b-bcf9-11eb-b5e8-a08cfdc101f8', '龙虎劫之激战归来', 'http://localhost:8080/upload/1d7869cfdd2ea521/2c300899e1b0da3c.png', '剧情,动作,犯罪', '该片讲述考古队队长宋少义在寻找宝物的过程中凭借自己的毅力、才智与黑暗势力较量的过程。电影展现了捍卫国家文物的凛然正气和至深的血缘亲情，故事跌宕起伏，结局让人深思。', '中国大陆 / 83分钟', '牟新,成龙,蒋聘婷', '8.4', '2021-05-27中国大陆上映', '45', '6号厅（大）', '国语2D', '2021-05-25 09:37:39');

-- ----------------------------
-- Table structure for wechatsamll_news
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_news`;
CREATE TABLE `wechatsamll_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wechatsamll_news
-- ----------------------------
INSERT INTO `wechatsamll_news` VALUES ('1', '对方萨达', '士大夫但是', 'http://localhost:8080/upload/2162135cbc2ecbfc/5af7eaef8bad1a1f.png', '2021-05-15 19:10:47');
INSERT INTO `wechatsamll_news` VALUES ('2', '广泛的特人45', '分为', 'http://localhost/upload/77c34f76f0cdd432/ed2c275860981840.jpg', '2021-05-15 19:18:50');
INSERT INTO `wechatsamll_news` VALUES ('3', '23542', '452542', 'http://localhost:8080/upload/406868a5cbb2c748/70373dc907ee94e1.jpg', '2021-05-15 19:37:07');

-- ----------------------------
-- Table structure for wechatsamll_opinion
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_opinion`;
CREATE TABLE `wechatsamll_opinion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_opinion
-- ----------------------------
INSERT INTO `wechatsamll_opinion` VALUES ('1', 'Jackie', '这个小程序非常的实用噢', '2021-04-14 14:51:18');
INSERT INTO `wechatsamll_opinion` VALUES ('2', 'Jackie', '我也这么觉得', '2021-04-14 15:02:33');
INSERT INTO `wechatsamll_opinion` VALUES ('3', 'Jackie', '我现在提交', '2021-04-14 15:13:07');
INSERT INTO `wechatsamll_opinion` VALUES ('4', 'Jackie', '真不错！！！', '2021-04-15 10:52:30');

-- ----------------------------
-- Table structure for wechatsamll_order
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_order`;
CREATE TABLE `wechatsamll_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `cinemaname` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `cinemaaddress` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `movieid` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `moviename` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `Sessions` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `seat` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `ordernumber` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_order
-- ----------------------------
INSERT INTO `wechatsamll_order` VALUES ('65', '27', 'hcx', '奥斯卡影城', '郑州市二七区二七广场', '10', '哥斯拉大战金刚', '5月30日', '15:10-17:10', '8号厅（IMAX）', '6排6座,6排7座', '72', '162216286873457924', 'http://localhost:8080/upload/9f352c75df215dc7/cd2f933f8cced394.png');
INSERT INTO `wechatsamll_order` VALUES ('55', '20', 'Jackie', '奥斯卡影城', '郑州市二七区二七广场', '23', '欢乐好声音', '05月26日', '10:30-12:05', '2号厅（大）', '09排5座', '25', '441652417758145858', 'http://localhost:8080/upload/f39d3df8391ab2f8/49ef89de803645b2.png');
INSERT INTO `wechatsamll_order` VALUES ('30', '21', 'test', '太平洋影城（北欧知识城店）', '新都区斑竹园镇中利路169号北欧商业广场4号楼4楼', '20', '生死坚守', '5月15日', '22:30-00:00', '6号厅（大）', '3排6座,3排7座', '64', '162098445479192253', 'http://localhost:8080/upload/1d7869cfdd2ea521/2c300899e1b0da3c.png');
INSERT INTO `wechatsamll_order` VALUES ('64', '20', 'Jackie', '奥斯卡影城', '郑州市二七区二七广场', '5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', '寂静之地2', '05月26日', '20:00-22:30', '8号厅（大）', '05排13座,05排14座', '50', '456215494444451245', 'http://localhost:8080/upload/5694aeba496dd6a0/b032f92b7ca72043.png');
INSERT INTO `wechatsamll_order` VALUES ('63', '27', 'hcx', '奥斯卡影城', '郑州市二七区二七广场', '21', '极限特工', '5月27日', '13:00-15:25', '8号厅（大）', '2排5座,2排6座', '50', '162209716547761021', 'http://localhost:8080/upload/5694aeba496dd6a0/b032f92b7ca72043.png');
INSERT INTO `wechatsamll_order` VALUES ('61', '20', 'Jackie', '万达影城', '中原区中原路146号', '22', '乘风破浪', '05月27日', '14:30-16:45', '3号厅-4DX', '01排5座', '34', '664193248865595614', 'http://localhost:8080/upload/684dc939d09e5055/b7f53bfa3091c941.png');
INSERT INTO `wechatsamll_order` VALUES ('58', '20', 'Jackie', '奥斯卡影城', '郑州市二七区二七广场', '10', '哥斯拉大战金刚', '05月28日', '15:10-17:10', '8号厅（IMAX）', '05排13座', '36', '113524335114675114', 'http://localhost:8080/upload/9f352c75df215dc7/cd2f933f8cced394.png');
INSERT INTO `wechatsamll_order` VALUES ('66', '27', 'hcx', '奥斯卡影城', '郑州市二七区二七广场', '1', '五亿探长雷洛传1:雷老虎', '5月28日', '13:00-15:25', '9号厅（大）', '2排7座,2排8座', '56', '162217146361477526', 'http://localhost:8080/upload/2162135cbc2ecbfc/5af7eaef8bad1a1f.png');

-- ----------------------------
-- Table structure for wechatsamll_pay
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_pay`;
CREATE TABLE `wechatsamll_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `items` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_pay
-- ----------------------------
INSERT INTO `wechatsamll_pay` VALUES ('1', 'Jackie', '2', '水费', '350', '2021-04-15 09:38:45');
INSERT INTO `wechatsamll_pay` VALUES ('3', 'Jackie', '2', '水费', '50', '2021-04-15 10:01:14');
INSERT INTO `wechatsamll_pay` VALUES ('4', 'Jackie', '2', '管理费', '500', '2021-04-15 10:07:59');
INSERT INTO `wechatsamll_pay` VALUES ('6', 'Jackie', '2', '清洁费', '80', '2021-04-15 10:50:49');

-- ----------------------------
-- Table structure for wechatsamll_punchin
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_punchin`;
CREATE TABLE `wechatsamll_punchin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_punchin
-- ----------------------------
INSERT INTO `wechatsamll_punchin` VALUES ('1', 'Jackie', '2', '深圳技师学院', '2021-04-12 10:29:11');

-- ----------------------------
-- Table structure for wechatsamll_report
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_report`;
CREATE TABLE `wechatsamll_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `card` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `high` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `fever` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_report
-- ----------------------------
INSERT INTO `wechatsamll_report` VALUES ('1', 'Jackie', '黄希儿11', '12345678910', '441235122644541111', '否', '否');
INSERT INTO `wechatsamll_report` VALUES ('3', 'Jackie', '111', '11', '111', '否', '否');
INSERT INTO `wechatsamll_report` VALUES ('4', 'Jackie', '陈奕迅', '11111111111', '4564654546455465446', '否', '否');

-- ----------------------------
-- Table structure for wechatsamll_singin
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_singin`;
CREATE TABLE `wechatsamll_singin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moviename` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `movieid` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `administrators` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `administratorsid` int(11) DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of wechatsamll_singin
-- ----------------------------
INSERT INTO `wechatsamll_singin` VALUES ('1', '五亿探长雷洛传1:雷老虎', '1', 'Jackie', '1', '13:00-15:25', '0');
INSERT INTO `wechatsamll_singin` VALUES ('6', '哥斯拉大战金刚', '10', 'Jackie', '1', '15:10-17:10', '2');
INSERT INTO `wechatsamll_singin` VALUES ('7', '五亿探长雷洛传1:雷老虎', '1', 'Jackie', '1', '14:30-16:45', '1');
INSERT INTO `wechatsamll_singin` VALUES ('8', '五亿探长雷洛传1:雷老虎', '1', 'Jackie', '1', '16:20-18:45', '1');
INSERT INTO `wechatsamll_singin` VALUES ('9', '哥斯拉大战金刚', '10', 'Jackie', '1', '22:30-00:00', '2');
INSERT INTO `wechatsamll_singin` VALUES ('17', '欢乐好声音', '23', 'Jackie', '1', '09:30-11:05', '2');
INSERT INTO `wechatsamll_singin` VALUES ('12', '五亿探长雷洛传1:雷老虎', '1', '黄希儿', '3', '20:00-22:30', '0');
INSERT INTO `wechatsamll_singin` VALUES ('13', '哥斯拉大战金刚', '10', '黄希儿', '3', '13:00-15:25', '0');
INSERT INTO `wechatsamll_singin` VALUES ('16', '欢乐好声音', '23', 'Jackie', '1', '09:30-11:05', '1');
INSERT INTO `wechatsamll_singin` VALUES ('15', '五亿探长雷洛传1:雷老虎', '1', '黄希儿', '3', '17:30-19:50', '1');
INSERT INTO `wechatsamll_singin` VALUES ('18', '欢乐好声音', '23', 'Jackie', '1', '10:30-12:05', '0');
INSERT INTO `wechatsamll_singin` VALUES ('19', '乘风破浪', '22', '黄希儿', '3', '14:30-16:45', '1');
INSERT INTO `wechatsamll_singin` VALUES ('20', '极限特工', '21', '黄希儿', '3', '15:10-17:10', '0');
INSERT INTO `wechatsamll_singin` VALUES ('21', '生死坚守', '20', '黄希儿', '3', '22:30-00:00', '1');
INSERT INTO `wechatsamll_singin` VALUES ('22', '乘风破浪', '22', '黄希儿', '3', '18:20-20:20', '2');
INSERT INTO `wechatsamll_singin` VALUES ('23', '生死坚守', '20', 'Jackie', '1', '17:30-19:50', '0');
INSERT INTO `wechatsamll_singin` VALUES ('24', '极限特工', '21', 'Jackie', '1', '13:00-15:25', '1');
INSERT INTO `wechatsamll_singin` VALUES ('25', '乘风破浪', '22', 'Jackie', '1', '15:10-17:10', '0');
INSERT INTO `wechatsamll_singin` VALUES ('26', '生死坚守', '20', 'Jackie', '1', '15:10-17:10', '2');
INSERT INTO `wechatsamll_singin` VALUES ('27', '欢乐好声音', '23', '牛云飞', '11', '17:30-19:50', '2');
INSERT INTO `wechatsamll_singin` VALUES ('29', '寂静之地2', '5f3a5ee6-bcf9-11eb-b5e8-a08cfdc101f8', 'Jackie', '1', '20:00-22:30', '0');
INSERT INTO `wechatsamll_singin` VALUES ('30', '24724', '360ca092-bd09-11eb-b5e8-a08cfdc101f8', 'Jackie', '1', '17:30-19:50', '1');

-- ----------------------------
-- Table structure for wechatsamll_teachersyno
-- ----------------------------
DROP TABLE IF EXISTS `wechatsamll_teachersyno`;
CREATE TABLE `wechatsamll_teachersyno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT '' COMMENT '头像',
  `teachername` varchar(255) DEFAULT NULL COMMENT '老师名字',
  `phone` varchar(11) DEFAULT '',
  `labelsyno` varchar(255) DEFAULT NULL COMMENT '标签简介',
  `teachersyno` varchar(255) DEFAULT '' COMMENT '老师简介',
  `teacherage` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `uptate_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wechatsamll_teachersyno
-- ----------------------------
INSERT INTO `wechatsamll_teachersyno` VALUES ('1', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '黄导师', '13751264512', '个性签名啊啊啊啊啊', '高等学校计算课业时间的单位。通常以一学期中每周上课一小时为一学分。学习修够学分方能毕业', '3年', '2021-03-29 09:35:01', '2021-03-29 09:35:01');
INSERT INTO `wechatsamll_teachersyno` VALUES ('7', 'http://punchin.ico:8066/upload/ffdc50b6c9537483/a52801616444cf6e.png', '陈指导', '12312312311', '个性个性签名签名', '这是老师的介绍', '5年+', '2021-03-29 16:28:49', '2021-03-29 16:28:49');
INSERT INTO `wechatsamll_teachersyno` VALUES ('8', 'http://punchin.ico:8066/upload/54371cd0886702ea/755b1a61b6bb36c3.png', '百度', '12345678945', 'thinkadmin', '百度介绍，介绍百度', '4年', '2021-03-29 19:59:45', '2021-03-29 19:59:45');
INSERT INTO `wechatsamll_teachersyno` VALUES ('9', 'http://punchin.ico:8066/upload/8c137e9c8b6561e9/a8b6fccbc9d25922.jpg', 'CSDN', '11111111111', 'CSDN很好用', '介绍CSDN', '3年', '2021-03-29 20:00:38', '2021-03-29 20:00:38');
INSERT INTO `wechatsamll_teachersyno` VALUES ('12', 'http://punchin.ico:8066/upload/d9c7cfb61602fd01/2799fe18a1507054.png', '马化腾', '1111', '123456', '介绍介绍介绍', '4年', '2021-03-31 09:47:46', '2021-03-31 09:47:46');

-- ----------------------------
-- Table structure for wechat_distribution_bill
-- ----------------------------
DROP TABLE IF EXISTS `wechat_distribution_bill`;
CREATE TABLE `wechat_distribution_bill` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `uid` int(200) NOT NULL COMMENT '当前购买人ID',
  `puid` int(200) NOT NULL COMMENT '获得分销人ID',
  `price` decimal(10,2) NOT NULL COMMENT '获得分销金额',
  `origin_price` decimal(10,2) NOT NULL COMMENT '购买商品订单金额',
  `rate` varchar(10) NOT NULL COMMENT '分销率',
  `create_time` datetime NOT NULL COMMENT '获得时间',
  `order_id` varchar(200) NOT NULL COMMENT '订单ID',
  `uname` varchar(255) DEFAULT NULL COMMENT '当前购买人姓名',
  `puname` varchar(255) DEFAULT NULL COMMENT '获得分销人姓名',
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wechat_distribution_bill
-- ----------------------------
INSERT INTO `wechat_distribution_bill` VALUES ('4', '888', '44', '80.18', '200.45', '0.4', '2020-12-01 19:13:56', '11', 'Ming', 'Tom', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('6', '888', '44', '80.18', '200.45', '0.4', '2020-12-01 19:14:29', '22', 'Ming', 'Tom', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('7', '25', '25', '0.01', '0.06', '0.20', '2021-01-05 14:55:11', '140', 'Ming', 'Tom', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('8', '25', '25', '0.01', '0.06', '0.20', '2021-01-05 15:23:23', '142', '用户 13243856575', '用户 13243856575', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('9', '25', '32', '0.01', '0.06', '0.20', '2021-01-05 15:25:22', '143', '用户 13243856575', '用户 13189756183', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('10', '32', '25', '0.01', '0.06', '0.20', '2021-01-09 19:15:42', '146', '用户 13189756183', '用户 13243856575', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('11', '32', '25', '0.01', '0.06', '0.20', '2021-01-09 19:28:14', '147', '用户 13189756183', '用户 13243856575', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('12', '32', '25', '0.01', '0.06', '0.20', '2021-01-09 20:00:09', '151', '用户 13189756183', '用户 13243856575', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('13', '32', '25', '0.01', '0.06', '0.20', '2021-01-10 17:26:09', '169', '用户 13189756183', '用户 13243856575', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('14', '43', '42', '0.01', '0.06', '0.20', '2021-01-13 17:11:36', '186', '用户 13189756183', '用户 13751008330', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('15', '47', '46', '0.01', '0.06', '0.20', '2021-01-13 17:54:26', '188', '用户 13189756183', '用户 13751008330', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('16', '47', '46', '0.01', '0.06', '0.20', '2021-01-14 21:26:14', '224', '用户 13189756183', '用户 13751008330', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('17', '47', '46', '0.01', '0.06', '0.20', '2021-01-14 21:46:53', '237', '用户 13189756183', '用户 13751008330', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('18', '46', '47', '0.01', '0.06', '0.20', '2021-01-14 21:48:41', '238', '用户 13751008330', '用户 13189756183', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('19', '50', '49', '0.01', '0.06', '0.20', '2021-01-15 22:23:12', '269', '用户 13189756183', '用户 13751008330', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('20', '72', '64', '0.01', '0.06', '0.20', '2021-01-19 18:13:46', '369', 'M⃰ing⃰', '要不要买菜', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('21', '72', '72', '0.01', '0.06', '0.20', '2021-01-19 18:24:01', '371', 'M⃰ing⃰', 'M⃰ing⃰', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('22', '72', '72', '0.01', '0.06', '0.20', '2021-01-19 19:33:50', '373', 'M⃰ing⃰', 'M⃰ing⃰', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('23', '66', '61', '0.20', '1.00', '0.20', '2021-01-19 19:38:20', '362', null, '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('24', '55', '64', '0.02', '0.10', '0.20', '2021-01-19 19:49:23', '375', 'Jackie', '要不要买菜', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('25', '62', '61', '0.20', '1.00', '0.20', '2021-01-19 20:38:18', '358', null, '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('26', '73', '61', '0.24', '0.80', '0.30', '2021-01-21 11:39:31', '393', '月亮和太阳', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('27', '72', '72', '0.01', '0.10', '0.10', '2021-01-29 21:24:40', '443', 'M⃰ing⃰', 'M⃰ing⃰', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('28', '72', '74', '0.01', '0.10', '0.10', '2021-01-29 21:24:40', '443', 'M⃰ing⃰', '小~靥', '2');
INSERT INTO `wechat_distribution_bill` VALUES ('29', '133', '121', '0.01', '0.10', '0.10', '2021-02-08 12:28:53', '509', 'M⃰ing⃰', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('30', '133', '134', '0.01', '0.10', '0.10', '2021-02-08 12:28:53', '509', 'M⃰ing⃰', '小~靥', '2');
INSERT INTO `wechat_distribution_bill` VALUES ('31', '138', '121', '0.10', '1.00', '0.10', '2021-02-15 10:00:50', '514', '月亮和太阳', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('32', '144', '121', '0.10', '1.00', '0.10', '2021-03-02 09:51:46', '518', '要不要买菜', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('33', '144', '121', '0.20', '1.00', '0.20', '2021-03-03 10:39:17', '525', '要不要买菜', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('34', '144', '121', '0.29', '1.00', '0.29', '2021-03-03 10:42:14', '526', '要不要买菜', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('35', '133', '121', '0.30', '1.00', '0.30', '2021-03-03 11:02:11', '530', 'M⃰ing⃰', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('36', '144', '121', '0.30', '1.00', '0.30', '2021-03-03 11:05:37', '531', '要不要买菜', '俊晨', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('37', '147', '140', '0.30', '1.00', '0.30', '2021-03-03 11:52:39', '534', '叁见助理--小月（Moon）', '叁见丽华', '1');
INSERT INTO `wechat_distribution_bill` VALUES ('38', '151', '148', '0.30', '1.00', '0.30', '2021-03-03 12:47:43', '537', '叁见助理--小月（Moon）', '肖丽华', '1');

-- ----------------------------
-- Table structure for wechat_distribution_config
-- ----------------------------
DROP TABLE IF EXISTS `wechat_distribution_config`;
CREATE TABLE `wechat_distribution_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `course_val` decimal(10,2) DEFAULT NULL,
  `advisory_val` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wechat_distribution_config
-- ----------------------------
INSERT INTO `wechat_distribution_config` VALUES ('1', 'rate', '0.30', '0.30');

-- ----------------------------
-- Table structure for wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `wechat_fans`;
CREATE TABLE `wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `unionid` varchar(100) DEFAULT '' COMMENT '粉丝unionid',
  `openid` varchar(100) DEFAULT '' COMMENT '粉丝openid',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '粉丝标签id',
  `is_black` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单状态',
  `subscribe` tinyint(1) unsigned DEFAULT '0' COMMENT '关注状态(0未关注,1已关注)',
  `nickname` varchar(200) DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户性别(1男性,2女性,0未知)',
  `country` varchar(50) DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT '' COMMENT '用户的语言(zh_CN)',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT '0' COMMENT '关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `subscribe_scene` varchar(200) DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) DEFAULT '' COMMENT '二维码场景内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_wechat_fans_openid` (`openid`) USING BTREE,
  KEY `idx_wechat_fans_unionid` (`unionid`) USING BTREE,
  KEY `idx_wechat_fans_is_back` (`is_black`) USING BTREE,
  KEY `idx_wechat_fans_subscribe` (`subscribe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-粉丝';

-- ----------------------------
-- Records of wechat_fans
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_fans_tags
-- ----------------------------
DROP TABLE IF EXISTS `wechat_fans_tags`;
CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` bigint(20) unsigned DEFAULT '0' COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `idx_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `idx_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-粉丝-标签';

-- ----------------------------
-- Records of wechat_fans_tags
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_keys
-- ----------------------------
DROP TABLE IF EXISTS `wechat_keys`;
CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(100) DEFAULT '' COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT '' COMMENT '类型(text,image,news)',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT '' COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT '' COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT '' COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT '' COMMENT '缩略图片',
  `music_desc` varchar(255) DEFAULT '' COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT '' COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT '' COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT '' COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `create_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_wechat_keys_appid` (`appid`) USING BTREE,
  KEY `idx_wechat_keys_type` (`type`) USING BTREE,
  KEY `idx_wechat_keys_keys` (`keys`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-关键字';

-- ----------------------------
-- Records of wechat_keys
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `wechat_media`;
CREATE TABLE `wechat_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) DEFAULT '' COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT '' COMMENT '文件md5',
  `type` varchar(20) DEFAULT '' COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_wechat_media_appid` (`appid`) USING BTREE,
  KEY `idx_wechat_media_md5` (`md5`) USING BTREE,
  KEY `idx_wechat_media_type` (`type`) USING BTREE,
  KEY `idx_wechat_media_media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-素材';

-- ----------------------------
-- Records of wechat_media
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_messageboard
-- ----------------------------
DROP TABLE IF EXISTS `wechat_messageboard`;
CREATE TABLE `wechat_messageboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newsId` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wechat_messageboard
-- ----------------------------
INSERT INTO `wechat_messageboard` VALUES ('106', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '78', '2021-03-30 10:47:19', null);
INSERT INTO `wechat_messageboard` VALUES ('101', '95', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/5XPO3Y8r0nG5tOS5M2W5Z8Ne5Ct9meR5TPicZYdJOgDBraXIOJrjiaVVnFGTI4rnbvyzc7jkhSeibQgJ1vyfSIK2w/132', '留留言', '2021-02-02 17:56:32', null);
INSERT INTO `wechat_messageboard` VALUES ('105', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '46', '2021-03-30 10:47:07', null);
INSERT INTO `wechat_messageboard` VALUES ('103', '94', '俊晨', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrXIPLrtUcxafWNIkEndGibJpMsOplUjNkiardgNqRJxk1V8yoMgicp2icjcZ20XkgsTRVQDGs5Cwq5Q/132', '你哈', '2021-02-03 10:19:08', null);
INSERT INTO `wechat_messageboard` VALUES ('104', '121', '俊晨', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrXIPLrtUcxafWNIkEndGibJpMsOplUjNkiardgNqRJxk1V8yoMgicp2icjcZ20XkgsTRVQDGs5Cwq5Q/132', '5555', '2021-03-09 14:42:10', null);
INSERT INTO `wechat_messageboard` VALUES ('107', '2', 'Jackie', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuaxjE4ibrlT6YjjNOhksm1Dw/132', '66', '2021-03-31 09:39:42', null);

-- ----------------------------
-- Table structure for wechat_service_config
-- ----------------------------
DROP TABLE IF EXISTS `wechat_service_config`;
CREATE TABLE `wechat_service_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authorizer_appid` varchar(100) DEFAULT '' COMMENT '公众号APPID',
  `authorizer_access_token` varchar(200) DEFAULT '' COMMENT '公众号授权Token',
  `authorizer_refresh_token` varchar(200) DEFAULT '' COMMENT '公众号刷新Token',
  `func_info` varchar(100) DEFAULT '' COMMENT '公众号集权',
  `nick_name` varchar(50) DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(200) DEFAULT '' COMMENT '公众号头像',
  `expires_in` bigint(20) DEFAULT NULL COMMENT 'Token有效时间',
  `service_type` tinyint(2) DEFAULT NULL COMMENT '微信类型(0代表订阅号,2代表服务号,3代表小程序)',
  `service_type_info` tinyint(2) DEFAULT NULL COMMENT '公众号实际类型',
  `verify_type` tinyint(2) DEFAULT NULL COMMENT '公众号认证类型(-1代表未认证, 0代表微信认证)',
  `verify_type_info` tinyint(2) DEFAULT NULL COMMENT '公众号实际认证类型',
  `user_name` varchar(100) DEFAULT '' COMMENT '众众号原始账号',
  `alias` varchar(100) DEFAULT '' COMMENT '公众号别名',
  `qrcode_url` varchar(200) DEFAULT '' COMMENT '公众号二维码',
  `business_info` varchar(255) DEFAULT '',
  `principal_name` varchar(255) DEFAULT '' COMMENT '公司名称',
  `miniprograminfo` varchar(1024) DEFAULT '' COMMENT '小程序JSON',
  `idc` tinyint(1) unsigned DEFAULT NULL,
  `signature` text COMMENT '小程序的描述',
  `total` bigint(20) unsigned DEFAULT '0' COMMENT '统计调用次数',
  `appkey` varchar(32) DEFAULT '' COMMENT '应用接口KEY',
  `appuri` varchar(255) DEFAULT '' COMMENT '应用接口URI',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1正常授权,0取消授权)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(0未删除,1已删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_wechat_service_config_authorizer_appid` (`authorizer_appid`) USING BTREE,
  KEY `idx_wechat_service_config_status` (`status`) USING BTREE,
  KEY `idx_wechat_service_config_is_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-授权';

-- ----------------------------
-- Records of wechat_service_config
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `wechat_user`;
CREATE TABLE `wechat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `personalsignature` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wechat_user
-- ----------------------------
INSERT INTO `wechat_user` VALUES ('25', '222', '222', null, null, null, null, null, null, '2021-05-25 09:19:40', '2021-05-25 09:19:40');
INSERT INTO `wechat_user` VALUES ('27', null, 'hcx', 'hcx', null, null, null, null, null, '2021-05-25 13:44:57', '2021-05-25 13:44:57');
INSERT INTO `wechat_user` VALUES ('4', 'ofbr-42rj6wNEZixpcuSOmqb7Yyk', 'Lee', '123456', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIp74WkwE6OCqf7tibNks0ML44Ve2elcSLuOuCUJ9NBGH6xqJuTJNgvn57oLp8F88s6CMbIK2yZYrA/132', null, null, null, null, '2021-04-12 14:28:53', '2021-04-12 14:28:53');
INSERT INTO `wechat_user` VALUES ('6', 'ofbr-449Bc2UFWsUSRnccURRl-50', '迟迟吾行丶', '123456', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er6cQ6ic5fOJDkVTf4zP8cILxeaqZF0CwoJKPdsF4BBaXnIibRR8HPsdl5kys6p7LibVFYD6KFackkaQ/132', null, null, null, null, '2021-04-25 14:33:49', '2021-04-25 14:33:49');
INSERT INTO `wechat_user` VALUES ('20', 'ofbr-48mIF5V99sVH2DVaBW1E6zs', 'Jackie', '123456', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicGj6w0pjgfKlwEpXPDg5Ztpo7icm3KHvou0yDG9rwBqIUNKKfIL4hgeMlYicBCdcuRVkzOMxNIsicIfzbUOToYGA/132', null, null, null, null, '2021-05-24 15:30:00', '2021-05-24 15:30:00');
INSERT INTO `wechat_user` VALUES ('15', null, 'hjh', '789', null, null, null, null, null, '2021-05-10 17:38:16', '2021-05-10 17:38:16');
INSERT INTO `wechat_user` VALUES ('16', null, 'hzs', '123', null, null, null, null, null, '2021-05-11 08:56:38', '2021-05-11 08:56:38');
INSERT INTO `wechat_user` VALUES ('17', null, 'qwe', '111', null, null, null, null, null, '2021-05-11 08:58:09', '2021-05-11 08:58:09');
INSERT INTO `wechat_user` VALUES ('21', null, 'test', '123', null, null, null, null, null, '2021-05-14 17:26:31', '2021-05-14 17:26:31');
DROP TRIGGER IF EXISTS `to_insert`;
DELIMITER ;;
CREATE TRIGGER `to_insert` BEFORE INSERT ON `wechatsamll_nearmovie` FOR EACH ROW BEGIN 
IF new.id is null then set new.id = UUID();
END IF;
END
;;
DELIMITER ;
