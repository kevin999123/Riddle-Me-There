<?php

session_start();
/*********************************************************************************************/

	
	function Returnvalue($result)
		{
			$jsonreturn =[
		    "result" => $result,
		   	];

		   	print json_encode($jsonreturn);
		}
	
	
		
			Returnvalue($_SESSION['UserName']);
		
			
	
	/*if($result == "correct" or $result == "error"){
		Returnvalue($result);
	}*/	
?>