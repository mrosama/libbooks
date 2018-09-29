<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';

if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_options`  limit 1");
 
 if($data == false){
 	echo 'NOoptions';
 } else {
 echo json_encode($data);	
 }	
}
//////////////////////




if(isset($_POST['editmsg'])){
	$msg_title = @$Mysql ->escapeString($_POST['msg_title']); 
	$msg_content = @$Mysql ->escapeString($_POST['msg_content']); 
	
	$dataINS=array(
	'msg_title' =>$msg_title ,
	'msg_content' =>$msg_content
	);
	//get row count
	
$len =	$Mysql ->RowCount("px_options","  ");
	if($len!=0){
		//update
		
		$result = $Mysql ->update('px_options', $dataINS , "");
		
		
	} else {
		//insert
		$result = $Mysql ->insert('px_options', $dataINS , "");
	}
	
	 
	 	if($result==true){
	 		
			echo "UpdateOptions";
	 	}
	 
	 
	
}

///////////*************************************




if(isset($_POST['opemail'])){
	
	$mail_sendmail = @$Mysql ->escapeString($_POST['mail_sendmail']); 
	$mail_sender = @$Mysql ->escapeString($_POST['mail_sender']); 
	$mail_smtp = @$Mysql ->escapeString($_POST['mail_smtp']); 
	$email_received = @$Mysql ->escapeString($_POST['email_received']); 
	$mail_server = @$Mysql ->escapeString($_POST['mail_server']); 
	$mail_port = @$Mysql ->escapeString($_POST['mail_port']); 
	$mail_user = @$Mysql ->escapeString($_POST['mail_user']); 
	$mail_pwd = @$Mysql ->escapeString($_POST['mail_pwd']); 
	$mail_type = @$Mysql ->escapeString($_POST['mail_type']); 
	$mail_encryption = @$Mysql ->escapeString($_POST['mail_encryption']); 
 
	
		$dataINS=array(
	'mail_sendmail' =>$mail_sendmail ,
	'mail_sender' =>$mail_sender,
	'mail_smtp' =>$mail_smtp,
	'email_received' =>$email_received,
	'mail_server' =>$mail_server,
	'mail_port' =>$mail_port,
	'mail_user' =>$mail_user,
	'mail_pwd' =>$mail_pwd,
	'mail_type' =>$mail_type,
	'mail_encryption' =>$mail_encryption
	
	);
	//get row count
	
	
	
	
	
$len =	$Mysql ->RowCount("px_options","  ");
	if($len!=0){
		//update
		
		$result = $Mysql ->update('px_options', $dataINS , "");
		
		
	} else {
		//insert
		$result = $Mysql ->insert('px_options', $dataINS , "");
	}
	
	 
	 	if($result==true){
	 		
			echo "UpdateOptions";
	 	}
	
	
	
	
	
	
	
	
	
	
}





















?>