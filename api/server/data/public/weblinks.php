<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';

$data=$Mysql ->Query("select * from px_website");
//var_dump($data);
echo json_encode($data);

?>