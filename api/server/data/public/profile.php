<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';

 
 
 
if( (isset($_POST['email'])) && (isset($_POST['password']))){
$ID = $Mysql ->escapeString($_POST['ID']);
$email = @$Mysql ->escapeString($_POST['email']);
$password = @$Mysql ->escapeString($_POST['password']);
$oldpassword = @$Mysql ->escapeString($_POST['oldpassword']);
$country = @$Mysql ->escapeString($_POST['country']); 
$gender = @$Mysql ->escapeString($_POST['gender']);
$FavSc = @$Mysql ->escapeString($_POST['FavSc']);
$FavIT = @$Mysql ->escapeString($_POST['FavIT']);
$FavAd = @$Mysql ->escapeString($_POST['FavAd']);
$FavPo = @$Mysql ->escapeString($_POST['FavPo']);
$FavHis = @$Mysql ->escapeString($_POST['FavHis']);
	//check 
	
	$len = $Mysql ->RowCount('px_members'," where `email` = '$email' and `ID` != '$ID' ");
	if($len == 0){
		
		if($password == $oldpassword ){
			$pass= $password;
		} else {
			$pass = md5($password);
		}
		
		
		//
		$dataINS=array(
		 
		'password' => $pass,
		'country' => $country,
		'gender' => $gender,
		'FavIT' => $FavIT,
		'FavAd' => $FavAd,
		'FavHis' => $FavHis,
		'FavPo' => $FavPo,
		'FavSc' => $FavSc);
		
		$result = $Mysql ->update('px_members', $dataINS ,"  where `ID` = '$ID' ");
		if($result==true){
			 
			echo 'UpdateUSER';
		} else {
			echo 'ERRORUPDATE';
		}
		
		
		
	} else {
		
		echo 'EMAILERROR';
	}
	
	
	
	
}
else {
	
	echo 'ERROR';
}
 
 ?>