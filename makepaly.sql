/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : makepaly

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-10-19 11:09:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mk_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mk_admin_menu`;
CREATE TABLE `mk_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of mk_admin_menu
-- ----------------------------
INSERT INTO `mk_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `mk_admin_menu` VALUES ('2', '1', '1', '0', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `mk_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `mk_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `mk_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `mk_admin_menu` VALUES ('6', '0', '0', '0', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `mk_admin_menu` VALUES ('7', '6', '1', '0', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `mk_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `mk_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `mk_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `mk_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `mk_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `mk_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `mk_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `mk_admin_menu` VALUES ('15', '6', '1', '0', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `mk_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `mk_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `mk_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `mk_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `mk_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `mk_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `mk_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `mk_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `mk_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `mk_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `mk_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `mk_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `mk_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `mk_admin_menu` VALUES ('29', '6', '1', '0', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `mk_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `mk_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `mk_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `mk_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `mk_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `mk_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `mk_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `mk_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `mk_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `mk_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `mk_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `mk_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `mk_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `mk_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `mk_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `mk_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `mk_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `mk_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `mk_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `mk_admin_menu` VALUES ('49', '110', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `mk_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `mk_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `mk_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `mk_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `mk_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `mk_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `mk_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `mk_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `mk_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `mk_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `mk_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `mk_admin_menu` VALUES ('61', '6', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `mk_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `mk_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `mk_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `mk_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `mk_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `mk_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `mk_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `mk_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `mk_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `mk_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `mk_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `mk_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `mk_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `mk_admin_menu` VALUES ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `mk_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `mk_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `mk_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `mk_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `mk_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `mk_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `mk_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `mk_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `mk_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `mk_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `mk_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `mk_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `mk_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `mk_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `mk_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `mk_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `mk_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `mk_admin_menu` VALUES ('93', '6', '1', '0', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `mk_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `mk_admin_menu` VALUES ('95', '6', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `mk_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `mk_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `mk_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `mk_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `mk_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `mk_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `mk_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `mk_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `mk_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `mk_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `mk_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `mk_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `mk_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `mk_admin_menu` VALUES ('109', '95', '1', '0', '10000', 'admin', 'Theme', 'design', '', '模板设计', '', '模板设计');
INSERT INTO `mk_admin_menu` VALUES ('110', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `mk_admin_menu` VALUES ('111', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `mk_admin_menu` VALUES ('112', '111', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `mk_admin_menu` VALUES ('113', '111', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `mk_admin_menu` VALUES ('114', '111', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `mk_admin_menu` VALUES ('115', '111', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `mk_admin_menu` VALUES ('116', '111', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `mk_admin_menu` VALUES ('117', '111', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `mk_admin_menu` VALUES ('118', '111', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `mk_admin_menu` VALUES ('119', '111', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `mk_admin_menu` VALUES ('120', '111', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `mk_admin_menu` VALUES ('121', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `mk_admin_menu` VALUES ('122', '121', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `mk_admin_menu` VALUES ('123', '110', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `mk_admin_menu` VALUES ('124', '123', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `mk_admin_menu` VALUES ('125', '124', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `mk_admin_menu` VALUES ('126', '124', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `mk_admin_menu` VALUES ('127', '123', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `mk_admin_menu` VALUES ('128', '127', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `mk_admin_menu` VALUES ('129', '6', '1', '1', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `mk_admin_menu` VALUES ('130', '129', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `mk_admin_menu` VALUES ('131', '129', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `mk_admin_menu` VALUES ('132', '129', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `mk_admin_menu` VALUES ('162', '0', '0', '0', '10000', 'mall', 'AdminIndex', 'default', '', '商城管理', 'globe', '商城管理');
INSERT INTO `mk_admin_menu` VALUES ('163', '162', '2', '0', '10000', 'mall', 'AdminAttr', 'index', '', '属性管理', '', '属性管理');
INSERT INTO `mk_admin_menu` VALUES ('164', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'addPost', '', '添加商品模型属性提交保存', '', '添加商品模型属性提交保存');
INSERT INTO `mk_admin_menu` VALUES ('165', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'editPost', '', '编辑商品模型属性提交保存', '', '编辑商品模型属性提交保存');
INSERT INTO `mk_admin_menu` VALUES ('166', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'delete', '', '删除商品模型属性', '', '删除商品模型属性');
INSERT INTO `mk_admin_menu` VALUES ('167', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'toggle', '', '商品模型属性 启用禁用', '', '商品模型属性 启用禁用');
INSERT INTO `mk_admin_menu` VALUES ('168', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'listOrder', '', '商品模型属性排序', '', '商品模型属性排序');
INSERT INTO `mk_admin_menu` VALUES ('169', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'addValuePost', '', '添加商品模型属性值提交保存', '', '添加商品模型属性值提交保存');
INSERT INTO `mk_admin_menu` VALUES ('170', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'editValuePost', '', '编辑商品模型属性值提交保存', '', '编辑商品模型属性值提交保存');
INSERT INTO `mk_admin_menu` VALUES ('171', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'deleteValue', '', '删除商品模型属性值', '', '删除商品模型属性值');
INSERT INTO `mk_admin_menu` VALUES ('172', '163', '2', '0', '10000', 'mall', 'AdminAttr', 'valueListOrder', '', '商品模型属性值排序', '', '商品模型属性值排序');
INSERT INTO `mk_admin_menu` VALUES ('173', '162', '1', '1', '10000', 'mall', 'AdminBrand', 'index', '', '品牌管理', '', '品牌管理');
INSERT INTO `mk_admin_menu` VALUES ('174', '173', '2', '0', '10000', 'mall', 'AdminBrand', 'status', '', '设置品牌启用状态', '', '设置品牌启用状态');
INSERT INTO `mk_admin_menu` VALUES ('175', '173', '1', '0', '10000', 'mall', 'AdminBrand', 'add', '', '新增品牌', '', '新增品牌');
INSERT INTO `mk_admin_menu` VALUES ('176', '175', '2', '0', '10000', 'mall', 'AdminBrand', 'addPost', '', '新增品牌提交', '', '新增品牌提交');
INSERT INTO `mk_admin_menu` VALUES ('177', '173', '1', '0', '10000', 'mall', 'AdminBrand', 'edit', '', '编辑品牌', '', '编辑品牌');
INSERT INTO `mk_admin_menu` VALUES ('178', '173', '1', '0', '10000', 'mall', 'AdminBrand', 'editPost', '', '编辑品牌提交', '', '编辑品牌提交');
INSERT INTO `mk_admin_menu` VALUES ('179', '173', '2', '0', '10000', 'mall', 'AdminBrand', 'delete', '', '删除品牌', '', '删除品牌');
INSERT INTO `mk_admin_menu` VALUES ('180', '162', '1', '1', '10000', 'mall', 'AdminCategory', 'index', '', '商品分类', '', '商品分类');
INSERT INTO `mk_admin_menu` VALUES ('181', '180', '1', '0', '10000', 'mall', 'AdminCategory', 'edit', '', '编辑商品分类', '', '编辑商品分类');
INSERT INTO `mk_admin_menu` VALUES ('182', '181', '2', '0', '10000', 'mall', 'AdminCategory', 'editPost', '', '编辑商品分类提交', '', '编辑商品分类提交');
INSERT INTO `mk_admin_menu` VALUES ('183', '180', '2', '0', '10000', 'mall', 'AdminCategory', 'setStatusOn', '', '设置商品分类启用状态', '', '设置商品分类启用状态');
INSERT INTO `mk_admin_menu` VALUES ('184', '180', '2', '0', '10000', 'mall', 'AdminCategory', 'setStatusOff', '', '设置商品分类禁用状态', '', '设置商品分类禁用状态');
INSERT INTO `mk_admin_menu` VALUES ('185', '180', '2', '0', '10000', 'mall', 'AdminCategory', 'delete', '', '删除商品分类', '', '删除商品分类');
INSERT INTO `mk_admin_menu` VALUES ('186', '180', '2', '0', '10000', 'mall', 'AdminCategory', 'listOrder', '', '商品分类排序', '', '商品分类排序');
INSERT INTO `mk_admin_menu` VALUES ('187', '162', '1', '1', '10000', 'mall', 'AdminItem', 'index', '', '商品管理', '', '商品管理');
INSERT INTO `mk_admin_menu` VALUES ('188', '187', '1', '0', '10000', 'mall', 'AdminItem', 'add', '', '添加商品', '', '添加商品');
INSERT INTO `mk_admin_menu` VALUES ('189', '187', '2', '0', '10000', 'mall', 'AdminItem', 'addPost', '', '添加商品提交保存', '', '添加商品提交保存');
INSERT INTO `mk_admin_menu` VALUES ('190', '187', '1', '0', '10000', 'mall', 'AdminItem', 'edit', '', '编辑商品', '', '编辑商品');
INSERT INTO `mk_admin_menu` VALUES ('191', '187', '1', '0', '10000', 'mall', 'AdminItem', 'skuList', '', '编辑商品规格', '', '编辑商品规格');
INSERT INTO `mk_admin_menu` VALUES ('192', '187', '1', '0', '10000', 'mall', 'AdminItem', 'saveSku', '', '保存商品规格', '', '保存商品规格');
INSERT INTO `mk_admin_menu` VALUES ('193', '187', '1', '0', '10000', 'mall', 'AdminItem', 'deleteSku', '', '删除商品规格', '', '删除商品规格');
INSERT INTO `mk_admin_menu` VALUES ('194', '187', '1', '0', '10000', 'mall', 'AdminItem', 'skuStatus', '', '商品规格上下架', '', '商品规格上下架');
INSERT INTO `mk_admin_menu` VALUES ('195', '187', '2', '0', '10000', 'mall', 'AdminItem', 'changeModel', '', '更改商品模型', '', '更改商品模型');
INSERT INTO `mk_admin_menu` VALUES ('196', '187', '2', '0', '10000', 'mall', 'AdminItem', 'editPost', '', '编辑商品提交保存', '', '添加商品提交保存');
INSERT INTO `mk_admin_menu` VALUES ('197', '187', '2', '0', '10000', 'mall', 'AdminItem', 'listOrder', '', '商品排序', '', '商品排序');
INSERT INTO `mk_admin_menu` VALUES ('198', '187', '2', '0', '10000', 'mall', 'AdminItem', 'status', '', '商品上架下架', '', '商品上架下架');
INSERT INTO `mk_admin_menu` VALUES ('199', '162', '1', '1', '10000', 'mall', 'AdminModel', 'index', '', '模型管理', '', '模型管理');
INSERT INTO `mk_admin_menu` VALUES ('200', '199', '1', '0', '10000', 'mall', 'AdminModel', 'add', '', '添加商品模型', '', '添加商品模型');
INSERT INTO `mk_admin_menu` VALUES ('201', '199', '2', '0', '10000', 'mall', 'AdminModel', 'addPost', '', '添加商品模型提交保存', '', '添加商品模型提交保存');
INSERT INTO `mk_admin_menu` VALUES ('202', '199', '1', '0', '10000', 'mall', 'AdminModel', 'edit', '', '编辑商品模型', '', '编辑商品模型');
INSERT INTO `mk_admin_menu` VALUES ('203', '199', '2', '0', '10000', 'mall', 'AdminModel', 'editPost', '', '编辑商品模型提交保存', '', '编辑商品模型提交保存');
INSERT INTO `mk_admin_menu` VALUES ('204', '199', '2', '0', '10000', 'mall', 'AdminModel', 'delete', '', '删除商品模型', '', '删除商品模型');
INSERT INTO `mk_admin_menu` VALUES ('205', '199', '2', '0', '10000', 'mall', 'AdminModel', 'toggle', '', '商品模型 启用禁用', '', '商品模型 启用禁用');
INSERT INTO `mk_admin_menu` VALUES ('206', '199', '1', '0', '10000', 'mall', 'AdminModel', 'attrs', '', '商品模型属性列表', '', '商品模型属性列表');
INSERT INTO `mk_admin_menu` VALUES ('218', '6', '1', '1', '10000', 'order', 'AdminPayment', 'index', '', '支付管理', '', '支付管理');
INSERT INTO `mk_admin_menu` VALUES ('219', '218', '1', '0', '10000', 'order', 'AdminPayment', 'edit', '', '编辑支付方式', '', '编辑支付方式');
INSERT INTO `mk_admin_menu` VALUES ('220', '218', '2', '0', '10000', 'order', 'AdminPayment', 'editPost', '', '编辑支付方式提交保存', '', '编辑支付方式提交保存');
INSERT INTO `mk_admin_menu` VALUES ('221', '218', '2', '0', '10000', 'order', 'AdminPayment', 'delete', '', '删除支付方式', '', '删除支付方式');
INSERT INTO `mk_admin_menu` VALUES ('222', '218', '2', '0', '10000', 'order', 'AdminPayment', 'listOrder', '', '支付方式排序', '', '支付方式排序');
INSERT INTO `mk_admin_menu` VALUES ('223', '218', '2', '0', '10000', 'order', 'AdminPayment', 'enable', '', '支付方式启用', '', '支付方式启用');
INSERT INTO `mk_admin_menu` VALUES ('224', '218', '2', '0', '10000', 'order', 'AdminPayment', 'disable', '', '支付方式禁用', '', '支付方式禁用');
INSERT INTO `mk_admin_menu` VALUES ('225', '6', '1', '1', '10000', 'order', 'AdminShipment', 'index', '', '物流方式', '', '物流方式');
INSERT INTO `mk_admin_menu` VALUES ('226', '225', '1', '0', '10000', 'order', 'AdminShipment', 'add', '', '添加物流方式', '', '添加物流方式');
INSERT INTO `mk_admin_menu` VALUES ('227', '225', '2', '0', '10000', 'order', 'AdminShipment', 'addPost', '', '添加物流方式提交保存', '', '添加物流方式提交保存');
INSERT INTO `mk_admin_menu` VALUES ('228', '225', '1', '0', '10000', 'order', 'AdminShipment', 'edit', '', '编辑物流方式', '', '编辑物流方式');
INSERT INTO `mk_admin_menu` VALUES ('229', '225', '2', '0', '10000', 'order', 'AdminShipment', 'editPost', '', '编辑物流方式提交保存', '', '编辑物流方式提交保存');
INSERT INTO `mk_admin_menu` VALUES ('230', '225', '2', '0', '10000', 'order', 'AdminShipment', 'delete', '', '删除物流方式', '', '删除物流方式');
INSERT INTO `mk_admin_menu` VALUES ('231', '225', '2', '0', '10000', 'order', 'AdminShipment', 'listOrder', '', '物流方式排序', '', '物流方式排序');
INSERT INTO `mk_admin_menu` VALUES ('232', '225', '2', '0', '10000', 'order', 'AdminShipment', 'enable', '', '物流方式启用', '', '物流方式启用');
INSERT INTO `mk_admin_menu` VALUES ('233', '225', '2', '0', '10000', 'order', 'AdminShipment', 'disable', '', '物流方式禁用', '', '物流方式禁用');
INSERT INTO `mk_admin_menu` VALUES ('234', '0', '0', '0', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `mk_admin_menu` VALUES ('235', '234', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `mk_admin_menu` VALUES ('236', '235', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `mk_admin_menu` VALUES ('237', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `mk_admin_menu` VALUES ('238', '235', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `mk_admin_menu` VALUES ('239', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `mk_admin_menu` VALUES ('240', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `mk_admin_menu` VALUES ('241', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `mk_admin_menu` VALUES ('242', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `mk_admin_menu` VALUES ('243', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `mk_admin_menu` VALUES ('244', '235', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `mk_admin_menu` VALUES ('245', '234', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `mk_admin_menu` VALUES ('246', '245', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `mk_admin_menu` VALUES ('247', '245', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `mk_admin_menu` VALUES ('248', '245', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `mk_admin_menu` VALUES ('249', '245', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `mk_admin_menu` VALUES ('250', '245', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `mk_admin_menu` VALUES ('251', '245', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `mk_admin_menu` VALUES ('252', '245', '2', '0', '10000', 'portal', 'AdminCategory', 'toggle', '', '文章分类显示隐藏', '', '文章分类显示隐藏');
INSERT INTO `mk_admin_menu` VALUES ('253', '245', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `mk_admin_menu` VALUES ('254', '234', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `mk_admin_menu` VALUES ('255', '254', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `mk_admin_menu` VALUES ('256', '254', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `mk_admin_menu` VALUES ('257', '254', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `mk_admin_menu` VALUES ('258', '254', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `mk_admin_menu` VALUES ('259', '254', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `mk_admin_menu` VALUES ('260', '234', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `mk_admin_menu` VALUES ('261', '260', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `mk_admin_menu` VALUES ('262', '260', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `mk_admin_menu` VALUES ('263', '260', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `mk_admin_menu` VALUES ('264', '260', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `mk_admin_menu` VALUES ('265', '0', '1', '1', '10000', 'vote', 'Index', 'default', '', '投票管理', 'ticket ', '投票管理');
INSERT INTO `mk_admin_menu` VALUES ('266', '265', '1', '1', '10000', 'vote', 'Index', 'index', '', '选手列表', 'fa-list ', '选手列表');
INSERT INTO `mk_admin_menu` VALUES ('267', '265', '1', '1', '10000', 'vote', 'Index', 'shenhe', '', '人员审核', 'fa-check-circle', '人员审核');
INSERT INTO `mk_admin_menu` VALUES ('268', '265', '1', '1', '10000', 'vote', 'Index', 'log', '', '投票日志', '', '投票日志');

-- ----------------------------
-- Table structure for `mk_asset`
-- ----------------------------
DROP TABLE IF EXISTS `mk_asset`;
CREATE TABLE `mk_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of mk_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `mk_auth_access`;
CREATE TABLE `mk_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of mk_auth_access
-- ----------------------------
INSERT INTO `mk_auth_access` VALUES ('5', '2', 'vote/index/default', 'admin_url');
INSERT INTO `mk_auth_access` VALUES ('6', '2', 'vote/index/index', 'admin_url');
INSERT INTO `mk_auth_access` VALUES ('7', '2', 'vote/index/shenhe', 'admin_url');

-- ----------------------------
-- Table structure for `mk_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `mk_auth_rule`;
CREATE TABLE `mk_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of mk_auth_rule
-- ----------------------------
INSERT INTO `mk_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `mk_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `mk_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `mk_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `mk_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `mk_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `mk_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `mk_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `mk_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `mk_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `mk_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `mk_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `mk_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `mk_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `mk_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `mk_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `mk_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `mk_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `mk_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `mk_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `mk_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `mk_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `mk_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `mk_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `mk_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `mk_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `mk_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `mk_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `mk_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `mk_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `mk_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `mk_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `mk_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `mk_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `mk_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `mk_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `mk_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `mk_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `mk_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `mk_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `mk_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `mk_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `mk_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `mk_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `mk_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `mk_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `mk_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `mk_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `mk_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `mk_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `mk_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `mk_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `mk_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `mk_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `mk_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `mk_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `mk_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `mk_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `mk_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `mk_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `mk_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `mk_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `mk_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `mk_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `mk_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `mk_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `mk_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `mk_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `mk_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `mk_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `mk_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `mk_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `mk_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `mk_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `mk_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `mk_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `mk_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `mk_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `mk_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `mk_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `mk_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `mk_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `mk_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `mk_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `mk_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `mk_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `mk_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `mk_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `mk_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `mk_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `mk_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', '');
INSERT INTO `mk_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `mk_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `mk_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `mk_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `mk_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `mk_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `mk_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `mk_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `mk_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `mk_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `mk_auth_rule` VALUES ('119', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `mk_auth_rule` VALUES ('120', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `mk_auth_rule` VALUES ('121', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `mk_auth_rule` VALUES ('122', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `mk_auth_rule` VALUES ('123', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `mk_auth_rule` VALUES ('124', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `mk_auth_rule` VALUES ('125', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `mk_auth_rule` VALUES ('126', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `mk_auth_rule` VALUES ('127', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `mk_auth_rule` VALUES ('128', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `mk_auth_rule` VALUES ('129', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `mk_auth_rule` VALUES ('130', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `mk_auth_rule` VALUES ('131', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `mk_auth_rule` VALUES ('132', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `mk_auth_rule` VALUES ('162', '1', 'mall', 'admin_url', 'mall/AdminAttr/index', '', '属性管理', '');
INSERT INTO `mk_auth_rule` VALUES ('163', '1', 'mall', 'admin_url', 'mall/AdminAttr/addPost', '', '添加商品模型属性提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('164', '1', 'mall', 'admin_url', 'mall/AdminAttr/editPost', '', '编辑商品模型属性提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('165', '1', 'mall', 'admin_url', 'mall/AdminAttr/delete', '', '删除商品模型属性', '');
INSERT INTO `mk_auth_rule` VALUES ('166', '1', 'mall', 'admin_url', 'mall/AdminAttr/toggle', '', '商品模型属性 启用禁用', '');
INSERT INTO `mk_auth_rule` VALUES ('167', '1', 'mall', 'admin_url', 'mall/AdminAttr/listOrder', '', '商品模型属性排序', '');
INSERT INTO `mk_auth_rule` VALUES ('168', '1', 'mall', 'admin_url', 'mall/AdminAttr/addValuePost', '', '添加商品模型属性值提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('169', '1', 'mall', 'admin_url', 'mall/AdminAttr/editValuePost', '', '编辑商品模型属性值提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('170', '1', 'mall', 'admin_url', 'mall/AdminAttr/deleteValue', '', '删除商品模型属性值', '');
INSERT INTO `mk_auth_rule` VALUES ('171', '1', 'mall', 'admin_url', 'mall/AdminAttr/valueListOrder', '', '商品模型属性值排序', '');
INSERT INTO `mk_auth_rule` VALUES ('172', '1', 'mall', 'admin_url', 'mall/AdminBrand/index', '', '品牌管理', '');
INSERT INTO `mk_auth_rule` VALUES ('173', '1', 'mall', 'admin_url', 'mall/AdminBrand/status', '', '设置品牌启用状态', '');
INSERT INTO `mk_auth_rule` VALUES ('174', '1', 'mall', 'admin_url', 'mall/AdminBrand/add', '', '新增品牌', '');
INSERT INTO `mk_auth_rule` VALUES ('175', '1', 'mall', 'admin_url', 'mall/AdminBrand/addPost', '', '新增品牌提交', '');
INSERT INTO `mk_auth_rule` VALUES ('176', '1', 'mall', 'admin_url', 'mall/AdminBrand/edit', '', '编辑品牌', '');
INSERT INTO `mk_auth_rule` VALUES ('177', '1', 'mall', 'admin_url', 'mall/AdminBrand/editPost', '', '编辑品牌提交', '');
INSERT INTO `mk_auth_rule` VALUES ('178', '1', 'mall', 'admin_url', 'mall/AdminBrand/delete', '', '删除品牌', '');
INSERT INTO `mk_auth_rule` VALUES ('179', '1', 'mall', 'admin_url', 'mall/AdminCategory/index', '', '商品分类', '');
INSERT INTO `mk_auth_rule` VALUES ('180', '1', 'mall', 'admin_url', 'mall/AdminCategory/edit', '', '编辑商品分类', '');
INSERT INTO `mk_auth_rule` VALUES ('181', '1', 'mall', 'admin_url', 'mall/AdminCategory/editPost', '', '编辑商品分类提交', '');
INSERT INTO `mk_auth_rule` VALUES ('182', '1', 'mall', 'admin_url', 'mall/AdminCategory/setStatusOn', '', '设置商品分类启用状态', '');
INSERT INTO `mk_auth_rule` VALUES ('183', '1', 'mall', 'admin_url', 'mall/AdminCategory/setStatusOff', '', '设置商品分类禁用状态', '');
INSERT INTO `mk_auth_rule` VALUES ('184', '1', 'mall', 'admin_url', 'mall/AdminCategory/delete', '', '删除商品分类', '');
INSERT INTO `mk_auth_rule` VALUES ('185', '1', 'mall', 'admin_url', 'mall/AdminCategory/listOrder', '', '商品分类排序', '');
INSERT INTO `mk_auth_rule` VALUES ('186', '1', 'mall', 'admin_url', 'mall/AdminIndex/default', '', '商城管理', '');
INSERT INTO `mk_auth_rule` VALUES ('187', '1', 'mall', 'admin_url', 'mall/AdminItem/index', '', '商品管理', '');
INSERT INTO `mk_auth_rule` VALUES ('188', '1', 'mall', 'admin_url', 'mall/AdminItem/add', '', '添加商品', '');
INSERT INTO `mk_auth_rule` VALUES ('189', '1', 'mall', 'admin_url', 'mall/AdminItem/addPost', '', '添加商品提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('190', '1', 'mall', 'admin_url', 'mall/AdminItem/edit', '', '编辑商品', '');
INSERT INTO `mk_auth_rule` VALUES ('191', '1', 'mall', 'admin_url', 'mall/AdminItem/skuList', '', '编辑商品规格', '');
INSERT INTO `mk_auth_rule` VALUES ('192', '1', 'mall', 'admin_url', 'mall/AdminItem/saveSku', '', '保存商品规格', '');
INSERT INTO `mk_auth_rule` VALUES ('193', '1', 'mall', 'admin_url', 'mall/AdminItem/deleteSku', '', '删除商品规格', '');
INSERT INTO `mk_auth_rule` VALUES ('194', '1', 'mall', 'admin_url', 'mall/AdminItem/skuStatus', '', '商品规格上下架', '');
INSERT INTO `mk_auth_rule` VALUES ('195', '1', 'mall', 'admin_url', 'mall/AdminItem/changeModel', '', '更改商品模型', '');
INSERT INTO `mk_auth_rule` VALUES ('196', '1', 'mall', 'admin_url', 'mall/AdminItem/editPost', '', '编辑商品提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('197', '1', 'mall', 'admin_url', 'mall/AdminItem/listOrder', '', '商品排序', '');
INSERT INTO `mk_auth_rule` VALUES ('198', '1', 'mall', 'admin_url', 'mall/AdminItem/status', '', '商品上架下架', '');
INSERT INTO `mk_auth_rule` VALUES ('199', '1', 'mall', 'admin_url', 'mall/AdminModel/index', '', '模型管理', '');
INSERT INTO `mk_auth_rule` VALUES ('200', '1', 'mall', 'admin_url', 'mall/AdminModel/add', '', '添加商品模型', '');
INSERT INTO `mk_auth_rule` VALUES ('201', '1', 'mall', 'admin_url', 'mall/AdminModel/addPost', '', '添加商品模型提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('202', '1', 'mall', 'admin_url', 'mall/AdminModel/edit', '', '编辑商品模型', '');
INSERT INTO `mk_auth_rule` VALUES ('203', '1', 'mall', 'admin_url', 'mall/AdminModel/editPost', '', '编辑商品模型提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('204', '1', 'mall', 'admin_url', 'mall/AdminModel/delete', '', '删除商品模型', '');
INSERT INTO `mk_auth_rule` VALUES ('205', '1', 'mall', 'admin_url', 'mall/AdminModel/toggle', '', '商品模型 启用禁用', '');
INSERT INTO `mk_auth_rule` VALUES ('206', '1', 'mall', 'admin_url', 'mall/AdminModel/attrs', '', '商品模型属性列表', '');
INSERT INTO `mk_auth_rule` VALUES ('207', '1', 'order', 'admin_url', 'order/AdminInvoice/index', '', '所有开发票', '');
INSERT INTO `mk_auth_rule` VALUES ('208', '1', 'order', 'admin_url', 'order/AdminInvoice/waitPrint', '', '待开普通发票', '');
INSERT INTO `mk_auth_rule` VALUES ('209', '1', 'order', 'admin_url', 'order/AdminInvoice/waitPrintValueAdded', '', '待开增值税发票', '');
INSERT INTO `mk_auth_rule` VALUES ('210', '1', 'order', 'admin_url', 'order/AdminOrder/default', '', '订单系统', '');
INSERT INTO `mk_auth_rule` VALUES ('211', '1', 'order', 'admin_url', 'order/AdminOrder/defaultFinance', '', '财务管理', '');
INSERT INTO `mk_auth_rule` VALUES ('212', '1', 'order', 'admin_url', 'order/AdminOrder/defaultStock', '', '仓储物流', '');
INSERT INTO `mk_auth_rule` VALUES ('213', '1', 'order', 'admin_url', 'order/AdminOrder/index', '', '订单管理', '');
INSERT INTO `mk_auth_rule` VALUES ('214', '1', 'order', 'admin_url', 'order/AdminOrder/notPaid', '', '未支付订单', '');
INSERT INTO `mk_auth_rule` VALUES ('215', '1', 'order', 'admin_url', 'order/AdminOrder/notShipped', '', '待发货订单', '');
INSERT INTO `mk_auth_rule` VALUES ('216', '1', 'order', 'admin_url', 'order/AdminOrder/hasShipped', '', '已发货订单', '');
INSERT INTO `mk_auth_rule` VALUES ('217', '1', 'order', 'admin_url', 'order/AdminOrder/hasPaid', '', '已支付订单', '');
INSERT INTO `mk_auth_rule` VALUES ('218', '1', 'order', 'admin_url', 'order/AdminPayment/index', '', '支付管理', '');
INSERT INTO `mk_auth_rule` VALUES ('219', '1', 'order', 'admin_url', 'order/AdminPayment/edit', '', '编辑支付方式', '');
INSERT INTO `mk_auth_rule` VALUES ('220', '1', 'order', 'admin_url', 'order/AdminPayment/editPost', '', '编辑支付方式提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('221', '1', 'order', 'admin_url', 'order/AdminPayment/delete', '', '删除支付方式', '');
INSERT INTO `mk_auth_rule` VALUES ('222', '1', 'order', 'admin_url', 'order/AdminPayment/listOrder', '', '支付方式排序', '');
INSERT INTO `mk_auth_rule` VALUES ('223', '1', 'order', 'admin_url', 'order/AdminPayment/enable', '', '支付方式启用', '');
INSERT INTO `mk_auth_rule` VALUES ('224', '1', 'order', 'admin_url', 'order/AdminPayment/disable', '', '支付方式禁用', '');
INSERT INTO `mk_auth_rule` VALUES ('225', '1', 'order', 'admin_url', 'order/AdminShipment/index', '', '物流方式', '');
INSERT INTO `mk_auth_rule` VALUES ('226', '1', 'order', 'admin_url', 'order/AdminShipment/add', '', '添加物流方式', '');
INSERT INTO `mk_auth_rule` VALUES ('227', '1', 'order', 'admin_url', 'order/AdminShipment/addPost', '', '添加物流方式提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('228', '1', 'order', 'admin_url', 'order/AdminShipment/edit', '', '编辑物流方式', '');
INSERT INTO `mk_auth_rule` VALUES ('229', '1', 'order', 'admin_url', 'order/AdminShipment/editPost', '', '编辑物流方式提交保存', '');
INSERT INTO `mk_auth_rule` VALUES ('230', '1', 'order', 'admin_url', 'order/AdminShipment/delete', '', '删除物流方式', '');
INSERT INTO `mk_auth_rule` VALUES ('231', '1', 'order', 'admin_url', 'order/AdminShipment/listOrder', '', '物流方式排序', '');
INSERT INTO `mk_auth_rule` VALUES ('232', '1', 'order', 'admin_url', 'order/AdminShipment/enable', '', '物流方式启用', '');
INSERT INTO `mk_auth_rule` VALUES ('233', '1', 'order', 'admin_url', 'order/AdminShipment/disable', '', '物流方式禁用', '');
INSERT INTO `mk_auth_rule` VALUES ('234', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `mk_auth_rule` VALUES ('235', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `mk_auth_rule` VALUES ('236', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `mk_auth_rule` VALUES ('237', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `mk_auth_rule` VALUES ('238', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `mk_auth_rule` VALUES ('239', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `mk_auth_rule` VALUES ('240', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `mk_auth_rule` VALUES ('241', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `mk_auth_rule` VALUES ('242', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `mk_auth_rule` VALUES ('243', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `mk_auth_rule` VALUES ('244', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `mk_auth_rule` VALUES ('245', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `mk_auth_rule` VALUES ('246', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `mk_auth_rule` VALUES ('247', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `mk_auth_rule` VALUES ('248', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `mk_auth_rule` VALUES ('249', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `mk_auth_rule` VALUES ('250', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `mk_auth_rule` VALUES ('251', '1', 'portal', 'admin_url', 'portal/AdminCategory/toggle', '', '文章分类显示隐藏', '');
INSERT INTO `mk_auth_rule` VALUES ('252', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `mk_auth_rule` VALUES ('253', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `mk_auth_rule` VALUES ('254', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `mk_auth_rule` VALUES ('255', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `mk_auth_rule` VALUES ('256', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `mk_auth_rule` VALUES ('257', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `mk_auth_rule` VALUES ('258', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `mk_auth_rule` VALUES ('259', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `mk_auth_rule` VALUES ('260', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `mk_auth_rule` VALUES ('261', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `mk_auth_rule` VALUES ('262', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `mk_auth_rule` VALUES ('263', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `mk_auth_rule` VALUES ('264', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `mk_auth_rule` VALUES ('265', '1', 'vote', 'admin_url', 'vote/Index/default', '', '投票管理', '');
INSERT INTO `mk_auth_rule` VALUES ('266', '1', 'vote', 'admin_url', 'vote/Index/index', '', '选手列表', '');
INSERT INTO `mk_auth_rule` VALUES ('267', '1', 'vote', 'admin_url', 'vote/Index/shenhe', '', '人员审核', '');
INSERT INTO `mk_auth_rule` VALUES ('268', '1', 'vote', 'admin_url', 'vote/Index/log', '', '投票日志', '');

-- ----------------------------
-- Table structure for `mk_class`
-- ----------------------------
DROP TABLE IF EXISTS `mk_class`;
CREATE TABLE `mk_class` (
  `c_id` int(2) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) NOT NULL,
  `c_pid` int(3) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_class
-- ----------------------------
INSERT INTO `mk_class` VALUES ('1', 'PHP1901', '1');
INSERT INTO `mk_class` VALUES ('2', 'PHP1902', '1');
INSERT INTO `mk_class` VALUES ('3', 'PHP1903', '1');
INSERT INTO `mk_class` VALUES ('4', 'PHP1904', '1');
INSERT INTO `mk_class` VALUES ('5', 'PHP1905', '1');
INSERT INTO `mk_class` VALUES ('6', 'PYTHON1901', '4');
INSERT INTO `mk_class` VALUES ('7', 'UID1901', '2');
INSERT INTO `mk_class` VALUES ('8', 'UID1902', '2');
INSERT INTO `mk_class` VALUES ('9', 'UID1903', '2');
INSERT INTO `mk_class` VALUES ('10', 'UID1904', '2');
INSERT INTO `mk_class` VALUES ('11', 'UID1905', '2');
INSERT INTO `mk_class` VALUES ('12', 'UID精品', '2');
INSERT INTO `mk_class` VALUES ('13', 'WEB1901', '3');
INSERT INTO `mk_class` VALUES ('14', 'WEB1902', '3');
INSERT INTO `mk_class` VALUES ('15', 'WEB1903', '3');
INSERT INTO `mk_class` VALUES ('16', 'WEB1904', '3');
INSERT INTO `mk_class` VALUES ('17', 'WEB1905', '3');
INSERT INTO `mk_class` VALUES ('18', 'WEB精品', '3');
INSERT INTO `mk_class` VALUES ('19', '英才1班', '5');
INSERT INTO `mk_class` VALUES ('20', '英才2班', '5');
INSERT INTO `mk_class` VALUES ('21', '英才3班', '5');
INSERT INTO `mk_class` VALUES ('22', '英才4班', '5');
INSERT INTO `mk_class` VALUES ('23', '英才5班', '5');
INSERT INTO `mk_class` VALUES ('24', '英才6班', '5');
INSERT INTO `mk_class` VALUES ('25', '英才7班', '5');
INSERT INTO `mk_class` VALUES ('26', '英才8班', '5');
INSERT INTO `mk_class` VALUES ('27', '新生班', '6');
INSERT INTO `mk_class` VALUES ('28', '实训中心', '7');
INSERT INTO `mk_class` VALUES ('29', 'UID1906', '2');
INSERT INTO `mk_class` VALUES ('30', 'UID1907', '2');
INSERT INTO `mk_class` VALUES ('31', 'WEB1906', '3');
INSERT INTO `mk_class` VALUES ('32', 'WEB1907', '3');

-- ----------------------------
-- Table structure for `mk_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mk_comment`;
CREATE TABLE `mk_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of mk_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_hook`
-- ----------------------------
DROP TABLE IF EXISTS `mk_hook`;
CREATE TABLE `mk_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='系统钩子表';

-- ----------------------------
-- Records of mk_hook
-- ----------------------------
INSERT INTO `mk_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `mk_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `mk_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `mk_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `mk_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `mk_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `mk_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `mk_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `mk_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `mk_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `mk_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `mk_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `mk_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `mk_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `mk_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `mk_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `mk_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `mk_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `mk_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `mk_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `mk_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `mk_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `mk_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `mk_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `mk_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `mk_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `mk_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `mk_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `mk_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `mk_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `mk_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `mk_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');
INSERT INTO `mk_hook` VALUES ('36', '1', '1', '验证码图片', 'captcha_image', 'cmf', '验证码图片');
INSERT INTO `mk_hook` VALUES ('37', '2', '1', '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面');
INSERT INTO `mk_hook` VALUES ('38', '2', '1', '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面');
INSERT INTO `mk_hook` VALUES ('39', '2', '1', '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面');
INSERT INTO `mk_hook` VALUES ('40', '2', '1', '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面');
INSERT INTO `mk_hook` VALUES ('41', '2', '1', '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面');
INSERT INTO `mk_hook` VALUES ('42', '2', '1', '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面');
INSERT INTO `mk_hook` VALUES ('43', '2', '1', '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面');
INSERT INTO `mk_hook` VALUES ('44', '2', '1', '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面');
INSERT INTO `mk_hook` VALUES ('49', '2', '1', '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面');
INSERT INTO `mk_hook` VALUES ('50', '2', '1', '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面');
INSERT INTO `mk_hook` VALUES ('51', '2', '1', '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面');
INSERT INTO `mk_hook` VALUES ('52', '2', '1', '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面');
INSERT INTO `mk_hook` VALUES ('53', '2', '1', '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面');
INSERT INTO `mk_hook` VALUES ('54', '2', '1', '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面');
INSERT INTO `mk_hook` VALUES ('55', '2', '1', '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子');
INSERT INTO `mk_hook` VALUES ('64', '2', '1', '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面');
INSERT INTO `mk_hook` VALUES ('65', '2', '1', '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面');
INSERT INTO `mk_hook` VALUES ('66', '2', '1', '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面');
INSERT INTO `mk_hook` VALUES ('67', '2', '1', '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面');
INSERT INTO `mk_hook` VALUES ('68', '2', '1', '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面');
INSERT INTO `mk_hook` VALUES ('69', '2', '1', '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面');
INSERT INTO `mk_hook` VALUES ('70', '2', '1', '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面');
INSERT INTO `mk_hook` VALUES ('71', '2', '1', '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');
INSERT INTO `mk_hook` VALUES ('72', '2', '0', '用户订单已支付', 'order_paid', 'order', '用户订单已支付');
INSERT INTO `mk_hook` VALUES ('73', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `mk_hook` VALUES ('74', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `mk_hook` VALUES ('75', '2', '1', '门户后台文章管理列表界面', 'portal_admin_article_index_view', 'portal', '门户后台文章管理列表界面');
INSERT INTO `mk_hook` VALUES ('76', '2', '1', '门户后台文章添加界面', 'portal_admin_article_add_view', 'portal', '门户后台文章添加界面');
INSERT INTO `mk_hook` VALUES ('77', '2', '1', '门户后台文章编辑界面', 'portal_admin_article_edit_view', 'portal', '门户后台文章编辑界面');
INSERT INTO `mk_hook` VALUES ('78', '2', '1', '门户后台文章分类管理列表界面', 'portal_admin_category_index_view', 'portal', '门户后台文章分类管理列表界面');
INSERT INTO `mk_hook` VALUES ('79', '2', '1', '门户后台文章分类添加界面', 'portal_admin_category_add_view', 'portal', '门户后台文章分类添加界面');
INSERT INTO `mk_hook` VALUES ('80', '2', '1', '门户后台文章分类编辑界面', 'portal_admin_category_edit_view', 'portal', '门户后台文章分类编辑界面');
INSERT INTO `mk_hook` VALUES ('81', '2', '1', '门户后台页面管理列表界面', 'portal_admin_page_index_view', 'portal', '门户后台页面管理列表界面');
INSERT INTO `mk_hook` VALUES ('82', '2', '1', '门户后台页面添加界面', 'portal_admin_page_add_view', 'portal', '门户后台页面添加界面');
INSERT INTO `mk_hook` VALUES ('83', '2', '1', '门户后台页面编辑界面', 'portal_admin_page_edit_view', 'portal', '门户后台页面编辑界面');
INSERT INTO `mk_hook` VALUES ('84', '2', '1', '门户后台文章标签管理列表界面', 'portal_admin_tag_index_view', 'portal', '门户后台文章标签管理列表界面');
INSERT INTO `mk_hook` VALUES ('85', '4', '0', '门户后台文章添加编辑界面右侧栏', 'portal_admin_article_edit_view_right_sidebar', 'portal', '门户后台文章添加编辑界面右侧栏');
INSERT INTO `mk_hook` VALUES ('86', '4', '0', '门户后台文章添加编辑界面主要内容', 'portal_admin_article_edit_view_main', 'portal', '门户后台文章添加编辑界面主要内容');

-- ----------------------------
-- Table structure for `mk_hook_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `mk_hook_plugin`;
CREATE TABLE `mk_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of mk_hook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_link`
-- ----------------------------
DROP TABLE IF EXISTS `mk_link`;
CREATE TABLE `mk_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of mk_link
-- ----------------------------
INSERT INTO `mk_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for `mk_looklogs`
-- ----------------------------
DROP TABLE IF EXISTS `mk_looklogs`;
CREATE TABLE `mk_looklogs` (
  `lo_id` int(11) NOT NULL AUTO_INCREMENT,
  `lo_pid` int(11) DEFAULT NULL,
  `lo_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`lo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_looklogs
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_major`
-- ----------------------------
DROP TABLE IF EXISTS `mk_major`;
CREATE TABLE `mk_major` (
  `m_id` int(2) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_major
-- ----------------------------
INSERT INTO `mk_major` VALUES ('1', 'bj1');
INSERT INTO `mk_major` VALUES ('2', 'bj2');
INSERT INTO `mk_major` VALUES ('3', 'bj3');
INSERT INTO `mk_major` VALUES ('4', 'bj4');
INSERT INTO `mk_major` VALUES ('5', 'bj5');
INSERT INTO `mk_major` VALUES ('6', 'bj6');
INSERT INTO `mk_major` VALUES ('7', 'bj7');

-- ----------------------------
-- Table structure for `mk_mall_attr`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_attr`;
CREATE TABLE `mk_mall_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `model_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型;1:自然属性;2:销售属性',
  `has_thumbnail` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有缩略图，一个商品类型只能有一个属性允许上传缩略图',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `input_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '输入组件类型;1:下拉列表;2:单行文本框;3:多行文本;',
  `searchable` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否可搜索;0:不可以;1:可以;(只有下拉列表可以搜索)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `list_order` float unsigned NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `options` text COMMENT '属性可选值，以英文逗号分隔，如果允许上传缩略图，代表此属性为自定义属性，商品可以自由设置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品品属性表';

-- ----------------------------
-- Records of mk_mall_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_attr_value`;
CREATE TABLE `mk_mall_attr_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性ID',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品属性值表';

-- ----------------------------
-- Records of mk_mall_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_brand`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_brand`;
CREATE TABLE `mk_mall_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用;0:不可用',
  `list_order` float unsigned NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌别名',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌图片标识',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌网址',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品品牌表';

-- ----------------------------
-- Records of mk_mall_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_category`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_category`;
CREATE TABLE `mk_mall_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用;0:不可用',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '一级分类logo',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `more` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品分类表';

-- ----------------------------
-- Records of mk_mall_category
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_item`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_item`;
CREATE TABLE `mk_mall_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品模型ID',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品副标题',
  `item_sn` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价格',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量，单位g',
  `volume` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '体积;单位ml',
  `length` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '长,单位cm',
  `width` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '宽,单位cm',
  `height` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '高,单位cm',
  `video` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品视频',
  `thumbnail` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `favorite_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `like_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `new_arrival` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新品上市',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为热卖商品',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是虚拟商品',
  `is_self` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自营',
  `barcode` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品级别的条形码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `use_platform` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用平台;0:全部;1:pc;2:手机',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '内容',
  `more` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品表';

-- ----------------------------
-- Records of mk_mall_item
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_item_attr`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_item_attr`;
CREATE TABLE `mk_mall_item_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品模型ID',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'SKU ID',
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售属性ID',
  `attr_value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售属性值ID',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of mk_mall_item_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_item_sku`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_item_sku`;
CREATE TABLE `mk_mall_item_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品模型ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品类目ID',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态;0:下架;1:上架',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `weight` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品重量',
  `volume` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '体积;单位ml',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(90) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `barcode` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '条形码',
  `thumbnail` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品默认图',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '销售属性值组成的key(从小到大用排序)',
  `spec_info` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '规格描述',
  `more` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品SKU表';

-- ----------------------------
-- Records of mk_mall_item_sku
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_mall_model`
-- ----------------------------
DROP TABLE IF EXISTS `mk_mall_model`;
CREATE TABLE `mk_mall_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态;0:禁用;1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品模型表';

-- ----------------------------
-- Records of mk_mall_model
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_manager`
-- ----------------------------
DROP TABLE IF EXISTS `mk_manager`;
CREATE TABLE `mk_manager` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `m_user` varchar(50) NOT NULL COMMENT '用户名',
  `m_pass` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_manager
-- ----------------------------
INSERT INTO `mk_manager` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `mk_nav`
-- ----------------------------
DROP TABLE IF EXISTS `mk_nav`;
CREATE TABLE `mk_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of mk_nav
-- ----------------------------
INSERT INTO `mk_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `mk_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for `mk_nav_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mk_nav_menu`;
CREATE TABLE `mk_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of mk_nav_menu
-- ----------------------------
INSERT INTO `mk_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for `mk_option`
-- ----------------------------
DROP TABLE IF EXISTS `mk_option`;
CREATE TABLE `mk_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of mk_option
-- ----------------------------
INSERT INTO `mk_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"\\u7801\\u5ba2\\u6295\\u7968\\u7ba1\\u7406\\u540e\\u53f0\",\"site_seo_title\":\"\\u7801\\u5ba2\\u6295\\u7968\\u7ba1\\u7406\\u540e\\u53f0\",\"site_seo_keywords\":\"\\u7801\\u5ba2\\u6295\\u7968\\u7ba1\\u7406\\u540e\\u53f0\",\"site_seo_description\":\"\\u7801\\u5ba2\\u6295\\u7968\\u7ba1\\u7406\\u540e\\u53f0\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\"}');
INSERT INTO `mk_option` VALUES ('2', '1', 'admin_dashboard_widgets', '[{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"CmfDocuments\",\"is_system\":1},{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1}]');
INSERT INTO `mk_option` VALUES ('3', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `mk_option` VALUES ('4', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');

-- ----------------------------
-- Table structure for `mk_order`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order`;
CREATE TABLE `mk_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级 id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态(0:已完成;1:未完成;2:已取消;)',
  `shipping_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态(0:未发货;1:已发货;2:已收货;10:待发货)',
  `pay_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态(0:未支付;1:已支付)',
  `invoice_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发票状态(0:未打印;1:已打印)',
  `user_confirmed` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户是否确认;1:已确认;0:未确认;2:确认邮件未发',
  `print_invoice_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '开票方式;0:按客户设置;1:手动;2:自动',
  `country` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `town` smallint(6) NOT NULL DEFAULT '0' COMMENT '乡镇',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `score_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `confirm_time` int(11) NOT NULL DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `expire_time` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间(配合pay_status表示订单到期时间)',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `zip_code` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `mobile2` varchar(20) NOT NULL DEFAULT '' COMMENT '备用手机号',
  `shipment_code` varchar(20) NOT NULL DEFAULT '' COMMENT '物流code',
  `shipment_name` varchar(30) NOT NULL DEFAULT '' COMMENT '物流名称',
  `tracking_number` varchar(15) NOT NULL DEFAULT '' COMMENT '快递单号',
  `payment_code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式code',
  `payment_name` varchar(30) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(50) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_taxpayer_id` varchar(30) NOT NULL DEFAULT '' COMMENT '发票纳税人识别码',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员备注',
  `source` varchar(30) NOT NULL DEFAULT '' COMMENT '订单来源',
  `more` text COMMENT '扩展信息,JSON格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `uid` (`user_id`) USING BTREE,
  KEY `shipping_code` (`shipment_code`) USING BTREE,
  KEY `payment_code` (`payment_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='art应用订单表';

-- ----------------------------
-- Records of mk_order
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_admin`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_admin`;
CREATE TABLE `mk_order_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人 ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员创建的订单表';

-- ----------------------------
-- Records of mk_order_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_cart`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_cart`;
CREATE TABLE `mk_order_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购物品实体所在表的主键id',
  `goods_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格表 id',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品实际支付价格',
  `goods_quantity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `selected` tinyint(1) NOT NULL DEFAULT '1' COMMENT '购物车选中状态(1:选中;0:未选中)',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入购物车的时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `deletable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可删除；1:可删除;0:不可删除',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '订购物品实体以前所在表，不带前缀',
  `goods_sku_table` varchar(64) NOT NULL DEFAULT '' COMMENT '商品规格表名',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `goods_spec` varchar(500) NOT NULL DEFAULT '' COMMENT '商品规格(文字描述)',
  `goods_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '商品货号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of mk_order_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_comment`;
CREATE TABLE `mk_order_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评价id',
  `comment_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '回复的次数',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购物品实体所在表的主键id',
  `goods_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格表 id',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单子项 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `is_anonymous` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名;1:匿名;0:否',
  `is_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是管理员回复,1:管理员回复,0:用户回复',
  `is_again` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是追加评价,1:追加评价,0:首次评价',
  `has_image` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否上传图片,1:有图片,0:没有图片',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '商品打分，默认中评',
  `service_star` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '店家服务打分，默认中评',
  `express_star` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '快递速度打分，默认中评',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '推荐排序字段',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `goods_sku_table` varchar(64) NOT NULL DEFAULT '' COMMENT '商品规格表名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '评论内容',
  `more` text COMMENT '扩展属性图片',
  PRIMARY KEY (`id`),
  KEY `comment_item_ID` (`order_item_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `createtime` (`create_time`),
  KEY `list_order` (`list_order`),
  KEY `is_admin` (`is_admin`),
  KEY `is_again` (`is_again`),
  KEY `is_img` (`has_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价表';

-- ----------------------------
-- Records of mk_order_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_comment_reply`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_comment_reply`;
CREATE TABLE `mk_order_comment_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品评论 id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_ID` (`comment_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品回复表';

-- ----------------------------
-- Records of mk_order_comment_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_draft`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_draft`;
CREATE TABLE `mk_order_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 ID',
  `admin_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '管理员 ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `customer` text COMMENT '客户信息',
  `items` text COMMENT '订单item',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员创建的草稿订单表';

-- ----------------------------
-- Records of mk_order_draft
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_invoice`;
CREATE TABLE `mk_order_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '发票类型;1: 个人;2:增值税普通发票;3:增值税专用发票;',
  `invoice_no` varchar(30) NOT NULL DEFAULT '' COMMENT '发票号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '发票抬头，（个人姓名，或公司名称）',
  `taxpayer_id` varchar(30) NOT NULL DEFAULT '' COMMENT '纳税人识别码',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '公司电话',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '公司地址',
  `bank_name` varchar(60) NOT NULL DEFAULT '' COMMENT '开户行',
  `bank_account` varchar(30) NOT NULL DEFAULT '' COMMENT '银行账号',
  `consignee_info` text COMMENT '收件人信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票表';

-- ----------------------------
-- Records of mk_order_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_invoice_order`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_invoice_order`;
CREATE TABLE `mk_order_invoice_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发票 id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票订单表';

-- ----------------------------
-- Records of mk_order_invoice_order
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_item`;
CREATE TABLE `mk_order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订购物品实体所在表的主键id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品规格表 id',
  `expire_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付过期时间',
  `goods_quantity` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付价格',
  `reward_score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT '订购物品实体以前所在表，不带前缀',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物品名称',
  `goods_sku_table` varchar(64) NOT NULL DEFAULT '' COMMENT '商品规格表名',
  `goods_spec` varchar(500) NOT NULL DEFAULT '' COMMENT '商品规格',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `comment_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '评价次数,2：已追加评价,1:已评价,0:未评价',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_payment`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_payment`;
CREATE TABLE `mk_order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_online` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否在线支付',
  `is_cod` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否货到付款(cash on delivery (COD))',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1:开启;0:关闭)',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `list_order` float(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'pay_coder',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付code',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `config` text COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='支付方式表';

-- ----------------------------
-- Records of mk_order_payment
-- ----------------------------
INSERT INTO `mk_order_payment` VALUES ('1', '0', '0', '1', '0.00', '0.00', 'bank_transfer', '银行卡转账', '银行卡转账\r\n账号600000000002\r\n开户行：中国工商银行2', null);

-- ----------------------------
-- Table structure for `mk_order_shipment`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_shipment`;
CREATE TABLE `mk_order_shipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启(1:开启;0:禁用)',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '快递代号',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '快递名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `shipping_code` (`code`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_order_shipment
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_user_address`;
CREATE TABLE `mk_order_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区',
  `town` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '乡镇',
  `consignee` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人',
  `alias` varchar(20) NOT NULL DEFAULT '' COMMENT '地址别名(方便用户记忆)',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `zip_code` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '手机',
  `mobile2` varchar(30) NOT NULL DEFAULT '' COMMENT '备用手机号',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认收货地址',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_order_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_order_user_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `mk_order_user_invoice`;
CREATE TABLE `mk_order_user_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '发票类型;1: 个人;2:增值税普通发票;3:增值税专用发票;',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '发票抬头，（个人姓名，或公司名称）',
  `taxpayer_id` varchar(30) NOT NULL DEFAULT '' COMMENT '纳税人识别码',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '公司电话',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '公司地址',
  `bank_name` varchar(60) NOT NULL DEFAULT '' COMMENT '开户行',
  `bank_account` varchar(30) NOT NULL DEFAULT '' COMMENT '银行账号',
  `consignee_info` text COMMENT '收件人信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户发票信息表';

-- ----------------------------
-- Records of mk_order_user_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_photo`
-- ----------------------------
DROP TABLE IF EXISTS `mk_photo`;
CREATE TABLE `mk_photo` (
  `z_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `z_pid` int(11) NOT NULL COMMENT '选手id',
  `z_src` varchar(255) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`z_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_photo
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_player`
-- ----------------------------
DROP TABLE IF EXISTS `mk_player`;
CREATE TABLE `mk_player` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选手id',
  `p_name` varchar(50) NOT NULL COMMENT '选手名字',
  `p_num` varchar(255) NOT NULL COMMENT '选手编号',
  `p_tnum` int(11) NOT NULL COMMENT '投票数量',
  `p_classid` int(11) NOT NULL COMMENT '选手班级id',
  `p_maid` int(11) NOT NULL COMMENT '专业id',
  `p_photo` varchar(255) NOT NULL COMMENT '选手封面图',
  `p_isshow` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `p_openid` varchar(255) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_player
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_plog`
-- ----------------------------
DROP TABLE IF EXISTS `mk_plog`;
CREATE TABLE `mk_plog` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `l_uopenid` varchar(255) NOT NULL COMMENT '用户opneid',
  `l_pid` int(11) NOT NULL COMMENT '选手id',
  `l_ptime` int(11) NOT NULL COMMENT '投票时间',
  PRIMARY KEY (`l_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5517 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_plog
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `mk_plugin`;
CREATE TABLE `mk_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of mk_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_portal_category`
-- ----------------------------
DROP TABLE IF EXISTS `mk_portal_category`;
CREATE TABLE `mk_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of mk_portal_category
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_portal_category_post`
-- ----------------------------
DROP TABLE IF EXISTS `mk_portal_category_post`;
CREATE TABLE `mk_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of mk_portal_category_post
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_portal_post`
-- ----------------------------
DROP TABLE IF EXISTS `mk_portal_post`;
CREATE TABLE `mk_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of mk_portal_post
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_portal_tag`
-- ----------------------------
DROP TABLE IF EXISTS `mk_portal_tag`;
CREATE TABLE `mk_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of mk_portal_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_portal_tag_post`
-- ----------------------------
DROP TABLE IF EXISTS `mk_portal_tag_post`;
CREATE TABLE `mk_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of mk_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_recycle_bin`
-- ----------------------------
DROP TABLE IF EXISTS `mk_recycle_bin`;
CREATE TABLE `mk_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 回收站';

-- ----------------------------
-- Records of mk_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_role`
-- ----------------------------
DROP TABLE IF EXISTS `mk_role`;
CREATE TABLE `mk_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of mk_role
-- ----------------------------
INSERT INTO `mk_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `mk_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for `mk_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `mk_role_user`;
CREATE TABLE `mk_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of mk_role_user
-- ----------------------------
INSERT INTO `mk_role_user` VALUES ('1', '2', '2');

-- ----------------------------
-- Table structure for `mk_route`
-- ----------------------------
DROP TABLE IF EXISTS `mk_route`;
CREATE TABLE `mk_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of mk_route
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_slide`
-- ----------------------------
DROP TABLE IF EXISTS `mk_slide`;
CREATE TABLE `mk_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of mk_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_slide_item`
-- ----------------------------
DROP TABLE IF EXISTS `mk_slide_item`;
CREATE TABLE `mk_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) NOT NULL COMMENT '幻灯片描述',
  `content` text COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of mk_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_theme`
-- ----------------------------
DROP TABLE IF EXISTS `mk_theme`;
CREATE TABLE `mk_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_theme
-- ----------------------------
INSERT INTO `mk_theme` VALUES ('1', '0', '0', '0', '0', 'simplemall', 'simplemall', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for `mk_theme_file`
-- ----------------------------
DROP TABLE IF EXISTS `mk_theme_file`;
CREATE TABLE `mk_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_theme_file
-- ----------------------------
INSERT INTO `mk_theme_file` VALUES ('1', '0', '10', 'simplemall', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO `mk_theme_file` VALUES ('2', '0', '10', 'simplemall', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `mk_theme_file` VALUES ('3', '0', '5', 'simplemall', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `mk_theme_file` VALUES ('4', '0', '10', 'simplemall', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `mk_theme_file` VALUES ('5', '0', '10', 'simplemall', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `mk_theme_file` VALUES ('6', '0', '10', 'simplemall', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `mk_theme_file` VALUES ('7', '1', '0', 'simplemall', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);
INSERT INTO `mk_theme_file` VALUES ('8', '1', '1', 'simplemall', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);

-- ----------------------------
-- Table structure for `mk_third_party_user`
-- ----------------------------
DROP TABLE IF EXISTS `mk_third_party_user`;
CREATE TABLE `mk_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of mk_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user`;
CREATE TABLE `mk_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of mk_user
-- ----------------------------
INSERT INTO `mk_user` VALUES ('1', '1', '0', '0', '1570498209', '0', '0', '0.00', '1568691893', '1', 'admin', '###87e597eb73eced1ba4d92d796db01875', 'admin', '2278906120@qq.com', '', '', '', '221.192.180.172', '', '', null);
INSERT INTO `mk_user` VALUES ('2', '1', '0', '0', '1570247331', '0', '0', '0.00', '0', '1', 'root', '###a3a8c8e69da3ba4cd847e63c89546274', '', '22@qq.com', '', '', '', '123.180.235.206', '', '', null);

-- ----------------------------
-- Table structure for `mk_user2`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user2`;
CREATE TABLE `mk_user2` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `u_photo` varchar(255) NOT NULL COMMENT '用户头像',
  `u_playtime` int(11) NOT NULL COMMENT '投票时间',
  `u_openid` varchar(255) NOT NULL COMMENT '用户openid',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_user2
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_action`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_action`;
CREATE TABLE `mk_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户操作表';

-- ----------------------------
-- Records of mk_user_action
-- ----------------------------
INSERT INTO `mk_user_action` VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for `mk_user_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_action_log`;
CREATE TABLE `mk_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of mk_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_balance_log`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_balance_log`;
CREATE TABLE `mk_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户余额变更日志表';

-- ----------------------------
-- Records of mk_user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_favorite`;
CREATE TABLE `mk_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of mk_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_like`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_like`;
CREATE TABLE `mk_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户点赞表';

-- ----------------------------
-- Records of mk_user_like
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_login_attempt`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_login_attempt`;
CREATE TABLE `mk_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of mk_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_score_log`;
CREATE TABLE `mk_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of mk_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `mk_user_token`;
CREATE TABLE `mk_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of mk_user_token
-- ----------------------------
INSERT INTO `mk_user_token` VALUES ('1', '1', '1584244014', '1568692014', '106e6603fb148ea9363b66d6a602474d106e6603fb148ea9363b66d6a602474d', 'web');
INSERT INTO `mk_user_token` VALUES ('2', '2', '1584252720', '1568700720', '96c731eb234a05e6c3051a0078fe52d796c731eb234a05e6c3051a0078fe52d7', 'web');

-- ----------------------------
-- Table structure for `mk_verification_code`
-- ----------------------------
DROP TABLE IF EXISTS `mk_verification_code`;
CREATE TABLE `mk_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of mk_verification_code
-- ----------------------------

-- ----------------------------
-- Table structure for `mk_winer`
-- ----------------------------
DROP TABLE IF EXISTS `mk_winer`;
CREATE TABLE `mk_winer` (
  `w_id` int(2) NOT NULL AUTO_INCREMENT,
  `w_pid` int(11) NOT NULL,
  `w_pici` int(1) DEFAULT NULL,
  `w_ctime` int(11) DEFAULT NULL,
  `w_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mk_winer
-- ----------------------------
