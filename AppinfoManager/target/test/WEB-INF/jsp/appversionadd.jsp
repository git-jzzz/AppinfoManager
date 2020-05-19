<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'appversionadd.jsp' starting page</title>
    
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
  	
  	/* 
	layui table 填写数据内容过多，自动换行完美解决
 */
  		.layui-table-cell {
    font-size:14px;
    padding:0 5px;
    height:auto;
    overflow:visible;
    text-overflow:inherit;
    white-space:normal;
    word-break: break-all;
    
}

.layui-input{
width:500px;
}

  	</style>
  </head>
  <body>
    <h2>
 <c:choose>
  	<c:when test="${update!=null}"> 修改APP最新版本信息</c:when>
  	<c:otherwise> 新增APP版本信息</c:otherwise>
  </c:choose>   
   </h2><br/><br/>
    <h2>历史版本信息</h2>
    <table class="layui-hide" id="demo" lay-filter="test"></table>
    
    
     <h2><c:choose>
  	<c:when test="${update!=null}"> 修改最新版本信息</c:when>
  	<c:otherwise> 新增版本信息</c:otherwise>
  </c:choose>   </h2>
     
     <form  style="margin-left: 15%" class="layui-form" action="">
     	 <div class="layui-form-item">
    <label class="layui-form-label">版本号*</label>
    <div class="layui-input-block">
      <input type="text"  name="versionNo"
      	<c:if test="${update!=null}">
      	readonly="readonly"
      	</c:if>
       value="${version.versionNo}"   lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">版本大小*</label> 
    <div class="layui-input-block">
      <input type="text" name="versionSize" value="${version.versionSize}" lay-verify="num" lay-reqtext="必填项!" placeholder="请输入软件大小,单位为MB" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">发布状态*</label> 
      <input value="3" name="publishStatus" value="${version.publishStatus}" lay-verify="num" type="hidden"   autocomplete="off" class="layui-input">
       	预发布
  </div>
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">版本简介*</label>
    <div class="layui-input-block">
      <textarea name="versionInfo"  style="width: 500px;" placeholder="请输入内容" class="layui-textarea">${version.versionInfo}</textarea>
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
   <label class="layui-form-label">apk文件*</label>
    <div class="layui-input-block">
       <button  type="button" class="layui-btn layui-btn-primary" id="apkupload"><i class="layui-icon"></i>浏览</button>
       <c:if test="${update!=null}">
       <span id="src5">${version.apkFileName}</span>
       	
       	 <button id="link" type="button" class="layui-btn"><i class="layui-icon"></i></button>
       	 
       	 <button id="del" type="button" class="layui-btn"><i class="layui-icon"></i></button>
       	   </c:if>
    </div>
  </div>
 
  
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
     <a href="JavaScript:history.back(-1)" class="layui-btn">返回</a>
    </div>
  </div>
  
   <input type="hidden" name="id" value="${version.id}"  />

  <input type="hidden" name="appId" value="${appId}" value="${version.downloadLink}" />
   <input type="hidden" name="downloadLink" value="${version.downloadLink}" id="src1"   />
 	  <input type="hidden" name="apkLocPath" id="src2"  value="${version.apkLocPath}"/>
 	  <input type="hidden" name="apkFileName" id="src3"value="${version.apkFileName}"  />
     </form>
     
    <script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
 

 
  upload.render({ //允许上传的文件后缀
    elem: '#apkupload'
    ,url: 'sys/apkupload.html'
    ,accept: 'file' //普通文件
    ,exts: 'zip|apk' //只允许上传压缩文件 apk文件
     ,size: 60 //限制文件大小，单位 KB
    ,done: function(res){
    
     if(res.code > 0){
        return layer.msg('上传失败');
      }
     //上传成功
      $("#src1").val(res.data.src1);
      $("#src2").val(res.data.src2);
      $("#src3").val(res.data.src3);
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
       
  var appId="${appId}";
  //第一个实例
  table.render({
    elem: '#demo'
    ,url: 'sys/appversionlist.html?appId='+appId //数据接口
    ,cols: [[ //表头
     {field: 'appName', title: '软件名称'}
      ,{field: 'versionNo', title: '版本号'}
      ,{field: 'versionSize', title: '版本大小'}
      ,{field: 'publishStatusName', title: '发布状态'} 
      ,{field: 'downloadLink', title: 'APK文件下载'}
      ,{field: 'modifyDate', title: '最新更新时间'}
    ]]
  });
  
       
       
       
        	form.verify({
  num: function(value, item){ //value：表单的值、item：表单的DOM对象
    if(!new RegExp("^[1-9]+[0-9]*\.?[0-9]*$").test(value)){
      return '请输入正确的数字';
    }
  }
});
  //监听提交
  	 form.on('submit(demo1)',function (data) {
            console.log(data.field);
            $.ajax({
                url:'sys/versionadd.html',
                type:"post",
                data:data.field,
                dataType:"json",
                success:function (data) {
                    if(data.result=="success"){
                    	layer.alert("操作成功！");
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
    
   <script>
 $(function(){
 	$("#link").click(function(){
 		if($("#src5").html()!=""){
 			layer.alert("下载链接:${version.downloadLink}",{icon:1});
 		}else{
   			layer.alert("无apk信息",{icon:2});
   		}
 	})
 	
 	$("#del").click(function(){
 		if($("#src5").html()!=""){
 		   
   		$.getJSON("sys/delversionsrc.html","id=${version.id}&apkFileName="+$("[name=apkFileName]").val(),function(data){
   			if(data.result="success"){
   				layer.alert("删除成功！",{icon:1})
   				$("[id^=src]").val("");
   				$("#src5").html("");
   				}else if(data.result=="lose"){
  					layer.alert("系统繁忙,请联系管理员！",{icon:2});
  				}else{
  					layer.alert("服务器不存在此路径！",{icon:2});
  				}
   			}) 
   		}else{
   			layer.alert("无apk信息",{icon:2});
   		}
 	
 	});
 	
 	
 })
   
   	
   </script>
    
    
  </body>
</html>
