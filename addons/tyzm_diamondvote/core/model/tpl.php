<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
} 
class Tyzm_Tpl{
	public function __construct() {
		global $_W;
	} 
	function tpl_input($value = array()) {
		foreach ($value as $row) {
			$js.='
			var '.$row['infotype'].'=$("*[name=\''.$row['infotype'].'\']").val();';
			if(!empty($row['notnull'])){
			$js.='	
			if('.$row['infotype'].'==""){dialog2("请输入'.$row['infoname'].'");return false;}';
			}
			switch($row['infotype']){
				case 'mobile':
					$html .= '<li><div class="tlt">'.$row['infoname'].'</div><div class="cont"><input name="'.$row['infotype'].'"  type="tel" placeholder="请输入'.$row['infoname'].'" class="tx"></div></li>';
					$js.='
					if(!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test(mobile))){dialog2("请输入正确的手机号码！");return false; } ';
				    break;
				case 'email':
					$html .= '<li><div class="tlt">'.$row['infoname'].'</div><div class="cont"><input name="'.$row['infotype'].'"  type="text" placeholder="请输入'.$row['infoname'].'" class="tx"></div></li>';
					$js.='if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){dialog2("请输入正确的电子邮箱！");return false; } ';
					break;
				case 'sex':
					$html .= '<li><div class="tlt">'.$row['infoname'].'</div><input name="'.$row['infotype'].'" type="radio" value="2" checked> 女　　<input name="'.$row['infotype'].'" type="radio" value="1" style="margin-left:5%"> 男</li>			';
					$js.='
					var '.$row['infotype'].'=$("input[name=\''.$row['infotype'].'\']:checked").val();';				
				    break;
				case 'bio':
				case 'interest':
					$html .= '<li><div class="tlt">'.$row['infoname'].'</div>
					<div class="cont">
						<textarea name="'.$row['infotype'].'" class="ta"  placeholder="请输入'.$row['infoname'].'"></textarea></div>
					</li>';
					 break;
				default:
				    $html .= '<li><div class="tlt">'.$row['infoname'].'</div><div class="cont"><input name="'.$row['infotype'].'"  type="text" placeholder="请输入'.$row['infoname'].'" class="tx"></div></li>';
					break;
			}
			
			$input.=$row['infotype'].":".$row['infotype'].",";
		}
		

		$res=array($html,$js,$input);
		return $res;
		
	}
	function tpl_inputweb($styp = array(),$value = array()) {
		foreach ($styp as $key =>$row){

			switch($row['infotype']){
				case 'sex':
				$html.='<div class="form-group">
					<label class="col-xs-12 col-sm-3 col-md-2 control-label"><span class="text-danger">*</span> '.$row["infoname"].'</label>
					<div class="col-sm-8 col-xs-12">
						<input type="text" class="form-control" name="join['.$row["infoname"].']" value="'.$value[$key]["val"].'"/>
						<span class="help-block">1为“女”，2为“男”</span>
					</div>
				</div>  ';
				
				 break;
				case 'bio':
				case 'interest':
				$html.='<div class="form-group">
					<label class="col-xs-12 col-sm-3 col-md-2 control-label"><span class="text-danger">*</span> '.$row["infoname"].'</label>
					<div class="col-sm-8 col-xs-12">
						<textarea name="join['.$row["infoname"].']" class="form-control js-a" cols="30" rows="2">'.$value[$key]["val"].'</textarea>
						<span class="help-block"></span>
					</div>
				   </div>  ';
				break;
				default:
				    $html.='<div class="form-group">
					<label class="col-xs-12 col-sm-3 col-md-2 control-label"><span class="text-danger">*</span> '.$row["infoname"].'</label>
					<div class="col-sm-8 col-xs-12">
						<input type="text" class="form-control" name="join['.$row["infoname"].']" value="'.$value[$key]["val"].'"/>
						<span class="help-block"></span>
					</div>
				   </div>  ';
					break;
				
			}
				
			
		}
		

		
		return $html;
		
	}
}