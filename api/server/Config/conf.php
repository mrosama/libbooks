<?php

/**
 * @Osama Salama
 * @copyright 2015
 * @Email osama_eg@live.com
 */

//@global config
if (version_compare(PHP_VERSION, '5.0.0', '<')) {
	exit("<font color='red'>Sorry, Application will only run on PHP version 5 or greater!\n</font>");
}
//error_reporting(0);
// error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
//error_reporting(E_PARSE);

//********************************************************
//@global database
$MysqlConfig['Host'] = 'localhost';
//Database Host
$MysqlConfig['User'] = 'root';
//Database User Name
$MysqlConfig['DBname'] = 'books';
//Database Name
$MysqlConfig['Password'] = 'pass';
//Database Password
//********************************************************
 
define("PATH_UPLOAD","../../../../template/attach/upload/");
define("PATH_ADVERT","../../../../template/attach/adv/");


define ("EXT_IMG", serialize (array ("JPEG", "JPG", "GIF",'PNG')));
define ("EXT_FILE", serialize (array ("PDF", "ZIP", "DOC")));

 
require_once   '../../Classes/Class.Mysql.php';

//@Load Main Class
$Mysql = new Mysql($MysqlConfig['Host'], $MysqlConfig['User'], $MysqlConfig['Password'], $MysqlConfig['DBname']);

 

//********************************************************
//@Inital code here
?>
