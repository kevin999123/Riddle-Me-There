<?php
//LoginSuccess.php
session_start();
/*********************************************************************************************/

 	$result = $_SESSION["value"];

	function Returnvalue($result)
		{
			$jsonreturn =[
		    "result" => "$_SESSION['value']",
		   	];

		   	print json_encode($jsonreturn);
		}

	Returnvalue($result);
	
?>