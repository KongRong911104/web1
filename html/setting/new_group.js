function new_group() {
    var new_group_name = prompt('請輸入新群組名稱');
    var new_groupname = document.getElementById('new_groupname');
    if (new_group_name.length > 0) {
        new_groupname.value = new_group_name;
        var group = document.getElementById('new_group');
        group.submit();
    }
}