<?php
ob_start();
session_start();
session_regenerate_id(true);
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';

if (isset($_POST['user']) && isset($_POST['pass'])) {
 
	$username = $Mysql -> escapeString($_POST['user']);
	$password = md5($Mysql -> escapeString($_POST['pass']));

	$len = $Mysql -> RowCount("px_members", "  where `email` = '$username' and `password` = '$password'   ");
 
	if ($len != 0) {
		//found return data

		$data = $Mysql -> Query(" select * from `px_members`   where `email` = '$username' and `password` = '$password'   ");

		$userInfo = $data[0];


		$result = array('login' => 'success', 'data' => $userInfo);
	 	 $_SESSION['Login'] = $result;
		 session_regenerate_id(true);
		echo json_encode($result);

	} else {
		$result = array('login' => 'failed');

		echo json_encode($result);

	}

} else  {
	
}

///////////////////

if (isset($_GET['connection'])) {

	if (isset($_SESSION['Login'])) {

		echo json_encode($_SESSION['Login']);
	}

}

//////////////////////////////////////////

if (isset($_GET['logout'])) {

	session_unset();
	session_destroy();
	$_SESSION = array();
	$result = array('login' => 'logout');
	echo json_encode($result);

}

ob_end_flush();
?>