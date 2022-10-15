<?php
#header("Content-type: text/html; charset=utf-8");
$data = file_get_contents("php://input");//$_POST['data'];

//$input = $GLOBALS['HTTP_RAW_POST_DATA'];
//file_put_contents('test.txt', );
echo 'received';

echo($data);
?>

