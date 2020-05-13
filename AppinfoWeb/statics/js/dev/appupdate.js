layui.use('upload', function () {
    var $ = layui.jquery
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


var appinfo;
var form;
layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form', 'layer'], function () {
    var table = layui.table;
    form = layui.form;


    /*加载数据*/

    var id = sessionStorage.getItem("appid");
    if (id == null) {
        layer.alert("无app信息,正返回首页>>>");
        setTimeout(function () {
            top.location.href = "../index.html";
        }, 1500)
    } else {
        /*移除数据*/
        sessionStorage.removeItem("appid");
        $.getJSON(serverUrl + "/sys/findbyid?id=" + id, function (data) {
            /*表单赋值*/
            appinfo = data.data.appinfo;
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
        })
    }


    //获取下拉框
    $.getJSON(serverUrl + "/sys/datedictionlist", function (datas) {
        for (var i = 0; i < datas.data.length; i++) {
            var item = datas.data[i];
            if (item.typeCode == "APP_STATUS") {
                $("[name=status]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
            } else if (item.typeCode == "APP_FLATFORM") {
                $("[name=flatformId]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
            }
        }
        $("[name=flatformId]").find("option[value=" + appinfo.flatformId + "]").prop("selected", true);
        form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
    })

    $.getJSON(serverUrl + "/sys/categoryList", function (data) {
        var i = "${appinfo.categoryLevel1}";
        for (var i = 0; i < data.data.length; i++) {

            $("[name=categoryLevel1]").append("<option value=" + data.data[i].id + ">" + data.data[i].categoryName + "</option>");
        }

        /*选中*/
        $("[name=categoryLevel1]").find("option[value='" + appinfo.categoryLevel1 + "']").prop("selected", true);
        form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
    })

    //三级分类
    form.on('select(c1)', function (data) {
        var id = data.elem.getAttribute("id");
        var val = data.value;
        if (id != 3) {
            id++;
            if (val != '') {
                if (id == 2) {
                    /*清空第三级信息*/
                    $("#3").html("");
                    $("#3").append("<option value=''>请先选择父级分类</option>");
                }
                /*123联动*/
                $.getJSON(serverUrl + "/sys/categoryList?parentId=" + val, function (data) {
                    $("#" + id + "").html("");
                    if (data.data.length != 0) {
                        $("#" + id + "").append(" <option value=''>全部</option>");
                        for (var o = 0; o < data.data.length; o++) {
                            $("#" + id + "").append("<option value='" + data.data[o].id + "'>" + data.data[o].categoryName + "</option>");
                        }
                    } else {
                        $("#" + id + "").append(" <option value=''>暂无</option>");
                    }
                    form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
                })
            }
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
            $.getJSON(serverUrl + "/sys/delImg", "id=" + appinfo.id + "&fileName=" + appinfo.logoLocPath, function (data) {
                if (data.data.result == "success") {
                    layer.alert("删除成功！", {icon: 1});
                    $("#src1,#src2").val("");
                    $("#demo1").attr("src", "");
                } else if (data.data.result == "lose") {
                    layer.alert("系统繁忙,请联系管理员！", {icon: 2});
                } else {
                    layer.alert("服务器不存在此路径！", {icon: 2});
                }
            })
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