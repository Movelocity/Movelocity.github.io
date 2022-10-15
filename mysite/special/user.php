<?php
#header("Content-type: text/html; charset=utf-8");
$action = $_GET['action'];
$uid = $_GET['uid'];
$data = $_GET['data'];

// 查用户名，改用户名
$array = file('data', FILE_SKIP_EMPTY_LINES);

for($i=0,$len=count($array);$i<$len; $i++){
    $rec = str_replace("'", "", $array[$i]);
    $items = explode(":", $rec);
            
    if(count($items)!=2) continue;
    if($items[0]==$uid){
        if($action ==  'setUserName'){
            $data = str_replace(str_split('\\/:*?"<>|+-\'\"'), '', $data);
            $array[$i] = "'$uid':'$data'\n";
            echo "ok";
            break;  // 去写文件
        }
        else if($action == 'getUserName'){
            //echo "username: $items[1]<br/>";
            echo $items[1];  // 取得用户名
            return;  // 直接退出
        }
    }
    
    if($i==$len-1){ //未找到,新建记录
        array_push($array, "'$uid':'$data'\n");
        echo($data);
    }
}


$file=fopen("data","w");  // 写入文件

foreach($array as $rec){  if(trim($rec)!="") fwrite($file, "$rec");  }

fclose($file);
?>



