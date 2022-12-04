<?php
include "crud.php";
$username = $_POST['id'];
$password = $_POST['passwd'];
$server = "localhost";         # MySQL/MariaDB 伺服器
$dbuser = "kongrong";       # 使用者帳號
$dbpassword = "kongrong1104"; # 使用者密碼
$dbname = "test";    # 資料庫名稱

# 連接 MySQL/MariaDB 資料庫
$connection = mysqli_connect($server, $dbuser, $dbpassword, $dbname);

# 檢查連線是否成功
if ($connection->connect_error) {
    die("連線失敗：" . $connection->connect_error);
}

# MariaDB 查詢
$sqlQuery = "SELECT * FROM `stu` ";
$result = mysqli_query($connection, $sqlQuery);
$datas = array();
// 如果有資料
if ($result) {
    // mysqli_num_rows方法可以回傳我們結果總共有幾筆資料
    if (mysqli_num_rows($result) > 0) {
        // 取得大於0代表有資料
        // while迴圈會根據資料數量，決定跑的次數
        // mysqli_fetch_assoc方法可取得一筆值
        while ($row = mysqli_fetch_assoc($result)) {
            // 每跑一次迴圈就抓一筆值，最後放進data陣列中
            $datas[] = $row;
        }
    }
    // 釋放資料庫查到的記憶體
    mysqli_free_result($result);
}

// 找出資料
$check_a = 0;
$check_b = 0;
for ($i = 0; $i < count($datas); $i++) {
    if ($datas[$i]['account'] == $username && $datas[$i]['password'] == $password) {
        $check_a = 1;
        $id = $datas[$i]['id'];
        $name = $datas[$i]['name'];
        $userimg = $datas[$i]['userimg'];
        break;
    }
}

if (!isset($_SESSION)) {
    session_start();
}  //判斷session是否已啟動
$_SESSION['logtime'] = 0;
$_SESSION['captchatime'] = 0;
if ((!empty($_SESSION['check_word'])) && (!empty($_POST['checkword']))) {  //判斷此兩個變數是否為空
    if (strtolower($_SESSION['check_word']) == strtolower($_POST['checkword'])) {
        $_SESSION['check_word'] = ''; //比對正確後，清空將check_word值
        $check_b = 1;
    }
}

$dd=detail_Read('manage', 'id',$id);
if(empty($dd)){

}
else{
    echo("<button class='b' onclick='Manage()'>管理界面</button>");
}
// 判斷登入是否正確,並跳轉
if ($check_a == 0 || $check_b == 0) {

    $url = "index.php";
    if ($check_a == 0) {
        $_SESSION['logtime'] = 1;
    }
    if ($check_b == 0) {
        $_SESSION['captchatime'] = 1;
    }
    
    header('Location: index.php');
    exit;
} 
else{
    session_start();
    $_SESSION['id'] = $id;
}
?>
<!DOCTYPE html>
<html lang="zw-TW">
    <style>
        .b{
            width: 100px;
            position: relative;
            top:450px;
            left:45%;
        }
    </style>
    <button class="b" onclick="Old()">舊版</button>
    <button class="b" onclick="New()">新版</button>
    <script>
        function Old(){
            window.location.href = "home.php";
        };
        function New(){
            window.location.href = "Newhome.php";
        };
        function Manage(){
            window.location.href = "setting.php";
        };
    </script>
</html>