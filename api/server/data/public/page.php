<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';

 


if(isset($_GET['id'])){
$id = intval($_GET['id']);
$id = $Mysql ->escapeString($id);
$data=$Mysql ->Query("select * from `px_page` where `ID`=$id ");
echo json_encode($data);
	
} else {
	
	return false;
}




?>