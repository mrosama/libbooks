<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';

$errors = array(); 
 
 
if( (isset($_POST['email'])) && (isset($_POST['password']))){
$email = $Mysql ->escapeString(strip_tags($_POST['email']));
$password = $Mysql ->escapeString(md5($_POST['password']));
$country = $Mysql ->escapeString(strip_tags($_POST['country'])); 
$gender = @$Mysql ->escapeString(strip_tags($_POST['gender']));
$FavSc = @$Mysql ->escapeString(strip_tags($_POST['FavSc']));
$FavIT = @$Mysql ->escapeString(strip_tags($_POST['FavIT']));
$FavAd = @$Mysql ->escapeString(strip_tags($_POST['FavAd']));
$FavPo = @$Mysql ->escapeString(strip_tags($_POST['FavPo']));
$FavHis = @$Mysql ->escapeString(strip_tags($_POST['FavHis']));
	//check 
	
	$len = $Mysql ->RowCount('px_members'," where `email` = '$email' ");
	if($len == 0){
		//
		$dataINS=array(
		'email' => $email,
		'password' => $password,
		'country' => $country,
		'gender' => $gender,
		'FavIT' => $FavIT,
		'FavAd' => $FavAd,
		'FavHis' => $FavHis,
		'FavPo' => $FavPo,
		'FavSc' => $FavSc);
		
		$result = $Mysql ->insert('px_members', $dataINS);
		if($result==true){
			//$errors['name']
			echo 'ADDUSER';
		} else {
			echo 'ERRORINSERT';
		}
		
		
		
	} else {
		
		echo 'EMAILERROR';
	}
	
	
	
	
}
else {
	
	echo 'ERROR';
}
 
 ?>