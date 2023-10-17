/*
 Navicat Premium Data Transfer

 Source Server         : 甲骨文amd2
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 129.150.45.251:3306
 Source Schema         : warehouse_hhg

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 17/10/2023 09:53:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `connectionpersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `available` int(11) NULL DEFAULT NULL COMMENT '启用状态(1 启用 0 禁用)',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES (1, '小张超市', '111', '武汉', '027-9123131', '张大明', '15279230588', '中国银行', '654431331343413', '213123@sina.com', '430000', 1, 0, NULL);
INSERT INTO `bus_customer` VALUES (2, '小明超市', '222', '深圳', '0755-9123131', '张小明', '13064154936', '中国银行', '654431331343413', '213123@sina.com', '430000', 1, 0, NULL);
INSERT INTO `bus_customer` VALUES (3, '快七超市', '430000', '武汉', '027-11011011', '雷生', '13617020687', '招商银行', '6543123341334133', '6666@66.com', '545341', 1, 0, NULL);
INSERT INTO `bus_customer` VALUES (4, '丽云超市', '332005', '十里大道1039号', '0792-13658745', '射可可', '13648524759', '建设银行', '36245684125509', '13648524759@163.com', '152632', 1, 0, NULL);
INSERT INTO `bus_customer` VALUES (8, '寻鲁超市', '234234', '撒旦法', '234', '地方', '1234', '是否', '234234', '123123@23', '213', 1, 0, NULL);
INSERT INTO `bus_customer` VALUES (11, 'asdf', 'afs', 'afsd', '123', 'dfs', '123', 'd sfd', '35234', 'q21341', '123', 1, 0, NULL);

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `providerid` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品产地',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装',
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产批号',
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批准文号',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `price` decimal(10, 0) NULL DEFAULT NULL COMMENT '销售价格',
  `number` int(11) NULL DEFAULT NULL COMMENT '库存',
  `dangernum` int(11) NULL DEFAULT NULL COMMENT '库存预警值',
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `available` int(11) NULL DEFAULT NULL COMMENT '是否启用(1 启用 2 禁用)',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sq0btr2v2lq8gt8b4gb8tlk0i`(`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES (1, '娃哈哈', 3, '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', 2, 473, 10, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);
INSERT INTO `bus_goods` VALUES (2, '旺旺雪饼[小包]', 1, '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', 4, 1090, 10, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);
INSERT INTO `bus_goods` VALUES (3, '旺旺大礼包', 1, '仙桃', '盒', '盒', '11', '11', '111', 28, 1021, 100, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);
INSERT INTO `bus_goods` VALUES (4, '娃哈哈', 3, '武汉', '200ML', '瓶', '11', '111', '12321', 3, 760, 10, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);
INSERT INTO `bus_goods` VALUES (5, '娃哈哈', 3, '武汉', '300ML', '瓶', '1234', '12321', '22221111', 3, 1000, 100, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);
INSERT INTO `bus_goods` VALUES (6, '纯牛奶', 4, '内蒙古', '24瓶一箱', '瓶', 'SD13156146', '321651613', '牛奶', 55, 100, 20, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);
INSERT INTO `bus_goods` VALUES (18, '八宝粥', 2, '广州', '箱', '15', 'DFS234341231', 'DF123124324', '粥', 4, 500, 100, '2023-10-14/A398BEBBE52A45E6B0DA48D67E1F18CF.jpg', 1, 0, NULL);

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付类型',
  `inporttime` datetime(0) NULL DEFAULT NULL COMMENT '进货时间',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `number` int(11) NULL DEFAULT NULL COMMENT '进货数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `inportprice` decimal(10, 0) NULL DEFAULT NULL COMMENT '进货价格',
  `providerid` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bus_inport_ibfk_1`(`providerid`) USING BTREE,
  INDEX `bus_inport_ibfk_2`(`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品进货表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `outputtime` datetime(0) NULL DEFAULT NULL COMMENT '退货时间',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `outportprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '退货价格',
  `number` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `inportid` int(11) NULL DEFAULT NULL COMMENT '进货id',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_bus_inport_bus_outport`(`inportid`) USING BTREE,
  CONSTRAINT `FK_bus_inport_bus_outport` FOREIGN KEY (`inportid`) REFERENCES `bus_inport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品退货表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商电话',
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `available` int(11) NULL DEFAULT NULL COMMENT '是否启用(1启用 0禁用)',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES (1, '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (2, '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (3, '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (4, '蒙牛集团', '332005', '内蒙古', '0790-362514856', '姿态', '13617252689', '中国银行', '36214587962509', '13617252689@163.com', '364145', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (5, '伊利集团', '562115', '内蒙古', '0792-36548569', 'Rita', '13698560566', '建设银行', '3621458963596509', '13698560566@163.com', '362514', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (12, 'asdf', '123', 'sdf', '123', 'sda', '123', '123', '123', '132', '213', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (13, '涂料粉加工厂', '123@qq.com', '石柱县', '13888888888', '小谭', '138', '中国银行', '42354254614548545', '123@qq.com', '123', 1, 0, NULL);
INSERT INTO `bus_provider` VALUES (14, 'xx', '123', 'xx', '123', '123', '123', '123', '13', '123', '123', 1, 0, NULL);

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `salestime` datetime(0) NULL DEFAULT NULL COMMENT '销售时间',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `number` int(11) NULL DEFAULT NULL COMMENT '销售数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `saleprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `userid` int(11) NULL DEFAULT NULL COMMENT '销售员',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品销售表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `salesbacktime` datetime(0) NULL DEFAULT NULL COMMENT '退货时间',
  `salebackprice` double(10, 2) NULL DEFAULT NULL COMMENT '退货价格',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `number` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `salesid` int(11) NULL DEFAULT NULL COMMENT '销售单id',
  `userid` int(11) NULL DEFAULT NULL COMMENT '销售员id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售员名称',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_bus_salesback_bus_sales`(`salesid`) USING BTREE,
  CONSTRAINT `FK_bus_salesback_bus_sales` FOREIGN KEY (`salesid`) REFERENCES `bus_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售退货表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `open` int(11) NULL DEFAULT NULL COMMENT '是否展开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门备注',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门地址',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码【为了调试显示顺序】',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `isdelete` int(1) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  `deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '总经办', 1, '大BOSS', '深圳', 1, 1, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '销售部', 0, '程序员', '武汉', 1, 2, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (3, 1, '运营部', 0, '无', '武汉', 1, 3, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (4, 1, '生产部', 0, '无', '武汉', 1, 4, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (5, 2, '销售一部', 0, '销售一部', '武汉', 1, 5, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (6, 2, '销售二部', 0, '销售二部', '武汉', 1, 6, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (7, 3, '运营一部', 0, '运营一部', '武汉', 1, 7, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (8, 2, '销售三部', 0, '销售三部', '11', 1, 8, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (9, 2, '销售四部', 0, '销售四部', '222', 1, 9, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (10, 2, '销售五部', 0, '销售五部', '33', 1, 10, '2019-04-10 14:06:32', 0, NULL);
INSERT INTO `sys_dept` VALUES (18, 4, '生产一部', 0, '生产食品', '武汉', 1, 11, '2019-04-13 09:49:38', 0, NULL);

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户',
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录id',
  `logintime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 375 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES (14, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 14:45:25');
INSERT INTO `sys_loginfo` VALUES (15, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:21:52');
INSERT INTO `sys_loginfo` VALUES (16, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:23:39');
INSERT INTO `sys_loginfo` VALUES (17, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-25 15:26:10');
INSERT INTO `sys_loginfo` VALUES (18, '落亦--luoyi', '127.0.0.1', '2019-11-25 15:53:00');
INSERT INTO `sys_loginfo` VALUES (19, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 08:32:41');
INSERT INTO `sys_loginfo` VALUES (20, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 09:18:06');
INSERT INTO `sys_loginfo` VALUES (21, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-26 09:59:19');
INSERT INTO `sys_loginfo` VALUES (22, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 10:48:05');
INSERT INTO `sys_loginfo` VALUES (23, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 15:15:03');
INSERT INTO `sys_loginfo` VALUES (24, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 15:42:02');
INSERT INTO `sys_loginfo` VALUES (25, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 16:56:54');
INSERT INTO `sys_loginfo` VALUES (26, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 18:07:44');
INSERT INTO `sys_loginfo` VALUES (27, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 18:08:08');
INSERT INTO `sys_loginfo` VALUES (28, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 19:23:12');
INSERT INTO `sys_loginfo` VALUES (29, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 20:46:57');
INSERT INTO `sys_loginfo` VALUES (30, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 21:17:48');
INSERT INTO `sys_loginfo` VALUES (31, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-26 21:21:16');
INSERT INTO `sys_loginfo` VALUES (32, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:13:56');
INSERT INTO `sys_loginfo` VALUES (33, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:29:17');
INSERT INTO `sys_loginfo` VALUES (34, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:30:38');
INSERT INTO `sys_loginfo` VALUES (35, '落亦--luoyi', '127.0.0.1', '2019-11-27 20:32:36');
INSERT INTO `sys_loginfo` VALUES (36, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-27 20:33:47');
INSERT INTO `sys_loginfo` VALUES (37, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 08:52:02');
INSERT INTO `sys_loginfo` VALUES (38, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:14');
INSERT INTO `sys_loginfo` VALUES (39, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:09:23');
INSERT INTO `sys_loginfo` VALUES (40, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:10:00');
INSERT INTO `sys_loginfo` VALUES (41, '落亦--luoyi', '127.0.0.1', '2019-11-28 09:10:53');
INSERT INTO `sys_loginfo` VALUES (42, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:17:06');
INSERT INTO `sys_loginfo` VALUES (43, '落亦--luoyi', '127.0.0.1', '2019-11-28 09:18:25');
INSERT INTO `sys_loginfo` VALUES (44, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:19:19');
INSERT INTO `sys_loginfo` VALUES (45, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:43:12');
INSERT INTO `sys_loginfo` VALUES (46, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:55:00');
INSERT INTO `sys_loginfo` VALUES (47, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:56:54');
INSERT INTO `sys_loginfo` VALUES (48, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 09:59:18');
INSERT INTO `sys_loginfo` VALUES (49, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 10:28:42');
INSERT INTO `sys_loginfo` VALUES (50, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 10:35:39');
INSERT INTO `sys_loginfo` VALUES (51, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:46:07');
INSERT INTO `sys_loginfo` VALUES (52, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:56:34');
INSERT INTO `sys_loginfo` VALUES (53, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 14:57:11');
INSERT INTO `sys_loginfo` VALUES (54, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 20:37:00');
INSERT INTO `sys_loginfo` VALUES (55, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:29:07');
INSERT INTO `sys_loginfo` VALUES (56, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:35:40');
INSERT INTO `sys_loginfo` VALUES (57, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:38:15');
INSERT INTO `sys_loginfo` VALUES (58, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-28 21:39:56');
INSERT INTO `sys_loginfo` VALUES (59, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 08:34:49');
INSERT INTO `sys_loginfo` VALUES (60, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:15:39');
INSERT INTO `sys_loginfo` VALUES (61, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:24:44');
INSERT INTO `sys_loginfo` VALUES (62, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 09:29:50');
INSERT INTO `sys_loginfo` VALUES (63, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:13:31');
INSERT INTO `sys_loginfo` VALUES (64, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:45:24');
INSERT INTO `sys_loginfo` VALUES (65, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 10:51:44');
INSERT INTO `sys_loginfo` VALUES (66, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 11:07:38');
INSERT INTO `sys_loginfo` VALUES (67, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 21:52:58');
INSERT INTO `sys_loginfo` VALUES (68, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:00:53');
INSERT INTO `sys_loginfo` VALUES (69, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:13:18');
INSERT INTO `sys_loginfo` VALUES (70, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:23:34');
INSERT INTO `sys_loginfo` VALUES (71, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:28:58');
INSERT INTO `sys_loginfo` VALUES (72, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:30:01');
INSERT INTO `sys_loginfo` VALUES (73, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:37:01');
INSERT INTO `sys_loginfo` VALUES (74, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:37:47');
INSERT INTO `sys_loginfo` VALUES (75, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 22:45:21');
INSERT INTO `sys_loginfo` VALUES (76, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:05:59');
INSERT INTO `sys_loginfo` VALUES (77, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:14:08');
INSERT INTO `sys_loginfo` VALUES (78, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:19:56');
INSERT INTO `sys_loginfo` VALUES (79, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-29 23:29:39');
INSERT INTO `sys_loginfo` VALUES (80, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:24:06');
INSERT INTO `sys_loginfo` VALUES (81, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:40:39');
INSERT INTO `sys_loginfo` VALUES (82, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:42:36');
INSERT INTO `sys_loginfo` VALUES (83, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 11:47:08');
INSERT INTO `sys_loginfo` VALUES (84, '落亦--luoyi', '127.0.0.1', '2019-11-30 11:59:23');
INSERT INTO `sys_loginfo` VALUES (85, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:03:46');
INSERT INTO `sys_loginfo` VALUES (86, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:18:12');
INSERT INTO `sys_loginfo` VALUES (87, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 12:58:59');
INSERT INTO `sys_loginfo` VALUES (88, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-11-30 18:29:39');
INSERT INTO `sys_loginfo` VALUES (89, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-01 09:37:38');
INSERT INTO `sys_loginfo` VALUES (90, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-01 11:46:14');
INSERT INTO `sys_loginfo` VALUES (91, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:39:07');
INSERT INTO `sys_loginfo` VALUES (92, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:42:01');
INSERT INTO `sys_loginfo` VALUES (93, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:44:22');
INSERT INTO `sys_loginfo` VALUES (94, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 10:49:58');
INSERT INTO `sys_loginfo` VALUES (95, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:40:27');
INSERT INTO `sys_loginfo` VALUES (96, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:41:44');
INSERT INTO `sys_loginfo` VALUES (97, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 18:51:51');
INSERT INTO `sys_loginfo` VALUES (98, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-02 19:44:13');
INSERT INTO `sys_loginfo` VALUES (99, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 08:40:06');
INSERT INTO `sys_loginfo` VALUES (100, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:17:34');
INSERT INTO `sys_loginfo` VALUES (101, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:49:33');
INSERT INTO `sys_loginfo` VALUES (102, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 09:49:54');
INSERT INTO `sys_loginfo` VALUES (103, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 10:46:23');
INSERT INTO `sys_loginfo` VALUES (104, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 10:52:24');
INSERT INTO `sys_loginfo` VALUES (105, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 11:12:01');
INSERT INTO `sys_loginfo` VALUES (106, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 13:52:12');
INSERT INTO `sys_loginfo` VALUES (107, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:33');
INSERT INTO `sys_loginfo` VALUES (108, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:09:36');
INSERT INTO `sys_loginfo` VALUES (109, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:12:28');
INSERT INTO `sys_loginfo` VALUES (110, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:13:55');
INSERT INTO `sys_loginfo` VALUES (111, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:20:36');
INSERT INTO `sys_loginfo` VALUES (112, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:21:06');
INSERT INTO `sys_loginfo` VALUES (113, '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-03 14:27:37');
INSERT INTO `sys_loginfo` VALUES (114, '旦素一-dansuyi', '0:0:0:0:0:0:0:1', '2019-12-03 14:27:54');
INSERT INTO `sys_loginfo` VALUES (115, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 15:04:21');
INSERT INTO `sys_loginfo` VALUES (116, '李九-lijiu', '0:0:0:0:0:0:0:1', '2019-12-03 15:47:02');
INSERT INTO `sys_loginfo` VALUES (117, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-03 15:47:25');
INSERT INTO `sys_loginfo` VALUES (118, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 08:36:54');
INSERT INTO `sys_loginfo` VALUES (119, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 09:18:26');
INSERT INTO `sys_loginfo` VALUES (120, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 09:40:35');
INSERT INTO `sys_loginfo` VALUES (121, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:14:43');
INSERT INTO `sys_loginfo` VALUES (122, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:27:12');
INSERT INTO `sys_loginfo` VALUES (123, '李约素-liyuesu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:12');
INSERT INTO `sys_loginfo` VALUES (124, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:20');
INSERT INTO `sys_loginfo` VALUES (125, '赵六-zhaoliu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:28');
INSERT INTO `sys_loginfo` VALUES (126, '王五-wangwu', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:40');
INSERT INTO `sys_loginfo` VALUES (127, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:28:51');
INSERT INTO `sys_loginfo` VALUES (128, '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-04 10:30:00');
INSERT INTO `sys_loginfo` VALUES (129, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 10:30:16');
INSERT INTO `sys_loginfo` VALUES (130, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-04 11:13:42');
INSERT INTO `sys_loginfo` VALUES (131, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 11:15:22');
INSERT INTO `sys_loginfo` VALUES (132, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-04 11:16:03');
INSERT INTO `sys_loginfo` VALUES (133, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:27:27');
INSERT INTO `sys_loginfo` VALUES (134, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:32:11');
INSERT INTO `sys_loginfo` VALUES (135, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:39:49');
INSERT INTO `sys_loginfo` VALUES (136, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:43:26');
INSERT INTO `sys_loginfo` VALUES (137, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 10:44:41');
INSERT INTO `sys_loginfo` VALUES (138, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 15:35:56');
INSERT INTO `sys_loginfo` VALUES (139, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 15:53:28');
INSERT INTO `sys_loginfo` VALUES (140, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 16:02:42');
INSERT INTO `sys_loginfo` VALUES (141, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 16:50:28');
INSERT INTO `sys_loginfo` VALUES (142, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:20:01');
INSERT INTO `sys_loginfo` VALUES (143, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:22:13');
INSERT INTO `sys_loginfo` VALUES (144, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:23:19');
INSERT INTO `sys_loginfo` VALUES (145, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:23:51');
INSERT INTO `sys_loginfo` VALUES (146, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 17:38:39');
INSERT INTO `sys_loginfo` VALUES (147, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 20:38:28');
INSERT INTO `sys_loginfo` VALUES (148, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:05:55');
INSERT INTO `sys_loginfo` VALUES (149, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:06:49');
INSERT INTO `sys_loginfo` VALUES (150, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:07:39');
INSERT INTO `sys_loginfo` VALUES (151, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-05 21:10:07');
INSERT INTO `sys_loginfo` VALUES (152, '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-05 21:11:47');
INSERT INTO `sys_loginfo` VALUES (153, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 21:11:58');
INSERT INTO `sys_loginfo` VALUES (154, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:54:31');
INSERT INTO `sys_loginfo` VALUES (155, '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-05 22:55:00');
INSERT INTO `sys_loginfo` VALUES (156, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:57:38');
INSERT INTO `sys_loginfo` VALUES (157, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:59:18');
INSERT INTO `sys_loginfo` VALUES (158, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-05 22:59:38');
INSERT INTO `sys_loginfo` VALUES (159, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:36:42');
INSERT INTO `sys_loginfo` VALUES (160, '苏北旦-subeidan', '0:0:0:0:0:0:0:1', '2019-12-06 08:42:18');
INSERT INTO `sys_loginfo` VALUES (161, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:42:46');
INSERT INTO `sys_loginfo` VALUES (162, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-06 08:45:31');
INSERT INTO `sys_loginfo` VALUES (163, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:47:03');
INSERT INTO `sys_loginfo` VALUES (164, '李四-lisi', '0:0:0:0:0:0:0:1', '2019-12-06 08:47:41');
INSERT INTO `sys_loginfo` VALUES (165, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:48:00');
INSERT INTO `sys_loginfo` VALUES (166, '王五-wangwu', '0:0:0:0:0:0:0:1', '2019-12-06 08:48:52');
INSERT INTO `sys_loginfo` VALUES (167, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:49:12');
INSERT INTO `sys_loginfo` VALUES (168, '上单-shangdan', '0:0:0:0:0:0:0:1', '2019-12-06 08:51:36');
INSERT INTO `sys_loginfo` VALUES (169, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:51:52');
INSERT INTO `sys_loginfo` VALUES (170, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 08:53:36');
INSERT INTO `sys_loginfo` VALUES (171, '上单-shangdan', '0:0:0:0:0:0:0:1', '2019-12-06 08:55:07');
INSERT INTO `sys_loginfo` VALUES (172, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 09:31:52');
INSERT INTO `sys_loginfo` VALUES (173, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 22:30:06');
INSERT INTO `sys_loginfo` VALUES (174, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:00:14');
INSERT INTO `sys_loginfo` VALUES (175, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:19:13');
INSERT INTO `sys_loginfo` VALUES (176, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:22:29');
INSERT INTO `sys_loginfo` VALUES (177, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:24:33');
INSERT INTO `sys_loginfo` VALUES (178, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:26:13');
INSERT INTO `sys_loginfo` VALUES (179, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2019-12-06 23:32:24');
INSERT INTO `sys_loginfo` VALUES (180, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-12-09 16:14:07');
INSERT INTO `sys_loginfo` VALUES (181, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:02:00');
INSERT INTO `sys_loginfo` VALUES (182, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:13:25');
INSERT INTO `sys_loginfo` VALUES (183, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:17:40');
INSERT INTO `sys_loginfo` VALUES (184, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:23:43');
INSERT INTO `sys_loginfo` VALUES (185, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-01-21 03:28:21');
INSERT INTO `sys_loginfo` VALUES (186, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-06 02:28:24');
INSERT INTO `sys_loginfo` VALUES (187, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-06 03:02:00');
INSERT INTO `sys_loginfo` VALUES (188, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-07 07:54:49');
INSERT INTO `sys_loginfo` VALUES (189, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-08 06:23:55');
INSERT INTO `sys_loginfo` VALUES (190, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-09 07:45:00');
INSERT INTO `sys_loginfo` VALUES (191, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 03:01:19');
INSERT INTO `sys_loginfo` VALUES (192, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:08:23');
INSERT INTO `sys_loginfo` VALUES (193, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:16:36');
INSERT INTO `sys_loginfo` VALUES (194, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:20:26');
INSERT INTO `sys_loginfo` VALUES (195, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:23:37');
INSERT INTO `sys_loginfo` VALUES (196, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:25:52');
INSERT INTO `sys_loginfo` VALUES (197, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:34:37');
INSERT INTO `sys_loginfo` VALUES (198, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:36:25');
INSERT INTO `sys_loginfo` VALUES (199, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:39:03');
INSERT INTO `sys_loginfo` VALUES (200, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:42:08');
INSERT INTO `sys_loginfo` VALUES (201, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:43:07');
INSERT INTO `sys_loginfo` VALUES (202, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:44:12');
INSERT INTO `sys_loginfo` VALUES (203, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-12 04:44:54');
INSERT INTO `sys_loginfo` VALUES (204, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:09:37');
INSERT INTO `sys_loginfo` VALUES (205, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:11:53');
INSERT INTO `sys_loginfo` VALUES (206, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:13:10');
INSERT INTO `sys_loginfo` VALUES (207, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:14:13');
INSERT INTO `sys_loginfo` VALUES (208, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:19:38');
INSERT INTO `sys_loginfo` VALUES (209, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:22:05');
INSERT INTO `sys_loginfo` VALUES (210, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:26:19');
INSERT INTO `sys_loginfo` VALUES (211, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 06:30:35');
INSERT INTO `sys_loginfo` VALUES (212, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 07:16:07');
INSERT INTO `sys_loginfo` VALUES (213, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 07:30:52');
INSERT INTO `sys_loginfo` VALUES (214, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 08:05:43');
INSERT INTO `sys_loginfo` VALUES (215, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 08:23:39');
INSERT INTO `sys_loginfo` VALUES (216, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 08:58:01');
INSERT INTO `sys_loginfo` VALUES (217, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 09:06:30');
INSERT INTO `sys_loginfo` VALUES (218, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-14 09:52:11');
INSERT INTO `sys_loginfo` VALUES (219, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 07:33:16');
INSERT INTO `sys_loginfo` VALUES (220, '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 07:39:04');
INSERT INTO `sys_loginfo` VALUES (221, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 07:40:26');
INSERT INTO `sys_loginfo` VALUES (222, '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 07:47:07');
INSERT INTO `sys_loginfo` VALUES (223, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 07:47:40');
INSERT INTO `sys_loginfo` VALUES (224, '落亦--luoyi', '127.0.0.1', '2020-02-24 07:55:53');
INSERT INTO `sys_loginfo` VALUES (225, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 08:09:22');
INSERT INTO `sys_loginfo` VALUES (226, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 08:53:10');
INSERT INTO `sys_loginfo` VALUES (227, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 08:57:15');
INSERT INTO `sys_loginfo` VALUES (228, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:04:42');
INSERT INTO `sys_loginfo` VALUES (229, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:24:06');
INSERT INTO `sys_loginfo` VALUES (230, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:26:52');
INSERT INTO `sys_loginfo` VALUES (231, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:32:45');
INSERT INTO `sys_loginfo` VALUES (232, '落亦--luoyi', '127.0.0.1', '2020-02-24 09:35:36');
INSERT INTO `sys_loginfo` VALUES (233, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:38:13');
INSERT INTO `sys_loginfo` VALUES (234, '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 09:42:05');
INSERT INTO `sys_loginfo` VALUES (235, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:42:47');
INSERT INTO `sys_loginfo` VALUES (236, '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 09:43:05');
INSERT INTO `sys_loginfo` VALUES (237, '李月素-liyuesu', '0:0:0:0:0:0:0:1', '2020-02-24 09:43:42');
INSERT INTO `sys_loginfo` VALUES (238, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:44:05');
INSERT INTO `sys_loginfo` VALUES (239, '李四-lisi', '0:0:0:0:0:0:0:1', '2020-02-24 09:44:47');
INSERT INTO `sys_loginfo` VALUES (240, '李四-lisi', '0:0:0:0:0:0:0:1', '2020-02-24 09:45:14');
INSERT INTO `sys_loginfo` VALUES (241, '王五-wangwu', '0:0:0:0:0:0:0:1', '2020-02-24 09:45:35');
INSERT INTO `sys_loginfo` VALUES (242, '赵六-zhaoliu', '0:0:0:0:0:0:0:1', '2020-02-24 09:45:55');
INSERT INTO `sys_loginfo` VALUES (243, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-02-24 09:46:32');
INSERT INTO `sys_loginfo` VALUES (244, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-01 09:46:24');
INSERT INTO `sys_loginfo` VALUES (245, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 02:28:15');
INSERT INTO `sys_loginfo` VALUES (246, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 02:42:09');
INSERT INTO `sys_loginfo` VALUES (247, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:02:07');
INSERT INTO `sys_loginfo` VALUES (248, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:06:11');
INSERT INTO `sys_loginfo` VALUES (249, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:12:35');
INSERT INTO `sys_loginfo` VALUES (250, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:28:54');
INSERT INTO `sys_loginfo` VALUES (251, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 03:53:25');
INSERT INTO `sys_loginfo` VALUES (252, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-06 12:58:05');
INSERT INTO `sys_loginfo` VALUES (253, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 03:11:53');
INSERT INTO `sys_loginfo` VALUES (254, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 03:50:55');
INSERT INTO `sys_loginfo` VALUES (255, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:13:39');
INSERT INTO `sys_loginfo` VALUES (256, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:16:53');
INSERT INTO `sys_loginfo` VALUES (257, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:23:31');
INSERT INTO `sys_loginfo` VALUES (258, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:25:49');
INSERT INTO `sys_loginfo` VALUES (259, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 04:34:00');
INSERT INTO `sys_loginfo` VALUES (260, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:24:46');
INSERT INTO `sys_loginfo` VALUES (261, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:44:40');
INSERT INTO `sys_loginfo` VALUES (262, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:50:38');
INSERT INTO `sys_loginfo` VALUES (263, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:52:28');
INSERT INTO `sys_loginfo` VALUES (264, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 07:59:44');
INSERT INTO `sys_loginfo` VALUES (265, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 08:10:44');
INSERT INTO `sys_loginfo` VALUES (266, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-07 08:13:23');
INSERT INTO `sys_loginfo` VALUES (267, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:37:14');
INSERT INTO `sys_loginfo` VALUES (268, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:39:03');
INSERT INTO `sys_loginfo` VALUES (269, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:41:25');
INSERT INTO `sys_loginfo` VALUES (270, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:43:31');
INSERT INTO `sys_loginfo` VALUES (271, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 03:56:23');
INSERT INTO `sys_loginfo` VALUES (272, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 04:17:22');
INSERT INTO `sys_loginfo` VALUES (273, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 04:29:46');
INSERT INTO `sys_loginfo` VALUES (274, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 09:53:15');
INSERT INTO `sys_loginfo` VALUES (275, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:07:53');
INSERT INTO `sys_loginfo` VALUES (276, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:30:36');
INSERT INTO `sys_loginfo` VALUES (277, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:32:45');
INSERT INTO `sys_loginfo` VALUES (278, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:36:43');
INSERT INTO `sys_loginfo` VALUES (279, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:50:53');
INSERT INTO `sys_loginfo` VALUES (280, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:52:45');
INSERT INTO `sys_loginfo` VALUES (281, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:53:31');
INSERT INTO `sys_loginfo` VALUES (282, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:54:57');
INSERT INTO `sys_loginfo` VALUES (283, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:55:39');
INSERT INTO `sys_loginfo` VALUES (284, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 10:57:06');
INSERT INTO `sys_loginfo` VALUES (285, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 11:00:54');
INSERT INTO `sys_loginfo` VALUES (286, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 11:04:41');
INSERT INTO `sys_loginfo` VALUES (287, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-08 11:08:39');
INSERT INTO `sys_loginfo` VALUES (288, '落亦--luoyi', '0:0:0:0:0:0:0:1', '2020-03-09 08:36:06');
INSERT INTO `sys_loginfo` VALUES (289, '超级管理员-system', '127.0.0.1', '2023-10-11 02:50:23');
INSERT INTO `sys_loginfo` VALUES (290, '黄海港-huanghaigang', '127.0.0.1', '2023-10-11 03:31:37');
INSERT INTO `sys_loginfo` VALUES (291, '超级管理员-system', '127.0.0.1', '2023-10-11 03:33:21');
INSERT INTO `sys_loginfo` VALUES (292, '超级管理员-system', '127.0.0.1', '2023-10-11 11:50:09');
INSERT INTO `sys_loginfo` VALUES (293, '超级管理员-system', '61.186.177.10', '2023-10-12 01:28:33');
INSERT INTO `sys_loginfo` VALUES (294, '超级管理员-system', '138.2.67.117', '2023-10-12 03:56:35');
INSERT INTO `sys_loginfo` VALUES (295, '超级管理员-system', '61.186.177.10', '2023-10-12 04:55:21');
INSERT INTO `sys_loginfo` VALUES (296, '超级管理员-system', '61.186.177.10', '2023-10-12 07:01:39');
INSERT INTO `sys_loginfo` VALUES (297, '超级管理员-system', '106.84.249.63', '2023-10-12 07:20:02');
INSERT INTO `sys_loginfo` VALUES (298, '仓库管理员-admin', '138.2.67.117', '2023-10-12 08:15:20');
INSERT INTO `sys_loginfo` VALUES (299, '超级管理员-system', '138.2.67.117', '2023-10-12 08:26:39');
INSERT INTO `sys_loginfo` VALUES (300, '超级管理员-system', '138.2.67.117', '2023-10-12 08:28:41');
INSERT INTO `sys_loginfo` VALUES (301, '超级管理员-system', '138.2.67.117', '2023-10-12 08:38:04');
INSERT INTO `sys_loginfo` VALUES (302, '超级管理员-system', '106.84.249.63', '2023-10-12 09:20:45');
INSERT INTO `sys_loginfo` VALUES (303, '超级管理员-system', '138.2.67.117', '2023-10-12 12:28:22');
INSERT INTO `sys_loginfo` VALUES (304, '超级管理员-system', '127.0.0.1', '2023-10-12 13:22:16');
INSERT INTO `sys_loginfo` VALUES (305, '超级管理员-system', '127.0.0.1', '2023-10-12 13:40:55');
INSERT INTO `sys_loginfo` VALUES (306, '超级管理员-system', '127.0.0.1', '2023-10-12 14:53:36');
INSERT INTO `sys_loginfo` VALUES (307, '超级管理员-system', '127.0.0.1', '2023-10-12 15:37:34');
INSERT INTO `sys_loginfo` VALUES (308, '超级管理员-system', '127.0.0.1', '2023-10-12 16:13:58');
INSERT INTO `sys_loginfo` VALUES (309, '超级管理员-system', '127.0.0.1', '2023-10-12 16:31:47');
INSERT INTO `sys_loginfo` VALUES (310, '超级管理员-system', '127.0.0.1', '2023-10-12 16:34:23');
INSERT INTO `sys_loginfo` VALUES (311, '超级管理员-system', '127.0.0.1', '2023-10-12 16:34:50');
INSERT INTO `sys_loginfo` VALUES (312, '超级管理员-system', '127.0.0.1', '2023-10-13 02:22:12');
INSERT INTO `sys_loginfo` VALUES (313, '超级管理员-system', '127.0.0.1', '2023-10-13 04:07:18');
INSERT INTO `sys_loginfo` VALUES (314, '超级管理员-system', '127.0.0.1', '2023-10-13 04:48:42');
INSERT INTO `sys_loginfo` VALUES (315, '超级管理员-system', '127.0.0.1', '2023-10-13 06:12:59');
INSERT INTO `sys_loginfo` VALUES (316, '超级管理员-system', '127.0.0.1', '2023-10-13 06:19:55');
INSERT INTO `sys_loginfo` VALUES (317, '超级管理员-system', '127.0.0.1', '2023-10-13 07:33:21');
INSERT INTO `sys_loginfo` VALUES (318, '超级管理员-system', '127.0.0.1', '2023-10-13 09:04:45');
INSERT INTO `sys_loginfo` VALUES (319, '超级管理员-system', '127.0.0.1', '2023-10-13 11:02:55');
INSERT INTO `sys_loginfo` VALUES (320, '超级管理员-system', '127.0.0.1', '2023-10-13 12:59:24');
INSERT INTO `sys_loginfo` VALUES (321, '超级管理员-system', '127.0.0.1', '2023-10-13 13:39:35');
INSERT INTO `sys_loginfo` VALUES (322, '超级管理员-system', '127.0.0.1', '2023-10-13 14:07:12');
INSERT INTO `sys_loginfo` VALUES (323, '超级管理员-system', '127.0.0.1', '2023-10-13 14:13:01');
INSERT INTO `sys_loginfo` VALUES (324, '超级管理员-system', '127.0.0.1', '2023-10-13 14:18:20');
INSERT INTO `sys_loginfo` VALUES (325, '王五-wangwu', '127.0.0.1', '2023-10-13 14:21:49');
INSERT INTO `sys_loginfo` VALUES (326, '超级管理员-system', '127.0.0.1', '2023-10-13 14:25:12');
INSERT INTO `sys_loginfo` VALUES (327, '超级管理员-system', '127.0.0.1', '2023-10-13 14:28:24');
INSERT INTO `sys_loginfo` VALUES (328, '王五-wangwu', '127.0.0.1', '2023-10-13 14:29:16');
INSERT INTO `sys_loginfo` VALUES (329, '超级管理员-system', '127.0.0.1', '2023-10-13 15:24:28');
INSERT INTO `sys_loginfo` VALUES (330, '超级管理员-system', '127.0.0.1', '2023-10-13 15:36:18');
INSERT INTO `sys_loginfo` VALUES (331, '超级管理员-system', '127.0.0.1', '2023-10-13 16:37:26');
INSERT INTO `sys_loginfo` VALUES (332, '超级管理员-system', '206.190.239.79', '2023-10-13 16:46:24');
INSERT INTO `sys_loginfo` VALUES (333, '超级管理员-system', '127.0.0.1', '2023-10-13 16:48:02');
INSERT INTO `sys_loginfo` VALUES (334, '超级管理员-system', '127.0.0.1', '2023-10-13 16:57:59');
INSERT INTO `sys_loginfo` VALUES (335, '超级管理员-system', '127.0.0.1', '2023-10-13 17:00:22');
INSERT INTO `sys_loginfo` VALUES (336, '超级管理员-system', '127.0.0.1', '2023-10-13 17:04:55');
INSERT INTO `sys_loginfo` VALUES (337, '超级管理员-system', '127.0.0.1', '2023-10-13 17:07:49');
INSERT INTO `sys_loginfo` VALUES (338, '超级管理员-system', '127.0.0.1', '2023-10-13 17:10:26');
INSERT INTO `sys_loginfo` VALUES (339, '超级管理员-system', '127.0.0.1', '2023-10-13 17:20:15');
INSERT INTO `sys_loginfo` VALUES (340, '赵六-zhaoliu', '127.0.0.1', '2023-10-13 17:25:32');
INSERT INTO `sys_loginfo` VALUES (341, '超级管理员-system', '127.0.0.1', '2023-10-13 17:31:45');
INSERT INTO `sys_loginfo` VALUES (342, '超级管理员-system', '127.0.0.1', '2023-10-13 18:03:36');
INSERT INTO `sys_loginfo` VALUES (343, '超级管理员-system', '127.0.0.1', '2023-10-13 18:06:39');
INSERT INTO `sys_loginfo` VALUES (344, '超级管理员-system', '127.0.0.1', '2023-10-14 03:38:56');
INSERT INTO `sys_loginfo` VALUES (345, '超级管理员-system', '127.0.0.1', '2023-10-14 04:31:25');
INSERT INTO `sys_loginfo` VALUES (346, '超级管理员-system', '206.190.239.79', '2023-10-14 04:42:05');
INSERT INTO `sys_loginfo` VALUES (347, '黄海港-hhg', '206.190.239.79', '2023-10-14 04:55:06');
INSERT INTO `sys_loginfo` VALUES (348, '超级管理员-system', '206.190.239.79', '2023-10-14 04:56:28');
INSERT INTO `sys_loginfo` VALUES (349, '超级管理员-system', '206.190.239.79', '2023-10-14 05:05:49');
INSERT INTO `sys_loginfo` VALUES (350, '超级管理员-system', '206.190.239.79', '2023-10-14 05:28:50');
INSERT INTO `sys_loginfo` VALUES (351, '超级管理员-system', '127.0.0.1', '2023-10-14 05:30:01');
INSERT INTO `sys_loginfo` VALUES (352, '超级管理员-system', '127.0.0.1', '2023-10-14 05:31:41');
INSERT INTO `sys_loginfo` VALUES (353, '超级管理员-system', '127.0.0.1', '2023-10-14 05:46:30');
INSERT INTO `sys_loginfo` VALUES (354, '超级管理员-system', '127.0.0.1', '2023-10-14 06:01:26');
INSERT INTO `sys_loginfo` VALUES (355, '超级管理员-system', '106.88.203.230', '2023-10-14 06:12:04');
INSERT INTO `sys_loginfo` VALUES (356, '超级管理员-system', '127.0.0.1', '2023-10-14 06:15:32');
INSERT INTO `sys_loginfo` VALUES (357, '黄海港-hhg', '127.0.0.1', '2023-10-14 07:20:30');
INSERT INTO `sys_loginfo` VALUES (358, '超级管理员-system', '127.0.0.1', '2023-10-14 07:20:52');
INSERT INTO `sys_loginfo` VALUES (359, '黄海港-hhg', '127.0.0.1', '2023-10-14 07:23:47');
INSERT INTO `sys_loginfo` VALUES (360, '仓库管理员-admin', '127.0.0.1', '2023-10-14 07:24:57');
INSERT INTO `sys_loginfo` VALUES (361, '超级管理员-system', '183.228.88.175', '2023-10-14 07:39:27');
INSERT INTO `sys_loginfo` VALUES (362, '超级管理员-system', '183.228.88.175', '2023-10-14 07:43:31');
INSERT INTO `sys_loginfo` VALUES (363, '超级管理员-system', '127.0.0.1', '2023-10-14 07:45:55');
INSERT INTO `sys_loginfo` VALUES (364, '超级管理员-system', '183.228.88.175', '2023-10-14 07:49:07');
INSERT INTO `sys_loginfo` VALUES (365, '仓库管理员-admin', '183.228.88.175', '2023-10-14 07:51:32');
INSERT INTO `sys_loginfo` VALUES (366, '仓库管理员-admin', '106.88.203.230', '2023-10-14 07:54:52');
INSERT INTO `sys_loginfo` VALUES (367, '仓库管理员-admin', '183.228.88.175', '2023-10-14 08:06:17');
INSERT INTO `sys_loginfo` VALUES (368, '超级管理员-system', '106.84.216.102', '2023-10-16 01:26:40');
INSERT INTO `sys_loginfo` VALUES (369, '超级管理员-system', '183.64.107.193', '2023-10-16 01:28:02');
INSERT INTO `sys_loginfo` VALUES (370, '超级管理员-system', '127.0.0.1', '2023-10-16 02:47:57');
INSERT INTO `sys_loginfo` VALUES (371, '超级管理员-system', '127.0.0.1', '2023-10-16 12:55:53');
INSERT INTO `sys_loginfo` VALUES (372, '超级管理员-system', '127.0.0.1', '2023-10-16 13:34:30');
INSERT INTO `sys_loginfo` VALUES (373, '超级管理员-system', '127.0.0.1', '2023-10-16 15:43:37');
INSERT INTO `sys_loginfo` VALUES (374, '超级管理员-system', '127.0.0.1', '2023-10-16 15:44:27');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `available` int(1) NULL DEFAULT NULL COMMENT '是否启用(1启用 0禁用)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (57, '纯牛奶[24瓶一箱]下100件送5件', '<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"layui-table\"><tbody><tr data-index=\"1\" class=\"layui-table-hover\"><td data-field=\"size\" data-key=\"1-0-9\" align=\"center\" class=\"\"><div class=\"layui-table-cell laytable-cell-1-0-9\">纯牛奶[24瓶一箱]</div></td><td data-field=\"goodspackage\" data-key=\"1-0-10\" align=\"center\" class=\"\"><div class=\"layui-table-cell laytable-cell-1-0-10\"><br></div></td><td data-field=\"productcode\" data-key=\"1-0-11\" align=\"center\" class=\"\"><div class=\"layui-table-cell laytable-cell-1-0-11\">-货号：<b>SD13156146</b></div></td></tr></tbody></table>&nbsp;2023年12月31日前有效', '2023-10-12 07:57:06', '超级管理员', NULL);
INSERT INTO `sys_notice` VALUES (71, 'sdfds', 'sdfasdf<span style=\"text-align: right;\">&nbsp;内容</span><div class=\"layui-input-block\" style=\"margin-left: 110px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative; min-height: 36px;\"><div class=\"layui-layedit\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-color: rgb(230, 230, 230); border-width: 1px; border-style: solid; border-radius: 2px;\"><div class=\"layui-unselect layui-layedit-tool\" style=\"padding: 3px 5px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); user-select: none; border-color: rgb(230, 230, 230); border-bottom-width: 1px; border-bottom-style: solid; font-size: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; background-color: rgb(255, 255, 255);\"><span class=\"layui-icon layedit-tool-b\" title=\"加粗\" lay-command=\"Bold\" layedit-event=\"b\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-i\" title=\"斜体\" lay-command=\"italic\" layedit-event=\"i\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-u\" title=\"下划线\" lay-command=\"underline\" layedit-event=\"u\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-d\" title=\"删除线\" lay-command=\"strikeThrough\" layedit-event=\"d\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layedit-tool-mid\" style=\"display: inline-block; vertical-align: middle; text-align: center; font-size: 14px; width: 1px; height: 18px; margin-right: 10px; margin-left: 10px; background-color: rgb(210, 210, 210);\"></span><span class=\"layui-icon layedit-tool-left\" title=\"左对齐\" lay-command=\"justifyLeft\" layedit-event=\"left\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-center\" title=\"居中对齐\" lay-command=\"justifyCenter\" layedit-event=\"center\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-right\" title=\"右对齐\" lay-command=\"justifyRight\" layedit-event=\"right\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layedit-tool-mid\" style=\"display: inline-block; vertical-align: middle; text-align: center; font-size: 14px; width: 1px; height: 18px; margin-right: 10px; margin-left: 10px; background-color: rgb(210, 210, 210);\"></span><span class=\"layui-icon layedit-tool-link\" title=\"插入链接\" layedit-event=\"link\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-unlink layui-disabled\" title=\"清除链接\" lay-command=\"unlink\" layedit-event=\"unlink\" \"=\"\" style=\"font-size: 14px; user-select: none; color: rgb(210, 210, 210); cursor: not-allowed; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-face\" title=\"表情\" layedit-event=\"face\" \"=\"\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"></span><span class=\"layui-icon layedit-tool-image\" title=\"图片\" layedit-event=\"image\" style=\"font-size: 14px; user-select: none; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: middle; text-align: center; position: relative; width: 32px; height: 30px; line-height: 30px; margin: 3px 5px; color: rgb(119, 119, 119); cursor: pointer; border-radius: 2px; font-family: layui-icon !important;\"><input type=\"file\" name=\"file\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: inherit; font-size: 0px; font-style: inherit; font-weight: inherit; outline: 0px; position: absolute; left: 0px; top: 0px; width: 32px; height: 30px; opacity: 0.01; cursor: pointer;\"></span></div></div></div>', '2023-10-16 15:21:59', '超级管理员', NULL);
INSERT INTO `sys_notice` VALUES (78, 'aaa', 'acczcvc', '2023-10-16 15:55:51', '超级管理员', NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单或按钮名称',
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单跳转路径',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open` int(11) NULL DEFAULT NULL COMMENT '是否展开(1展开 0不展开)',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限控制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, 'menu', '仓库管理系统', NULL, '&#xe68e;', '', '', 1, 1, 1);
INSERT INTO `sys_permission` VALUES (2, 1, 'menu', '基础管理', NULL, '&#xe857;', '', '', 0, 2, 1);
INSERT INTO `sys_permission` VALUES (3, 1, 'menu', '进货管理', NULL, '&#xe645;', '', NULL, 0, 3, 1);
INSERT INTO `sys_permission` VALUES (4, 1, 'menu', '销售管理', NULL, '&#xe611;', '', '', 0, 4, 1);
INSERT INTO `sys_permission` VALUES (5, 1, 'menu', '系统管理', NULL, '&#xe614;', '', '', 0, 5, 1);
INSERT INTO `sys_permission` VALUES (6, 1, 'menu', '其它管理', NULL, '&#xe628;', '', '', 0, 6, 1);
INSERT INTO `sys_permission` VALUES (7, 2, 'menu', '客户管理', NULL, '&#xe651;', '/bus/toCustomerManager', '', 0, 7, 1);
INSERT INTO `sys_permission` VALUES (8, 2, 'menu', '供应商管理', NULL, '&#xe658;', '/bus/toProviderManager', '', 0, 8, 1);
INSERT INTO `sys_permission` VALUES (9, 2, 'menu', '商品管理', NULL, '&#xe657;', '/bus/toGoodsManager', '', 0, 9, 1);
INSERT INTO `sys_permission` VALUES (10, 3, 'menu', '商品进货', NULL, '&#xe756;', '/bus/toInportManager', '', 0, 10, 1);
INSERT INTO `sys_permission` VALUES (11, 3, 'menu', '商品退货查询', NULL, '&#xe65a;', '/bus/toOutportManager', '', 0, 11, 1);
INSERT INTO `sys_permission` VALUES (12, 4, 'menu', '商品销售', NULL, '&#xe65b;', '/bus/toSalesManager', '', 0, 12, 1);
INSERT INTO `sys_permission` VALUES (13, 4, 'menu', '销售退货查询', NULL, '&#xe770;', '/bus/toSalesbackManager', '', 0, 13, 1);
INSERT INTO `sys_permission` VALUES (14, 5, 'menu', '部门管理', NULL, '&#xe770;', '/sys/toDeptManager', '', 0, 14, 1);
INSERT INTO `sys_permission` VALUES (15, 5, 'menu', '菜单管理', NULL, '&#xe663;', '/sys/toMenuManager', '', 0, 15, 1);
INSERT INTO `sys_permission` VALUES (16, 5, 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', 0, 16, 1);
INSERT INTO `sys_permission` VALUES (17, 5, 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', 0, 17, 1);
INSERT INTO `sys_permission` VALUES (18, 5, 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', 0, 18, 1);
INSERT INTO `sys_permission` VALUES (21, 6, 'menu', '登陆日志', NULL, '&#xe675;', '/sys/toLoginfoManager', '', 0, 21, 1);
INSERT INTO `sys_permission` VALUES (22, 6, 'menu', '系统公告', NULL, '&#xe756;', '/sys/toNoticeManager', NULL, 0, 22, 1);
INSERT INTO `sys_permission` VALUES (23, 6, 'menu', '图标管理', NULL, '&#xe670;', '../resources/page/icon.html', NULL, 0, 23, 1);
INSERT INTO `sys_permission` VALUES (30, 14, 'permission', '添加部门', 'dept:create', '', NULL, NULL, 0, 24, 1);
INSERT INTO `sys_permission` VALUES (31, 14, 'permission', '修改部门', 'dept:update', '', NULL, NULL, 0, 26, 1);
INSERT INTO `sys_permission` VALUES (32, 14, 'permission', '删除部门', 'dept:delete', '', NULL, NULL, 0, 27, 1);
INSERT INTO `sys_permission` VALUES (34, 15, 'permission', '添加菜单', 'menu:create', '', '', '', 0, 29, 1);
INSERT INTO `sys_permission` VALUES (35, 15, 'permission', '修改菜单', 'menu:update', '', NULL, NULL, 0, 30, 1);
INSERT INTO `sys_permission` VALUES (36, 15, 'permission', '删除菜单', 'menu:delete', '', NULL, NULL, 0, 31, 1);
INSERT INTO `sys_permission` VALUES (38, 16, 'permission', '添加权限', 'permission:create', '', NULL, NULL, 0, 33, 1);
INSERT INTO `sys_permission` VALUES (39, 16, 'permission', '修改权限', 'permission:update', '', NULL, NULL, 0, 34, 1);
INSERT INTO `sys_permission` VALUES (40, 16, 'permission', '删除权限', 'permission:delete', '', NULL, NULL, 0, 35, 1);
INSERT INTO `sys_permission` VALUES (42, 17, 'permission', '添加角色', 'role:create', '', NULL, NULL, 0, 37, 1);
INSERT INTO `sys_permission` VALUES (43, 17, 'permission', '修改角色', 'role:update', '', NULL, NULL, 0, 38, 1);
INSERT INTO `sys_permission` VALUES (44, 17, 'permission', '删除角色', 'role:delete', '', NULL, NULL, 0, 39, 1);
INSERT INTO `sys_permission` VALUES (46, 17, 'permission', '分配权限', 'role:selectPermission', '', NULL, NULL, 0, 41, 1);
INSERT INTO `sys_permission` VALUES (47, 18, 'permission', '添加用户', 'user:create', '', NULL, NULL, 0, 42, 1);
INSERT INTO `sys_permission` VALUES (48, 18, 'permission', '修改用户', 'user:update', '', NULL, NULL, 0, 43, 1);
INSERT INTO `sys_permission` VALUES (49, 18, 'permission', '删除用户', 'user:delete', '', NULL, NULL, 0, 44, 1);
INSERT INTO `sys_permission` VALUES (51, 18, 'permission', '用户分配角色', 'user:selectRole', '', NULL, NULL, 0, 46, 1);
INSERT INTO `sys_permission` VALUES (52, 18, 'permission', '重置密码', 'user:resetPwd', NULL, NULL, NULL, 0, 47, 1);
INSERT INTO `sys_permission` VALUES (53, 14, 'permission', '部门查询', 'dept:view', NULL, NULL, NULL, 0, 48, 1);
INSERT INTO `sys_permission` VALUES (54, 15, 'permission', '菜单查询', 'menu:view', NULL, NULL, NULL, 0, 49, 1);
INSERT INTO `sys_permission` VALUES (55, 16, 'permission', '权限查询', 'permission:view', NULL, NULL, NULL, 0, 50, 1);
INSERT INTO `sys_permission` VALUES (56, 17, 'permission', '角色查询', 'role:view', NULL, NULL, NULL, 0, 51, 1);
INSERT INTO `sys_permission` VALUES (57, 18, 'permission', '用户查询', 'user:view', NULL, NULL, NULL, 0, 52, 1);
INSERT INTO `sys_permission` VALUES (68, 7, 'permission', '客户查询', 'customer:view', NULL, NULL, NULL, NULL, 60, 1);
INSERT INTO `sys_permission` VALUES (69, 7, 'permission', '客户添加', 'customer:create', NULL, NULL, NULL, NULL, 61, 1);
INSERT INTO `sys_permission` VALUES (70, 7, 'permission', '客户修改', 'customer:update', NULL, NULL, NULL, NULL, 62, 1);
INSERT INTO `sys_permission` VALUES (71, 7, 'permission', '客户删除', 'customer:delete', NULL, NULL, NULL, NULL, 63, 1);
INSERT INTO `sys_permission` VALUES (73, 21, 'permission', '日志查询', 'info:view', NULL, NULL, NULL, NULL, 65, 1);
INSERT INTO `sys_permission` VALUES (74, 21, 'permission', '日志删除', 'info:delete', NULL, NULL, NULL, NULL, 66, 1);
INSERT INTO `sys_permission` VALUES (75, 21, 'permission', '日志批量删除', 'info:batchdelete', NULL, NULL, NULL, NULL, 67, 1);
INSERT INTO `sys_permission` VALUES (76, 22, 'permission', '公告查询', 'notice:view', NULL, NULL, NULL, NULL, 68, 1);
INSERT INTO `sys_permission` VALUES (77, 22, 'permission', '公告添加', 'notice:create', NULL, NULL, NULL, NULL, 69, 1);
INSERT INTO `sys_permission` VALUES (78, 22, 'permission', '公告修改', 'notice:update', NULL, NULL, NULL, NULL, 70, 1);
INSERT INTO `sys_permission` VALUES (79, 22, 'permission', '公告删除', 'notice:delete', NULL, NULL, NULL, NULL, 71, 1);
INSERT INTO `sys_permission` VALUES (81, 8, 'permission', '供应商查询', 'provider:view', NULL, NULL, NULL, NULL, 73, 1);
INSERT INTO `sys_permission` VALUES (82, 8, 'permission', '供应商添加', 'provider:create', NULL, NULL, NULL, NULL, 74, 1);
INSERT INTO `sys_permission` VALUES (83, 8, 'permission', '供应商修改', 'provider:update', NULL, NULL, NULL, NULL, 75, 1);
INSERT INTO `sys_permission` VALUES (84, 8, 'permission', '供应商删除', 'provider:delete', NULL, NULL, NULL, NULL, 76, 1);
INSERT INTO `sys_permission` VALUES (86, 22, 'permission', '公告查看', 'notice:viewnotice', NULL, NULL, NULL, NULL, 78, 1);
INSERT INTO `sys_permission` VALUES (91, 9, 'permission', '商品查询', 'goods:view', NULL, NULL, NULL, 0, 79, 1);
INSERT INTO `sys_permission` VALUES (92, 9, 'permission', '商品添加', 'goods:create', NULL, NULL, NULL, 0, 80, 1);
INSERT INTO `sys_permission` VALUES (116, 9, 'permission', '商品删除', 'goods:delete', NULL, NULL, NULL, 0, 84, 1);
INSERT INTO `sys_permission` VALUES (117, 9, 'permission', '商品修改', 'goods:update', NULL, NULL, NULL, 0, 85, 1);
INSERT INTO `sys_permission` VALUES (119, 22, 'permission', '公告批量删除', 'notice:batchdelete', NULL, NULL, NULL, 0, 87, 1);
INSERT INTO `sys_permission` VALUES (122, 6, 'menu', '缓存管理', NULL, '&#xe630', '/sys/toCacheManager', '_black', 1, 88, 1);
INSERT INTO `sys_permission` VALUES (123, 122, 'permission', '同步缓存', 'cache:syncCache', NULL, NULL, NULL, 0, 89, 1);
INSERT INTO `sys_permission` VALUES (124, 122, 'permission', '清空缓存', 'cache:removeAllCache', NULL, NULL, NULL, 0, 90, 1);
INSERT INTO `sys_permission` VALUES (126, 12, 'permission', '添加销售', 'sales:create', NULL, NULL, NULL, 0, 91, 1);
INSERT INTO `sys_permission` VALUES (128, 12, 'permission', '修改销售', 'sales:update', NULL, NULL, NULL, 0, 92, 1);
INSERT INTO `sys_permission` VALUES (129, 12, 'permission', '删除销售', 'sales:delete', NULL, NULL, NULL, 0, 93, 1);
INSERT INTO `sys_permission` VALUES (130, 12, 'permission', '销售退货', 'sales:back', NULL, NULL, NULL, 0, 94, 1);
INSERT INTO `sys_permission` VALUES (131, 13, 'permission', '删除销售退货', 'salesback:delete', NULL, NULL, NULL, 0, 95, 1);
INSERT INTO `sys_permission` VALUES (132, 10, 'permission', '添加进货', 'inport:create', NULL, NULL, NULL, 0, 96, 1);
INSERT INTO `sys_permission` VALUES (133, 10, 'permission', '修改进货', 'inport:update', NULL, NULL, NULL, 0, 97, 1);
INSERT INTO `sys_permission` VALUES (134, 10, 'permission', '删除进货', 'inport:delete', NULL, NULL, NULL, 0, 98, 1);
INSERT INTO `sys_permission` VALUES (135, 10, 'permission', '进货退货', 'inport:back', NULL, NULL, NULL, 0, 99, 1);
INSERT INTO `sys_permission` VALUES (136, 11, 'permission', '删除进货退货', 'outport:delete', NULL, NULL, NULL, 0, 100, 1);
INSERT INTO `sys_permission` VALUES (137, 11, 'permission', '撤回退货', 'outport:revocation', NULL, NULL, NULL, 0, 101, 1);
INSERT INTO `sys_permission` VALUES (138, 13, 'permission', '撤回销售退货', 'salesback:revocation', NULL, NULL, NULL, 0, 102, 1);
INSERT INTO `sys_permission` VALUES (139, 12, 'permission', '根据销售员查询销售记录', 'sales:salesman', NULL, NULL, NULL, 0, 103, 1);
INSERT INTO `sys_permission` VALUES (140, 13, 'permission', '根据销售员查询退货记录', 'salesback:salesman', NULL, NULL, NULL, 0, 104, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `available` int(11) NULL DEFAULT NULL COMMENT '是否启用(1启用 0禁用)',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (4, '基础数据管理员', '基础数据管理员', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (6, '销售员', '销售员', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (8, '系统管理员', '管理所有的系统设置', 1, '2020-02-24 07:46:27');
INSERT INTO `sys_role` VALUES (10, '测试', '测试', 1, '2020-03-06 03:31:36');
INSERT INTO `sys_role` VALUES (11, '仓库管理员', '拥有所有仓库管理操作权限', 1, '2023-10-11 04:02:16');
INSERT INTO `sys_role` VALUES (12, '销售管理员', '拥有销售管理所有权限', 1, '2023-10-14 03:48:32');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`, `rid`) USING BTREE,
  INDEX `sys_role_permission_ibfk_1`(`pid`) USING BTREE,
  INDEX `sys_role_permission_ibfk_2`(`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (4, 1);
INSERT INTO `sys_role_permission` VALUES (6, 1);
INSERT INTO `sys_role_permission` VALUES (8, 1);
INSERT INTO `sys_role_permission` VALUES (10, 1);
INSERT INTO `sys_role_permission` VALUES (11, 1);
INSERT INTO `sys_role_permission` VALUES (12, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (4, 2);
INSERT INTO `sys_role_permission` VALUES (6, 2);
INSERT INTO `sys_role_permission` VALUES (11, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (11, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (6, 4);
INSERT INTO `sys_role_permission` VALUES (11, 4);
INSERT INTO `sys_role_permission` VALUES (12, 4);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (8, 5);
INSERT INTO `sys_role_permission` VALUES (11, 5);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (10, 6);
INSERT INTO `sys_role_permission` VALUES (11, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (4, 7);
INSERT INTO `sys_role_permission` VALUES (6, 7);
INSERT INTO `sys_role_permission` VALUES (11, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (4, 8);
INSERT INTO `sys_role_permission` VALUES (11, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (4, 9);
INSERT INTO `sys_role_permission` VALUES (6, 9);
INSERT INTO `sys_role_permission` VALUES (11, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (11, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (11, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (6, 12);
INSERT INTO `sys_role_permission` VALUES (11, 12);
INSERT INTO `sys_role_permission` VALUES (12, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (6, 13);
INSERT INTO `sys_role_permission` VALUES (11, 13);
INSERT INTO `sys_role_permission` VALUES (12, 13);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (8, 14);
INSERT INTO `sys_role_permission` VALUES (11, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (8, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (8, 16);
INSERT INTO `sys_role_permission` VALUES (11, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (8, 17);
INSERT INTO `sys_role_permission` VALUES (11, 17);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (8, 18);
INSERT INTO `sys_role_permission` VALUES (11, 18);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (11, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 30);
INSERT INTO `sys_role_permission` VALUES (8, 30);
INSERT INTO `sys_role_permission` VALUES (11, 30);
INSERT INTO `sys_role_permission` VALUES (1, 31);
INSERT INTO `sys_role_permission` VALUES (8, 31);
INSERT INTO `sys_role_permission` VALUES (11, 31);
INSERT INTO `sys_role_permission` VALUES (1, 32);
INSERT INTO `sys_role_permission` VALUES (8, 32);
INSERT INTO `sys_role_permission` VALUES (11, 32);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (8, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (8, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (8, 36);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (8, 38);
INSERT INTO `sys_role_permission` VALUES (11, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (8, 39);
INSERT INTO `sys_role_permission` VALUES (11, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (8, 40);
INSERT INTO `sys_role_permission` VALUES (11, 40);
INSERT INTO `sys_role_permission` VALUES (1, 42);
INSERT INTO `sys_role_permission` VALUES (8, 42);
INSERT INTO `sys_role_permission` VALUES (11, 42);
INSERT INTO `sys_role_permission` VALUES (1, 43);
INSERT INTO `sys_role_permission` VALUES (8, 43);
INSERT INTO `sys_role_permission` VALUES (11, 43);
INSERT INTO `sys_role_permission` VALUES (1, 44);
INSERT INTO `sys_role_permission` VALUES (8, 44);
INSERT INTO `sys_role_permission` VALUES (11, 44);
INSERT INTO `sys_role_permission` VALUES (1, 46);
INSERT INTO `sys_role_permission` VALUES (8, 46);
INSERT INTO `sys_role_permission` VALUES (11, 46);
INSERT INTO `sys_role_permission` VALUES (1, 47);
INSERT INTO `sys_role_permission` VALUES (8, 47);
INSERT INTO `sys_role_permission` VALUES (11, 47);
INSERT INTO `sys_role_permission` VALUES (1, 48);
INSERT INTO `sys_role_permission` VALUES (8, 48);
INSERT INTO `sys_role_permission` VALUES (11, 48);
INSERT INTO `sys_role_permission` VALUES (1, 49);
INSERT INTO `sys_role_permission` VALUES (8, 49);
INSERT INTO `sys_role_permission` VALUES (11, 49);
INSERT INTO `sys_role_permission` VALUES (1, 51);
INSERT INTO `sys_role_permission` VALUES (8, 51);
INSERT INTO `sys_role_permission` VALUES (11, 51);
INSERT INTO `sys_role_permission` VALUES (1, 52);
INSERT INTO `sys_role_permission` VALUES (8, 52);
INSERT INTO `sys_role_permission` VALUES (11, 52);
INSERT INTO `sys_role_permission` VALUES (1, 53);
INSERT INTO `sys_role_permission` VALUES (8, 53);
INSERT INTO `sys_role_permission` VALUES (11, 53);
INSERT INTO `sys_role_permission` VALUES (1, 54);
INSERT INTO `sys_role_permission` VALUES (8, 54);
INSERT INTO `sys_role_permission` VALUES (1, 55);
INSERT INTO `sys_role_permission` VALUES (8, 55);
INSERT INTO `sys_role_permission` VALUES (11, 55);
INSERT INTO `sys_role_permission` VALUES (1, 56);
INSERT INTO `sys_role_permission` VALUES (8, 56);
INSERT INTO `sys_role_permission` VALUES (11, 56);
INSERT INTO `sys_role_permission` VALUES (1, 57);
INSERT INTO `sys_role_permission` VALUES (8, 57);
INSERT INTO `sys_role_permission` VALUES (11, 57);
INSERT INTO `sys_role_permission` VALUES (1, 68);
INSERT INTO `sys_role_permission` VALUES (4, 68);
INSERT INTO `sys_role_permission` VALUES (6, 68);
INSERT INTO `sys_role_permission` VALUES (11, 68);
INSERT INTO `sys_role_permission` VALUES (1, 69);
INSERT INTO `sys_role_permission` VALUES (6, 69);
INSERT INTO `sys_role_permission` VALUES (11, 69);
INSERT INTO `sys_role_permission` VALUES (1, 70);
INSERT INTO `sys_role_permission` VALUES (11, 70);
INSERT INTO `sys_role_permission` VALUES (1, 71);
INSERT INTO `sys_role_permission` VALUES (11, 71);
INSERT INTO `sys_role_permission` VALUES (1, 73);
INSERT INTO `sys_role_permission` VALUES (1, 74);
INSERT INTO `sys_role_permission` VALUES (1, 75);
INSERT INTO `sys_role_permission` VALUES (1, 76);
INSERT INTO `sys_role_permission` VALUES (11, 76);
INSERT INTO `sys_role_permission` VALUES (1, 77);
INSERT INTO `sys_role_permission` VALUES (11, 77);
INSERT INTO `sys_role_permission` VALUES (1, 78);
INSERT INTO `sys_role_permission` VALUES (11, 78);
INSERT INTO `sys_role_permission` VALUES (1, 79);
INSERT INTO `sys_role_permission` VALUES (11, 79);
INSERT INTO `sys_role_permission` VALUES (1, 81);
INSERT INTO `sys_role_permission` VALUES (4, 81);
INSERT INTO `sys_role_permission` VALUES (11, 81);
INSERT INTO `sys_role_permission` VALUES (1, 82);
INSERT INTO `sys_role_permission` VALUES (11, 82);
INSERT INTO `sys_role_permission` VALUES (1, 83);
INSERT INTO `sys_role_permission` VALUES (11, 83);
INSERT INTO `sys_role_permission` VALUES (1, 84);
INSERT INTO `sys_role_permission` VALUES (11, 84);
INSERT INTO `sys_role_permission` VALUES (1, 86);
INSERT INTO `sys_role_permission` VALUES (11, 86);
INSERT INTO `sys_role_permission` VALUES (1, 91);
INSERT INTO `sys_role_permission` VALUES (4, 91);
INSERT INTO `sys_role_permission` VALUES (6, 91);
INSERT INTO `sys_role_permission` VALUES (11, 91);
INSERT INTO `sys_role_permission` VALUES (1, 92);
INSERT INTO `sys_role_permission` VALUES (4, 92);
INSERT INTO `sys_role_permission` VALUES (11, 92);
INSERT INTO `sys_role_permission` VALUES (1, 116);
INSERT INTO `sys_role_permission` VALUES (4, 116);
INSERT INTO `sys_role_permission` VALUES (11, 116);
INSERT INTO `sys_role_permission` VALUES (1, 117);
INSERT INTO `sys_role_permission` VALUES (4, 117);
INSERT INTO `sys_role_permission` VALUES (11, 117);
INSERT INTO `sys_role_permission` VALUES (11, 119);
INSERT INTO `sys_role_permission` VALUES (10, 122);
INSERT INTO `sys_role_permission` VALUES (11, 122);
INSERT INTO `sys_role_permission` VALUES (11, 123);
INSERT INTO `sys_role_permission` VALUES (11, 124);
INSERT INTO `sys_role_permission` VALUES (6, 126);
INSERT INTO `sys_role_permission` VALUES (11, 126);
INSERT INTO `sys_role_permission` VALUES (12, 126);
INSERT INTO `sys_role_permission` VALUES (6, 128);
INSERT INTO `sys_role_permission` VALUES (11, 128);
INSERT INTO `sys_role_permission` VALUES (12, 128);
INSERT INTO `sys_role_permission` VALUES (6, 129);
INSERT INTO `sys_role_permission` VALUES (11, 129);
INSERT INTO `sys_role_permission` VALUES (12, 129);
INSERT INTO `sys_role_permission` VALUES (6, 130);
INSERT INTO `sys_role_permission` VALUES (11, 130);
INSERT INTO `sys_role_permission` VALUES (12, 130);
INSERT INTO `sys_role_permission` VALUES (11, 131);
INSERT INTO `sys_role_permission` VALUES (12, 131);
INSERT INTO `sys_role_permission` VALUES (11, 132);
INSERT INTO `sys_role_permission` VALUES (11, 133);
INSERT INTO `sys_role_permission` VALUES (11, 134);
INSERT INTO `sys_role_permission` VALUES (11, 135);
INSERT INTO `sys_role_permission` VALUES (11, 136);
INSERT INTO `sys_role_permission` VALUES (11, 137);
INSERT INTO `sys_role_permission` VALUES (6, 138);
INSERT INTO `sys_role_permission` VALUES (11, 138);
INSERT INTO `sys_role_permission` VALUES (12, 138);
INSERT INTO `sys_role_permission` VALUES (11, 139);
INSERT INTO `sys_role_permission` VALUES (12, 139);
INSERT INTO `sys_role_permission` VALUES (11, 140);
INSERT INTO `sys_role_permission` VALUES (12, 140);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户地址',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别(1男 0女)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `hiredate` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `mgr` int(11) NULL DEFAULT NULL COMMENT '上级领导id',
  `available` int(11) NULL DEFAULT 1 COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码',
  `type` int(255) NULL DEFAULT NULL COMMENT '用户类型[0超级管理员，1管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  `isdelete` int(255) NULL DEFAULT 0 COMMENT '是否删除（1已删除 0未删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_user_loginname`(`loginname`) USING BTREE COMMENT '登陆名称唯一',
  INDEX `FK_sys_dept_sys_user`(`deptid`) USING BTREE,
  CONSTRAINT `FK_sys_dept_sys_user` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '超级管理员', 'system', '532ac00e86893901af5f0be6b704dbc7', '系统深处的男人', 1, '超级管理员', 1, '2018-06-25 11:06:34', NULL, 1, 1, 0, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '04A93C74C8294AA09A8B974FD1F4ECBB', 0);
INSERT INTO `sys_user` VALUES (2, '落亦-', 'luoyi', '532ac00e86893901af5f0be6b704dbc7', '九江', 1, '超级管理员', 1, '2019-11-23 20:52:16', NULL, 1, 2, 0, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '04A93C74C8294AA09A8B974FD1F4ECBB', 0);
INSERT INTO `sys_user` VALUES (3, '李月素', 'liyuesu', '532ac00e86893901af5f0be6b704dbc7', '九江', 1, '否', 2, '2020-02-12 12:22:23', 5, 1, 3, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '04A93C74C8294AA09A8B974FD1F4ECBB', 0);
INSERT INTO `sys_user` VALUES (4, '李四', 'lisi', '532ac00e86893901af5f0be6b704dbc7', '九江', 1, '普通用户', 3, '2020-02-09 15:46:55', 3, 1, 4, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '04A93C74C8294AA09A8B974FD1F4ECBB', 0);
INSERT INTO `sys_user` VALUES (5, '王五', 'wangwu', 'a45fbc0f37577b407f8bfb4610f9a6bb', '上海', 1, '普通用户', 5, '2019-12-02 18:57:42', 4, 1, 5, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', 'D1ECDC55658D46A4805425F3A72A2451', 0);
INSERT INTO `sys_user` VALUES (6, '赵六', 'zhaoliu', 'd8bed69484de1d3fcd23b00df23167e3', '广州', 1, '普通用户', 5, '2019-12-02 18:59:05', 5, 1, 6, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', 'A5FFDF9FF1554481A6262A1B3EF90EBC', 0);
INSERT INTO `sys_user` VALUES (7, '陈七', 'chengqi', '532ac00e86893901af5f0be6b704dbc7', '深圳', 1, '普遍用户', 4, '2019-12-03 09:52:18', 3, 1, 7, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '04A93C74C8294AA09A8B974FD1F4ECBB', 0);
INSERT INTO `sys_user` VALUES (10, '苏北旦', 'subeidan', 'b661f48dc70d448773be54874198788c', '重庆', 0, '将军', 3, '2019-12-03 00:00:00', 3, 1, 9, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '950289EBDBA24C7789E392E1D0254635', 0);
INSERT INTO `sys_user` VALUES (12, '托尼', 'tuoni', '1403e113a2936d4509e9c13b8849f4b5', '美国', 1, '钢铁侠', 7, '2019-12-03 00:00:00', 13, 1, 11, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '571059AF59E64A7D92FECB93FA1B0AEF', 0);
INSERT INTO `sys_user` VALUES (13, '贾维斯', 'jiaweisi', '98f28b861888f4274cb423345dce4bcc', '美国', 1, '人工智能', 3, '2019-12-03 00:00:00', 12, 1, 12, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '7258E2D93A3F429085B34BBD8E345CE7', 0);
INSERT INTO `sys_user` VALUES (14, '李九', 'lijiu', '9356d33c67f21e23b448d6198e414f77', '九江', 1, '测试', 4, '2020-03-05 16:00:00', 10, 1, 13, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', 'D3FBF5E33F4D42FDACE85178FE84E95A', 0);
INSERT INTO `sys_user` VALUES (17, '张十', 'zhangshi', 'e99ddd2f81f17319e7a767573c674975', '南昌', 1, '测试', 4, '2020-03-06 03:30:12', 10, 1, 14, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '5C6E7D2E2D8C4A8CB9DD4A9DF64DDB57', 0);
INSERT INTO `sys_user` VALUES (18, '黄海港', 'hhg', '1571d9fe3f288f057de76ae95e95fcf0', '石柱县', 1, '金牌销售', 5, '2023-10-10 16:00:00', 25, 1, 15, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '1697F7E735F54255AB5C1D0F7FA6D3C1', 0);
INSERT INTO `sys_user` VALUES (25, '仓库管理员', 'admin', '81e55fc79ef1a8269d5ffc8c2c39e419', '石柱县', 1, '', 1, '2023-10-14 07:22:20', NULL, 1, 16, 1, '2023-10-14/D790172D28BC456DA8EC561A8E1BBE75.png', '5E77FF4B01E6433392265865E825C608', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE,
  INDEX `FK_sys_user_role_1`(`rid`) USING BTREE,
  CONSTRAINT `FK_sys_user_role_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sys_user_role_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (5, 6);
INSERT INTO `sys_user_role` VALUES (6, 6);
INSERT INTO `sys_user_role` VALUES (7, 6);
INSERT INTO `sys_user_role` VALUES (18, 6);
INSERT INTO `sys_user_role` VALUES (3, 8);
INSERT INTO `sys_user_role` VALUES (17, 10);
INSERT INTO `sys_user_role` VALUES (25, 11);

SET FOREIGN_KEY_CHECKS = 1;
