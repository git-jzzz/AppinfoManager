<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'appadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layuiadmin/style/admin.css" media="all">
    <script src="${pageContext.request.contextPath}/statics/layuiadmin/layui/layui.js"></script>  
  <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js">
  
  </script>
  
  	<style type="text/css">
	.layui-input{
		width:600px;
	}
</style>
  </head>
  
  <body>
  <h2>新增APP基础信息</h2>
    <form style="margin-left: 15%" class="layui-form" action="">
    	  <div class="layui-form-item">
    <label class="layui-form-label">软件名称*:</label>
    <div class="layui-input-block">
      <input type="text" name="softwareName" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入软件名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">APK名称*:</label>
    <div class="layui-input-block">
      <input type="text" name="aPKName" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入APK名称" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">支持ROM*:</label>
    <div class="layui-input-block">
      <input type="text" name="supportROM" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入支持的ROM" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">界面语言*:</label>
    <div class="layui-input-block">
      <input type="text" name="interfaceLanguage" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入软件支持的界面语言" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">软件大小*:</label>
    <div class="layui-input-block">
      <input type="text" name="softwareSize" lay-verify="num2" lay-reqtext="必填项!" placeholder="请输入软件大小,单位为MB" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">下载次数*:</label>
    <div class="layui-input-block">
      <input type="text" name="downloads" lay-verify="num" lay-reqtext="必填项!" placeholder="请输入下载次数" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">所属平台</label>
    <div class="layui-input-block">
      <select name="flatformId" lay-filter="aihao">
       
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">一级分类*</label>
    <div class="layui-input-block">
      <select lay-verify="required" lay-filter="c1"  name="categoryLevel1">
       
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">二级分类*</label>
    <div class="layui-input-block">
      <select lay-verify="required" lay-filter="c1"  name="categoryLevel2">
       
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">三级分类*</label>
    <div class="layui-input-block">
      <select lay-verify="required" name="categoryLevel3">
       
      </select>
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">app状态*:</label>
    <div class="layui-input-block">
    <input type="hidden" name="status"  value="1"/>
      待审核
    </div>
  </div>
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">应用简介*：</label>
    <div class="layui-input-block">
      <textarea name="appInfo" style="width: 500px;" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
   <div class="layui-form-item">
     <label class="layui-form-label">LOGO图片*：</label>
    <div class="layui-upload">
 	 <input type="hidden" name="logoPicPath" id="src1"  />
 	  <input type="hidden" name="logoLocPath" id="src2"  />
  <div class="layui-upload-list">
   <button type="button" class="layui-btn" id="test1">选择文件</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img class="layui-upload-img" width="100px" height="100px" id="demo1">
    <p id="demoText"></p>
  </div>
</div>  
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
     <a href="JavaScript:history.back(-1)" class="layui-btn">返回</a>
    </div>
  </div>
  
    </form>
  </body>
  
  
  <script>
  
  	$(function(){
  	var isTrue=true;
  		//重名验证
  		$("[name=aPKName]").blur(function(){
  		if($(this).val()!=""){
  			$.getJSON("sys/findbyapkname.html","aPKName="+$(this).val(),function(data){
  			if(data.result=="exits"){
  				layer.msg("APK名称已存在,不可使用~");
  				isTrue=false;
  			}else{
  			layer.msg("APK名称可用~");
  			isTrue=true;
  			}
  		})
  		}
  		})
  		
  	})
  </script>
  
  <script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //普通图片上传
  var uploadInst = upload.render({
    elem: '#test1'
    ,url: 'sys/logoimg.html'
      ,exts: 'jpg|png|jpeg' //只允许上传压缩文件 apk文件
     ,size: 50 //限制文件大小，单位 KB
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo1').attr('src', result); //图片链接（base64）
      });
    }
    ,done: function(res){
      //如果上传失败
      if(res.code > 0){
        return layer.msg('上传失败');
      }
      
       //上传成功
      $("#src1").val(res.data.src1);
      $("#src2").val(res.data.src2);
     
    }
    ,error: function(){
      //演示失败状态，并实现重传
      var demoText = $('#demoText');
      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
      demoText.find('.demo-reload').on('click', function(){
        uploadInst.upload();
      });
    }
  });
  
   });
   	
   </script>
  
  <script>
  
  var  form;
  layui.config({
    base: '${pageContext.request.contextPath}/statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table','form'], function(){
    var table = layui.table;
       form = layui.form;
       
       
       //获取下拉框
	  		$.getJSON("sys/datedictionlist.html",function(datas){
	  				 for(var i=0;i<datas.length;i++){
	                    var item=datas[i];
	                    if(item.typeCode=="APP_STATUS"){
	                    	 $("[name=status]").append("<option value="+item.valueId+">"+item.valueName+"</option>");
	                    }else if(item.typeCode=="APP_FLATFORM"){
	                    	 $("[name=flatformId]").append("<option value="+item.valueId+">"+item.valueName+"</option>");
	                    }
	                }
	  				form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
	  			})
	  			
	  			$.getJSON("sys/categoryList.html",function(data){
	  				for(var i=0;i<data.length;i++){
	  					$("[name=categoryLevel1]").append("<option value="+data[i].id+">"+data[i].categoryName+"</option>");
	  				}
	  				form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
	  			})
	  			
	  			//三级分类
	  			form.on('select(c1)', function(data){
				if(data.value>2){
					$("[name=categoryLevel3]").html("");
				}else{
					$("[name=categoryLevel2]").html("");
				}
			
			$.getJSON("sys/categoryList.html?parentId="+data.value,function(datas){
				for(var i=0;i<datas.length;i++){
				if(data.value>2){
				$("[name=categoryLevel3]").append("<option value="+datas[i].id+">"+datas[i].categoryName+"</option>");
				}else{
				$("[name=categoryLevel2]").append("<option value="+datas[i].id+">"+datas[i].categoryName+"</option>");
				}
  					
  				}
  				form.render('select');//select是固定写法 不是选择器   渲染 下拉框   否则不会刷新数据
				})
			});
       
       
       
       
       form.verify({
  num: function(value, item){ //value：表单的值、item：表单的DOM对象
    if(!new RegExp("^[1-9]+[0-9]*$").test(value)){
      return '请输入正确的数字';
    }
  },
   num2: function(value, item){ //value：表单的值、item：表单的DOM对象
    if(!new RegExp("^[1-9]+[0-9]*\.?[0-9]*$").test(value)){
      return '请输入正确的数字';
    }
  }
});

      
       
  //监听提交
  	 form.on('submit(demo1)',function (data) {
            console.log(data.field);
            $.ajax({
                url:'sys/appaddsave.html',
                type:"post",
                data:data.field,
                dataType:"json",
                success:function (data) {
                    if(data.result=="success"){
                    	layer.alert("新增成功！");
                    	history.back(-1);
                    }else{
                    	layer.alert("程序繁忙,请联系系统管理员！");
                    }
                }
            });
            return false;
        });
         });
  </script>
</html>
