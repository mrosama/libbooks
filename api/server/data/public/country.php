<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';

 


 
$data=$Mysql ->Query("select * from `px_country` ");
echo json_encode($data);
	
 




?>