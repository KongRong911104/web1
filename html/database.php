<?php
function connection()
{
    $server = "localhost";         # 伺服器
    $dbuser = "kongrong";       # 使用者帳號
    $dbpassword = "kongrong1104"; # 使用者密碼
    $dbname = "test";    # 資料庫名稱
    return  mysqli_connect($server, $dbuser, $dbpassword, $dbname);
}
?>