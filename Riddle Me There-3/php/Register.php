<?php


require('connect.php'); 

function writefile($value)
{
	

	$file = fopen("test.TXT","w"); //開啟檔案

	fwrite($file,$value);

	fclose($file);
}


$emailErr = null;
$ageErr = null;
$pwdErr = null;
$nullErr = null;


	$firstname = $_POST["username"];
	$email = $_POST["email"];
	$pwd = $_POST["password"];
	$country =$_POST["country"];
	$age = $_POST["age"];
	$sex = $_POST["gender"];
	$recommend = $_POST["recommend"];
	$date = date("Y-m-d H:i:s");







/******************************************************************************/

		if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			
	  		$emailErr = "無效的 email1 格式！"; 
	  		
	  		
		}

		if(!isset($recommend)){
			if (!filter_var($recommend, FILTER_VALIDATE_EMAIL)) {
				
		  		$emailErr = "無效的 email2 格式！"; 
		  		
		  		
			}
		}



		if( is_numeric($age)){
			
		}else{
			$ageErr = "請輸入正確數字";
		}


		$plen=strlen($pwd);
		if(!preg_match("/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i",$pwd)or$plen<6 or $plen>15){
		 	 $pwdErr = '密碼必須為6-15位的數字和字母的组合<br />';
		}

		if(is_null($email) or is_null($age) or is_null($firstname) or is_null($country) or is_null($sex) or is_null($pwd)){
			$nullErr ="不能有空值";
		}

		
		
		
/**************************************************************************/

if(!isset($emailErr)&& !isset($ageErr)&& !isset($pwdErr) && !isset($nullErr))
{
			
			$result = "correct";
			
			writefile($result);
	/***********************************************************************************/
	// magneto加密方式
	/*		function getRandomString($length = 10)
			{
				$char = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
				$charLength = strlen($char);//得到字串長度
				$randomString = "";
				for($i = 0; $i < $length; $i++){
					$randomString .= $char[rand(0, $charLength - 1)];
				}//從$char字串中隨機抓取兩個字元

				return $randomString;	//回傳兩個字元
			}



			//$salt是隨機產生兩個字元
			 function getHash($password, $salt = false)
		    {
		        if (is_integer($salt)) {
		            $salt = getRandomString($salt);//隨機抓兩個字元
		        }
		        return $salt === false ? hash('md5',$password) :hash('md5',$salt . $password) . ':' . $salt;
		        //Magento加密密碼=$salt+$password結合起來做md5加密加上分號在加上$salt
		    }

		     //getHash($pwd,2),$pwd->輸入的密碼,2->產生兩個字元
			
			$md52 = getHash($pwd,2);


		/*************************************************************************************/


		/*$sql="INSERT INTO customer_entity(entity_id,entity_type_id,attribute_set_id,website_id,email,group_id,increment_id,store_id,created_at,updated_at,is_active,disable_auto_group_change) VALUES(null,'1','0','1','$email','1',null,'1','$date','$date','1','0')";
		 mysql_query($sql,$con) or die("失敗1" .mysql_error());



		$sql2="select entity_id from customer_entity where email = '$email'";
		$result= mysql_query($sql2,$con) or die("失敗2" .mysql_error());


		while($row = mysql_fetch_array($result)){//印出資料
		        $id=$row['entity_id'];
		  
		    }




		$sql3="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','5','$id','$firstname')";

		$sql4="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','12','$id','$md52')";
		$sql5="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','3','$id','English')";


		$sql6="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','210','$id','$country')";
		$sql7="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','211','$id','$age')";
		$sql8="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','221','$id','$sex')";
		$sql9="INSERT INTO customer_entity_varchar(	value_id,entity_type_id,attribute_id,entity_id,value) VALUES(null,'1','222','$id','$recommend')";


		mysql_query($sql3,$con) or die("失敗3" .mysql_error());
		mysql_query($sql4,$con) or die("失敗4" .mysql_error());
		mysql_query($sql5,$con) or die("失敗5" .mysql_error());
		mysql_query($sql6,$con) or die("失敗6" .mysql_error());
		mysql_query($sql7,$con) or die("失敗7" .mysql_error());
		mysql_query($sql8,$con) or die("失敗7" .mysql_error());
		mysql_query($sql9,$con) or die("失敗7" .mysql_error());


*/	
}else {
	$result ="error";
	writefile($result);

	
}

mysql_close($con); 


/*else {
	$result ="error";
	writefile($result);

	$json2 = [
    		"email-error" => "$emailErr",
    		"age-error" => "$ageErr",
    		"pwd-error" => "$pwdErr",
    		"null-Err" => "$nullErr",
		];
}
*/

/*********************************************************************************************/

?>