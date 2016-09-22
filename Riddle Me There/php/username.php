<?php 
require('connect.php'); 
$email=$_POST["email"];

$sql2="select entity_id from customer_entity where email = '$email'";
			
			$result= mysql_query($sql2,$con) or die("失敗2" .mysql_error());


			while($row = mysql_fetch_array($result)){//印出資料
			        $id=$row['entity_id'];
			  
			    }

$sql = "select value from customer_entity_varchar where entity_id = '$id' AND attribute_id = '5'";  //replace with your table name 
$result = mysql_query($sql,$con);
$json = array(); 

if(mysql_num_rows($result)){
	while($row=mysql_fetch_assoc($result)){ 
		$json[]=$row; 
	} 
	print json_encode($json);
} 

mysql_close($con); 

?>