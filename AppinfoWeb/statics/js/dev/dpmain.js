//JavaScript代码区域
//加载多个组件 使用数组
layui.use(['element', 'layer'], function () {
    var element = layui.element
    layer = layui.layer;


    var devName = sessionStorage.getItem("devUser");
    $("#devName").html(devName);
    $("#d").html("欢迎你，" + devName);

    //退出登录
    $("#loginout").click(function () {
        $.get(serverUrl + "/dev/dploginout", function (data) {
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