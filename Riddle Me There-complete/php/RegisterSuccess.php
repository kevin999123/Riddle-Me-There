<?php

session_start();
/*********************************************************************************************/
	
	function Returnvalue($result)
		{
			$jsonreturn =array(
		    	"result" => $result,
		   	);

		   	print json_encode($jsonreturn);
		}
	
	if (!empty($_SESSION['Register'])) {
    	$result = $_SESSION['Register'];
    	
			Returnvalue($result);
	}
	 
		
		
			
	
	/*if($result == "correct" or $result == "error"){
		Returnvalue($result);
	}*/	
?>