<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';

if(isset($_GET['msg'])){
$data=$Mysql ->Query("select * from `px_options` ");
echo json_encode($data);
}
 




if(isset($_GET['product'])){
$data=$Mysql ->Query("select * from `px_books` where `active` = 'YES' and `cover`!='' order by ID desc limit 6  ");
	
echo json_encode($data);
}














?>