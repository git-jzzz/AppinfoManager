

layui.use('upload', function () {
    var $ = layui.jquery
        , upload = layui.upload;

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#test1'
        , url: serverUrl + '/sys/logoimg'
        , exts: 'jpg|png|jpeg' //只允许上传压缩文件 apk文件
        , size: 50 //限制文件大小，单位 KB
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


var form;
layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form','jquery'], function () {
    var table = layui.table;
    form = layui.form;
    $=layui.$;

   /* //获取下拉框
    $.ajax({
        type: "GET",
        url:serverUrl + "/sys/datedictionlist" ,
        dataType:"json",
        success: function (datas) {
            register_dev(datas.code);
            for (var i = 0; i < datas.data.length; i++) {
                var item = datas.data[i];
                if (item.typeCode == "APP_STATUS") {
                    $("[name=status]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
                } else if (item.typeCode == "APP_FLATFORM") {
                    $("[name=flatformId]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
                }
            }
            form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
        }
    });
    $.ajax({
        type: "GET",
        url:serverUrl + "/sys/categoryList" ,
        dataType:"json",
        success: function (data) {
            register_dev(data.code);
            for (var i = 0; i < data.data.length; i++) {
                $("[name=categoryLevel1]").append("<option value=" + data.data[i].id + ">" + data.data[i].categoryName + "</option>");
            }
            form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
        }
    });


    //三级分类
    form.on('select(c1)', function (data) {
        if (data.value > 2) {
            $("[name=categoryLevel3]").html("");
        } else {
            $("[name=categoryLevel2]").html("");
        }
        $.ajax({
            type: "GET",
            url:serverUrl + "categoryList" ,
            data:{"parentId": data.value },
            dataType:"json",
            success: function (datas) {
                register_dev(datas.code);
                for (var i = 0; i < datas.data.length; i++) {
                    if (data.value > 2) {
                        $("[name=categoryLevel3]").append("<option value=" + datas.data[i].id + ">" + datas.data[i].categoryName + "</option>");
                    } else {
                        $("[name=categoryLevel2]").append("<option value=" + datas.data[i].id + ">" + datas.data[i].categoryName + "</option>");
                    }

                }
                form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
            }
        });
    });*/


    $(function () {
        var isTrue = true;
        //重名验证
        $("[name=aPKName]").blur(function () {
            if ($(this).val() != "") {
                $.ajax({
                    type: "GET",
                    url:serverUrl + "/sys/findbyapkname" ,
                    data:{"aPKName":$(this).val()},
                    dataType:"json",
                    success: function (data) {
                        register_dev(data.code);
                        if (data.data.result == "exits") {
                            layer.msg("APK名称已存在,不可使用~");
                            isTrue = false;
                        } else {
                            layer.msg("APK名称可用~");
                            isTrue = true;
                        }
                    }
                });
            }
        })
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
            url: serverUrl + '/sys/appaddsave',
            type: "post",
            data: data.field,
            dataType: "json",
            success: function (data) {
                register_dev(data.code);
                if (data.data.result == "success") {
                    layer.msg("新增成功");
                    setTimeout(function () {
                        sessionStorage.removeItem("devUser");
                        history.back(-1);
                    }, 1000);
                } else {
                    layer.alert("程序繁忙,请联系系统管理员！");
                }
            }
        });
        return false;
    });
});
