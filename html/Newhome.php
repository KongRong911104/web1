<?php
session_start();
$id = $_SESSION['id'];
if ($id == '') {
    header('Location: index.php');
    exit;
}
include 'crud.php';
$stu_data = detail_Read('stu', 'id', $id);
$username = $stu_data[0]['name'];
$userimg = $stu_data[0]['userimg'];
$group = detail_Read('permission', 'id', $id);
$groupid = rough_Read('groupid');
$gronplist = array();
for ($i = 0; $i < count($group); $i++) {
    for ($j = 0; $j < count($groupid); $j++) {
        if ($group[$i]['groupid'] == $groupid[$j]['groupid']) {
            $grouplist[] = [$groupid[$j]['groupid'], $groupid[$j]['groupname']];
        }
    }
}
array_multisort($grouplist);
$grouplist = json_encode($grouplist);
?>
<!DOCTYPE html>
<html lang="zw-TW">

<head>
    <meta charset="utf-8">
    <title>
        真的登入了!
    </title>
    <script>
        function keyLogin() {
            if (event.keyCode == 13) //enter的鍵值為13
                document.getElementById("send").click(); //觸動按鈕的點擊
        }
    </script>
    <style>
        html {
            background-color: rgba(19, 18, 18, 0.76);
        }

        .grouptop {
            margin-left: -8px;
            background-color: #1A1818;
            position: absolute;
            top: 0px;
            height: 5%;
            width: 15%;
            border: 1px solid black;
            padding-left: 2%;
            font-size: 35px;
            color: white;
        }

        .chattop {
            background-color: #1A1818;
            position: absolute;
            top: 0px;
            left: 17%;
            width: 64%;
            height: 5%;
            border: 1px solid black;
            padding-left: 2%;
            font-size: 35px;
            color: white;
        }

        .usertop {
            top: 0px;
            left: 83%;
            background-color: #1A1818;
            position: absolute;
            width: 14.9%;
            height: 5%;
            border: 1px solid black;
            padding-left: 2%;
            font-size: 35px;
            color: white;
        }

        .inputsite {
            position: absolute;
            top: 93%;
            left: 17%;
            border: 1px solid;
            width: 66%;
            height: 6.5%;
        }

        .groupsize {
            top: 5%;
            margin-left: -8px;
            background-color: #272626;
            position: absolute;
            width: 17%;
            height: 88%;
            border: 1px solid;
            overflow-y: scroll;
            overflow-x: hidden;

        }

        ::-webkit-scrollbar {
            width: 5px;
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgba(0, 0, 0, 0.8);
        }

        .grouplist_style {
            position: relative;
            left: -12%;
            padding-left: 10%;
            width: 100%;
            height: 70px;
            font-size: 35px;
            color: white;
            list-style: none;
        }

        .grouplist_style:hover {
            background-color: #0F0F0E;
        }

        .chat {

            background-color: #272727b9;
            position: absolute;
            top: 5%;
            left: 17%;
            width: 66%;
            height: 88%;
            border: 2px solid;
        }

        .inputStyle {
            margin-top: 10px;
            margin-left: 35px;
            position: relative;
            border-radius: 8px;
            width: 92%;
            height: 70%;
            border: 2px solid;
            border-color: #383838;
            font-size: 27px;
            color: rgb(255, 255, 255);
            background-color: #6e6c6cb7;
        }

        .inputStyle::placeholder {
            color: rgba(233, 231, 231, 0.363);
        }

        .inputStyle:focus {
            outline: none;
            border-color: rgba(107, 107, 107, 0.733);
        }

        .userset {
            position: absolute;
            top: 93%;
            border: 1px solid;
            width: 17%;
            height: 6.5%;
            margin-left: -8px;
            background-color: rgba(0, 0, 0, 0.733);
        }

        .logo {
            position: absolute;
            border-radius: 50px;
            left: 15%;
            top: 17%;
        }

        .username {
            position: relative;
            border-radius: 50px;
            left: 30%;
            top: 30%;
            color: white;
            font-size: 18px;
            font-weight: bold;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }

        .userposition {
            position: absolute;
            border-radius: 50px;
            left: 17%;
            top: 5%;
            color: rgba(255, 255, 255, 0.39);
            font-size: 16px;
            font-weight: bold;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }

        .userlist {
            top: 5%;
            left: 83%;
            background-color: #272626;
            position: absolute;
            width: 16.9%;
            height: 94.5%;
            border: 1px solid;
        }

        .sentphoto {

            position: relative;
            top: 0px;
            left: -30px;
            border: hidden;

        }

        .reloadphoto {
            width: 40px;
            height: 25px;
            left: 50%;
            border: none;
            background-color: green;
            border-radius: 5px;
            color: white;
        }

        .reloadphoto:hover {
            background-color: greenyellow;
        }

        .reloadphoto:active {
            background-color: lightgreen;
        }
    </style>
</head>

<body>
    <div class="grouptop">群組
        <!-- <button id='reloadphoto' class="reroadphoto" onclick="reset();" width='30px'>重整</button> -->
    </div>
    <div class="chattop"></div>
    <div class="usertop">角色</div>
    <div class="groupsize">
        <ul id="grouplist"></ul>
    </div>
    <div class="userset">
        <img class="logo" id="userimg" width="40px">
        <div class="username" id="username"></div>
    </div>
    <div class="chat">
        <ul id="contentlist"></ul>
    </div>
    <div class="inputsite">
        <input type="text" class="inputStyle" placeholder="寫點什麼吧..."></input>
        <img id="photo" class="sentphoto" src="https://www.transparentpng.com/thumb/send-email-button/tCjejK-send-email-button-transparent.png" onclick="sendword()" width="20px">
    </div>
    <div class="userlist">
        <ul></ul>
    </div>
    <script>
        var $username = document.getElementById("username")
        $username.innerHTML = '<?= $username ?>';
        var userimg = document.getElementById("userimg");
        userimg.src = '<?= $userimg ?>';
    </script>
    <script>
        var groupul = document.getElementById('grouplist');
        var grouplist = <?php echo $grouplist ?>;
        for (var i = 0; i < (grouplist.length); i++) {
            var groupli = document.createElement('li');
            groupli.className = "grouplist_style";
            groupli.id = grouplist[i][0];
            groupli.onclick = get_groupid;
            groupli.innerHTML = grouplist[i][1];
            groupul.appendChild(groupli);

            function get_groupid() {
                var group_id = event.target.id;
                var groupname = event.target.innerHTML;
                window.location.href = 'Newchat.php?group=' + group_id + '&groupname=' + groupname;
            }
        }
    </script>
    <script>
        function reset() {
            window.location.href = 'checklogin.php';
        }
    </script>
</body>

</html>