<?php
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';

//$Mysql -> download(PATH_UPLOAD.'1411285681.zip');

if(isset($_GET['param'])){
	$id =  $Mysql ->escapeString($_GET['param']);
	
	$data = $Mysql ->Query("select * from `px_books` where   `ID`='$id' and `active` = 'YES'   ");
if($data == false){
	echo "NOBOOK";
} else {
echo json_encode($data);
}
	
}











ob_end_flush();
?>