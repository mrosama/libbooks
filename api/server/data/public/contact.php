<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once   '../../Config/conf.php';

if( (isset($_POST['user_name'])) && (isset($_POST['user_email']))){
	
	$user_name = $Mysql ->escapeString(strip_tags($_POST['user_name']));
	$user_email = $Mysql ->escapeString(strip_tags($_POST['user_email']));
	$user_title= $Mysql ->escapeString(strip_tags($_POST['user_title']));
	$user_msg = $Mysql ->escapeString(strip_tags($_POST['user_msg']));
	 
	
		$dataINS=array(
		'name' => $user_name,
		'email' => $user_email,
		'title' => $user_title,
		'message' => $user_msg,
		'message_dat' => date('Y-m-d h:h:s')
		 );
		
		//get Config
		
		$Confing = $Mysql ->get_Options();
		 
		
		$result = $Mysql ->insert('px_message', $dataINS);
		if($result==true){
			 
	
			 
			echo 'ADD';
			@$Mysql ->Send_Email($Confing["email_received"],'باعت بريد','لديك رسالة بريدية واردة ألان...'); 
		} else {
			echo 'ERRORR';
		}
		
		
		
	
	
	
}
 
	else {
		
		echo 'ERRORR';
	}
	
 



?>