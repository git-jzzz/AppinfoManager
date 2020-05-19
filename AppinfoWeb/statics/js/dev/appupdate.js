layui.use(['upload','jquery'], function () {
    var $ = layui.$
        , upload = layui.upload;

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#test1'
        , url: serverUrl + '/sys/logoimg'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#demo1').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            register_dev(res.code);
            //如果上传失败
            if (res.code != 200) {
                return layer.msg('上传失败');
            }
            //上传成功
            $("#src1").val(res.data.data.src1);
            $("#src2").val(res.data.data.src2);

        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    });

});


var form;
layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form', 'layer','jquery'], function () {
    var table = layui.table,
    form = layui.form,
    $=layui.$;


    /*加载数据*/
    var appinfo;
    var id = sessionStorage.getItem("appid");
    $.ajax({
        type: "GET",
        url:serverUrl + "/sys/findbyid" ,
        dataType:"json",
        data:{"id":id},
        success: function (data) {
            register_dev(data.code);
            /*表单赋值*/

            appinfo = data.data.appinfo;
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
            });
            $("#status").val(appinfo.statusName);
            if (appinfo.status == 3) {
                $("#shen").html("保存并再次提交审核");
            }
            $("#demo1").attr("src", appinfo.logoPicPath);

            $("#2").append("<option value='" + appinfo.categoryLevel2 + "'>" + appinfo.categoryLevel2Name + "</option>");
            $("#3").append("<option value='" + appinfo.categoryLevel3 + "'>" + appinfo.categoryLevel3Name + "</option>");

            //获取下拉框
            $.ajax({
                type: "GET",
                url:serverUrl + "/sys/datedictionlist" ,
                success: function (datas) {
                    register_dev(datas.code);
                    for (var i = 0; i < datas.data.length; i++) {
                        var item = datas.data[i];
                       if (item.typeCode == "APP_FLATFORM") {   
                            $("[name=flatformId]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
                        }
                    }
                    $("[name=flatformId]").find("option[value="+appinfo.flatformId+"]").prop("selected", true);
                    form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
                }
            });

            $.ajax({
                type: "GET",
                url:serverUrl + "/sys/categoryList" ,
                success: function (data) {
                    register_dev(data.code);
                    var i = appinfo.categoryLevel1;
                    for (var i = 0; i < data.data.length; i++) {

                        $("[name=categoryLevel1]").append("<option value=" + data.data[i].id + ">" + data.data[i].categoryName + "</option>");
                    }
                    /*选中*/
                    $("[name=categoryLevel1]").find("option[value='" + appinfo.categoryLevel1 + "']").prop("selected", true);
                    form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
                }
            });
        }
    });





    $("#shen").click(function () {
        /* 单击修改状态 */
        if ($("#shen").html() != "保存") {
            $("[name=status]").val(1);
        }

    })

    $("#del").click(function () {
        if ($("#src2").val() != "") {
            $.ajax({
                type: "GET",
                url:serverUrl + "/sys/delImg",
                data:{"id":appinfo.id,"fileName":appinfo.logoLocPath},
                dataType:"json",
                success: function (data) {
                    register_dev(data.code);
                    if (data.data.result == "success") {
                        layer.alert("删除成功！", {icon: 1});
                        $("#src1,#src2").val("");
                        $("#demo1").attr("src", "");
                    } else if (data.data.result == "lose") {
                        layer.alert("系统繁忙,请联系管理员！", {icon: 2});
                    } else {
                        layer.alert("服务器不存在此路径！", {icon: 2});
                    }
                }
            });
        } else {
            layer.alert("无img信息！", {icon: 2});
        }
    })


    form.verify({
        num: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (!new RegExp("^[1-9]+[0-9]*$").test(value)) {
                return '请输入正确的数字';
            }
        },
        num2: function (value, item) { //value：表单的值、item：表单的DOM对象
            if (!new RegExp("^[1-9]+[0-9]*\.?[0-9]*$").test(value)) {
                return '请输入正确的数字';
            }
        }
    });

    //监听提交
    form.on('submit(demo1)', function (data) {
        console.log(data.field);
        $.ajax({
            url: serverUrl + '/sys/appupdatesave',
            type: "post",
            data: data.field,
            dataType: "json",
            success: function (data) {
                register_dev(data.code);
                if (data.data.result == "success") {
                    layer.alert("修改成功！");
                    history.back(-1);
                } else {
                    layer.alert("程序繁忙,请联系系统管理员！");
                }
            }
        });
        return false;
    });
});