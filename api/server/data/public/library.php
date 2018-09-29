<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

 
require_once   '../../Config/conf.php';



if(isset($_GET['category'])){
$cat = 	 $Mysql ->escapeString($_GET['category']);
	
$data = $Mysql ->Query("select * from `px_cat` where `cat` ='$cat'  ");







 $total = array();
	if (is_array($data)) {
		
		foreach ($data as $key => $val) {
			
		 $total[]= $Mysql ->CatCount($val['ID']);
		   	
		}
		
		
	}
 
 
 /*
$arr = array();
$i =0;
		if (is_array($data)) {
			foreach ($data as $key => $val) {
				$arr[$i]['ID']=$val['ID'];
				$arr[$i]['cat']=$val['cat'];
				$arr[$i]['name']=$val['name'];
				$arr[$i]['total'] = $Mysql ->CatCount($val['ID']);
				$i++;
			}
			
		}
	*/
		
		
		
	
	
 $datajson= array('data' =>$data,'total' =>$total);
 //$datajson =$arr;

if($data == false){
	echo "NOCAT";
} else {
echo json_encode($datajson);
}
/*
*/










}
 
//---------------------------------------------------

if(isset($_GET['cat'])){
$cat = 	 $Mysql ->escapeString($_GET['cat']);
	
$data = $Mysql ->Query("select * from `px_books` where `cat` ='$cat' and `active` = 'YES'   ");
if($data == false){
	echo "NOBOOK";
} else {
echo json_encode($data);
}
 
}


//







if(isset($_GET['view'])){
$cat = 	 $Mysql ->escapeString($_GET['cats']);
$id = 	 $Mysql ->escapeString($_GET['ids']);
	
$data = $Mysql ->Query("select * from `px_books` where `cat` ='$cat' and `ID`='$id' and `active` = 'YES'   ");
if($data == false){
	echo "NOBOOK";
} else {
echo json_encode($data);
}
 
}


/////////////////////



if(isset($_GET['search'])){
	
$q =$Mysql ->escapeString($_GET['param']);	
	
	
$data = $Mysql ->Query("select * from `px_books` where `bookname` like '%{$q}%'  and `active` = 'YES'   ");
if($data == false){
	echo "NOBOOK";
} else {
echo json_encode($data);
}
	
	
	
}



















//---------------------------------------------------



if(isset($_GET['bread'])){
	$id =  $Mysql ->escapeString($_GET['bread']);
	if($id != 0){
	$data = $Mysql ->breadcrumb($id);
	echo json_encode($data);
	//print_r($data);
	}
}














?>