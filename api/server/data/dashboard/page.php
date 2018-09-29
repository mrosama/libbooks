<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';

if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_page`  order by ID desc");
 
 if($data == false){
 	echo 'NOPAGES';
 } else {
 echo json_encode($data);	
 }
 

	
}


//**********************************


if(isset($_POST['IDremove'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
$Mysql -> Fetch("delete  from `px_page` where `ID` in($in) ");	
	
	
	
}
/////////////////////////////////////////////////




if(isset($_POST['title'])){
	
	$title   = $Mysql ->escapeString($_POST['title']);
	$content = $Mysql ->escapeString($_POST['content']);
	
	$dataINS=array(
	'title' =>$title ,
	'content' =>$content
	);
	
	
	$result = $Mysql ->insert('px_page', $dataINS);
		if($result==true){
			 
			echo 'ADD_PAGE';
		} else {
			echo 'ERROR_PAGE';
		}
	
	
	
}



////////////////////


if(isset($_GET['edit'])){
	
$id   = $Mysql ->escapeString($_GET['id']);
	
	
$data=$Mysql ->Query("select * from `px_page`   where `ID` = '$id'  ");
 
 if($data == false){
 	echo 'NOPAGES';
 } else {
 echo json_encode($data);	
 }
 
	
	
}


//--------------------------


if(isset($_POST['edit'])){
	$id   = $Mysql ->escapeString($_POST['id']);
	$title   = $Mysql ->escapeString($_POST['title_edit']);
	$content = $Mysql ->escapeString($_POST['content_edit']);
	
	$dataINS=array(
	'title' =>$title ,
	'content' =>$content
	);
	
	
	$result = $Mysql ->update('px_page', $dataINS , "  where `ID` ='$id' ");
		if($result==true){
			 
			echo 'EDIT_PAGE';
		} else {
			echo 'ERROR_PAGE';
		}
	
	
	
}



















?>