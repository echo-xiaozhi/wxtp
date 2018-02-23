<?php
pdo_query("

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_count`;
CREATE TABLE `ims_tyzm_diamondvote_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pv_total` int(1) NOT NULL,
  `share_total` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_fansdata`;
CREATE TABLE `ims_tyzm_diamondvote_fansdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(50) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_openid` (`openid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_friendship`;
CREATE TABLE `ims_tyzm_diamondvote_friendship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `eventrule` mediumtext,
  `config` mediumtext,
  `packata` mediumtext,
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_gift`;
CREATE TABLE `ims_tyzm_diamondvote_gift` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `ptid` varchar(128) NOT NULL,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `paytype` varchar(30) NOT NULL,
  `uniontid` varchar(30) NOT NULL,
  `oauth_openid` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL,
  `gifttitle` varchar(8) DEFAULT '0',
  `gifticon` varchar(255) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `giftvote` varchar(50) NOT NULL,
  `ispay` int(1) NOT NULL,
  `isdeal` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_tid` (`tid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_ptid` (`ptid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_looklist`;
CREATE TABLE `ims_tyzm_diamondvote_looklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `oauth_openid` varchar(50) NOT NULL,
  `user_ip` varchar(15) NOT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_redpack`;
CREATE TABLE `ims_tyzm_diamondvote_redpack` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `unionid` varchar(50) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL,
  `mch_billno` varchar(28) DEFAULT '',
  `total_amount` int(10) DEFAULT '0',
  `total_num` int(3) NOT NULL,
  `client_ip` varchar(15) NOT NULL,
  `send_time` varchar(14) DEFAULT '0',
  `send_listid` varchar(32) DEFAULT '0',
  `return_data` text,
  `return_code` varchar(16) NOT NULL,
  `return_msg` varchar(256) NOT NULL,
  `result_code` varchar(16) NOT NULL,
  `err_code` varchar(32) NOT NULL,
  `err_code_des` varchar(128) NOT NULL,
  `rewards` varchar(20) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_reply`;
CREATE TABLE `ims_tyzm_diamondvote_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `starttime` int(10) DEFAULT '0',
  `endtime` int(10) DEFAULT '0',
  `apstarttime` int(10) DEFAULT '0',
  `apendtime` int(10) DEFAULT '0',
  `votestarttime` int(10) DEFAULT '0',
  `voteendtime` int(10) DEFAULT '0',
  `topimg` varchar(255) DEFAULT '',
  `bgcolor` varchar(255) DEFAULT '',
  `style` varchar(255) DEFAULT '',
  `infomsg` mediumtext,
  `eventrule` mediumtext,
  `prizemsg` mediumtext,
  `endintro` mediumtext,
  `config` mediumtext,
  `addata` mediumtext,
  `giftdata` mediumtext NOT NULL,
  `bill_data` mediumtext NOT NULL,
  `applydata` mediumtext NOT NULL,
  `area` varchar(100) DEFAULT '0',
  `shareimg` varchar(255) DEFAULT '',
  `sharetitle` varchar(100) DEFAULT '',
  `sharedesc` varchar(300) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_viporder`;
CREATE TABLE `ims_tyzm_diamondvote_viporder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `ptid` varchar(128) NOT NULL,
  `uniacid` int(11) DEFAULT '0',
  `uniontid` varchar(30) NOT NULL,
  `paytype` varchar(10) NOT NULL,
  `oauth_openid` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL,
  `packname` varchar(8) DEFAULT '0',
  `packicon` varchar(255) NOT NULL,
  `packtime` varchar(255) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `packnum` varchar(50) NOT NULL,
  `ispay` int(1) NOT NULL,
  `isdeal` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_tid` (`tid`),
  KEY `indx_ptid` (`ptid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_votedata`;
CREATE TABLE `ims_tyzm_diamondvote_votedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `oauth_openid` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL,
  `votetype` tinyint(1) DEFAULT '0',
  `reward` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_tid` (`tid`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ims_tyzm_diamondvote_voteuser`;
CREATE TABLE `ims_tyzm_diamondvote_voteuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `noid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `oauth_openid` varchar(50) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `img1` varchar(255) DEFAULT '',
  `img2` varchar(255) DEFAULT '',
  `img3` varchar(255) DEFAULT '',
  `img4` varchar(255) DEFAULT '',
  `img5` varchar(255) DEFAULT '',
  `details` mediumtext,
  `joindata` mediumtext NOT NULL,
  `formatdata` mediumtext,
  `votenum` int(255) DEFAULT '0',
  `giftcount` decimal(10,2) NOT NULL,
  `vheat` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `locktime` int(10) DEFAULT '0',
  `attestation` tinyint(1) DEFAULT '0',
  `atmsg` varchar(255) NOT NULL DEFAULT '',
  `lastvotetime` int(10) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rid` (`rid`),
  KEY `indx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

");