<?php


/*********************************************************************************************/
$result = $_POST["result"];
function Returnvalue($result)
{
	$jsonreturn =[
    "result" => "$result",
   	];

   	print json_encode($jsonreturn);
}



Returnvalue($result);


?>