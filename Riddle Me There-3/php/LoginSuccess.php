<?php
//LoginSuccess.php
session_start();
/*********************************************************************************************/
	
 	$result = $_SESSION["value"];

	function Returnvalue($result)
		{
			$jsonreturn =[
		    "result" => $result,
		   	];

		   	print json_encode($jsonreturn);
		}

	Returnvalue($result);
	
?>