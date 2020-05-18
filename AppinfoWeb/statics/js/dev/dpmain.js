//JavaScript代码区域
//加载多个组件 使用数组
layui.use(['element', 'layer','jquery'], function () {
    var element = layui.element
    $=layui.$
    layer = layui.layer;


    var devName = sessionStorage.getItem("devUser");
    $("#devName").html(devName);
    $("#d").html("欢迎你，" + devName);

    //退出登录
    $("#loginout").click(function () {
        $.ajax({
            type: "GET",
            url:serverUrl + "/dev/dploginout",
            success: function (data) {
                register_dev(data.code);
                if (data.code == 200) {
                    layer.msg("退出成功");
                    setTimeout(function () {
                        sessionStorage.removeItem("devUser");
                        localStorage.removeItem("token_dev");
                        location.href = "../index.html";
                    }, 1000);
                } else {
                    layer.msg(data.msg);
                }
            }
        });
    })

  window.del=  function () {
        $("#d").remove();
    }
});

