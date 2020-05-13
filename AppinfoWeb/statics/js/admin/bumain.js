//JavaScript代码区域
layui.use(['element', 'layer'], function () {
    var element = layui.element
        , layer = layui.layer;
    var userName = sessionStorage.getItem("backerUser");
    $("#userName").html(userName);
    $("#d").html("欢迎你，" + userName);

    //退出登录
    $("#loginout").click(function () {
        $.get(serverUrl + "/bu/buloginout", function (data) {
            layer.msg("退出成功");
            setTimeout(function () {
                sessionStorage.removeItem("devUser");
                location.href = "../index.html";
            }, 1000);
        })
    })

});

function del() {
    $("#d").remove();
}