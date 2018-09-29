<?php
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");
require_once '../../Config/conf.php';
/////////////

if (isset($_POST['PollPost'])) {

	$Q = $Mysql -> escapeString($_POST['QuestionID']);
	$A = $Mysql -> escapeString($_POST['AnswerID']);

	$sql = "update  px_poll_answer  set `hits`=(hits)+1 where `poll`='$Q' and `ID`='$A'  ";
	$Mysql -> Fetch($sql);
	$cookieName = "poll_" . $Q;
	setcookie($cookieName, $Q, time() + 2592000);

	$data = $Mysql -> Query("select * from `px_poll_question` where `active` = 'YES'   limit 1");
	$poll = $data[0];

	$poll_answer = $Mysql -> Query("select * from `px_poll_answer` where `poll` = '$poll[ID]' and `answer` !='' ");
	$total = array();
	if (is_array($poll_answer)) {
		foreach ($poll_answer as $key => $val) {
			$item = $Mysql -> Percent('px_poll_answer', $poll['ID'], $val['hits']);
			array_push($total, $item);
		}

	}
	//	print_r($total);
	//echo json_encode($total);
	//\\\\\\\\\\\\\\\\\////////////

	$arr = array('question' => $poll['question'], 'question_id' => $poll['ID'], 'show' => 'result');
	$CPoll = array('answer' => $poll_answer);
	$CPercent = array('percent' => $total);
	$datajson = array_merge($arr, $CPoll, $CPercent);

	echo json_encode($datajson);

}

/////////////////////////////////

if (isset($_GET['show_FORM'])) {

	$lenAll = $Mysql -> RowCount("px_poll_question", "  where  `active`='YES' ");
	if ($lenAll != 0) {
		$data = $Mysql -> Query("select * from `px_poll_question` where `active` = 'YES'   limit 1");
		$poll = $data[0];

		if (@isset($_COOKIE['poll_' . $poll['ID']])) {
			//show result

			$poll_answer = $Mysql -> Query("select * from `px_poll_answer` where `poll` = '$poll[ID]' and `answer` !='' ");
			$total = array();
			if (is_array($poll_answer)) {
				foreach ($poll_answer as $key => $val) {
					$item = $Mysql -> Percent('px_poll_answer', $poll['ID'], $val['hits']);
					array_push($total, $item);
				}

			}
			//	print_r($total);
			//echo json_encode($total);
			//\\\\\\\\\\\\\\\\\////////////

			$arr = array('question' => $poll['question'], 'question_id' => $poll['ID'], 'show' => 'result');
			$CPoll = array('answer' => $poll_answer);
			$CPercent = array('percent' => $total);
			$datajson = array_merge($arr, $CPoll, $CPercent);

			echo json_encode($datajson);

		} else {
			//show form
			$poll_answer = $Mysql -> Query("select * from `px_poll_answer` where `poll` = '$poll[ID]' and `answer` !='' ");

			$arr = array('question' => $poll['question'], 'question_id' => $poll['ID'], 'show' => 'form');
			$CPoll = array('answer' => $poll_answer);

			//get percent

			$datajson = array_merge($arr, $CPoll);

			echo json_encode($datajson);

		}

		//1
	}

}

ob_end_flush();
?>