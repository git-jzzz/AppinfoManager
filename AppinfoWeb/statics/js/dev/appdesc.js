var form;
layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form', 'layer'], function () {
    var table = layui.table;
    form = layui.form;
    layer = layui.layer;

    var appinfo;
    var id = sessionStorage.getItem("id");
    sessionStorage.removeItem("id");
    $.getJSON(serverUrl + "/sys/findbyid?id=" + id, function (data) {
        appinfo = data.data.appinfo;
        /*加载表单数据*/
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
            , "statusName": appinfo.statusName
        });
        $("#demo1").attr("src", appinfo.logoPicPath);

    })

    //第一个实例
    table.render({
        elem: '#demo'
        , url: serverUrl + '/sys/appversionlist?appId=' + id //数据接口
        , cols: [[ //表头
            {field: 'appName', title: '软件名称'}
            , {field: 'versionNo', title: '版本号'}
            , {field: 'versionSize', title: '版本大小'}
            , {field: 'publishStatusName', title: '发布状态'}
            , {field: 'downloadLink', title: 'APK文件下载'}
            , {field: 'modifyDate', title: '最新更新时间'}
        ]]
    });
});