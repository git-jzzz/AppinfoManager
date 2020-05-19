layui.config({
    base: '../../statics/layuiadmin/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table', 'form','jquery'], function () {
    var table = layui.table,
    form = layui.form,
    $=layui.$;
    table.set({headers:{token_back: localStorage.getItem("token_back")}})
//获取下拉框
    $.ajax({
        type: "GET",
        url: serverUrl + "/sys/back/datedictionlist",
        success: function (datas) {
//token鉴权
            register_back(datas.code);
            for (var i = 0; i < datas.data.length; i++) {
                var item = datas.data[i];
                if (item.typeCode == "APP_STATUS") {
                    $("[name=status]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
                } else if (item.typeCode == "APP_FLATFORM") {
                    $("[name=flatformId]").append("<option value=" + item.valueId + ">" + item.valueName + "</option>");
                }
            }
            form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
            if(datas.token!=null){
                localStorage.setItem("token_back",datas.token);
            }
        }
    });

    $("[name=categoryLevel1]").append("<option value=''>全部</option>");

    $.ajax({
        type: "GET",
        url: serverUrl + "/sys/back/categoryList",
        success: function (data) {
            //token鉴权
            register_back(data.code);
            for (var i = 0; i < data.data.length; i++) {
                $("[name=categoryLevel1]").append("<option value=" + data.data[i].id + ">" + data.data[i].categoryName + "</option>");
            }
            form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据

            if(data.token!=null){
                layer.alert(1);
                localStorage.setItem("token_back",datas.token);
            }
        }
    });


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
                $.ajax({
                    type: "GET",
                    url:serverUrl + "/sys/back/categoryList?parentId=" + val,
                    success: function (data) {
                        //token鉴权
                        register_back(data.code);
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
                        if(data.token!=null){
                            localStorage.setItem("token_back",datas.token);
                        }
                    }
                });
            }
        }
    });


    table.render({
        elem: '#info'
        , url: serverUrl + '/sys/back/list?status=1'//数据接口
        , cellMinWidth: 80 //全局定义常规单x元格的最小宽度，layui 2.2.1 新增
        , page: true //开启分页
        , limits: [3, 4, 5]
        , limit: 3
        , cols: [[
            {field: 'softwareName', width: 100, title: '软件名称'}
            , {field: 'aPKName', width: 100, title: 'APK名称'}
            , {field: 'softwareSize', width: 100, title: '软件大小/M'}
            , {field: 'flatformName', width: 100, title: '所属平台'}
            , {field: 'categoryContext', title: '所属分类(一级分类、二级分类、三级分类)', width: '20%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
            , {field: 'statusName', width: 100, title: '状态'}
            , {field: 'downloads', width: 80, title: '下载次数'}
            , {field: 'versionNo', width: 80, title: '最新版本号'}
            , {field: 'versionId', title: 'vid', width: 50, hide: true}
            , {field: 'id', title: 'id', width: 50, hide: true}
            , {title: '操作',width: 200, align: 'center', toolbar: '#barDemo'}
        ]]
    });
    //监听提交 lay-filter="search"
    form.on('submit(search)', function (data) {
        var formData = data.field;
        var softwareName = formData.softwareName,

            url = formData.url,
            icon = formData.icon,
            parent_id = formData.parent_id;
        //执行重载
        table.reload('info', {
            page: {
                curr: 1 //重新从第 1 页开始
            }
            , where: {//这里传参  向后台
                softwareName: softwareName,
                status: formData.status,
                flatformId: formData.flatformId,
                categoryLevel1: formData.categoryLevel1,
                categoryLevel2: formData.categoryLevel2,
                categoryLevel3: formData.categoryLevel3,
                i: "1"
                //可传多个参数到后台...  ，分隔
            }
            , url: serverUrl + '/sys/back/list'//后台做模糊搜索接口路径
            , method: 'post'
        });
        return false;//false：阻止表单跳转  true：表单跳转
    });


    //监听行工具事件
    table.on('tool(info)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'sel') {
            if (data.versionNo == null) {
                layer.alert("该APP下没有上传最新版本,不能进行审核操作！");
            } else {
                sessionStorage.setItem("id", data.id);
                sessionStorage.setItem("versionId", data.versionId);
                location.href = "appcheck.html";
                //查看
            }
        }
    });
})