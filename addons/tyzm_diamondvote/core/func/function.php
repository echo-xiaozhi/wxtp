<?php

if (!defined('IN_IA')) {
	die('Access Denied');
}
function m($name = '')
{
	static $_modules = array();
	if (isset($_modules[$name])) {
		return $_modules[$name];
	}
	$model = TYZM_MODEL_MODEL . "/" . strtolower($name) . '.php';
	if (!is_file($model)) {
		die(' Model ' . $name . ' Not Found!');
	}
	require $model;
	$class_name = 'Tyzm_' . ucfirst($name);
	$_modules[$name] = new $class_name();
	return $_modules[$name];
}
function is_array2($array)
{
	if (is_array($array)) {
		foreach ($array as $k => $v) {
			return is_array($v);
		}
		return false;
	}
	return false;
}
function is_weixin()
{
	$useragent = addslashes($_SERVER['HTTP_USER_AGENT']);
	if (strpos($useragent, 'MicroMessenger') === false && strpos($useragent, 'Windows Phone') === false) {
		echo "请使用微信打开";
		die;
	}
}
function del_dir($dir)
{
	if (is_dir($dir)) {
		foreach (scandir($dir) as $row) {
			if ($row == '.' || $row == '..') {
				continue;
			}
			$path = $dir . '/' . $row;
			if (filetype($path) == 'dir') {
				del_dir($path);
			} else {
				unlink($path);
			}
		}
		rmdir($dir);
	} else {
		return false;
	}
}