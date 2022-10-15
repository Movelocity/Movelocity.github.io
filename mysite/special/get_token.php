<?php
$API_KEY = "qBETQzh8kg5dgfLvhjptxEgX";
$SECRET_KEY = "4I6b2oeWwyE02dZ5QQGk5GRqHCrFV3mr";
$ROBOT_ID = "S71213";
$SKILL_ID = "1203723";

$url = "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=$API_KEY&client_secret=$SECRET_KEY";

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // 1表示结果存入变量，0表示直接echo
$response = curl_exec($ch);
curl_close($ch);

$token = json_decode($response, true);
echo $token['access_token'];

//$header = array('token:JxRaZezavm3HXM3d9pWnYiqqQC1SJbsU','language:zh','region:GZ');
// $content = array(
//         'name' => 'fdipzone'
// );
?>