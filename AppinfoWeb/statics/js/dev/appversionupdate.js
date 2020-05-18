layui.use('upload', function () {
    var $ = layui.jquery
        , upload = layui.upload;


    upload.render({ //允许上传的文件后缀
        elem: '#apkupload'
        , url: serverUrl + '/sys/apkupload'
        , accept: 'file' //普通文件
        , exts: 'zip|apk' //只允许上传压缩文件 apk文件
        , size: 60 //限制文件大小，单位 KB
        , done: function (res) {
            register_dev(res.code);
            if (res.code != 200) {
                return layer.msg('上传失败');
            } else {
                layer.msg('上传成功');
                $("#src1").val(res.data.data.src1);
                $("#src2").val(res.data.data.src2);
                $("#src3").val(res.data.data.src3);
            }

        }
    });


});



var form;
layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form'], function () {
    var table = layui.table;
    form = layui.form;

    var appId = sessionStorage.getItem("appId");
    var versionId = sessionStorage.getItem("versionId");
    sessionStorage.removeItem("appId");
    sessionStorage.removeItem("versionId");
    var version;
    $.ajax({
        type: "GET",
        url:serverUrl + "/sys/findVersionById?id=" + versionId ,
        success: function (data) {
            register_dev(data.code);
            version = data.data.version;
            console.log(version);
            form.val('example', {
                "versionNo": version.versionNo
                , "versionSize": version.versionSize
                , "publishStatus": version.publishStatus
                , "versionInfo": version.versionInfo
                , "appId": appId
                , "downloadLink": version.downloadLink
                , "apkLocPath": version.apkLocPath
                , "apkFileName": version.apkFileName
                , "id": version.id
            });
            $("#src5").html(version.apkFileName);
        }
    });

    //第一个实例
    table.render({
        elem: '#demo'
        , url: serverUrl + '/sys/appversionlist?appId=' + appId //数据接口
        , cols: [[ //表头
            {field: 'appName', title: '软件名称'}
            , {field: 'versionNo', title: '版本号'}
            , {field: 'versionSize', title: '版本大小'}
            , {field: 'publishStatusName', title: '发布状态'}
            , {field: 'downloadLink', title: 'APK文件下载'}
            , {field: 'modifyDate', title: '最新更新时间'}
        ]]
    });

    form.verify({
        num: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (!new RegExp("^[1-9]+[0-9]*\.?[0-9]*$").test(value)) {
                return '请输入正确的数字';
            }
        }
    });
    //监听提交

    form.on('submit(demo1)', function (data) {
        console.log(data.field);
        if ($("#src1").val() != "") {
            $.ajax({
                url: serverUrl + '/sys/versionadd',
                type: "post",
                data: data.field,
                dataType: "json",
                success: function (data) {
                    register_dev(data.code);
                    if (data.data.result == "success") {
                        layer.alert("操作成功！");
                        history.back(-1);
                    } else {
                        layer.alert("程序繁忙,请联系统管理员！");
                    }
                }
            });
        } else {
            layer.alert("请上传apk文件！");
        }
        return false;
    });

    $("#link").click(function () {
        if ($("#src5").html() != "") {
            layer.alert("下载链接:" + version.downloadLink + "", {icon: 1});
        } else {
            layer.alert("无apk信息", {icon: 2});
        }
    })

    $("#del").click(function () {
        if ($("#src5").html() != "") {
            $.ajax({
                type: "GET",
                url:serverUrl + "/sys/delversionsrc?id=" + version.id + "&apkFileName=" + $("[name=apkFileName]").val(),
                success: function (data) {
                    register_dev(data.code);
                    if (data.data.result = "success") {
                        layer.alert("删除成功！", {icon: 1})
                        $("[id^=src]").val("");
                        $("#src5").html("");
                    } else if (data.data.result == "lose") {
                        layer.alert("系统繁忙,请联系管理员！", {icon: 2});
                    } else {
                        layer.alert("服务器不存在此路径！", {icon: 2});
                    }
                }
            });
        } else {
            layer.alert("无apk信息", {icon: 2});
        }
    });
});
