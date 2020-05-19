var form;
var layer;
layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form', 'layer','jquery'], function () {
    var table = layui.table;
    form = layui.form;
    layer = layui.layer;
    $=layui.$;

    /*加载数据*/
    var id = sessionStorage.getItem("id");
    var versionId = sessionStorage.getItem("versionId");
    var appinfo;
    var version;

    $.ajax({
        /* headers: {
             "token_back": localStorage.getItem("token_back")
         },*/
        type: "GET",
        url: serverUrl + "/sys/back/findbyid?id=" + id + "&versionId=" + versionId,
        success: function (data) {
            //token鉴权
            register_back(data.code);

            appinfo = data.data.appinfo;
            version = data.data.version;
            if(data.token!=null){
                localStorage.setItem("token_back",datas.token);
            }
            console.log(appinfo);

            form.val('example', {
                "softwareName": appinfo.softwareName  // "name": "value"
                , "aPKName": appinfo.aPKName
                , "supportROM": appinfo.supportROM
                , "interfaceLanguage": appinfo.interfaceLanguage //复选框选中状态
                , "softwareSize": appinfo.softwareSize //开关状态
                , "downloads": appinfo.downloads
                , "appInfo": appinfo.appInfo
                , "logoPicPath": appinfo.logoPicPath
                , "logoLocPath": appinfo.logoLocPath
                , "downloads": appinfo.downloads
                , "id": appinfo.id
                , "status": appinfo.status
                , "logoPicPath": appinfo.logoPicPath
                , "logoLocPath": appinfo.logoLocPath
                , "categoryContext": appinfo.categoryContext
                , "flatformName": appinfo.flatformName
            });

            form.val('example2', {
                "versionNo": version.versionNo
                , "versionSize": version.versionSize
                , "versionInfo": version.versionInfo
            });
            $("#apkFileName").html(version.apkFileName)

            $("#demo1").attr("src", appinfo.logoPicPath);
            if(data.token!=null){
                localStorage.setItem("token_back",datas.token);
            }
        }
    });



    /*弹出下载链接*/
    $("#link").click(function () {

    })

    $(".layui-btn").click(function () {
        if(this.id=="link"){
            layer.alert("下载链接:" + version.downloadLink + "", {icon: 1});
            return ;
        }

        var status = 3;
        if ($(this).html() == "审核通过") {
            status = 2;
        }
        if ($(this).html() != "返回") {
            $.ajax({
                type: "GET",
                url: serverUrl + "/sys/back/setStatus?status=" + status + "&id=" + appinfo.id + "",
                success: function (data) {
                   register_back(data.code);
                    if(data.token!=null){
                        localStorage.setItem("token_back",data.token);
                    }
                    if (data.data.result == "success") {
                        layer.alert("操作成功！");
                        history.back(-1);
                    } else {
                        layer.alert("程序繁忙,请联系系统管理员！");
                    }
                }
            });

        }
    })
});