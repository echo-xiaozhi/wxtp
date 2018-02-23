SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DROP TABLE IF EXISTS `ims_account`;
CREATE TABLE IF NOT EXISTS `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ims_account` (`acid`, `uniacid`, `hash`, `type`, `isconnect`, `isdeleted`) VALUES
(1, 1, 'uRr8qvQV', 1, 0, 0);

DROP TABLE IF EXISTS `ims_account_wechats`;
CREATE TABLE IF NOT EXISTS `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ims_account_wechats` (`acid`, `uniacid`, `token`, `access_token`, `encodingaeskey`, `level`, `name`, `account`, `original`, `signature`, `country`, `province`, `city`, `username`, `password`, `lastupdate`, `key`, `secret`, `styleid`, `subscribeurl`, `auth_refresh_token`) VALUES
(1, 1, 'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP', '', '', 1, 'wesambo', '', '', '', '', '', '', '', '', 0, '', '', 1, '', '');

DROP TABLE IF EXISTS `ims_activity_clerks`;
CREATE TABLE IF NOT EXISTS `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_clerk_menu`;
CREATE TABLE IF NOT EXISTS `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

INSERT INTO `ims_activity_clerk_menu` (`id`, `uniacid`, `displayorder`, `pid`, `group_name`, `title`, `icon`, `url`, `type`, `permission`, `system`) VALUES
(1, 0, 0, 0, 'mc', '快捷交易', '', '', '', 'mc_manage', 1),
(2, 0, 0, 1, '', '积分充值', 'fa fa-money', 'credit1', 'modal', 'mc_credit1', 1),
(3, 0, 0, 1, '', '余额充值', 'fa fa-cny', 'credit2', 'modal', 'mc_credit2', 1),
(4, 0, 0, 1, '', '消费', 'fa fa-usd', 'consume', 'modal', 'mc_consume', 1),
(5, 0, 0, 1, '', '发放会员卡', 'fa fa-credit-card', 'card', 'modal', 'mc_card', 1),
(6, 0, 0, 0, 'stat', '数据统计', '', '', '', 'stat_manage', 1),
(7, 0, 0, 6, '', '积分统计', 'fa fa-bar-chart', './index.php?c=stat&a=credit1', 'url', 'stat_credit1', 1),
(8, 0, 0, 6, '', '余额统计', 'fa fa-bar-chart', './index.php?c=stat&a=credit2', 'url', 'stat_credit2', 1),
(9, 0, 0, 6, '', '现金消费统计', 'fa fa-bar-chart', './index.php?c=stat&a=cash', 'url', 'stat_cash', 1),
(10, 0, 0, 6, '', '会员卡统计', 'fa fa-bar-chart', './index.php?c=stat&a=card', 'url', 'stat_card', 1),
(11, 0, 0, 0, 'activity', '系统优惠券核销', '', '', '', 'activity_card_manage', 1),
(12, 0, 0, 11, '', '折扣券核销', 'fa fa-money', './index.php?c=activity&a=consume&do=display&type=1', 'url', 'activity_consume_coupon', 1),
(13, 0, 0, 11, '', '代金券核销', 'fa fa-money', './index.php?c=activity&a=consume&do=display&type=2', 'url', 'activity_consume_token', 1),
(14, 0, 0, 0, 'wechat', '微信卡券核销', '', '', '', 'wechat_card_manage', 1),
(15, 0, 0, 14, '', '卡券核销', 'fa fa-money', './index.php?c=wechat&a=consume', 'url', 'wechat_consume', 1),
(16, 0, 0, 6, '', '收银台收款统计', 'fa fa-bar-chart', './index.php?c=stat&a=paycenter', 'url', 'stat_paycenter', 1);

DROP TABLE IF EXISTS `ims_activity_coupon`;
CREATE TABLE IF NOT EXISTS `ims_activity_coupon` (
  `couponid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `title` varchar(30) NOT NULL,
  `couponsn` varchar(50) NOT NULL,
  `description` text,
  `discount` decimal(10,2) NOT NULL,
  `condition` decimal(10,2) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `limit` int(11) NOT NULL,
  `dosage` int(11) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `use_module` tinyint(3) unsigned NOT NULL,
  `credittype` varchar(20) NOT NULL,
  PRIMARY KEY (`couponid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_coupon_allocation`;
CREATE TABLE IF NOT EXISTS `ims_activity_coupon_allocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`couponid`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_coupon_modules`;
CREATE TABLE IF NOT EXISTS `ims_activity_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_coupon_record`;
CREATE TABLE IF NOT EXISTS `ims_activity_coupon_record` (
  `recid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `grantmodule` varchar(50) NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `usemodule` varchar(50) NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `remark` varchar(300) NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`recid`),
  KEY `couponid` (`uid`,`grantmodule`,`usemodule`,`status`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_exchange`;
CREATE TABLE IF NOT EXISTS `ims_activity_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `extra` varchar(3000) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `pretotal` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extra` (`extra`(333)) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_exchange_trades`;
CREATE TABLE IF NOT EXISTS `ims_activity_exchange_trades` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`,`uid`,`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_exchange_trades_shipping`;
CREATE TABLE IF NOT EXISTS `ims_activity_exchange_trades_shipping` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_modules`;
CREATE TABLE IF NOT EXISTS `ims_activity_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `available` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `uniacid` (`uniacid`),
  KEY `module` (`module`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_modules_record`;
CREATE TABLE IF NOT EXISTS `ims_activity_modules_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `num` tinyint(3) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_activity_stores`;
CREATE TABLE IF NOT EXISTS `ims_activity_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `source` tinyint(3) unsigned NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `location_id` (`location_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_article_category`;
CREATE TABLE IF NOT EXISTS `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_article_news`;
CREATE TABLE IF NOT EXISTS `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_article_notice`;
CREATE TABLE IF NOT EXISTS `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_article_unread_notice`;
CREATE TABLE IF NOT EXISTS `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_basic_reply`;
CREATE TABLE IF NOT EXISTS `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_business`;
CREATE TABLE IF NOT EXISTS `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_attachment`;
CREATE TABLE IF NOT EXISTS `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `ims_core_attachment` (`id`, `uniacid`, `uid`, `filename`, `attachment`, `type`, `createtime`) VALUES
(1, 1, 1, 'logo2.png', 'images/global/TMUmIz29AZ95LUyz3iN9Qa93k3UCvZ.png', 1, 1468651633);

DROP TABLE IF EXISTS `ims_core_cache`;
CREATE TABLE IF NOT EXISTS `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('setting', 'a:6:{s:9:"copyright";a:24:{s:6:"status";s:1:"0";s:10:"verifycode";s:1:"0";s:6:"reason";s:0:"";s:8:"sitename";s:21:"微上宝分销平台";s:3:"url";s:7:"http://";s:8:"statcode";s:0:"";s:10:"footerleft";s:14:"Copyright 2017";s:11:"footerright";s:19:"All Rights Reserved";s:4:"icon";s:0:"";s:5:"flogo";s:48:"images/global/ez83GNNaav63zt60detv60bZzRGnBV.png";s:6:"slides";s:216:"a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}";s:6:"notice";s:0:"";s:5:"blogo";s:48:"images/global/ez83GNNaav63zt60detv60bZzRGnBV.png";s:8:"baidumap";a:2:{s:3:"lng";s:0:"";s:3:"lat";s:0:"";}s:7:"company";s:24:"广州谷来信息科技";s:14:"companyprofile";s:0:"";s:7:"address";s:27:"广东省广州市天河区";s:6:"person";s:9:"陈先生";s:5:"phone";s:12:"020-88888888";s:2:"qq";s:8:"88888888";s:5:"email";s:13:"888888@qq.com";s:8:"keywords";s:21:"微上宝分销平台";s:11:"description";s:21:"微上宝分销平台";s:12:"showhomepage";i:1;}s:8:"authmode";i:1;s:5:"close";a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}s:8:"register";a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}s:18:"module_receive_ban";a:0:{}s:5:"basic";a:1:{s:8:"template";s:7:"default";}}'),
('system_frame', 'a:5:{s:8:"platform";a:3:{i:0;a:2:{s:5:"title";s:12:"基本功能";s:5:"items";a:9:{i:0;a:5:{s:2:"id";s:1:"3";s:5:"title";s:12:"文字回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=basic";s:15:"permission_name";s:20:"platform_reply_basic";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=basic";}}i:1;a:5:{s:2:"id";s:1:"4";s:5:"title";s:12:"图文回复";s:3:"url";s:37:"./index.php?c=platform&a=reply&m=news";s:15:"permission_name";s:19:"platform_reply_news";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:45:"./index.php?c=platform&a=reply&do=post&m=news";}}i:2;a:5:{s:2:"id";s:1:"5";s:5:"title";s:12:"音乐回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=music";s:15:"permission_name";s:20:"platform_reply_music";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=music";}}i:3;a:5:{s:2:"id";s:1:"6";s:5:"title";s:12:"图片回复";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=images";s:15:"permission_name";s:21:"platform_reply_images";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:47:"./index.php?c=platform&a=reply&do=post&m=images";}}i:4;a:5:{s:2:"id";s:1:"7";s:5:"title";s:12:"语音回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=voice";s:15:"permission_name";s:20:"platform_reply_voice";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=voice";}}i:5;a:5:{s:2:"id";s:1:"8";s:5:"title";s:12:"视频回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=video";s:15:"permission_name";s:20:"platform_reply_video";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=video";}}i:6;a:5:{s:2:"id";s:1:"9";s:5:"title";s:18:"微信卡券回复";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=wxcard";s:15:"permission_name";s:21:"platform_reply_wxcard";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:47:"./index.php?c=platform&a=reply&do=post&m=wxcard";}}i:7;a:5:{s:2:"id";s:2:"10";s:5:"title";s:21:"自定义接口回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=userapi";s:15:"permission_name";s:22:"platform_reply_userapi";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:48:"./index.php?c=platform&a=reply&do=post&m=userapi";}}i:8;a:4:{s:2:"id";s:2:"11";s:5:"title";s:12:"系统回复";s:3:"url";s:44:"./index.php?c=platform&a=special&do=display&";s:15:"permission_name";s:21:"platform_reply_system";}}}i:1;a:2:{s:5:"title";s:12:"高级功能";s:5:"items";a:6:{i:0;a:4:{s:2:"id";s:2:"13";s:5:"title";s:18:"常用服务接入";s:3:"url";s:43:"./index.php?c=platform&a=service&do=switch&";s:15:"permission_name";s:16:"platform_service";}i:1;a:4:{s:2:"id";s:2:"14";s:5:"title";s:15:"自定义菜单";s:3:"url";s:30:"./index.php?c=platform&a=menu&";s:15:"permission_name";s:13:"platform_menu";}i:2;a:4:{s:2:"id";s:2:"15";s:5:"title";s:18:"特殊消息回复";s:3:"url";s:44:"./index.php?c=platform&a=special&do=message&";s:15:"permission_name";s:16:"platform_special";}i:3;a:4:{s:2:"id";s:2:"16";s:5:"title";s:15:"二维码管理";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";}i:4;a:4:{s:2:"id";s:2:"17";s:5:"title";s:15:"多客服接入";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=custom";s:15:"permission_name";s:21:"platform_reply_custom";}i:5;a:4:{s:2:"id";s:2:"18";s:5:"title";s:18:"长链接二维码";s:3:"url";s:32:"./index.php?c=platform&a=url2qr&";s:15:"permission_name";s:15:"platform_url2qr";}}}i:2;a:2:{s:5:"title";s:12:"数据统计";s:5:"items";a:4:{i:0;a:4:{s:2:"id";s:2:"20";s:5:"title";s:12:"聊天记录";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=history&";s:15:"permission_name";s:21:"platform_stat_history";}i:1;a:4:{s:2:"id";s:2:"21";s:5:"title";s:24:"回复规则使用情况";s:3:"url";s:38:"./index.php?c=platform&a=stat&do=rule&";s:15:"permission_name";s:18:"platform_stat_rule";}i:2;a:4:{s:2:"id";s:2:"22";s:5:"title";s:21:"关键字命中情况";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=keyword&";s:15:"permission_name";s:21:"platform_stat_keyword";}i:3;a:4:{s:2:"id";s:2:"23";s:5:"title";s:6:"参数";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=setting&";s:15:"permission_name";s:21:"platform_stat_setting";}}}}s:4:"site";a:3:{i:0;a:2:{s:5:"title";s:12:"微站管理";s:5:"items";a:3:{i:0;a:5:{s:2:"id";s:2:"26";s:5:"title";s:12:"站点管理";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:18:"site_multi_display";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:35:"./index.php?c=site&a=multi&do=post&";}}i:1;a:4:{s:2:"id";s:2:"29";s:5:"title";s:12:"模板管理";s:3:"url";s:39:"./index.php?c=site&a=style&do=template&";s:15:"permission_name";s:19:"site_style_template";}i:2;a:4:{s:2:"id";s:2:"30";s:5:"title";s:18:"模块模板扩展";s:3:"url";s:37:"./index.php?c=site&a=style&do=module&";s:15:"permission_name";s:17:"site_style_module";}}}i:1;a:2:{s:5:"title";s:18:"特殊页面管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"32";s:5:"title";s:12:"会员中心";s:3:"url";s:34:"./index.php?c=site&a=editor&do=uc&";s:15:"permission_name";s:14:"site_editor_uc";}i:1;a:5:{s:2:"id";s:2:"33";s:5:"title";s:12:"专题页面";s:3:"url";s:36:"./index.php?c=site&a=editor&do=page&";s:15:"permission_name";s:16:"site_editor_page";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:38:"./index.php?c=site&a=editor&do=design&";}}}}i:2;a:2:{s:5:"title";s:12:"功能组件";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"35";s:5:"title";s:12:"分类设置";s:3:"url";s:30:"./index.php?c=site&a=category&";s:15:"permission_name";s:13:"site_category";}i:1;a:4:{s:2:"id";s:2:"36";s:5:"title";s:12:"文章管理";s:3:"url";s:29:"./index.php?c=site&a=article&";s:15:"permission_name";s:12:"site_article";}}}}s:2:"mc";a:9:{i:0;a:2:{s:5:"title";s:12:"粉丝管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"39";s:5:"title";s:12:"粉丝分组";s:3:"url";s:28:"./index.php?c=mc&a=fangroup&";s:15:"permission_name";s:11:"mc_fangroup";}i:1;a:4:{s:2:"id";s:2:"40";s:5:"title";s:6:"粉丝";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";}}}i:1;a:2:{s:5:"title";s:12:"会员中心";s:5:"items";a:3:{i:0;a:4:{s:2:"id";s:2:"42";s:5:"title";s:21:"会员中心关键字";s:3:"url";s:37:"./index.php?c=platform&a=cover&do=mc&";s:15:"permission_name";s:17:"platform_cover_mc";}i:1;a:5:{s:2:"id";s:2:"43";s:5:"title";s:6:"会员";s:3:"url";s:25:"./index.php?c=mc&a=member";s:15:"permission_name";s:9:"mc_member";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:32:"./index.php?c=mc&a=member&do=add";}}i:2;a:4:{s:2:"id";s:2:"44";s:5:"title";s:9:"会员组";s:3:"url";s:25:"./index.php?c=mc&a=group&";s:15:"permission_name";s:8:"mc_group";}}}i:2;a:2:{s:5:"title";s:15:"会员卡管理";s:5:"items";a:4:{i:0;a:4:{s:2:"id";s:2:"46";s:5:"title";s:18:"会员卡关键字";s:3:"url";s:39:"./index.php?c=platform&a=cover&do=card&";s:15:"permission_name";s:19:"platform_cover_card";}i:1;a:4:{s:2:"id";s:2:"47";s:5:"title";s:15:"会员卡管理";s:3:"url";s:33:"./index.php?c=mc&a=card&do=manage";s:15:"permission_name";s:14:"mc_card_manage";}i:2;a:4:{s:2:"id";s:2:"48";s:5:"title";s:15:"会员卡设置";s:3:"url";s:33:"./index.php?c=mc&a=card&do=editor";s:15:"permission_name";s:14:"mc_card_editor";}i:3;a:4:{s:2:"id";s:2:"49";s:5:"title";s:21:"会员卡其他功能";s:3:"url";s:32:"./index.php?c=mc&a=card&do=other";s:15:"permission_name";s:13:"mc_card_other";}}}i:3;a:2:{s:5:"title";s:12:"积分兑换";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"51";s:5:"title";s:9:"折扣券";s:3:"url";s:32:"./index.php?c=activity&a=coupon&";s:15:"permission_name";s:23:"activity_coupon_display";}i:1;a:4:{s:2:"id";s:2:"52";s:5:"title";s:15:"折扣券核销";s:3:"url";s:59:"./index.php?c=activity&a=consume&do=display&type=1&status=2";s:15:"permission_name";s:23:"activity_consume_coupon";}i:2;a:4:{s:2:"id";s:2:"53";s:5:"title";s:9:"代金券";s:3:"url";s:30:"./index.php?c=activity&a=token";s:15:"permission_name";s:22:"activity_token_display";}i:3;a:4:{s:2:"id";s:2:"54";s:5:"title";s:15:"代金券核销";s:3:"url";s:59:"./index.php?c=activity&a=consume&do=display&type=2&status=2";s:15:"permission_name";s:22:"activity_consume_token";}i:4;a:4:{s:2:"id";s:2:"55";s:5:"title";s:12:"真实物品";s:3:"url";s:30:"./index.php?c=activity&a=goods";s:15:"permission_name";s:22:"activity_goods_display";}}}i:4;a:2:{s:5:"title";s:19:"微信素材&群发";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"57";s:5:"title";s:13:"素材&群发";s:3:"url";s:32:"./index.php?c=material&a=display";s:15:"permission_name";s:16:"material_display";}i:1;a:4:{s:2:"id";s:2:"58";s:5:"title";s:12:"定时群发";s:3:"url";s:29:"./index.php?c=material&a=mass";s:15:"permission_name";s:13:"material_mass";}}}i:5;a:2:{s:5:"title";s:18:"微信卡券管理";s:5:"items";a:3:{i:0;a:4:{s:2:"id";s:2:"60";s:5:"title";s:12:"卡券列表";s:3:"url";s:35:"./index.php?c=wechat&a=card&do=list";s:15:"permission_name";s:16:"wechat_card_list";}i:1;a:4:{s:2:"id";s:2:"61";s:5:"title";s:12:"卡券核销";s:3:"url";s:30:"./index.php?c=wechat&a=consume";s:15:"permission_name";s:14:"wechat_consume";}i:2;a:4:{s:2:"id";s:2:"62";s:5:"title";s:15:"测试白名单";s:3:"url";s:36:"./index.php?c=wechat&a=white&do=list";s:15:"permission_name";s:17:"wechat_white_list";}}}i:6;a:2:{s:5:"title";s:12:"门店管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"64";s:5:"title";s:12:"门店列表";s:3:"url";s:30:"./index.php?c=activity&a=store";s:15:"permission_name";s:19:"activity_store_list";}i:1;a:4:{s:2:"id";s:2:"65";s:5:"title";s:12:"店员列表";s:3:"url";s:30:"./index.php?c=activity&a=clerk";s:15:"permission_name";s:19:"activity_clerk_list";}}}i:7;a:2:{s:5:"title";s:9:"收银台";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"67";s:5:"title";s:18:"微信刷卡收款";s:3:"url";s:40:"./index.php?c=paycenter&a=wxmicro&do=pay";s:15:"permission_name";s:21:"paycenter_wxmicro_pay";}i:1;a:4:{s:2:"id";s:2:"68";s:5:"title";s:18:"收银台关键字";s:3:"url";s:39:"./index.php?c=platform&a=cover&do=clerk";s:15:"permission_name";s:15:"paycenter_clerk";}}}i:8;a:2:{s:5:"title";s:12:"统计中心";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"70";s:5:"title";s:18:"会员积分统计";s:3:"url";s:28:"./index.php?c=stat&a=credit1";s:15:"permission_name";s:12:"stat_credit1";}i:1;a:4:{s:2:"id";s:2:"71";s:5:"title";s:18:"会员余额统计";s:3:"url";s:28:"./index.php?c=stat&a=credit2";s:15:"permission_name";s:12:"stat_credit2";}i:2;a:4:{s:2:"id";s:2:"72";s:5:"title";s:24:"会员现金消费统计";s:3:"url";s:25:"./index.php?c=stat&a=cash";s:15:"permission_name";s:9:"stat_cash";}i:3;a:4:{s:2:"id";s:2:"73";s:5:"title";s:15:"会员卡统计";s:3:"url";s:25:"./index.php?c=stat&a=card";s:15:"permission_name";s:9:"stat_card";}i:4;a:4:{s:2:"id";s:2:"74";s:5:"title";s:21:"收银台收款统计";s:3:"url";s:30:"./index.php?c=stat&a=paycenter";s:15:"permission_name";s:14:"stat_paycenter";}}}}s:7:"setting";a:3:{i:0;a:2:{s:5:"title";s:15:"公众号选项";s:5:"items";a:7:{i:0;a:4:{s:2:"id";s:2:"77";s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:15:"profile_payment";}i:1;a:4:{s:2:"id";s:2:"78";s:5:"title";s:19:"借用 oAuth 权限";s:3:"url";s:37:"./index.php?c=mc&a=passport&do=oauth&";s:15:"permission_name";s:17:"mc_passport_oauth";}i:2;a:4:{s:2:"id";s:2:"79";s:5:"title";s:22:"借用 JS 分享权限";s:3:"url";s:31:"./index.php?c=profile&a=jsauth&";s:15:"permission_name";s:14:"profile_jsauth";}i:3;a:4:{s:2:"id";s:2:"80";s:5:"title";s:18:"会员字段管理";s:3:"url";s:25:"./index.php?c=mc&a=fields";s:15:"permission_name";s:9:"mc_fields";}i:4;a:4:{s:2:"id";s:2:"81";s:5:"title";s:18:"微信通知设置";s:3:"url";s:28:"./index.php?c=mc&a=tplnotice";s:15:"permission_name";s:12:"mc_tplnotice";}i:5;a:4:{s:2:"id";s:2:"82";s:5:"title";s:21:"工作台菜单设置";s:3:"url";s:32:"./index.php?c=profile&a=deskmenu";s:15:"permission_name";s:16:"profile_deskmenu";}i:6;a:4:{s:2:"id";s:2:"83";s:5:"title";s:18:"会员扩展功能";s:3:"url";s:25:"./index.php?c=mc&a=plugin";s:15:"permission_name";s:9:"mc_plugin";}}}i:1;a:2:{s:5:"title";s:21:"会员及粉丝选项";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"85";s:5:"title";s:12:"积分设置";s:3:"url";s:26:"./index.php?c=mc&a=credit&";s:15:"permission_name";s:9:"mc_credit";}i:1;a:4:{s:2:"id";s:2:"86";s:5:"title";s:12:"注册设置";s:3:"url";s:40:"./index.php?c=mc&a=passport&do=passport&";s:15:"permission_name";s:20:"mc_passport_passport";}i:2;a:4:{s:2:"id";s:2:"87";s:5:"title";s:18:"粉丝同步设置";s:3:"url";s:36:"./index.php?c=mc&a=passport&do=sync&";s:15:"permission_name";s:16:"mc_passport_sync";}i:3;a:4:{s:2:"id";s:2:"88";s:5:"title";s:14:"UC站点整合";s:3:"url";s:22:"./index.php?c=mc&a=uc&";s:15:"permission_name";s:5:"mc_uc";}i:4;a:4:{s:2:"id";s:2:"89";s:5:"title";s:18:"邮件通知参数";s:3:"url";s:30:"./index.php?c=profile&a=notify";s:15:"permission_name";s:14:"profile_notify";}}}i:2;a:1:{s:5:"title";s:18:"其他功能选项";}}s:3:"ext";a:1:{i:0;a:2:{s:5:"title";s:6:"管理";s:5:"items";a:1:{i:0;a:4:{s:2:"id";s:2:"93";s:5:"title";s:18:"扩展功能管理";s:3:"url";s:31:"./index.php?c=profile&a=module&";s:15:"permission_name";s:14:"profile_module";}}}}}'),
('usersfields', 'a:45:{s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"mobile";s:12:"手机号码";s:3:"vip";s:9:"VIP级别";s:6:"gender";s:6:"性别";s:9:"birthyear";s:12:"出生生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:12:"邮寄地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:14:"resideprovince";s:12:"居住地址";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:5:"email";s:12:"电子邮箱";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";}'),
('module_receive_enable', 'a:13:{s:5:"image";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"voice";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"video";a:1:{i:0;s:11:"ewei_shopv2";}s:10:"shortvideo";a:1:{i:0;s:11:"ewei_shopv2";}s:8:"location";a:1:{i:0;s:11:"ewei_shopv2";}s:4:"link";a:1:{i:0;s:11:"ewei_shopv2";}s:9:"subscribe";a:1:{i:0;s:11:"ewei_shopv2";}s:11:"unsubscribe";a:1:{i:0;s:11:"ewei_shopv2";}s:2:"qr";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"trace";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"click";a:1:{i:0;s:11:"ewei_shopv2";}s:4:"view";a:1:{i:0;s:11:"ewei_shopv2";}s:14:"merchant_order";a:1:{i:0;s:11:"ewei_shopv2";}}'),
('ewei_shop_c63f0b1d52faebdb70e565393f9a13d6', 'a:5:{s:2:"id";s:2:"10";s:7:"uniacid";s:1:"1";s:4:"sets";s:370:"a:1:{s:3:"wap";a:13:{s:4:"open";i:1;s:7:"inh5app";s:1:"0";s:8:"mustbind";s:1:"0";s:5:"style";s:7:"default";s:5:"color";s:0:"";s:2:"bg";s:53:"../addons/ewei_shopv2/template/account/default/bg.jpg";s:7:"sms_reg";s:1:"5";s:10:"sms_forget";s:1:"5";s:13:"sms_changepwd";s:1:"5";s:8:"sms_bind";s:1:"5";s:7:"loginbg";N;s:5:"regbg";N;s:3:"sns";a:2:{s:2:"wx";i:0;s:2:"qq";i:0;}}}";s:7:"plugins";N;s:3:"sec";N;}'),
('ewei_shop_74d1cea9b4bb0b717d26c64287fa94e9', 'a:1:{s:3:"wap";a:13:{s:4:"open";i:1;s:7:"inh5app";s:1:"0";s:8:"mustbind";s:1:"0";s:5:"style";s:7:"default";s:5:"color";s:0:"";s:2:"bg";s:53:"../addons/ewei_shopv2/template/account/default/bg.jpg";s:7:"sms_reg";s:1:"5";s:10:"sms_forget";s:1:"5";s:13:"sms_changepwd";s:1:"5";s:8:"sms_bind";s:1:"5";s:7:"loginbg";N;s:5:"regbg";N;s:3:"sns";a:2:{s:2:"wx";i:0;s:2:"qq";i:0;}}}'),
('ewei_shop_7ee76e95befb5ab0960c0979fc988246', 's:5:"false";'),
('ewei_shop_9a52bfbf32243c1f30edc58b89a2935a', 'a:0:{}'),
('ewei_shop_02b72fcc49fb8916836f109352f05d59', 's:19:"2016-11-30 21:15:06";'),
('ewei_shop_52285de7717f2d78ca6623c56da33f82', 's:19:"2016-11-30 21:15:07";'),
('ewei_shop_d45488b13ce1f38aa2bba754b153037f', 's:19:"2016-11-30 21:15:08";'),
('unicount:1', 's:1:"1";'),
('ewei_shop_a4676ec36c0e61443f52f5bf9c711135', 'a:11:{i:0;a:13:{s:2:"id";s:1:"1";s:12:"displayorder";s:1:"1";s:8:"identity";s:5:"qiniu";s:4:"name";s:12:"七牛存储";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:45:"../addons/ewei_shopv2/static/images/qiniu.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:1;a:13:{s:2:"id";s:1:"5";s:12:"displayorder";s:1:"5";s:8:"identity";s:6:"verify";s:4:"name";s:9:"O2O核销";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:46:"../addons/ewei_shopv2/static/images/verify.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:2;a:13:{s:2:"id";s:1:"6";s:12:"displayorder";s:1:"6";s:8:"identity";s:8:"tmessage";s:4:"name";s:12:"会员群发";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/tmessage.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:3;a:13:{s:2:"id";s:1:"7";s:12:"displayorder";s:1:"7";s:8:"identity";s:4:"perm";s:4:"name";s:12:"分权系统";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:44:"../addons/ewei_shopv2/static/images/perm.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:4;a:13:{s:2:"id";s:1:"8";s:12:"displayorder";s:1:"8";s:8:"identity";s:4:"sale";s:4:"name";s:9:"营销宝";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:44:"../addons/ewei_shopv2/static/images/sale.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:5;a:13:{s:2:"id";s:2:"11";s:12:"displayorder";s:2:"11";s:8:"identity";s:7:"virtual";s:4:"name";s:12:"虚拟物品";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/virtual.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:6;a:13:{s:2:"id";s:2:"13";s:12:"displayorder";s:2:"13";s:8:"identity";s:6:"coupon";s:4:"name";s:9:"超级券";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:46:"../addons/ewei_shopv2/static/images/coupon.jpg";s:4:"desc";N;s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:7;a:13:{s:2:"id";s:2:"24";s:12:"displayorder";s:2:"27";s:8:"identity";s:3:"sms";s:4:"name";s:12:"短信提醒";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:43:"../addons/ewei_shopv2/static/images/sms.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:8;a:13:{s:2:"id";s:2:"27";s:12:"displayorder";s:2:"33";s:8:"identity";s:3:"wap";s:4:"name";s:9:"全网通";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:0:"";s:4:"desc";s:0:"";s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:9;a:13:{s:2:"id";s:2:"30";s:12:"displayorder";s:2:"33";s:8:"identity";s:7:"printer";s:4:"name";s:15:"小票打印机";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:0:"";s:4:"desc";s:0:"";s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:10;a:13:{s:2:"id";s:2:"28";s:12:"displayorder";s:2:"34";s:8:"identity";s:5:"h5app";s:4:"name";s:5:"H5APP";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:0:"";s:4:"desc";s:0:"";s:5:"iscom";s:1:"1";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}}'),
('ewei_shop_09110ee6c3659ae7c87f306b6c6a8616', 'a:22:{i:0;a:13:{s:2:"id";s:1:"2";s:12:"displayorder";s:1:"2";s:8:"identity";s:6:"taobao";s:4:"name";s:12:"商品助手";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:46:"../addons/ewei_shopv2/static/images/taobao.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:1;a:13:{s:2:"id";s:1:"3";s:12:"displayorder";s:1:"3";s:8:"identity";s:10:"commission";s:4:"name";s:12:"人人分销";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:50:"../addons/ewei_shopv2/static/images/commission.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:2;a:13:{s:2:"id";s:1:"4";s:12:"displayorder";s:1:"4";s:8:"identity";s:6:"poster";s:4:"name";s:12:"超级海报";s:7:"version";s:3:"1.2";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:46:"../addons/ewei_shopv2/static/images/poster.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:3;a:13:{s:2:"id";s:2:"10";s:12:"displayorder";s:2:"10";s:8:"identity";s:10:"creditshop";s:4:"name";s:12:"积分商城";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:50:"../addons/ewei_shopv2/static/images/creditshop.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:4;a:13:{s:2:"id";s:2:"12";s:12:"displayorder";s:2:"11";s:8:"identity";s:7:"article";s:4:"name";s:12:"文章营销";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/article.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:5;a:13:{s:2:"id";s:2:"14";s:12:"displayorder";s:2:"14";s:8:"identity";s:7:"postera";s:4:"name";s:12:"活动海报";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/postera.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:6;a:13:{s:2:"id";s:2:"16";s:12:"displayorder";s:2:"15";s:8:"identity";s:7:"diyform";s:4:"name";s:12:"自定表单";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/diyform.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:7;a:13:{s:2:"id";s:2:"17";s:12:"displayorder";s:2:"16";s:8:"identity";s:8:"exhelper";s:4:"name";s:12:"快递助手";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/exhelper.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:8;a:13:{s:2:"id";s:2:"18";s:12:"displayorder";s:2:"19";s:8:"identity";s:6:"groups";s:4:"name";s:12:"人人拼团";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:46:"../addons/ewei_shopv2/static/images/groups.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:9;a:13:{s:2:"id";s:2:"19";s:12:"displayorder";s:2:"20";s:8:"identity";s:7:"diypage";s:4:"name";s:12:"店铺装修";s:7:"version";s:3:"2.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/designer.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:10;a:13:{s:2:"id";s:2:"20";s:12:"displayorder";s:2:"22";s:8:"identity";s:8:"globonus";s:4:"name";s:12:"全民股东";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/globonus.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:11;a:13:{s:2:"id";s:2:"21";s:12:"displayorder";s:2:"23";s:8:"identity";s:5:"merch";s:4:"name";s:9:"多商户";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:45:"../addons/ewei_shopv2/static/images/merch.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:12;a:13:{s:2:"id";s:2:"22";s:12:"displayorder";s:2:"26";s:8:"identity";s:2:"qa";s:4:"name";s:12:"帮助中心";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:42:"../addons/ewei_shopv2/static/images/qa.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:13;a:13:{s:2:"id";s:2:"29";s:12:"displayorder";s:2:"26";s:8:"identity";s:6:"abonus";s:4:"name";s:12:"区域代理";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:46:"../addons/ewei_shopv2/static/images/abonus.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:14;a:13:{s:2:"id";s:2:"25";s:12:"displayorder";s:2:"29";s:8:"identity";s:4:"sign";s:4:"name";s:12:"积分签到";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:44:"../addons/ewei_shopv2/static/images/sign.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:15;a:13:{s:2:"id";s:2:"26";s:12:"displayorder";s:2:"30";s:8:"identity";s:3:"sns";s:4:"name";s:12:"全民社区";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:43:"../addons/ewei_shopv2/static/images/sns.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:16;a:13:{s:2:"id";s:2:"31";s:12:"displayorder";s:2:"34";s:8:"identity";s:7:"bargain";s:4:"name";s:12:"砍价活动";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/bargain.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:17;a:13:{s:2:"id";s:2:"32";s:12:"displayorder";s:2:"35";s:8:"identity";s:4:"task";s:4:"name";s:12:"任务中心";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:44:"../addons/ewei_shopv2/static/images/task.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:18;a:13:{s:2:"id";s:2:"33";s:12:"displayorder";s:2:"36";s:8:"identity";s:7:"cashier";s:4:"name";s:9:"收银台";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/cashier.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:19;a:13:{s:2:"id";s:2:"34";s:12:"displayorder";s:2:"37";s:8:"identity";s:8:"messages";s:4:"name";s:12:"消息群发";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/messages.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:20;a:13:{s:2:"id";s:2:"35";s:12:"displayorder";s:2:"38";s:8:"identity";s:7:"seckill";s:4:"name";s:12:"整点秒杀";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"sale";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/seckill.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:21;a:13:{s:2:"id";s:2:"36";s:12:"displayorder";s:2:"39";s:8:"identity";s:8:"exchange";s:4:"name";s:12:"兑换中心";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/exchange.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}}'),
('ewei_shop_0911efc078ad5f1d1b9287ef20d15ac2', 's:19:"2016-11-30 21:15:09";'),
('ewei_shop_38220aea94c7235faf501f4f7b391b16', 's:19:"2016-11-30 21:15:10";'),
('ewei_shop_ea6faf4b5220ae84fad4509b6e8af8ed', 's:19:"2016-11-30 21:15:11";'),
('ewei_shop_a27f270fcbd83b6c7e90eb88a6ec56a9', 'a:0:{}'),
('unisetting:0', 'b:0;'),
('ewei_shop_b06276d2e35260c3485cf80049b85a51', 'a:0:{}'),
('ewei_shop_4d7d7aa27c6670259d9f0867adee3308', 'a:0:{}'),
('unimodules:1:1', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:14:"人人商城V2";s:7:"version";s:6:"2.10.0";s:7:"ability";s:87:"人人商城(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:15:"微上宝科技";s:3:"url";s:32:"https://shop140828924.taobao.com";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";s:1:"1";s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('unimodules:1:', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:14:"人人商城V2";s:7:"version";s:6:"2.10.0";s:7:"ability";s:87:"人人商城(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:15:"微上宝科技";s:3:"url";s:32:"https://shop140828924.taobao.com";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";s:1:"1";s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('uniaccount:1', 'a:28:{s:4:"acid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"token";s:32:"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP";s:12:"access_token";s:0:"";s:14:"encodingaeskey";s:0:"";s:5:"level";s:1:"1";s:4:"name";s:7:"wesambo";s:7:"account";s:0:"";s:8:"original";s:0:"";s:9:"signature";s:0:"";s:7:"country";s:0:"";s:8:"province";s:0:"";s:4:"city";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:10:"lastupdate";s:1:"0";s:3:"key";s:0:"";s:6:"secret";s:0:"";s:7:"styleid";s:1:"1";s:12:"subscribeurl";s:0:"";s:18:"auth_refresh_token";s:0:"";s:12:"default_acid";s:1:"1";s:4:"type";s:1:"1";s:3:"uid";N;s:9:"starttime";N;s:7:"endtime";N;s:6:"groups";a:1:{i:1;a:5:{s:7:"groupid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"title";s:15:"默认会员组";s:6:"credit";s:1:"0";s:9:"isdefault";s:1:"1";}}s:10:"grouplevel";s:1:"0";}'),
('checkupgrade:system', 'a:1:{s:10:"lastupdate";i:1495590680;}'),
('userbasefields', 'a:44:{s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";s:6:"mobile";s:12:"手机号码";s:5:"email";s:12:"电子邮箱";s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"gender";s:6:"性别";s:5:"birth";s:6:"生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:6:"地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:6:"reside";s:9:"居住地";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";}');

DROP TABLE IF EXISTS `ims_core_cron`;
CREATE TABLE IF NOT EXISTS `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_cron_record`;
CREATE TABLE IF NOT EXISTS `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_menu`;
CREATE TABLE IF NOT EXISTS `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(60) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

INSERT INTO `ims_core_menu` (`id`, `pid`, `title`, `name`, `url`, `append_title`, `append_url`, `displayorder`, `type`, `is_display`, `is_system`, `permission_name`) VALUES
(1, 0, '基础设置', 'platform', '', 'fa fa-cog', '', 0, 'url', 1, 1, ''),
(2, 1, '基本功能', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_basic_function'),
(3, 2, '文字回复', 'platform', './index.php?c=platform&a=reply&m=basic', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=basic', 0, 'url', 1, 1, 'platform_reply_basic'),
(4, 2, '图文回复', 'platform', './index.php?c=platform&a=reply&m=news', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=news', 0, 'url', 1, 1, 'platform_reply_news'),
(5, 2, '音乐回复', 'platform', './index.php?c=platform&a=reply&m=music', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=music', 0, 'url', 1, 1, 'platform_reply_music'),
(6, 2, '图片回复', 'platform', './index.php?c=platform&a=reply&m=images', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=images', 0, 'url', 1, 1, 'platform_reply_images'),
(7, 2, '语音回复', 'platform', './index.php?c=platform&a=reply&m=voice', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=voice', 0, 'url', 1, 1, 'platform_reply_voice'),
(8, 2, '视频回复', 'platform', './index.php?c=platform&a=reply&m=video', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=video', 0, 'url', 1, 1, 'platform_reply_video'),
(9, 2, '微信卡券回复', 'platform', './index.php?c=platform&a=reply&m=wxcard', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=wxcard', 0, 'url', 1, 1, 'platform_reply_wxcard'),
(10, 2, '自定义接口回复', 'platform', './index.php?c=platform&a=reply&m=userapi', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=userapi', 0, 'url', 1, 1, 'platform_reply_userapi'),
(11, 2, '系统回复', 'platform', './index.php?c=platform&a=special&do=display&', '', '', 0, 'url', 1, 1, 'platform_reply_system'),
(12, 1, '高级功能', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_high_function'),
(13, 12, '常用服务接入', 'platform', './index.php?c=platform&a=service&do=switch&', '', '', 0, 'url', 1, 1, 'platform_service'),
(14, 12, '自定义菜单', 'platform', './index.php?c=platform&a=menu&', '', '', 0, 'url', 1, 1, 'platform_menu'),
(15, 12, '特殊消息回复', 'platform', './index.php?c=platform&a=special&do=message&', '', '', 0, 'url', 1, 1, 'platform_special'),
(16, 12, '二维码管理', 'platform', './index.php?c=platform&a=qr&', '', '', 0, 'url', 1, 1, 'platform_qr'),
(17, 12, '多客服接入', 'platform', './index.php?c=platform&a=reply&m=custom', '', '', 0, 'url', 1, 1, 'platform_reply_custom'),
(18, 12, '长链接二维码', 'platform', './index.php?c=platform&a=url2qr&', '', '', 0, 'url', 1, 1, 'platform_url2qr'),
(19, 1, '数据统计', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_stat'),
(20, 19, '聊天记录', 'platform', './index.php?c=platform&a=stat&do=history&', '', '', 0, 'url', 1, 1, 'platform_stat_history'),
(21, 19, '回复规则使用情况', 'platform', './index.php?c=platform&a=stat&do=rule&', '', '', 0, 'url', 1, 1, 'platform_stat_rule'),
(22, 19, '关键字命中情况', 'platform', './index.php?c=platform&a=stat&do=keyword&', '', '', 0, 'url', 1, 1, 'platform_stat_keyword'),
(23, 19, '参数', 'platform', './index.php?c=platform&a=stat&do=setting&', '', '', 0, 'url', 1, 1, 'platform_stat_setting'),
(24, 0, '微站功能', 'site', '', 'fa fa-life-bouy', '', 0, 'url', 1, 1, ''),
(25, 24, '微站管理', 'site', '', '', '', 0, 'url', 1, 1, 'site_manage'),
(26, 25, '站点管理', 'site', './index.php?c=site&a=multi&do=display&', 'fa fa-plus', './index.php?c=site&a=multi&do=post&', 0, 'url', 1, 1, 'site_multi_display'),
(27, 25, '站点添加/编辑', 'site', '', '', '', 0, 'permission', 0, 1, 'site_multi_post'),
(28, 25, '站点删除', 'site', '', '', '', 0, 'permission', 0, 1, 'site_multi_del'),
(29, 25, '模板管理', 'site', './index.php?c=site&a=style&do=template&', '', '', 0, 'url', 1, 1, 'site_style_template'),
(30, 25, '模块模板扩展', 'site', './index.php?c=site&a=style&do=module&', '', '', 0, 'url', 1, 1, 'site_style_module'),
(31, 24, '特殊页面管理', 'site', '', '', '', 0, 'url', 1, 1, 'site_special_page'),
(32, 31, '会员中心', 'site', './index.php?c=site&a=editor&do=uc&', '', '', 0, 'url', 1, 1, 'site_editor_uc'),
(33, 31, '专题页面', 'site', './index.php?c=site&a=editor&do=page&', 'fa fa-plus', './index.php?c=site&a=editor&do=design&', 0, 'url', 1, 1, 'site_editor_page'),
(34, 24, '功能组件', 'site', '', '', '', 0, 'url', 1, 1, 'site_article'),
(35, 34, '分类设置', 'site', './index.php?c=site&a=category&', '', '', 0, 'url', 1, 1, 'site_category'),
(36, 34, '文章管理', 'site', './index.php?c=site&a=article&', '', '', 0, 'url', 1, 1, 'site_article'),
(37, 0, '粉丝营销', 'mc', '', 'fa fa-gift', '', 0, 'url', 1, 1, ''),
(38, 37, '粉丝管理', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_fans_manage'),
(39, 38, '粉丝分组', 'mc', './index.php?c=mc&a=fangroup&', '', '', 0, 'url', 1, 1, 'mc_fangroup'),
(40, 38, '粉丝', 'mc', './index.php?c=mc&a=fans&', '', '', 0, 'url', 1, 1, 'mc_fans'),
(41, 37, '会员中心', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_members_manage'),
(42, 41, '会员中心关键字', 'mc', './index.php?c=platform&a=cover&do=mc&', '', '', 0, 'url', 1, 1, 'platform_cover_mc'),
(43, 41, '会员', 'mc', './index.php?c=mc&a=member', 'fa fa-plus', './index.php?c=mc&a=member&do=add', 0, 'url', 1, 1, 'mc_member'),
(44, 41, '会员组', 'mc', './index.php?c=mc&a=group&', '', '', 0, 'url', 1, 1, 'mc_group'),
(45, 37, '会员卡管理', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_card_manage'),
(46, 45, '会员卡关键字', 'mc', './index.php?c=platform&a=cover&do=card&', '', '', 0, 'url', 1, 1, 'platform_cover_card'),
(47, 45, '会员卡管理', 'mc', './index.php?c=mc&a=card&do=manage', '', '', 0, 'url', 1, 1, 'mc_card_manage'),
(48, 45, '会员卡设置', 'mc', './index.php?c=mc&a=card&do=editor', '', '', 0, 'url', 1, 1, 'mc_card_editor'),
(49, 45, '会员卡其他功能', 'mc', './index.php?c=mc&a=card&do=other', '', '', 0, 'url', 1, 1, 'mc_card_other'),
(50, 37, '积分兑换', 'mc', '', '', '', 0, 'url', 1, 1, 'activity_discount_manage'),
(51, 50, '折扣券', 'mc', './index.php?c=activity&a=coupon&', '', '', 0, 'url', 1, 1, 'activity_coupon_display'),
(52, 50, '折扣券核销', 'mc', './index.php?c=activity&a=consume&do=display&type=1&status=2', '', '', 0, 'url', 1, 1, 'activity_consume_coupon'),
(53, 50, '代金券', 'mc', './index.php?c=activity&a=token', '', '', 0, 'url', 1, 1, 'activity_token_display'),
(54, 50, '代金券核销', 'mc', './index.php?c=activity&a=consume&do=display&type=2&status=2', '', '', 0, 'url', 1, 1, 'activity_consume_token'),
(55, 50, '真实物品', 'mc', './index.php?c=activity&a=goods', '', '', 0, 'url', 1, 1, 'activity_goods_display'),
(56, 37, '微信素材&群发', 'mc', '', '', '', 0, 'url', 1, 1, 'material_manage'),
(57, 56, '素材&群发', 'mc', './index.php?c=material&a=display', '', '', 0, 'url', 1, 1, 'material_display'),
(58, 56, '定时群发', 'mc', './index.php?c=material&a=mass', '', '', 0, 'url', 1, 1, 'material_mass'),
(59, 37, '微信卡券管理', 'mc', '', '', '', 0, 'url', 1, 1, 'wechat_card_manage'),
(60, 59, '卡券列表', 'mc', './index.php?c=wechat&a=card&do=list', '', '', 0, 'url', 1, 1, 'wechat_card_list'),
(61, 59, '卡券核销', 'mc', './index.php?c=wechat&a=consume', '', '', 0, 'url', 1, 1, 'wechat_consume'),
(62, 59, '测试白名单', 'mc', './index.php?c=wechat&a=white&do=list', '', '', 0, 'url', 1, 1, 'wechat_white_list'),
(63, 37, '门店管理', 'mc', '', '', '', 0, 'url', 1, 1, 'activity_store_manage'),
(64, 63, '门店列表', 'mc', './index.php?c=activity&a=store', '', '', 0, 'url', 1, 1, 'activity_store_list'),
(65, 63, '店员列表', 'mc', './index.php?c=activity&a=clerk', '', '', 0, 'url', 1, 1, 'activity_clerk_list'),
(66, 37, '收银台', 'mc', '', '', '', 0, 'url', 1, 1, 'paycenter_manage'),
(67, 66, '微信刷卡收款', 'mc', './index.php?c=paycenter&a=wxmicro&do=pay', '', '', 0, 'url', 1, 1, 'paycenter_wxmicro_pay'),
(68, 66, '收银台关键字', 'mc', './index.php?c=platform&a=cover&do=clerk', '', '', 0, 'url', 1, 1, 'paycenter_clerk'),
(69, 37, '统计中心', 'mc', '', '', '', 0, 'url', 1, 1, 'stat_center'),
(70, 69, '会员积分统计', 'mc', './index.php?c=stat&a=credit1', '', '', 0, 'url', 1, 1, 'stat_credit1'),
(71, 69, '会员余额统计', 'mc', './index.php?c=stat&a=credit2', '', '', 0, 'url', 1, 1, 'stat_credit2'),
(72, 69, '会员现金消费统计', 'mc', './index.php?c=stat&a=cash', '', '', 0, 'url', 1, 1, 'stat_cash'),
(73, 69, '会员卡统计', 'mc', './index.php?c=stat&a=card', '', '', 0, 'url', 1, 1, 'stat_card'),
(74, 69, '收银台收款统计', 'mc', './index.php?c=stat&a=paycenter', '', '', 0, 'url', 1, 1, 'stat_paycenter'),
(75, 0, '功能选项', 'setting', '', 'fa fa-umbrella', '', 0, 'url', 1, 1, ''),
(76, 75, '公众号选项', 'setting', '', '', '', 0, 'url', 1, 1, 'account_setting'),
(77, 76, '支付参数', 'setting', './index.php?c=profile&a=payment&', '', '', 0, 'url', 1, 1, 'profile_payment'),
(78, 76, '借用 oAuth 权限', 'setting', './index.php?c=mc&a=passport&do=oauth&', '', '', 0, 'url', 1, 1, 'mc_passport_oauth'),
(79, 76, '借用 JS 分享权限', 'setting', './index.php?c=profile&a=jsauth&', '', '', 0, 'url', 1, 1, 'profile_jsauth'),
(80, 76, '会员字段管理', 'setting', './index.php?c=mc&a=fields', '', '', 0, 'url', 1, 1, 'mc_fields'),
(81, 76, '微信通知设置', 'setting', './index.php?c=mc&a=tplnotice', '', '', 0, 'url', 1, 1, 'mc_tplnotice'),
(82, 76, '工作台菜单设置', 'setting', './index.php?c=profile&a=deskmenu', '', '', 0, 'url', 1, 1, 'profile_deskmenu'),
(83, 76, '会员扩展功能', 'setting', './index.php?c=mc&a=plugin', '', '', 0, 'url', 1, 1, 'mc_plugin'),
(84, 75, '会员及粉丝选项', 'setting', '', '', '', 0, 'url', 1, 1, 'mc_setting'),
(85, 84, '积分设置', 'setting', './index.php?c=mc&a=credit&', '', '', 0, 'url', 1, 1, 'mc_credit'),
(86, 84, '注册设置', 'setting', './index.php?c=mc&a=passport&do=passport&', '', '', 0, 'url', 1, 1, 'mc_passport_passport'),
(87, 84, '粉丝同步设置', 'setting', './index.php?c=mc&a=passport&do=sync&', '', '', 0, 'url', 1, 1, 'mc_passport_sync'),
(88, 84, 'UC站点整合', 'setting', './index.php?c=mc&a=uc&', '', '', 0, 'url', 1, 1, 'mc_uc'),
(89, 84, '邮件通知参数', 'setting', './index.php?c=profile&a=notify', '', '', 0, 'url', 1, 1, 'profile_notify'),
(90, 75, '其他功能选项', 'setting', '', '', '', 0, 'url', 1, 1, 'others_setting'),
(91, 0, '扩展功能', 'ext', '', 'fa fa-cubes', '', 0, 'url', 1, 1, ''),
(92, 91, '管理', 'ext', '', '', '', 0, 'url', 1, 1, ''),
(93, 92, '扩展功能管理', 'ext', './index.php?c=profile&a=module&', '', '', 0, 'url', 1, 1, 'profile_module');

DROP TABLE IF EXISTS `ims_core_paylog`;
CREATE TABLE IF NOT EXISTS `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_performance`;
CREATE TABLE IF NOT EXISTS `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_queue`;
CREATE TABLE IF NOT EXISTS `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_resource`;
CREATE TABLE IF NOT EXISTS `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_sendsms_log`;
CREATE TABLE IF NOT EXISTS `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_core_sessions`;
CREATE TABLE IF NOT EXISTS `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('1cc20012424929fe4e24283de27e8098', 1, '::1', 'acid|s:1:"1";uniacid|i:1;token|a:3:{s:4:"udS4";i:1475642432;s:4:"rnHL";i:1475642539;s:4:"d3vW";i:1475642657;}', 1475646257),
('bb9f151eeb7d81d2ffca6950c7b9f7d5', 1, '::1', 'acid|s:1:"1";uniacid|i:1;token|a:3:{s:4:"vroV";i:1481269618;s:4:"WEd8";i:1481269618;s:4:"K6Sj";i:1481269619;}', 1481273219);

DROP TABLE IF EXISTS `ims_core_settings`;
CREATE TABLE IF NOT EXISTS `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ims_core_settings` (`key`, `value`) VALUES
('copyright', 'a:24:{s:6:"status";s:1:"0";s:10:"verifycode";s:1:"0";s:6:"reason";s:0:"";s:8:"sitename";s:21:"微上宝分销平台";s:3:"url";s:7:"http://";s:8:"statcode";s:0:"";s:10:"footerleft";s:14:"Copyright 2017";s:11:"footerright";s:19:"All Rights Reserved";s:4:"icon";s:0:"";s:5:"flogo";s:48:"images/global/ez83GNNaav63zt60detv60bZzRGnBV.png";s:6:"slides";s:216:"a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}";s:6:"notice";s:0:"";s:5:"blogo";s:48:"images/global/ez83GNNaav63zt60detv60bZzRGnBV.png";s:8:"baidumap";a:2:{s:3:"lng";s:0:"";s:3:"lat";s:0:"";}s:7:"company";s:24:"广州谷来信息科技";s:14:"companyprofile";s:0:"";s:7:"address";s:27:"广东省广州市天河区";s:6:"person";s:9:"陈先生";s:5:"phone";s:12:"020-88888888";s:2:"qq";s:8:"88888888";s:5:"email";s:13:"888888@qq.com";s:8:"keywords";s:21:"微上宝分销平台";s:11:"description";s:21:"微上宝分销平台";s:12:"showhomepage";i:1;}'),
('authmode', 'i:1;'),
('close', 'a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}'),
('register', 'a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}'),
('module_receive_ban', 'a:0:{}'),
('basic', 'a:1:{s:8:"template";s:7:"default";}');

DROP TABLE IF EXISTS `ims_coupon`;
CREATE TABLE IF NOT EXISTS `ims_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `logo_url` varchar(150) NOT NULL,
  `code_type` tinyint(3) unsigned NOT NULL,
  `brand_name` varchar(15) NOT NULL,
  `title` varchar(15) NOT NULL,
  `sub_title` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `notice` varchar(15) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date_info` varchar(200) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `use_custom_code` tinyint(3) NOT NULL,
  `bind_openid` tinyint(3) unsigned NOT NULL,
  `can_share` tinyint(3) unsigned NOT NULL,
  `can_give_friend` tinyint(3) unsigned NOT NULL,
  `get_limit` tinyint(3) unsigned NOT NULL,
  `service_phone` varchar(20) NOT NULL,
  `extra` varchar(1000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_selfconsume` tinyint(3) unsigned NOT NULL,
  `promotion_url_name` varchar(10) NOT NULL,
  `promotion_url` varchar(100) NOT NULL,
  `promotion_url_sub_title` varchar(10) NOT NULL,
  `source` tinyint(3) unsigned NOT NULL,
  `dosage` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_activity`;
CREATE TABLE IF NOT EXISTS `ims_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `msg_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(3) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `coupons` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `members` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_groups`;
CREATE TABLE IF NOT EXISTS `ims_coupon_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_location`;
CREATE TABLE IF NOT EXISTS `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_modules`;
CREATE TABLE IF NOT EXISTS `ims_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `couponid` (`couponid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_record`;
CREATE TABLE IF NOT EXISTS `ims_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `friend_openid` varchar(50) NOT NULL,
  `givebyfriend` tinyint(3) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `grantmodule` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `card_id` (`card_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_setting`;
CREATE TABLE IF NOT EXISTS `ims_coupon_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) NOT NULL,
  `logourl` varchar(150) NOT NULL,
  `whitelist` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_coupon_store`;
CREATE TABLE IF NOT EXISTS `ims_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `couponid` (`couponid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_cover_reply`;
CREATE TABLE IF NOT EXISTS `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `ims_cover_reply` (`id`, `uniacid`, `multiid`, `rid`, `module`, `do`, `title`, `description`, `thumb`, `url`) VALUES
(1, 1, 0, 7, 'mc', '', '进入个人中心', '', '', './index.php?c=mc&a=home&i=1'),
(2, 1, 1, 8, 'site', '', '进入首页', '', '', './index.php?c=home&i=1&t=1'),
(3, 1, 0, 9, 'ewei_shopv2', '', '', '', '', './index.php?i=1&c=entry&m=ewei_shopv2&do=mobile&r=article.list'),
(4, 1, 0, 10, 'ewei_shopv2', '', '1', '', '', './index.php?i=1&c=entry&m=ewei_shopv2&do=mobile&r=sign.list');

DROP TABLE IF EXISTS `ims_custom_reply`;
CREATE TABLE IF NOT EXISTS `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_images_reply`;
CREATE TABLE IF NOT EXISTS `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card`;
CREATE TABLE IF NOT EXISTS `ims_mc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `format_type` tinyint(3) unsigned NOT NULL,
  `format` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `fields` varchar(1000) NOT NULL,
  `snpos` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `business` text NOT NULL,
  `discount_type` tinyint(3) unsigned NOT NULL,
  `discount` varchar(3000) NOT NULL,
  `grant` varchar(3000) NOT NULL,
  `grant_rate` varchar(20) NOT NULL,
  `offset_rate` int(10) unsigned NOT NULL,
  `offset_max` int(10) NOT NULL,
  `nums_status` tinyint(3) unsigned NOT NULL,
  `nums_text` varchar(15) NOT NULL,
  `nums` varchar(1000) NOT NULL,
  `times_status` tinyint(3) unsigned NOT NULL,
  `times_text` varchar(15) NOT NULL,
  `times` varchar(1000) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recommend_status` tinyint(3) unsigned NOT NULL,
  `sign_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_care`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_care` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit2` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `time` tinyint(3) unsigned NOT NULL,
  `show_in_card` tinyint(3) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sms_notice` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_credit_set`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_credit_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_members`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(50) NOT NULL,
  `cid` int(10) NOT NULL,
  `cardsn` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `nums` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_notices`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_notices_unread`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_notices_unread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_recommend`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_record`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `tag` varchar(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_card_sign_record`;
CREATE TABLE IF NOT EXISTS `ims_mc_card_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `is_grant` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_cash_record`;
CREATE TABLE IF NOT EXISTS `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_chats_record`;
CREATE TABLE IF NOT EXISTS `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_credits_recharge`;
CREATE TABLE IF NOT EXISTS `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_credits_record`;
CREATE TABLE IF NOT EXISTS `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_fans_groups`;
CREATE TABLE IF NOT EXISTS `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
CREATE TABLE IF NOT EXISTS `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`) USING BTREE,
  KEY `fanid_index` (`fanid`) USING BTREE,
  KEY `tagid_index` (`tagid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_groups`;
CREATE TABLE IF NOT EXISTS `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ims_mc_groups` (`groupid`, `uniacid`, `title`, `credit`, `isdefault`) VALUES
(1, 1, '默认会员组', 0, 1);

DROP TABLE IF EXISTS `ims_mc_handsel`;
CREATE TABLE IF NOT EXISTS `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
CREATE TABLE IF NOT EXISTS `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(30) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `updatetime` (`updatetime`),
  KEY `nickname` (`nickname`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_mapping_ucenter`;
CREATE TABLE IF NOT EXISTS `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_mass_record`;
CREATE TABLE IF NOT EXISTS `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_members`;
CREATE TABLE IF NOT EXISTS `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_member_address`;
CREATE TABLE IF NOT EXISTS `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mc_member_fields`;
CREATE TABLE IF NOT EXISTS `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

DROP TABLE IF EXISTS `ims_mc_oauth_fans`;
CREATE TABLE IF NOT EXISTS `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_menu_event`;
CREATE TABLE IF NOT EXISTS `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_mobilenumber`;
CREATE TABLE IF NOT EXISTS `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_modules`;
CREATE TABLE IF NOT EXISTS `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

INSERT INTO `ims_modules` (`mid`, `name`, `type`, `title`, `version`, `ability`, `description`, `author`, `url`, `settings`, `subscribes`, `handles`, `isrulefields`, `issystem`, `target`, `iscard`, `permissions`) VALUES
(1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'http://bbs.we7.cc', 0, 'a:0:{}', 'a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}', 1, 1, 0, 0, ''),
(7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, ''),
(11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, ''),
(12, 'paycenter', 'system', '收银台', '1.0', '收银台', '收银台', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '');

DROP TABLE IF EXISTS `ims_modules_bindings`;
CREATE TABLE IF NOT EXISTS `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

INSERT INTO `ims_modules_bindings` (`eid`, `module`, `entry`, `call`, `title`, `do`, `state`, `direct`, `url`, `icon`, `displayorder`) VALUES
(9, 'ewei_shopv2', 'menu', '', '在线更新', 'download', '', 0, '', '', 0),
(8, 'ewei_shopv2', 'menu', '', '商城管理', 'shop', '', 0, '', '', 0),
(7, 'ewei_shopv2', 'cover', '', '商城入口', 'shop', '', 0, '', '', 0);

DROP TABLE IF EXISTS `ims_modules_recycle`;
CREATE TABLE IF NOT EXISTS `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

DROP TABLE IF EXISTS `ims_music_reply`;
CREATE TABLE IF NOT EXISTS `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_news_reply`;
CREATE TABLE IF NOT EXISTS `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_paycenter_order`;
CREATE TABLE IF NOT EXISTS `ims_paycenter_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `uniontid` varchar(40) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL,
  `trade_type` varchar(10) NOT NULL,
  `body` varchar(255) NOT NULL,
  `fee` varchar(15) NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `auth_code` varchar(30) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `follow` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `credit_status` tinyint(3) unsigned NOT NULL,
  `paytime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_profile_fields`;
CREATE TABLE IF NOT EXISTS `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

INSERT INTO `ims_profile_fields` (`id`, `field`, `available`, `title`, `description`, `displayorder`, `required`, `unchangeable`, `showinregister`, `field_length`) VALUES
(1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0),
(2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0),
(3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0),
(4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0),
(5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0),
(6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0),
(7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0),
(8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0),
(9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0),
(10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0),
(11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0),
(12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0),
(13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0),
(14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0),
(15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0),
(16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0),
(17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0),
(18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0),
(19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0),
(20, 'company', 1, '公司', '', 0, 0, 0, 0, 0),
(21, 'education', 1, '学历', '', 0, 0, 0, 0, 0),
(22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0),
(23, 'position', 1, '职位', '', 0, 0, 0, 0, 0),
(24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0),
(25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0),
(26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0),
(27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0),
(28, 'height', 1, '身高', '', 0, 0, 0, 0, 0),
(29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0),
(30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0),
(31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0),
(32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0),
(33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0),
(34, 'site', 1, '主页', '', 0, 0, 0, 0, 0),
(35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0),
(36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0);

DROP TABLE IF EXISTS `ims_qrcode`;
CREATE TABLE IF NOT EXISTS `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_qrcode_stat`;
CREATE TABLE IF NOT EXISTS `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_rule`;
CREATE TABLE IF NOT EXISTS `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

INSERT INTO `ims_rule` (`id`, `uniacid`, `name`, `module`, `displayorder`, `status`) VALUES
(1, 0, '城市天气', 'userapi', 255, 1),
(2, 0, '百度百科', 'userapi', 255, 1),
(3, 0, '即时翻译', 'userapi', 255, 1),
(4, 0, '今日老黄历', 'userapi', 255, 1),
(5, 0, '看新闻', 'userapi', 255, 1),
(6, 0, '快递查询', 'userapi', 255, 1),
(7, 1, '个人中心入口设置', 'cover', 0, 1),
(8, 1, '微擎团队入口设置', 'cover', 0, 1),
(9, 1, 'ewei_shopv2文章营销入口设置', 'cover', 0, 1),
(10, 1, 'ewei_shopv2签到入口设置', 'cover', 0, 1);

DROP TABLE IF EXISTS `ims_rule_keyword`;
CREATE TABLE IF NOT EXISTS `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

INSERT INTO `ims_rule_keyword` (`id`, `rid`, `uniacid`, `module`, `content`, `type`, `displayorder`, `status`) VALUES
(1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1),
(2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1),
(3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1),
(4, 3, 0, 'userapi', '^@.+$', 3, 255, 1),
(5, 4, 0, 'userapi', '日历', 1, 255, 1),
(6, 4, 0, 'userapi', '万年历', 1, 255, 1),
(7, 4, 0, 'userapi', '黄历', 1, 255, 1),
(8, 4, 0, 'userapi', '几号', 1, 255, 1),
(9, 5, 0, 'userapi', '新闻', 1, 255, 1),
(10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1),
(11, 7, 1, 'cover', '个人中心', 1, 0, 1),
(12, 8, 1, 'cover', '首页', 1, 0, 1),
(13, 9, 1, 'cover', '1', 1, 0, 1),
(14, 10, 1, 'cover', '签到入口', 1, 0, 1);

DROP TABLE IF EXISTS `ims_site_article`;
CREATE TABLE IF NOT EXISTS `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_site_category`;
CREATE TABLE IF NOT EXISTS `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_site_multi`;
CREATE TABLE IF NOT EXISTS `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ims_site_multi` (`id`, `uniacid`, `title`, `styleid`, `site_info`, `status`, `bindhost`) VALUES
(1, 1, '微擎团队', 1, '', 1, '');

DROP TABLE IF EXISTS `ims_site_nav`;
CREATE TABLE IF NOT EXISTS `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_site_page`;
CREATE TABLE IF NOT EXISTS `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `ims_site_page` (`id`, `uniacid`, `multiid`, `title`, `description`, `params`, `html`, `type`, `status`, `createtime`, `goodnum`) VALUES
(1, 1, 0, '快捷菜单', '', '{"navStyle":"2","bgColor":"#f4f4f4","menus":[{"title":"\\u4f1a\\u5458\\u5361","url":".\\/index.php?c=mc&a=bond&do=card&i=1","submenus":[],"icon":{"name":"fa fa-credit-card","color":"#969696"},"image":"","hoverimage":"","hovericon":[]},{"title":"\\u5151\\u6362","url":".\\/index.php?c=activity&a=coupon&do=display&&i=1","submenus":[],"icon":{"name":"fa fa-money","color":"#969696"},"image":"","hoverimage":"","hovericon":[]},{"title":"\\u4ed8\\u6b3e","url":"\\" data-target=\\"#scan\\" data-toggle=\\"modal\\" href=\\"javascript:void();","submenus":[],"icon":{"name":"fa fa-qrcode","color":"#969696"},"image":"","hoverimage":"","hovericon":""},{"title":"\\u4e2a\\u4eba\\u4e2d\\u5fc3","url":".\\/index.php?i=1&c=mc&","submenus":[],"icon":{"name":"fa fa-user","color":"#969696"},"image":"","hoverimage":"","hovericon":[]}],"extend":[],"position":{"homepage":true,"usercenter":true,"page":true,"article":true},"ignoreModules":[]}', '<div style="background-color: rgb(244, 244, 244);" class="js-quickmenu nav-menu-app has-nav-0  has-nav-4"   ><ul class="nav-group clearfix"><li class="nav-group-item " ><a href="./index.php?c=mc&a=bond&do=card&i=1" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-credit-card"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">会员卡</span></a></li><li class="nav-group-item " ><a href="./index.php?c=activity&a=coupon&do=display&&i=1" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-money"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">兑换</span></a></li><li class="nav-group-item " ><a href="" data-target="#scan" data-toggle="modal" href="javascript:void();" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-qrcode"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">付款</span></a></li><li class="nav-group-item " ><a href="./index.php?i=1&c=mc&" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-user"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">个人中心</span></a></li></ul></div>', 4, 1, 1440242655, 0);

DROP TABLE IF EXISTS `ims_site_slide`;
CREATE TABLE IF NOT EXISTS `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_site_styles`;
CREATE TABLE IF NOT EXISTS `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ims_site_styles` (`id`, `uniacid`, `templateid`, `name`) VALUES
(1, 1, 1, '微站默认模板_gC5C');

DROP TABLE IF EXISTS `ims_site_styles_vars`;
CREATE TABLE IF NOT EXISTS `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_site_templates`;
CREATE TABLE IF NOT EXISTS `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `ims_site_templates` (`id`, `name`, `title`, `version`, `description`, `author`, `url`, `type`, `sections`) VALUES
(1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '微擎团队', 'http://we7.cc', '1', 0);

DROP TABLE IF EXISTS `ims_stat_fans`;
CREATE TABLE IF NOT EXISTS `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=203 ;

INSERT INTO `ims_stat_fans` (`id`, `uniacid`, `new`, `cancel`, `cumulate`, `date`) VALUES
(1, 1, 0, 0, 0, '20160715'),
(2, 1, 0, 0, 0, '20160714'),
(3, 1, 0, 0, 0, '20160713'),
(4, 1, 0, 0, 0, '20160712'),
(5, 1, 0, 0, 0, '20160711'),
(6, 1, 0, 0, 0, '20160710'),
(7, 1, 0, 0, 0, '20160709'),
(8, 1, 0, 0, 0, '20160813'),
(9, 1, 0, 0, 0, '20160812'),
(10, 1, 0, 0, 0, '20160811'),
(11, 1, 0, 0, 0, '20160810'),
(12, 1, 0, 0, 0, '20160809'),
(13, 1, 0, 0, 0, '20160808'),
(14, 1, 0, 0, 0, '20160807'),
(15, 1, 0, 0, 0, '20160819'),
(16, 1, 0, 0, 0, '20160818'),
(17, 1, 0, 0, 0, '20160817'),
(18, 1, 0, 0, 0, '20160816'),
(19, 1, 0, 0, 0, '20160815'),
(20, 1, 0, 0, 0, '20160814'),
(21, 1, 0, 0, 0, '20160829'),
(22, 1, 0, 0, 0, '20160828'),
(23, 1, 0, 0, 0, '20160827'),
(24, 1, 0, 0, 0, '20160826'),
(25, 1, 0, 0, 0, '20160825'),
(26, 1, 0, 0, 0, '20160824'),
(27, 1, 0, 0, 0, '20160823'),
(28, 1, 0, 0, 0, '20160903'),
(29, 1, 0, 0, 0, '20160902'),
(30, 1, 0, 0, 0, '20160901'),
(31, 1, 0, 0, 0, '20160831'),
(32, 1, 0, 0, 0, '20160830'),
(33, 1, 0, 0, 0, '20160911'),
(34, 1, 0, 0, 0, '20160910'),
(35, 1, 0, 0, 0, '20160909'),
(36, 1, 0, 0, 0, '20160908'),
(37, 1, 0, 0, 0, '20160907'),
(38, 1, 0, 0, 0, '20160906'),
(39, 1, 0, 0, 0, '20160905'),
(40, 1, 0, 0, 0, '20160912'),
(41, 1, 0, 0, 0, '20160918'),
(42, 1, 0, 0, 0, '20160917'),
(43, 1, 0, 0, 0, '20160916'),
(44, 1, 0, 0, 0, '20160915'),
(45, 1, 0, 0, 0, '20160914'),
(46, 1, 0, 0, 0, '20160913'),
(47, 1, 0, 0, 0, '20160919'),
(48, 1, 0, 0, 0, '20161004'),
(49, 1, 0, 0, 0, '20161003'),
(50, 1, 0, 0, 0, '20161002'),
(51, 1, 0, 0, 0, '20161001'),
(52, 1, 0, 0, 0, '20160930'),
(53, 1, 0, 0, 0, '20160929'),
(54, 1, 0, 0, 0, '20160928'),
(55, 1, 0, 0, 0, '20161011'),
(56, 1, 0, 0, 0, '20161010'),
(57, 1, 0, 0, 0, '20161009'),
(58, 1, 0, 0, 0, '20161008'),
(59, 1, 0, 0, 0, '20161007'),
(60, 1, 0, 0, 0, '20161006'),
(61, 1, 0, 0, 0, '20161005'),
(62, 1, 0, 0, 0, '20161019'),
(63, 1, 0, 0, 0, '20161018'),
(64, 1, 0, 0, 0, '20161017'),
(65, 1, 0, 0, 0, '20161016'),
(66, 1, 0, 0, 0, '20161015'),
(67, 1, 0, 0, 0, '20161014'),
(68, 1, 0, 0, 0, '20161013'),
(69, 1, 0, 0, 0, '20161026'),
(70, 1, 0, 0, 0, '20161025'),
(71, 1, 0, 0, 0, '20161024'),
(72, 1, 0, 0, 0, '20161023'),
(73, 1, 0, 0, 0, '20161022'),
(74, 1, 0, 0, 0, '20161021'),
(75, 1, 0, 0, 0, '20161020'),
(76, 1, 0, 0, 0, '20161102'),
(77, 1, 0, 0, 0, '20161101'),
(78, 1, 0, 0, 0, '20161031'),
(79, 1, 0, 0, 0, '20161030'),
(80, 1, 0, 0, 0, '20161029'),
(81, 1, 0, 0, 0, '20161028'),
(82, 1, 0, 0, 0, '20161027'),
(83, 1, 0, 0, 0, '20161112'),
(84, 1, 0, 0, 0, '20161111'),
(85, 1, 0, 0, 0, '20161110'),
(86, 1, 0, 0, 0, '20161109'),
(87, 1, 0, 0, 0, '20161108'),
(88, 1, 0, 0, 0, '20161107'),
(89, 1, 0, 0, 0, '20161106'),
(90, 1, 0, 0, 0, '20161122'),
(91, 1, 0, 0, 0, '20161121'),
(92, 1, 0, 0, 0, '20161120'),
(93, 1, 0, 0, 0, '20161119'),
(94, 1, 0, 0, 0, '20161118'),
(95, 1, 0, 0, 0, '20161117'),
(96, 1, 0, 0, 0, '20161116'),
(97, 1, 0, 0, 0, '20161207'),
(98, 1, 0, 0, 0, '20161206'),
(99, 1, 0, 0, 0, '20161205'),
(100, 1, 0, 0, 0, '20161204'),
(101, 1, 0, 0, 0, '20161203'),
(102, 1, 0, 0, 0, '20161202'),
(103, 1, 0, 0, 0, '20161201'),
(104, 1, 0, 0, 0, '20161208'),
(105, 1, 0, 0, 0, '20161225'),
(106, 1, 0, 0, 0, '20161224'),
(107, 1, 0, 0, 0, '20161223'),
(108, 1, 0, 0, 0, '20161222'),
(109, 1, 0, 0, 0, '20161221'),
(110, 1, 0, 0, 0, '20161220'),
(111, 1, 0, 0, 0, '20161219'),
(112, 1, 0, 0, 0, '20170108'),
(113, 1, 0, 0, 0, '20170107'),
(114, 1, 0, 0, 0, '20170106'),
(115, 1, 0, 0, 0, '20170105'),
(116, 1, 0, 0, 0, '20170104'),
(117, 1, 0, 0, 0, '20170103'),
(118, 1, 0, 0, 0, '20170102'),
(119, 1, 0, 0, 0, '20170110'),
(120, 1, 0, 0, 0, '20170109'),
(121, 1, 0, 0, 0, '20170209'),
(122, 1, 0, 0, 0, '20170208'),
(123, 1, 0, 0, 0, '20170207'),
(124, 1, 0, 0, 0, '20170206'),
(125, 1, 0, 0, 0, '20170205'),
(126, 1, 0, 0, 0, '20170204'),
(127, 1, 0, 0, 0, '20170203'),
(128, 1, 0, 0, 0, '20170213'),
(129, 1, 0, 0, 0, '20170212'),
(130, 1, 0, 0, 0, '20170211'),
(131, 1, 0, 0, 0, '20170210'),
(132, 1, 0, 0, 0, '20170214'),
(133, 1, 0, 0, 0, '20170220'),
(134, 1, 0, 0, 0, '20170219'),
(135, 1, 0, 0, 0, '20170218'),
(136, 1, 0, 0, 0, '20170217'),
(137, 1, 0, 0, 0, '20170216'),
(138, 1, 0, 0, 0, '20170215'),
(139, 1, 0, 0, 0, '20170221'),
(140, 1, 0, 0, 0, '20170309'),
(141, 1, 0, 0, 0, '20170308'),
(142, 1, 0, 0, 0, '20170307'),
(143, 1, 0, 0, 0, '20170306'),
(144, 1, 0, 0, 0, '20170305'),
(145, 1, 0, 0, 0, '20170304'),
(146, 1, 0, 0, 0, '20170303'),
(147, 1, 0, 0, 0, '20170314'),
(148, 1, 0, 0, 0, '20170313'),
(149, 1, 0, 0, 0, '20170312'),
(150, 1, 0, 0, 0, '20170311'),
(151, 1, 0, 0, 0, '20170310'),
(152, 1, 0, 0, 0, '20170319'),
(153, 1, 0, 0, 0, '20170318'),
(154, 1, 0, 0, 0, '20170317'),
(155, 1, 0, 0, 0, '20170316'),
(156, 1, 0, 0, 0, '20170315'),
(157, 1, 0, 0, 0, '20170320'),
(158, 1, 0, 0, 0, '20170328'),
(159, 1, 0, 0, 0, '20170327'),
(160, 1, 0, 0, 0, '20170326'),
(161, 1, 0, 0, 0, '20170325'),
(162, 1, 0, 0, 0, '20170324'),
(163, 1, 0, 0, 0, '20170323'),
(164, 1, 0, 0, 0, '20170322'),
(165, 1, 0, 0, 0, '20170329'),
(166, 1, 0, 0, 0, '20170330'),
(167, 1, 0, 0, 0, '20170331'),
(168, 1, 0, 0, 0, '20170407'),
(169, 1, 0, 0, 0, '20170406'),
(170, 1, 0, 0, 0, '20170405'),
(171, 1, 0, 0, 0, '20170404'),
(172, 1, 0, 0, 0, '20170403'),
(173, 1, 0, 0, 0, '20170402'),
(174, 1, 0, 0, 0, '20170401'),
(175, 1, 0, 0, 0, '20170414'),
(176, 1, 0, 0, 0, '20170413'),
(177, 1, 0, 0, 0, '20170412'),
(178, 1, 0, 0, 0, '20170411'),
(179, 1, 0, 0, 0, '20170410'),
(180, 1, 0, 0, 0, '20170409'),
(181, 1, 0, 0, 0, '20170408'),
(182, 1, 0, 0, 0, '20170420'),
(183, 1, 0, 0, 0, '20170419'),
(184, 1, 0, 0, 0, '20170418'),
(185, 1, 0, 0, 0, '20170417'),
(186, 1, 0, 0, 0, '20170416'),
(187, 1, 0, 0, 0, '20170415'),
(188, 1, 0, 0, 0, '20170421'),
(189, 1, 0, 0, 0, '20170510'),
(190, 1, 0, 0, 0, '20170509'),
(191, 1, 0, 0, 0, '20170508'),
(192, 1, 0, 0, 0, '20170507'),
(193, 1, 0, 0, 0, '20170506'),
(194, 1, 0, 0, 0, '20170505'),
(195, 1, 0, 0, 0, '20170504'),
(196, 1, 0, 0, 0, '20170523'),
(197, 1, 0, 0, 0, '20170522'),
(198, 1, 0, 0, 0, '20170521'),
(199, 1, 0, 0, 0, '20170520'),
(200, 1, 0, 0, 0, '20170519'),
(201, 1, 0, 0, 0, '20170518'),
(202, 1, 0, 0, 0, '20170517');

DROP TABLE IF EXISTS `ims_stat_keyword`;
CREATE TABLE IF NOT EXISTS `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_stat_msg_history`;
CREATE TABLE IF NOT EXISTS `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_stat_rule`;
CREATE TABLE IF NOT EXISTS `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_uni_account`;
CREATE TABLE IF NOT EXISTS `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `ims_uni_account` (`uniacid`, `groupid`, `name`, `description`, `default_acid`, `rank`) VALUES
(1, 0, 'wesambo', '一个朝气蓬勃的团队', 1, NULL);

DROP TABLE IF EXISTS `ims_uni_account_group`;
CREATE TABLE IF NOT EXISTS `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_uni_account_menus`;
CREATE TABLE IF NOT EXISTS `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_uni_account_modules`;
CREATE TABLE IF NOT EXISTS `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

INSERT INTO `ims_uni_account_modules` (`id`, `uniacid`, `module`, `enabled`, `settings`) VALUES
(1, 1, 'basic', 1, ''),
(2, 1, 'news', 1, ''),
(3, 1, 'music', 1, ''),
(4, 1, 'userapi', 1, ''),
(5, 1, 'recharge', 1, ''),
(8, 1, 'ewei_shopv2', 1, '');

DROP TABLE IF EXISTS `ims_uni_account_users`;
CREATE TABLE IF NOT EXISTS `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_uni_group`;
CREATE TABLE IF NOT EXISTS `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(15000) NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `ims_uni_group` (`id`, `name`, `modules`, `templates`, `uniacid`) VALUES
(1, '体验套餐服务', 'a:1:{i:0;s:11:"ewei_shopv2";}', 'N;', 0);

DROP TABLE IF EXISTS `ims_uni_settings`;
CREATE TABLE IF NOT EXISTS `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `shortcuts` varchar(5000) NOT NULL,
  `payment` varchar(2000) NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ims_uni_settings` (`uniacid`, `passport`, `oauth`, `jsauth_acid`, `uc`, `notify`, `creditnames`, `creditbehaviors`, `welcome`, `default`, `default_message`, `shortcuts`, `payment`, `stat`, `default_site`, `sync`, `recharge`, `tplnotice`, `grouplevel`, `mcplugin`, `exchange_enable`, `coupon_type`, `menuset`) VALUES
(1, 'a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}', 'a:2:{s:6:"status";s:1:"0";s:7:"account";s:1:"0";}', 0, 'a:1:{s:6:"status";i:0;}', 'a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}', 'a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', 'a:4:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";}s:6:"wechat";a:5:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}}', '', 1, 0, '', '', 0, '', 0, 0, '');

DROP TABLE IF EXISTS `ims_uni_verifycode`;
CREATE TABLE IF NOT EXISTS `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_userapi_cache`;
CREATE TABLE IF NOT EXISTS `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_userapi_reply`;
CREATE TABLE IF NOT EXISTS `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

INSERT INTO `ims_userapi_reply` (`id`, `rid`, `description`, `apiurl`, `token`, `default_text`, `cachetime`) VALUES
(1, 1, '"城市名+天气", 如: "北京天气"', 'weather.php', '', '', 0),
(2, 2, '"百科+查询内容" 或 "定义+查询内容", 如: "百科姚明", "定义自行车"', 'baike.php', '', '', 0),
(3, 3, '"@查询内容(中文或英文)"', 'translate.php', '', '', 0),
(4, 4, '"日历", "万年历", "黄历"或"几号"', 'calendar.php', '', '', 0),
(5, 5, '"新闻"', 'news.php', '', '', 0),
(6, 6, '"快递+单号", 如: "申通1200041125"', 'express.php', '', '', 0);

DROP TABLE IF EXISTS `ims_users`;
CREATE TABLE IF NOT EXISTS `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `ims_users` (`uid`, `groupid`, `username`, `password`, `salt`, `type`, `status`, `joindate`, `joinip`, `lastvisit`, `lastip`, `remark`, `starttime`, `endtime`) VALUES
(1, 0, 'admin', 'c49e8fafe1e1f0271403a221b2ab03b2cf4328b9', '316b6c24', 0, 0, 1468650810, '', 1495590679, '::1', '', 0, 0);

DROP TABLE IF EXISTS `ims_users_failed_login`;
CREATE TABLE IF NOT EXISTS `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

DROP TABLE IF EXISTS `ims_users_group`;
CREATE TABLE IF NOT EXISTS `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `ims_users_group` (`id`, `name`, `package`, `maxaccount`, `maxsubaccount`, `timelimit`) VALUES
(1, '体验用户组', 'a:1:{i:0;i:1;}', 1, 1, 0),
(2, '白金用户组', 'a:1:{i:0;i:1;}', 2, 2, 0),
(3, '黄金用户组', 'a:1:{i:0;i:1;}', 3, 3, 0);

DROP TABLE IF EXISTS `ims_users_invitation`;
CREATE TABLE IF NOT EXISTS `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_users_permission`;
CREATE TABLE IF NOT EXISTS `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_users_profile`;
CREATE TABLE IF NOT EXISTS `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_video_reply`;
CREATE TABLE IF NOT EXISTS `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_voice_reply`;
CREATE TABLE IF NOT EXISTS `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_wechat_attachment`;
CREATE TABLE IF NOT EXISTS `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_wechat_news`;
CREATE TABLE IF NOT EXISTS `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ims_wxcard_reply`;
CREATE TABLE IF NOT EXISTS `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
