layui.use(['upload', 'layer'], function () {
    var $ = layui.jquery
        , layer = layui.layer
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
                //上传成功
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
}).use(['index', 'table', 'layer', 'form'], function () {
    var table = layui.table;
    form = layui.form;
    layer = layui.layer;


    var appId = sessionStorage.getItem("appId");
    $("[name=appId]").val(appId);
    sessionStorage.removeItem("appId");

    //第一个实例
    table.render({
        elem: '#demo'
        , url: serverUrl + '/sys/appversionlist?appId=' + appId //数据接口
        , cols: [[ //表头
            {field: 'appName', title: '软件名称'}
            , {field: 'versionNo', title: '版本号'}
            , {field: 'versionSize', title: '版本大小'}
            , {field: 'publishStatusName', title: '发布状态'}
            , {field: 'downloadLink',width : 300, title: 'APK文件下载'}
            , {field: 'modifyDate',width:100, title: '最新更新时间'}
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
                        layer.alert("程序繁忙,请联系系统管理员！");
                    }
                }
            });
        } else {
            layer.alert("请上传apk文件！");
        }
        return false;
    });
});