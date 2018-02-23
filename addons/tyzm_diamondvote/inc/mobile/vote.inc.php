<?php

defined('IN_IA') or die('Access Denied');
global $_W, $_GPC;
is_weixin();
$rid = intval($_GPC['rid']);
$id = intval($_GPC['id']);
$ty = intval($_GPC['ty']);
$userinfo = array();
$userinfo['nickname'] = $this->oauthuser['nickname'];
$userinfo['openid'] = $this->oauthuser['openid'];
$userinfo['avatar'] = $this->oauthuser['avatar'];
$userinfo['oauth_openid'] = $this->oauthuser['oauth_openid'];
$userinfo['follow'] = $this->oauthuser['follow'];
$votere = m('vote')->setvote($userinfo, $rid, $id, $_GPC['latitude'], $_GPC['longitude']);
die(json_encode($votere));