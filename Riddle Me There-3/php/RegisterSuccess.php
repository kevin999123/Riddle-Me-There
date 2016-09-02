<?php


/*********************************************************************************************/
function readfiles()
{
	$str = "";
	$filename = "test.TXT";

	if(file_exists($filename)){

	    $file = fopen($filename, "r");

	    if($file != NULL){

	        //當檔案未執行到最後一筆，迴圈繼續執行(fgets一次抓一行)

	        while (!feof($file)) {

	            $str .= fgets($file);

	        }


	    	fclose($file);

		}

    }
	return $str;
}

 /* $url = "http://140.131.12.56/Register.php";
  function get_data($url) {
	  $ch = curl_init();
	  $timeout = 5;
	  curl_setopt($ch, CURLOPT_URL, $url);
	  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	  curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
	  $data = curl_exec($ch);
	  curl_close($ch);
	  return $data;
	}

	$vlas =get_data($url);*/

	function Returnvalue($result)
		{
			$jsonreturn =[
		    "result" => "$result",
		   	];

		   	print json_encode($jsonreturn);
		}
	for($i=0 ; $i<2 ;$i++){
		$result = readfiles();
		sleep(1);
	}
	if($result == "correct" or $result == "error"){
		Returnvalue($result);
	}	
?>