<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';

if (isset($_GET['list'])) {
	$data = $Mysql -> Query("select * from `px_poll_question`  order by ID desc");

	if ($data == false) {
		echo 'NOPAGES';
	} else {
		echo json_encode($data);
	}

}

///

if (isset($_GET['active'])) {

	$ID = $Mysql -> escapeString($_GET['s']);
	$Mysql -> Fetch("update    `px_poll_question` set `active`='NO' ");
	$Mysql -> Fetch("update    `px_poll_question` set `active`='YES' where `ID` = '$ID' ");

}

///

if (isset($_POST['IDremove'])) {
	$ID = $Mysql -> escapeString($_POST['IDremove']);

	$ID = explode('-', $ID);
	$in = implode($ID, ',');
	//print_r($ID);
	//echo $R ;

	$Mysql -> Fetch("delete  from `px_poll_answer` where `poll` in($in) ");

	$Mysql -> Fetch("delete  from `px_poll_question` where `ID` in($in) ");

}
/////////////////////////////////////////////////

if (isset($_POST['add'])) {

	$q1 = @$Mysql -> escapeString($_POST['q1']);
	$a1 = @$Mysql -> escapeString($_POST['a1']);
	$a2 = @$Mysql -> escapeString($_POST['a2']);
	$a3 = @$Mysql -> escapeString($_POST['a3']);
	$a4 = @$Mysql -> escapeString($_POST['a4']);
	$a5 = @$Mysql -> escapeString($_POST['a5']);

	////////////////////////////////////////////////////

	$dataINS = array('question' => $q1);
	$result = $Mysql -> insert('px_poll_question', $dataINS);
	$ids = $Mysql -> getId();
	/////////////////////////

	//for($i=1;$i<6;$i++){
	@$Mysql -> Fetch("insert into `px_poll_answer`(`answer`,`poll`) values('$a1','" . $ids . "') ");
	@$Mysql -> Fetch("insert into `px_poll_answer`(`answer`,`poll`) values('$a2','" . $ids . "') ");
	@$Mysql -> Fetch("insert into `px_poll_answer`(`answer`,`poll`) values('$a3','" . $ids . "') ");
	@$Mysql -> Fetch("insert into `px_poll_answer`(`answer`,`poll`) values('$a4','" . $ids . "') ");
	@$Mysql -> Fetch("insert into `px_poll_answer`(`answer`,`poll`) values('$a5','" . $ids . "') ");
	//}

	echo "add";

}

//////////////////////////

if (isset($_GET['edit'])) {

	$id = $Mysql -> escapeString($_GET['id']);

	$data = $Mysql -> Query("select * from `px_poll_question`   where `ID` = '$id'  ");

	$data2 = $Mysql -> Query("select * from `px_poll_answer`   where `poll` = '$id'  ");
	$me = array('q' => $data, 'a' => $data2);
	if ($data == false) {
		echo 'NOPAGES';
	} else {
		echo json_encode($me);
	}

}

/////

if (isset($_POST['update'])) {

	$Myval = array();
	$id = $Mysql -> escapeString($_POST['id']);
	$q1 = $Mysql -> escapeString($_POST['q1']);
	$a1 = @$Mysql -> escapeString($_POST['a1']);
	$a2 = @$Mysql -> escapeString($_POST['a2']);
	$a3 = @$Mysql -> escapeString($_POST['a3']);
	$a4 = @$Mysql -> escapeString($_POST['a4']);
	$a5 = @$Mysql -> escapeString($_POST['a5']);

	array_push($Myval, $a1);
	array_push($Myval, $a2);
	array_push($Myval, $a3);
	array_push($Myval, $a4);
	array_push($Myval, $a5);

	$arr_answer = $_POST['ida'];

	$Mysql -> Fetch("update `px_poll_question` set `question` ='$q1' where `ID`='$id' ");

	$len = count($arr_answer);

	for ($i = 0; $i < $len; $i++) {
		$s = $arr_answer[$i]['ID'];

		$Mysql -> Fetch("update   `px_poll_answer` set `answer`='$Myval[$i]' where `ID`='$s' and `poll`='$id'  ");

	}

}
?>
