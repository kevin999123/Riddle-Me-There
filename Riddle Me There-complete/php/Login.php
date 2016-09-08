<?php
    session_start();
	require("connect.php");


	$email  = $_POST["email"];
	$auto  = $_POST["auto"];
	$pwd  = $_POST["password"];

	function validateHash($password, $hash)
    {
        $hashArr = explode(':', $hash);
        switch (count($hashArr)) {
            case 1:
                if( md5($password) === $hash)
                    return "true";
                else
                    return "false";
            case 2:
                if( md5($hashArr[1] . $password) === $hashArr[0])
                    return "true";
                else
                    return "false";
        }
    
    }

    $sql2="select value from customer_entity_varchar where attribute_id='12' AND entity_id=(select entity_id from customer_entity where email = '$email')";
    $result= mysql_query($sql2,$con) or die("失敗2" .mysql_error());

    while($row = mysql_fetch_array($result)){//印出資料
		        $hash=$row['value'];
		  
	}

    $value = validateHash($pwd,$hash);

    echo $value;
     $_SESSION["value"] = $value;       
    
?>