layui.use(['jquery','layer'], function () {
    $=layui.$;
    layer = layui.layer;

    $.ajax({
                type: "GET",
                url: serverUrl + "/sys/dev_auth",
                success: function (data) {
                    register_dev(data.code);
        }
    });

    /*可以被外部js引用  window.name=function(){}*/
       window.register_dev=function (code) {
           if(code==801){
               layer.msg("登录令牌无效或已过期,正在为您跳转到系统首页》》》");
               setTimeout(function () {
                   sessionStorage.clear();
                   localStorage.clear();
                   window.top.location.href = "../index.html";
               },1800)
           }
       }
   })
    





