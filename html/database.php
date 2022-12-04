<?php
function connection()
{
    $server = "";         # 伺服器
    $dbuser = "";       # 使用者帳號
    $dbpassword = ""; # 使用者密碼
    $dbname = "web";    # 資料庫名稱
    return  mysqli_connect($server, $dbuser, $dbpassword, $dbname);
}
?>
