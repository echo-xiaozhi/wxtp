<?php
defined('IN_IA') or exit('Access Denied');
if ($do == 'online') {
	header('Location: http://baidu.com/gateway.php?referrer='.$_W['setting']['site']['key']);
	exit;
} elseif ($do == 'offline') {
	header('Location: http://baidu.com/gateway.php?referrer='.$_W['setting']['site']['key'].'&standalone=1');
	exit;
} else {
}
template('cloud/device');
