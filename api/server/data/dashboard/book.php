<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';



if(isset($_GET['list'])){
	$data=$Mysql ->Query("select * from `px_books`  order by ID desc");
 
 if($data == false){
 	echo 'NODATA';
 } else {
 echo json_encode($data);	
 }
 

	
}

/////////////////////////////////////////////



//**********************************


if(isset($_POST['delbook'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
	$data=$Mysql ->Query("select * from `px_books` where `ID` in($in)  order by ID desc");
 
 if($data != false){
	foreach ($data as $key => $value) {
		//echo $value['img']."<br/>";
		 @unlink(PATH_UPLOAD.$value['filename']);
		  @unlink(PATH_UPLOAD.$value['cover']);
	}
 }
	
	
 $Mysql -> Fetch("delete  from `px_books` where `ID` in($in) ");	
	
	
	
}

//////////////////////////////////////





//**********************************


if(isset($_POST['activebook'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
 
	
	
 $Mysql -> Fetch("update   `px_books`   set `active`='YES'  where `ID` in($in) ");	
	
	
	
}






//**********************************


if(isset($_POST['deactivebook'])){
$ID = $Mysql ->escapeString($_POST['IDremove']); 	
	
$ID= explode('-', $ID);
$in = implode($ID, ',');
//print_r($ID);
 //echo $R ;	
	
 
	
	
 $Mysql -> Fetch("update   `px_books`  set `active`='NO'  where `ID` in($in) ");	
	
	
	
}


//////////////////


if(isset($_GET['getCategory'])){
	
echo $Mysql -> MainCategory();
}

////////


function CheckInput($n) {
	if (!isset($_POST["$n"])) {

		echo "MISSING_INPUT";
		return false;
	}
}

$Mime_Img = unserialize(EXT_IMG);
$Mime_File = unserialize(EXT_FILE);

if (isset($_POST['type'])) {

	$DefaultInput = array('bookname', 'bookdesc', 'author', 'authoremail', 'cat');

	array_map("CheckInput", $DefaultInput);

	//----------------------------------------------------------------------------------------

	$bookname = $Mysql -> escapeString(strip_tags($_POST['bookname']));
	$bookdesc = $Mysql -> escapeString(strip_tags($_POST['bookdesc']));
	$author = $Mysql -> escapeString(strip_tags($_POST['author']));
	$authoremail = $Mysql -> escapeString(strip_tags($_POST['authoremail']));
	$cat = $Mysql -> escapeString(strip_tags($_POST['cat']));
	$Cover = "";
    $FileBook ="";
	$size="";
	$dat = date("Y-m-d h:i:s");


if (!isset($_FILES['UploadedFile0'])) {
	
	echo "MISSING_FILE";
	return FALSE;
} else{
	$fileEXE = $Mysql -> File_extension($_FILES["UploadedFile0"]["name"]);
	
	if (in_array(strtoupper($fileEXE), $Mime_File)) {
		$FileBook = time() . '.' . $fileEXE;
		
		move_uploaded_file($_FILES["UploadedFile0"]["tmp_name"], PATH_UPLOAD . $FileBook);
		$size = @$Mysql ->FormatSize(filesize(PATH_UPLOAD . $FileBook));
	} else {
		
		echo "MISSING_FILE_Extension";
	return FALSE;
	}
	
	
}







	if (isset($_FILES['UploadedFile1'])) {

		$fileEXE = $Mysql -> File_extension($_FILES["UploadedFile1"]["name"]);

		if (in_array(strtoupper($fileEXE), $Mime_Img)) {
			$FileImage = time() . '.' . $fileEXE;
			move_uploaded_file($_FILES["UploadedFile1"]["tmp_name"], PATH_UPLOAD . $FileImage);
			$Mysql ->ImageSize(PATH_UPLOAD . $FileImage ,PATH_UPLOAD . $FileImage,128,190);
			
			$Cover = $FileImage;
		} else {
			$Cover = "";
		}

	} else {

		$Cover = "";
	}

	//------------------------------------------------------------------------------
	
	
	$dataINS=array(
		'bookname' => $bookname,
		'bookdesc' => $bookdesc,
		'author' => $author,
		'authoremail' => $authoremail,
		'cat' => $cat,
		'filename' => $FileBook,
		'cover' => $Cover,
		'dat' => $dat,
		'size' => $size
		
		);
		
		$result = $Mysql ->insert('px_books', $dataINS);
		if($result==true){
			 
			echo 'ADD_BOOK';
		} else {
			echo 'ERROR_BOOK';
		}
	
	 
 
}
 
///


if(isset($_GET['getbook'])){
	
$id   = $Mysql ->escapeString($_GET['id']);
	
	
$data=$Mysql ->Query("select * from `px_books`   where `ID` = '$id'  ");
 
 if($data == false){
 	echo 'NOBOOK';
 } else {
 echo json_encode($data);	
 }



}

//////////////////////////////////

if(isset($_POST['upedit'])){
	
    $DefaultInput = array('bookname', 'bookdesc', 'author', 'authoremail', 'cat');

	array_map("CheckInput", $DefaultInput);
	$id = $Mysql -> escapeString(strip_tags($_POST['id']));
	$bookname =     $Mysql -> escapeString(strip_tags($_POST['bookname']));
	$bookdesc =     $Mysql -> escapeString(strip_tags($_POST['bookdesc']));
	$author   =     $Mysql -> escapeString(strip_tags($_POST['author']));
	$authoremail =  $Mysql -> escapeString(strip_tags($_POST['authoremail']));
	$cat =          $Mysql -> escapeString(strip_tags($_POST['cat']));
	$Cover_old =  $Mysql -> escapeString(strip_tags($_POST['img_old']));;
    $FileBook_old =  $Mysql -> escapeString(strip_tags($_POST['file_old']));;
	$size =  $Mysql -> escapeString(strip_tags($_POST['file_size']));;
	 
	
	if (isset($_FILES['UploadedFile1'])) {
		$fileEXE = $Mysql -> File_extension($_FILES["UploadedFile1"]["name"]);
		if (in_array(strtoupper($fileEXE), $Mime_Img)) {
			$FileImage = time() . '.' . $fileEXE;
			move_uploaded_file($_FILES["UploadedFile1"]["tmp_name"], PATH_UPLOAD . $FileImage);
			$Mysql ->ImageSize(PATH_UPLOAD . $FileImage ,PATH_UPLOAD . $FileImage,128,190);
				@unlink(PATH_UPLOAD.$Cover_old);
			$Cover = $FileImage;
		} else {
			$Cover = $Cover_old ;
		}
		
		
	} else {
	$Cover = $Cover_old;	
	}
	
	
	///
	
	if (isset($_FILES['UploadedFile0'])) {
		$fileEXE = $Mysql -> File_extension($_FILES["UploadedFile0"]["name"]);
		
		
	if (in_array(strtoupper($fileEXE), $Mime_File)) {
		$FileBook = time() . '.' . $fileEXE;
		
		move_uploaded_file($_FILES["UploadedFile0"]["tmp_name"], PATH_UPLOAD . $FileBook);
		$size = @$Mysql ->FormatSize(filesize(PATH_UPLOAD . $FileBook));
		@unlink(PATH_UPLOAD.$FileBook);
	} else {
	$FileBook = $FileBook_old; 	
	}
		
		
	} else {
			$FileBook = $FileBook_old; 	
	}
	
	///
	
	
	
	
	$dataINS=array(
		'bookname' => $bookname,
		'bookdesc' => $bookdesc,
		'author' => $author,
		'authoremail' => $authoremail,
		'cat' => $cat,
		'filename' => $FileBook,
		'cover' => $Cover,
	 
		'size' => $size
		
		);
		
		$result = $Mysql ->update('px_books', $dataINS,"  where `ID` = '$id' ");
		if($result==true){
			 
			echo 'ADD_BOOK';
		} else {
			echo 'ERROR_BOOK';
		}
	
	
	
	
	
	//
	
}

/////////////////











if(isset($_GET['adminCategory'])){
	
echo $Mysql -> MainCategory_Admin();
}

////////



if(isset($_POST['newcat'])){
	
$name =     $Mysql -> escapeString(strip_tags($_POST['cattitle']));
$cat =     $Mysql -> escapeString(strip_tags($_POST['cat']));	
	
		
$data=$Mysql ->Query("select * from `px_cat`   where `ID` = '$cat'  ");
 
 if($data != false){
     $level= $data[0]['level'];
    }
	
if($cat==0){
$lev = 0;
}	
else {
$lev = $level+1;
}
///	
	
	
	
	$dataINS=array(
		'name' => $name,
		'cat' => $cat,
		'level' => $lev
          );
	
	
	
		$result = $Mysql ->insert('px_cat', $dataINS);
		if($result==true){
			 
			echo 'ADD_CAT';
		} else {
			echo 'ERROR_CAT';
		}
	
	
	
	
//	
	
}





///


if(isset($_POST['delcats'])){
	$cat =     $Mysql -> escapeString(strip_tags($_POST['id']));	
	
	 @$Mysql -> Fetch("delete  from `px_cat` where `ID` ='$cat' ");
	 echo "delete";	
}

///////////////



if(isset($_GET['editcats'])){
	$cat =     $Mysql -> escapeString(strip_tags($_GET['id']));	
	$data=$Mysql ->Query("select * from `px_cat`  where `ID` = '$cat'  ");
 
 if($data == false){
 	echo 'NODATA';
 } else {
 echo json_encode($data);	
 }
 

	
}

//



if(isset($_POST['editmycat'])){
	
	$id = $Mysql -> escapeString(strip_tags($_POST['id']));	
	$name = $Mysql -> escapeString(strip_tags($_POST['cattitle']));
	$dataINS=array(
		'name' => $name
 );
		
		$result = $Mysql ->update('px_cat', $dataINS,"where `ID` = '$id' ");
		if($result==true){
			 
			echo 'ADD';
		} else {
			echo 'Error';
		}
		
	
	
	
		
	
}














?>