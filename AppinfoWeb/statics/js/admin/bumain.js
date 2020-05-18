//JavaScript代码区域
layui.use(['element', 'layer','jquery'], function () {
    var element = layui.element
        ,$=layui.$
        , layer = layui.layer;
    var userName = sessionStorage.getItem("backerUser");
    $("#userName").html(userName);
    $("#d").html("欢迎你，" + userName);


    //退出登录
    $("#loginout").click(function () {
        $.ajax({
            type: "GET",
            url: serverUrl + "/bu/buloginout",
            success: function (data) {
                if (data.code == 200) {
                    layer.msg("退出成功");
                    setTimeout(function () {
                        sessionStorage.removeItem("backerUser");
                        localStorage.removeItem("token_back");
                        location.href = "../index.html";
                    }, 1000);
                }
            }
        });
    })

 window.del=   function () {
        $("#d").remove();
    }

});

