<?php
/**
 * 钻石投票-详情
 *
 * @author 微上宝科技
 * @url http://wesambo.taobao.com
 */

defined('IN_IA') or exit('Access Denied');
global $_W,$_GPC;
is_weixin();
load()->func('communication');
$uniacid = intval($_W['uniacid']);
$rid=intval($_GPC['rid']);
$id=intval($_GPC['id']);
$openid=$this->oauthuser['openid'];
$oauth_openid=$this->oauthuser['oauth_openid'];


$reply = pdo_fetch("SELECT rid,title,sharedesc,description,config,addata,applydata,endtime,status FROM " . tablename($this->tablereply) . " WHERE rid = :rid ", array(':rid' => $rid));
$reply=array_merge ($reply,@unserialize($reply['config']));unset($reply['config']);


$addata=@unserialize($reply['addata']);	
if($_W['ispost']){
	$nowpage=$_GPC['limit'];
	$pindex = max(1, intval($nowpage));
	$psize = 10;	
	$list = pdo_fetchall("SELECT * FROM " . tablename($this->tablegift) . " WHERE tid = :tid AND ispay=1 ORDER BY `id` DESC LIMIT ".($pindex-1) * $psize.','.$psize,array(':tid' => $id));
	if (!empty($list)){
		foreach ($list as $key => $value) {
			$list[$key]['avatar']=tomedia($value['avatar']);
			if(empty($reply['isdiamondnone'])){
				$list[$key]['cont']=htmlspecialchars($value['nickname']."，给TA送了".$value['gifttitle']."！");
			}else{
				$list[$key]['avatar']=MODULE_URL."/template/static/images/niming.jpg";
				$list[$key]['cont']=htmlspecialchars("微信用户，给TA送了".$value['gifttitle']."！");
			}
			$list[$key]['createtime']=date("Y-m-d H:i:s",$value['createtime']);
		}
		$sta =200;
	}else{
		$sta =-103;
	}
	exit(json_encode(array('status' => $sta, 'content' => $list)));
}




$voteuser = pdo_fetch("SELECT * FROM " . tablename($this->tablevoteuser) . " WHERE rid = :rid AND  id = :id ", array(':rid' => $rid,':id' => $id));
$voteuser["img1"]=tomedia($voteuser["img1"]);
$voteuser["img2"]=tomedia($voteuser["img2"]);
$voteuser["img3"]=tomedia($voteuser["img3"]);
$voteuser["img4"]=tomedia($voteuser["img4"]);
$voteuser["img5"]=tomedia($voteuser["img5"]);



$pvtotal=pdo_fetch("SELECT pv_total FROM ".tablename($this->tablecount)." WHERE tid = :tid AND rid = :rid ", array(':tid' => $id,':rid' => $rid));
if(empty($pvtotal)){
	$pvtotal['pv_total']=0;
}
$pvtotal['pv_total']=$pvtotal['pv_total']+$voteuser['vheat'];
if($voteuser['openid']!=$this->oauthuser['openid']){
	$myvoteuser = pdo_fetch("SELECT id FROM " . tablename($this->tablevoteuser) . " WHERE rid = :rid AND  openid = :openid ", array(':rid' => $rid,':openid' => $openid));
	if(!empty($myvoteuser)){
		$myvoteid=$myvoteuser['id']; 
	}
}


$reply['giftscale']=$reply['giftscale']?$reply['giftscale']:1;
$reply['giftunit']=$reply['giftunit']?$reply['giftunit']:"点";
$_share['title'] ="我是".$voteuser['name'].",编号".$voteuser['noid'].",正在参加".$reply['title']."活动。";
$_share['imgUrl'] =$voteuser["img1"];
$_share['desc'] =!empty($reply['sharedesc'])?$reply['sharedesc']:$reply['description'];
$_W['page']['sitename']="我是".$voteuser['name'].",编号".$voteuser['noid'].",正在参加".$reply['title']."活动，来帮我投一票吧。";

if(!empty($reply['isfriendship'])){
	$packnum=pdo_fetchcolumn("SELECT sum(packnum) FROM ".tablename($this->tableviporder)." WHERE oauth_openid = :oauth_openid AND ispay=1 AND packtime>".TIMESTAMP, array(':oauth_openid' => $oauth_openid));
	$looknumt=pdo_fetchcolumn("SELECT COUNT(id) FROM ".tablename($this->tablelooklist)." WHERE oauth_openid = :oauth_openid ", array(':oauth_openid' => $oauth_openid));
	$packnum=$packnum-$looknumt;
	
	$lookinfo = pdo_fetch("SELECT id FROM " . tablename($this->tablelooklist) . " WHERE oauth_openid = :oauth_openid AND rid = :rid AND  tid = :tid", array(':oauth_openid' => $oauth_openid,':rid' =>$rid,':tid' =>$id));
	$applydata=@unserialize($reply['applydata']);
	$joindata=@unserialize($voteuser['joindata']);

	$friends=array();
	foreach ($applydata as $key=> $row) {
		if($row['isshow']){
			$friends[$key]=$joindata[$key];
		}
	}
}

include $this->template('view');



