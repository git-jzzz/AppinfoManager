$(function () {
    layui.use('form', function () {
        var form = layui.form
        layer = layui.layer;
        //监听提交
        form.on('submit(login)', function (data) {
            layer.msg("提交");
            $.ajax({
                url: serverUrl + "/bu/buloginyan",
                data: data.field,
                type: 'post',
                dataType: 'json',
                success: function (result) {
                    if (result.code == '200') {
                        var userName = result.data.userName;
                        sessionStorage.setItem("backerUser", userName);
                        location.href = 'bumain.html';
                    } else {
                        layer.msg(result.msg);
                    }
                },
                error: function (xhr) {
                    console.log(xhr);
                    layer.msg(xhr.data.msg);
                }
            })
            return false;
        });
    });
})