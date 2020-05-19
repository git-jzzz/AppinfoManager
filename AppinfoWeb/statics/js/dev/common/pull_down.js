
layui.use(['form'],function () {
    var form=layui.form;

    //获取下拉框
    $.ajax({
        type: "GET",
        url:serverUrl + "/sys/datedictionlist" ,
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
            if(document.title=="adppupdate"){
                $("[name=flatformId]").find("option[value="+sessionStorage.getItem("appinfo_upd").flatformId+"]").prop("selected", true);
            }
            form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
        }
    });

    $("[name=categoryLevel1]").append("<option value=''>全部</option>");
    $.ajax({
        type: "GET",
        url:serverUrl + "/sys/categoryList" ,
        success: function (data) {
            register_dev(data.code);
            for (var i = 0; i < data.data.length; i++) {
                $("[name=categoryLevel1]").append("<option value=" + data.data[i].id + ">" + data.data[i].categoryName + "</option>");
            }
            if(document.title=="adppupdate"){
                //修改页面
                alert(2);
                $("[name=categoryLevel1]").find("option[value='" + sessionStorage.getItem("appinfo_upd").categoryLevel1 + "']").prop("selected", true);
            }
            form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
        }
    });

})
