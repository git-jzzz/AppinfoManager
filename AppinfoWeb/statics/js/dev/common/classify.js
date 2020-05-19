
layui.use(['form'],function () {
    var form=layui.form;
    //分类
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
                $.ajax({
                    type: "GET",
                    url:serverUrl + "/sys/categoryList?parentId=" + val ,
                    success: function (data) {
                        register_dev(data.code);
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
                    }
                });
            }
        }
    });
})
