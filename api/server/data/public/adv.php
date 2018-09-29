<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once   '../../Config/conf.php';


if( isset($_GET['cat'])){
	$cat = $Mysql ->escapeString($_GET['cat']);
	$lenAll =$Mysql ->RowCount("px_adv","  where  `cat`='$cat' ");
	
	if($lenAll != 0 ){
	
//	
	
	$len =$Mysql ->RowCount("px_adv","  where `flag`=0 and `cat`='$cat'");
	
	if($len !=0 ){
		//found
		$data = $Mysql ->Query("select * from `px_adv` where `flag`=0 and `cat` = '$cat' order by RAND() limit 1");
		$rs=$data[0];
        $Mysql ->update("px_adv",array('flag'=>1)," where `ID`='$rs[ID]' ");  
				
	} else {
		//update
		$Mysql ->update("px_adv",array('flag'=>0)," where `cat`='$cat' ");
			$data = $Mysql ->Query("select * from `px_adv` where `flag`=0 and `cat` = '$cat' order by RAND() limit 1 ");
		$rs=$data[0];
	}
	
	//retrun advert
	if(!empty($rs["links"])){
		echo "<a href='$rs[links]'  target='_blank'><img src='template/attach/adv/$rs[img]' width='$rs[max_w]' height='$rs[max_h]' border=0></a>";
	} else {
	echo "<img src='template/attach/adv/$rs[img]' border=0 width='$rs[max_w]' height='$rs[max_h]'>";	
	}
	
	 
	
	}
	
	
	
}




//echo "<img src='template/attach/adv/1220277046.gif'>";
 
?>