<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';

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































/* move_uploaded_file($_FILES["UploadedFile0"]["tmp_name"],$path . $_FILES["UploadedFile0"]["name"]);

 move_uploaded_file($_FILES["UploadedFile1"]["tmp_name"],$path . $_FILES["UploadedFile1"]["name"]);

 print_r($_POST);

 echo $_POST['authorname']. "----------";
 */
?>