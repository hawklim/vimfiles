<?php
	include("include/global.php");
	$row=$art->get_row($id);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $row['title']?>-<?php echo $system['name']?></title>
<meta name="keywords" content="<?php echo $row['keywords']?>">
<meta name="description" content="<?php echo $row['smalltext']?>">
<link href="css/index.css" rel="stylesheet" type="text/css" />
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
		  <?php echo $art->art_list($row['cid'],10,32,0,0,2,0,0)?>
		  </ul>
	  </div>
      
		<div class="main_hit">
		  <div class="titles">
				<span>点击排行</span>
				<p></p>
		  </div>
		  <ul>
		  <?php echo $art->art_list($row['cid'],10,32,0,0,0,0,0)?>
		  </ul>
	  </div>      		
		
	</div>
	
  <div class="main_R">   
   <div class="path"><?php echo $art->art_path($row['id']);?></div>     
    <div class="zzcms_content">
       <?php $art->art_content($row['id']);?>
    </div>   
  </div>
</div>
<?php include("include/footer.php");?>