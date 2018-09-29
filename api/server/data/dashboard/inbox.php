<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';


if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_message`  order by ID desc");
 
 if($data == false){
 	echo 'NOPAGES';
 } else {
 echo json_encode($data);	
 }
 

	
}


if(isset($_GET['edit'])){
	
$id   = $Mysql ->escapeString($_GET['id']);
	
 
	
 $Mysql->Fetch("update  `px_message` set `read` = '1' where `ID` = '$id' ");
	 
	
	
$data=$Mysql ->Query("select * from `px_message`   where `ID` = '$id'  ");
 
 if($data == false){
 	echo 'NOPAGES';
 } else {
 echo json_encode($data);	
 }
 
	
	
}
////////////////////////


if(isset($_POST['send'])){
	
	   $to = $Mysql ->escapeString(strip_tags($_POST['email']));
		$subject = $Mysql ->escapeString(strip_tags($_POST['subject']));
			$msg = $Mysql ->escapeString( $_POST['message']);
				 
	
	@$Mysql ->Send_Email($to, $subject ,$msg); 
	
	
	echo "send";
	
	
 	
	
}


///////////////


if(isset($_POST['composer'])){
	
	   $to = $Mysql ->escapeString(strip_tags($_POST['email']));
		$subject = $Mysql ->escapeString(strip_tags($_POST['subject']));
			$msg = $Mysql ->escapeString( $_POST['message']);
				 
	
	@$Mysql ->Send_Email($to, $subject ,$msg); 
	
	
	echo "send";
	
	
 	
	
}











?>