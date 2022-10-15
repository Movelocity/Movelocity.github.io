<?php

// $API_KEY = "qBETQzh8kg5dgfLvhjptxEgX";
// $SECRET_KEY = "4I6b2oeWwyE02dZ5QQGk5GRqHCrFV3mr";
// $ROBOT_ID = "S71213";
// $SKILL_ID = "1203723";

// $url = "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=$API_KEY&client_secret=$SECRET_KEY";

// $ch = curl_init($url);
// curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // 1表示结果存入变量，0表示直接echo
// $response = curl_exec($ch);
// curl_close($ch);
// $token = json_decode($response, true)['access_token'];

// echo 'token: ',$token,'<br/><br/>';
///////////////////////////////////////////////////////

$token = $_POST['token'];
$query = $_POST['query'];
// echo "token: $token";

$ROBOT_ID = "S71213";
$SKILL_ID = "1203723";
$url = "https://aip.baidubce.com/rpc/2.0/unit/service/v3/chat?access_token=$token";

$post_data = array(
    'version'=>'3.0',
    'service_id'=>$ROBOT_ID,
    'session_id'=>'',
    'log_id'=>'1751300725',
    'request'=>array('terminal_id'=>'88888', 'query'=>$query)
    );
$header = array('content-type'=>'application/json');

$json_data = json_encode($post_data);
// echo $url,'<br/><br/>';
// echo $data_formatted,'<br/><br/>';

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
curl_setopt($ch, CURLOPT_POSTFIELDS , $json_data);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // 1表示结果存入变量，0表示直接echo

$response = json_decode(curl_exec($ch), true);
curl_close($ch);
echo $response['result']['context']['SYS_PRESUMED_HIST'][1];
?>