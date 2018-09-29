<?php
include_once 'mailer/PHPMailerAutoload.php';

Class Mysql {

	protected $Adapter;

	public function __construct($Host, $UserDb, $PassDb, $Dbname) {

		$this -> Adapter = new mysqli($Host, $UserDb, $PassDb, $Dbname);
		if ($this -> Adapter -> connect_error) {
			die('Connect Error (' . $this -> Adapter -> connect_errno . ') ' . $this -> Adapter -> connect_error);
		}

		if (!$this -> Adapter -> set_charset("utf8")) {

		}

	}

	public function __destruct() {

		$this -> Adapter -> close();

	}

	public function getId() {
		return $this -> Adapter -> insert_id;

	}

	public function insert($table, $fields_values = array()) {

		$check = true;
		$val = '';
		$names = '';
		foreach ($fields_values as $fields => $values) {
			if ($check) {
				$check = false;
			} else {
				$names .= ',';
				$val .= ',';
			}
			$names .= $fields;
			if ($values == 'NOW()') {
				$val .= $values;
			} else {
				$val .= $this -> Quote($values);

			}
		}

		$sql = "INSERT INTO  " . $table . " ($names) VALUES ($val);";
		//echo $sql ;
		$result = $this -> Adapter -> query($sql);
		if ($result == true) {
			return true;
		} else {
			return false;
		}
	}

	public function update($table, $fields_values, $where = false) {

		$set = '';
		$first = true;
		foreach ($fields_values as $fields => $values) {
			if ($first) {
				$first = false;
			} else {
				$set .= ',';
			}
			$set .= "$fields = " . $this -> Quote($this -> Adapter -> real_escape_string($values));
		}
		$sql = "UPDATE " . $table . " SET $set";
		if ($where) {
			$sql .= "  $where";
		}
		//echo $sql;
		$result = $this -> Adapter -> query($sql);
		if ($result === TRUE) {
			return true;
		} else {
			return false;
		}

	}

	public function RowCount($table, $condtions = '') {
		$sql = "select * from " . $table . $condtions;
		//echo $sql."*********************";
		$result = $this -> Adapter -> query($sql);
		return $result -> num_rows;
	}

	public function RowAffected() {

		return $this -> Adapter -> affected_rows;
	}

	public function Fetch($sql) {
		//echo $sql;
		$result = $this -> Adapter -> query($sql);
		return $result;
	}

	public function Query($sql) {
		//echo $sql;
		$result = $this -> Adapter -> query($sql);

		if ($result -> num_rows != 0) {
			while ($row = $result -> fetch_array(MYSQLI_ASSOC)) {
				$user_arr[] = $row;
			}
			return $user_arr;

		} else {
			return false;
		}
	}

	public function escapeString($string) {

		$string = $this -> Adapter -> real_escape_string($string);
		return $string;

	}

	public function Quote($string = null) {
		return ($string === null) ? 'NULL' : "'" . str_replace("'", "''", $string) . "'";
	}

	//-----------------------------------------------------------

	public function get_Options() {
		$sql = "select *  from `px_options` ";
		$result = $this -> Query($sql);
		return $result[0];
	}

	public function Send_Email($to, $Subject, $Message, $attach = false, $fromEmail = false, $fromName = false) {

		try {

			$mailConfig = $this -> get_Options();

			$mimetype = $mailConfig['mail_type'];

			@date_default_timezone_set('Etc/UTC');

			$mymail = new PHPMailer();

			switch($mimetype) {
				case "text" :
					$mymail -> ContentType = "text/plain";
					$mymail -> IsHTML(false);
					break;

				case "html" :
					$mymail -> ContentType = "text/html";
					$mymail -> IsHTML(true);
					break;

				default :
					$mymail -> ContentType = "text/html";
					$mymail -> IsHTML(true);
			}

			if ($fromEmail) {
				$fromEmail = $fromEmail;
			} else {
				$fromEmail = $mailConfig['mail_user'];
			}

			if ($fromName) {
				$fromName = $fromName;
			} else {
				$fromName = $mailConfig["mail_sender"];
			}

			$mymail -> Priority = "1";
			$mymail -> CharSet = 'utf-8';

			if ($attach != false) {

				$mymail -> AddAttachment($attach);

			}

			$mymail -> Port = $mailConfig['mail_port'];

			$mymail -> setFrom($fromEmail, $fromName);

			switch($mailConfig["mail_server"]) {
				case "Mail" :
					$mymail -> Mailer = "mail";
					break;

				case "smtp" :
					$mymail -> Mailer = "smtp";

					$mymail -> Host = $mailConfig["mail_smtp"];
					$mymail -> Debugoutput = 'html';
					$mymail -> SMTPDebug = false;
					$mymail -> SMTPAuth = true;
					$mymail -> Username = $mailConfig["mail_user"];
					$mymail -> Password = $mailConfig["mail_pwd"];
					if ($mailConfig['mail_encryption'] != 'none') {
						$mymail -> SMTPSecure = $mailConfig['mail_encryption'];
					}

					break;

				case "sendmail" :
					$mymail -> Mailer = "sendmail";
					break;

				default :
					$mymail -> Mailer = "mail";
			}

			$mymail -> AddAddress($to);
			$mymail -> Subject = $Subject;
			$mymail -> Body = $Message;

			if (!$mymail -> Send()) {

				// echo "Mailer Error: " . $mymail -> ErrorInfo;
				@unlink($attach);
				$mymail -> ClearAddresses();
				$mymail -> ClearAttachments();

				return false;
			} else {

				@unlink($attach);
				$mymail -> ClearAddresses();
				$mymail -> ClearAttachments();
				return true;
			}

		} catch (Exception $e) {
			@unlink($attach);
			echo $e -> getMessage();
		}

	}

	//

	//

	///////////////custome method/////////////////////

	public function Percent($table, $q, $hits) {

		$sql = "select sum(hits) as total from  $table  where `poll`='$q'  limit 1";
		$data = $this -> Query($sql);
		$total = $data[0]['total'];
		$percent = @round($hits / $total * 100);
		return $percent;

	}

	///////////////////////////////////////////

	public function MainCategory() {
		$result = $this -> Adapter -> query("select * from `px_cat` where `cat` ='0' ");
		echo '<select name="cat" ng-model="cat" class="form-control"   >';
		//echo "<option value='0'> تصنيف رئيسي</option>";
		while ($row = $result -> fetch_array(MYSQLI_ASSOC)) {
			echo "<option value='$row[ID]'> $row[name]</option>";
			$this -> InnerCategory($row['ID']);
		}
		echo '</select >';
		//
	}






public function MainCategory_Admin() {
		$result = $this -> Adapter -> query("select * from `px_cat` where `cat` ='0' ");
		echo '<select name="cat" ng-init="cat=0" ng-model="cat" class="form-control" size="5"   >';
		 echo "<option value='0' selected='selected'> تصنيف رئيسي</option>";
		while ($row = $result -> fetch_array(MYSQLI_ASSOC)) {
			echo "<option value='$row[ID]'> $row[name]</option>";
			$this -> InnerCategory($row['ID']);
		}
		echo '</select >';
		//
	}





	public function InnerCategory($id) {
		$result = $this -> Adapter -> query("select * from `px_cat` where `cat` ='$id' ");
		while ($row = $result -> fetch_array(MYSQLI_ASSOC)) {
			echo "<option value='$row[ID]'> ";
			for ($i = 0; $i < $row['level']; $i++) {
				echo "&nbsp;-";
			}
			echo "$row[name]</option>";
			$this -> InnerCategory($row['ID']);
		}

	}


/*	public function File_extension($filename) {

		$exe = end(explode(".", $filename));

		return $exe;

	}*/

function File_extension($filename)
{
$path_info = @pathinfo($filename);
return $path_info['extension'];
}








	public function ImageSize($ImgSrc, $ImgTarget, $x, $y) {
		if (function_exists('imagecreatefromjpeg')) {

			try {
				switch (strtoupper($this->File_extension($ImgSrc))) {
					case "JPG" :
					case "JPEG" :
						$im = @imagecreatefromjpeg($ImgSrc);
						break;
					case "GIF" :
						$im = @imagecreatefromgif($ImgSrc);
						break;
					case "PNG" :
						$im = @imagecreatefrompng($ImgSrc);
						break;
				}
				$canves = @imagecreatetruecolor($x, $y);
				$width = @imagesx($im);
				$height = @imagesy($im);

				//$trans = imagecolorat($canves, 0, 0);
				//$trans = imagecolorallocate ($canves, 255, 255, 255);
				$trans = imagecolorresolve($canves, 0, 0, 0);
				imagecolortransparent($canves, $trans);

				@imagecopyresampled($canves, $im, 0, 0, 0, 0, $x, $y, $width, $height);
				@imagegif($canves, $ImgTarget);
				@imagedestroy($im);
				@imagedestroy($canves);

			} catch(Exception  $e) {
				echo "<script>alert($e->getMessage())</script>";
			}
		} else {
			dir('GD Not Support in Server.........');
		}

	}





public function BreadCat(&$elmCategory,$id){ 
	$id=$this -> escapeString($id);
 $result = $this -> Adapter -> query("select * from `px_cat` where `ID` ='$id' ");
	
	 while ($row = $result -> fetch_array(MYSQLI_ASSOC)) {
	 	$elmCategory[]=$row['ID'];
		
		 $result2 = $this -> Adapter -> query("select * from `px_cat` where `cat` ='$row[ID]' ");
		while ($row2 = $result2 -> fetch_array(MYSQLI_ASSOC)) {
			
		$this->BreadCat($elmCategory, $row2['ID']);	
		}
		
	 }
	 
	return $elmCategory;
	//
}



///get count


public function CatCount($id){
	
	  $elmCategory = array();
	  $this-> BreadCat($elmCategory,$id);
	//  return $elmCategory;
	  
	  if(is_array($elmCategory) && count($elmCategory)!=0){
	  	$total = 0;
		//$ValID = implode($elmCategory,','); 
		 foreach($elmCategory as $key =>$val){
		 	$total += $this->RowCount("px_books" , "  where `cat` ='$val' ");
		 	
		 }
	  	
		
		
		return $total;
	  } else {
	  	return '0';
	  }
	  
	  
	  
	
}









public function breadcrumb($id){
$id = (int) $this ->escapeString($id);
$j =0;

for($i =0 ; $i < 6  ; $i++){
	if($j == 0){
	$sql= "select * from `px_cat` where `ID` ='$id' ";
	
	$result = $this -> Adapter -> query($sql);
	$row = $result -> fetch_array(MYSQLI_ASSOC);
	$CatID[]   = $row['ID'];
	$CatVal[]  = $row['name'];
	
	$nextID = $row['cat'];
	$j++;
	} else {
		if($nextID != 0){
	 $sql= "select * from `px_cat` where `ID` ='$nextID' ";
	$result = $this -> Adapter -> query($sql);
	$row = $result -> fetch_array(MYSQLI_ASSOC);
	$CatID[]   = $row['ID'];
	$CatVal[]  = $row['name'];
	$nextID = $row['cat'];
		} else {
			break;
		}
		
	}
	
	
	
//end for	
}	
	$NewArr = array('keys' =>$CatID ,'vals' =>$CatVal);
	return $NewArr;
	
	
}








public  function FormatSize($fileSize)
{

$byteUnits = array(" GB"," MB"," KB"," bytes");

if($fileSize >= 1073741824)
{
$fileSize = round($fileSize / 1073741824 * 100) / 100 . $byteUnits[0];
}
elseif($fileSize >= 1048576)
{
$fileSize = round($fileSize / 1048576 * 100) / 100 . $byteUnits[1];
}
elseif($fileSize >= 1024)
{
$fileSize = round($fileSize / 1024 * 100) / 100 . $byteUnits[2];
}
else
{
$fileSize = $fileSize . $byteUnits[3];
}
return $fileSize;
}



////////////


public function download( $file )
{
@header( "Pragma: public");
@header( "Expires: 0");
@header( "Cache-Control: must-revalidate, post-check=0, pre-check=0");
@header( "Accept-Ranges: none");
@header( "Content-Type: application/force-download");
@header( "Content-Type: application/octet-stream");
@header( 'Content-Disposition: attachment; filename="'. basename($file) .'"');
@header( "Content-Length: ". filesize($file));
@header( "Content-Transfer-Encoding: binary");
@header( "Content-Description: File Transfert");
@readfile( $file );
exit;
 
    } 















}
?>