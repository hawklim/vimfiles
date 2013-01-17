<?php
	include("../include/global.php");
	include("ZC_Check_admin.php");
	//添加连接
	if(isset($action)&&$action=='add'){
		$is_show=$is_top=0;
		$is_show=isset($_POST['is_show'])?1:0;
		$is_top=isset($_POST['is_top'])?1:0;
		$sql="insert into `".PRE."link`(`title`,`logo`,`url`,`is_top`,`is_show`) values('".$title."','".$pic."','".$url."',".$is_top.",".$is_show.")";
		$db->query($sql) or die (showmsg("添加友情连接出现错误"));	
		cache_table('link',$fields='*',false,'is_show=1','id');
		selectmsg('ZC_Link_Manager.php?action=add&tid=0','ZC_Link_List.php');		
	//修改连接
	}elseif(isset($action)&&$action=='modify'){
		$is_show=$is_top=0;
		$is_show=isset($_POST['is_show'])?1:0;
		$is_top=isset($_POST['is_top'])?1:0;
		$sql="update `".PRE."link` set `title`='$title',`logo`='$pic',`url`='$url',`is_show`=".$is_show.",`is_top`=".$is_top." where `id`=".intval($id);
		$db->query($sql) or die (showmsg("修改友情连接出现错误"));
		cache_table('link',$fields='*',false,'is_show=1','id');
		showmsg('修改成功！');
	
	//删除连接
	}else{
		$sql="delete from `".PRE."link` where `id`=".intval($id);
		$db->query($sql);
		cache_table('link',$fields='*',false,'is_show=1','id');
		showmsg('删除成功！','ZC_Link_List.php');
	}
?>
