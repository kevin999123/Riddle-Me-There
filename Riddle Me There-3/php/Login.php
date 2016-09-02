<?php

	require("connect.php");

    function writefile($value)
    {
        

        $file = fopen("login.TXT","w"); //開啟檔案

        fwrite($file,$value);

        fclose($file);
    }

	$email  = $_POST["email"];
	$auto  = $_POST["auto"];
	$pwd  = $_POST["pwd"];

	function validateHash($password, $hash)
    {
        $hashArr = explode(':', $hash);
        switch (count($hashArr)) {
            case 1:
                return $this->hash($password) === $hash;
            case 2:
                return $this->hash($hashArr[1] . $password) === $hashArr[0];
        }
    
    }

    $sql2="select value from customer_entity_varchar where attribute_id="12" AND entity_id=(select entity_id from customer_entity where email = '$email')";
    $result= mysql_query($sql2,$con) or die("失敗2" .mysql_error());

    while($row = mysql_fetch_array($result)){//印出資料
		        $hash=$row['entity_id'];
		  
	}

    $value = validateHash($pwd,$hash);

    
            
    writefile($value);
?>