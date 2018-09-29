<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';


if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_adv`  order by ID desc");
 
 if($data == false){
 	echo 'NOPAGES';
 } else {
 echo json_encode($data);	
 }
 

	
}

/////////////////////////////////////////////



//**********************************


if(isset($_POST['IDremove'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
	$data=$Mysql ->Query("select * from `px_adv` where `ID` in($in)  order by ID desc");
 
 if($data != false){
	foreach ($data as $key => $value) {
		//echo $value['img']."<br/>";
		 @unlink(PATH_ADVERT.$value['img']);
	}
 }
	
	
 $Mysql -> Fetch("delete  from `px_adv` where `ID` in($in) ");	
	
	
	
}

//////////////////////////////////////










if (isset($_POST['type'])) {
		$Mime_Img = unserialize(EXT_IMG);
 
										
	$name = @$Mysql -> escapeString(strip_tags($_POST['name']));
	$links = @$Mysql -> escapeString(strip_tags($_POST['links']));
	$max_w = @$Mysql -> escapeString(strip_tags($_POST['max_w']));
	$max_h = @$Mysql -> escapeString(strip_tags($_POST['max_h']));
	$cat = @$Mysql -> escapeString(strip_tags($_POST['cat']));
	 $Fileadvert ="";	 		
		///
		
		if (!isset($_FILES['UploadedFile0'])) {
			
		echo "MISSING_FILE";
	return FALSE;	
			
		} else {
			$fileEXE = $Mysql -> File_extension($_FILES["UploadedFile0"]["name"]);
			
				if (in_array(strtoupper($fileEXE), $Mime_Img)) {
					$Fileadvert = time() . '.' . $fileEXE;
			move_uploaded_file($_FILES["UploadedFile0"]["tmp_name"], PATH_ADVERT . $Fileadvert);
				} else {
					
 echo "MISSING_FILE_Extension";
	return FALSE;
				}
 }
		
		
	//
	
		$dataINS=array(
		'name' => $name,
		'links' => $links,
		'img' => $Fileadvert,
		'cat' => $cat,
		'max_w' => $max_w,
		'max_h' => $max_h
	 
		);
		
		$result = $Mysql ->insert('px_adv', $dataINS);
		if($result==true){
			 
			echo 'ADD_ADVERT';
		} else {
			echo 'ERROR_ADVERT';
		}
		
		
		
		
		
		
		
		
		
		
	
}






if(isset($_GET['edit'])){
	
$id   = $Mysql ->escapeString($_GET['id']);
	
	
$data=$Mysql ->Query("select * from `px_adv`   where `ID` = '$id'  ");
 
 if($data == false){
 	echo 'NOADVERT';
 } else {
 echo json_encode($data);	
 }



}

///////////////////////////////





if (isset($_POST['updateedit'])) {
		$Mime_Img = unserialize(EXT_IMG);
 
	$id = @$Mysql -> escapeString(strip_tags($_POST['id']));									
	$name = @$Mysql -> escapeString(strip_tags($_POST['name']));
	$links = @$Mysql -> escapeString(strip_tags($_POST['links']));
	$max_w = @$Mysql -> escapeString(strip_tags($_POST['max_w']));
	$max_h = @$Mysql -> escapeString(strip_tags($_POST['max_h']));
	$cat = @$Mysql -> escapeString(strip_tags($_POST['cat']));

    $Fileadvert_old = @$Mysql -> escapeString(strip_tags($_POST['img']));


if (isset($_FILES['UploadedFile0'])) {

$fileEXE = $Mysql -> File_extension($_FILES["UploadedFile0"]["name"]);
			
				if (in_array(strtoupper($fileEXE), $Mime_Img)) {
					$Fileadvert = time() . '.' . $fileEXE;
			move_uploaded_file($_FILES["UploadedFile0"]["tmp_name"], PATH_ADVERT . $Fileadvert);
				//unlink($Fileadvert_old);
				@unlink(PATH_ADVERT.$Fileadvert_old);
				} else {
					
 echo "MISSING_FILE_Extension";
	return FALSE;
				}



} else {
 $Fileadvert = 	$Fileadvert_old;
	
}





	$dataINS=array(
		'name' => $name,
		'links' => $links,
		'img' => $Fileadvert,
		'cat' => $cat,
		'max_w' => $max_w,
		'max_h' => $max_h
	 
		);
		
		$result = $Mysql ->update('px_adv', $dataINS,"where `ID` = '$id' ");
		if($result==true){
			 
			echo 'ADD_ADVERT';
		} else {
			echo 'ERROR_ADVERT';
		}
		




	
	
	//
}










?>