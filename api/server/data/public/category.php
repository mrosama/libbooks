<?php
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';



if(isset($_GET['getCategory'])){
	
echo $Mysql -> MainCategory();
}








ob_end_flush();
?>