<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';


if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_members`  order by ID desc");
 
 if($data == false){
 	echo 'NODATA';
 } else {
 echo json_encode($data);	
 }
 

	
}

///////////////////////






if(isset($_POST['mytype'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
$Mysql -> Fetch("delete  from `px_members` where `ID` in($in) ");	
	
}

///--------------------------------------------------------------------


if(isset($_POST['myrole'])){
	$val= $Mysql ->escapeString($_POST['val']);
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
$Mysql -> Fetch("update   `px_members` set `Admin` ='$val'  where `ID` in($in) ");	
	
}


if(isset($_POST['register'])){
			
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
$admin = @$Mysql ->escapeString(strip_tags($_POST['admin']));

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
		'FavSc' => $FavSc,
		'admin'=>$admin);
		
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
}

//



if(isset($_GET['getdatauser'])){
	$id = $Mysql ->escapeString(strip_tags($_GET['id']));
	$data=$Mysql ->Query("select * from `px_members`   where `ID` = '$id' ");
 
 if($data == false){
 	echo 'NODATA';
 } else {
 echo json_encode($data);	
 }
 

	
}

///////////////////////





if(isset($_POST['edituser'])){
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
	$admin = @$Mysql ->escapeString($_POST['admin']);	
	
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
		'FavSc' => $FavSc,
		'admin' =>$admin
		);
		
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
	
}











?>