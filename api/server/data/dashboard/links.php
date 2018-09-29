<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';


if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_website`  order by ID desc");
 
 if($data == false){
 	echo 'NOPAGES';
 } else {
 echo json_encode($data);	
 }
 

	
}

///////////////////////



if(isset($_POST['IDremove'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
$Mysql -> Fetch("delete  from `px_website` where `ID` in($in) ");	
	
}

///--------------------------------------------------------------------







if(isset($_POST['title'])){
	
	$website_name   = $Mysql ->escapeString($_POST['title']);
	$website_link   = $Mysql ->escapeString($_POST['link']);
	
	$dataINS=array(
	'website_name' =>$website_name ,
	'website_link ' =>$website_link
	);
	
	
	$result = $Mysql ->insert('px_website', $dataINS);
		if($result==true){
			 
			echo 'ADD_SITE';
		} else {
			echo 'ERROR_SITE';
		}
	
	
	
}
























?>