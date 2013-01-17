<?php
	include("include/global.php");		
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META   HTTP-EQUIV="pragma"   CONTENT="no-cache">   
<META   HTTP-EQUIV="Cache-Control"   CONTENT="no-cache,   must-revalidate">   
<META   HTTP-EQUIV="expires"   CONTENT="0">  
<title>留言本-<?php echo $system['name']?></title>
<meta name="keywords" content="留言本">
<meta name="description" content="留言本">
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
        <!--
        function chk(theForm){
                if (theForm.name.value == ""){
                        alert("呢称不能为空");
                        theForm.name.focus();
                        return (false);
                }
                if (theForm.title.value == ""){
                        alert("标题不能为空");
                        theForm.title.focus();
                        return (false);
                }
				if (theForm.content.value == ""){
                        alert("内容不能为空");
                        theForm.content.focus();
                        return (false);
                }
        }
		function less_str(str){	
			return str.value.length < str.getAttribute("maxlength");
		}
		//-->
 </script>
</head>

<body>
<?php include("include/head.php");?>
<div class="main">
	<div class="main_L">
		
		<div class="main_new">
		  <div class="titles">
				<span>最新文章</span>
				<p></p>
		  </div>
		  <ul>
		  <?php echo $art->art_list($cid,10,32,0,0,2,0,0)?>
		  </ul>
	  </div>
      
		<div class="main_hit">
		  <div class="titles">
				<span>点击排行</span>
				<p></p>
		  </div>
		  <ul>
		  <?php echo $art->art_list($cid,10,32,0,0,0,0,0)?>
		  </ul>
	  </div>      		
		
	</div>
	
  <div class="main_R">     
    <div>
<?php
	if(isset($action)&&$action=='add'){
		$book->add_book();
	}else{
		$book->book_list(10);
	}
?>
<form id="form1" name="form1" method="post" action="Book.php?action=add" onSubmit="return chk(this)">
	<div class="b_book">
		<div class="b_title">
			<div class="b_left">您的呢称：</div>
			<div class="b_right"><input type="text" name="name" id="name" maxlength="10" />*</div>
		</div>
		<div class="b_title">
			<div class="b_left">您的主页：</div>
			<div class="b_right"><input type="text" name="url" id="url" maxlength="30"/></div>
		</div>
		<div class="b_title">
			<div class="b_left">您的QQ：</div>
			<div class="b_right"><input type="text" name="qq" id="qq" maxlength="11"/></div>
		</div>
		  <div class="b_title">
			<div class="b_left">您的Email：</div>
			<div class="b_right"><input type="text" name="email" id="email" maxlength="30"/></div>
		</div>
		 <div class="b_title">
			<div class="b_left">留言主题：</div>
			<div class="b_right"><input name="title" type="text" id="title" size="40" maxlength="60"/>*</div>
		</div>
		 <div class="b_title">
			<div class="b_left">验证码：</div>
			<div class="b_right"><input name="vercode" type="vercode" id="vercode" size="10" maxlength="4"/>&nbsp;&nbsp;&nbsp;<img src="include/ver.php" onclick="this.src='include/ver.php?id='+Math.random()*5;" alt="验证码,看不清楚?请点击刷新验证码"/>*</div>
		</div>
		 <div class="b_title">
			<div class="b_left">留言内容：</div>
			<div class="b_right"><textarea name="content" id="content" cols="45" rows="5" maxlength="200" onkeypress="return less_str(this);"></textarea>*</div>
		</div>
		<div class="b_title">
			<div class="b_left"></div>
			<div class="b_right">
				<input type="submit" name="button" id="button" value="提交" />
				<input type="reset" name="button2" id="button2" value="重置" />
			</div>
		</div>
	</div>
</form>





    </div>   
  </div>
</div>
<?php include("include/footer.php");?>
