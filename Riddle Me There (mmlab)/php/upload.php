<?php 
require('connect.php'); 
$score=$_POST['Score'];
$name = $_POST['name'];
$email = $_POST['email'];
$date = date("Y-m-d H:i:s");

$sql2="select entity_id from customer_entity where email = '$email'";
			
			$result= mysql_query($sql2,$con) or die("失敗2" .mysql_error());


			while($row = mysql_fetch_array($result)){//印出資料
			        $id=$row['entity_id'];
			  
			    }

$sql="INSERT INTO foo_bar_baz(score_id,entity_id,grade,game_id,s_date,name) VALUES(null,'$id','$score','1','$date','$name')";


mysql_query($sql,$con) or die("失敗1" .mysql_error());