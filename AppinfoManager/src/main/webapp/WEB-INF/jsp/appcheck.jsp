<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>appdesc</title>
    
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
  <h2>APP基础信息</h2>
    <form style="margin-left: 15%" class="layui-form" action="">
    	  <div class="layui-form-item">
    <label class="layui-form-label">软件名称*:</label>
    <div class="layui-input-block">
      <input type="text" readonly="readonly" name="softwareName" value="${appinfo.softwareName}" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入软件名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">APK名称*:</label>
    <div class="layui-input-block">
      <input type="text"  name="aPKName" readonly="readonly" value="${appinfo.aPKName}" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入APK名称" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">支持ROM*:</label>
    <div class="layui-input-block">
      <input type="text" readonly="readonly" name="supportROM" value="${appinfo.supportROM}" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入支持的ROM" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">界面语言*:</label>
    <div class="layui-input-block">
      <input type="text" readonly="readonly" name="interfaceLanguage" value="${appinfo.interfaceLanguage}" lay-verify="required" lay-reqtext="必填项!" placeholder="请输入软件支持的界面语言" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">软件大小*:</label>
    <div class="layui-input-block">
      <input type="text" readonly="readonly" name="softwareSize" value="${appinfo.softwareSize}" lay-verify="number" lay-reqtext="必填项!" placeholder="请输入软件大小,单位为MB" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">下载次数*:</label>
    <div class="layui-input-block">
      <input type="text" readonly="readonly" name="downloads" value="${appinfo.downloads}" lay-verify="number" lay-reqtext="必填项!" placeholder="请输入下载次数" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">所属平台</label>
    <div class="layui-input-block">
       <input type="text" readonly="readonly"  value="${appinfo.flatformName}" lay-reqtext="必填项!" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">所属分类*</label>
    <div class="layui-input-block">
       <input type="text" readonly="readonly"  value="${appinfo.categoryContext}" lay-reqtext="必填项!" autocomplete="off" class="layui-input">
    </div>
  </div>
 
  
   <div class="layui-form-item">
    <label class="layui-form-label">app状态*:</label>
    <div class="layui-input-block">
    <input type="text" readonly="readonly"  value="${appinfo.statusName}" lay-reqtext="必填项!" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">应用简介*：</label>
    <div class="layui-input-block">
      <textarea name="appInfo"  readonly="readonly" style="width: 500px;" placeholder="请输入内容" class="layui-textarea">${appinfo.appInfo}</textarea>
    </div>
  </div>
   <div class="layui-form-item">
     <label class="layui-form-label">LOGO图片*：</label>
    <div class="layui-upload">
  <div class="layui-upload-list">
  
  <img class="layui-upload-img" src="${pageContext.request.contextPath}${appinfo.logoLocPath}" width="100px" height="100px" id="demo1" />
   <button type="button" class="layui-btn" >审核通过</button>
    <button type="button" class="layui-btn">审核不通过</button>
  	<a href="JavaScript:history.back(-1)" class="layui-btn">返回</a>
  
  </div>
</div>  
  </div>
 
  
  
    </form>
    
      <h2>最新版本信息</h2>
       <form  style="margin-left: 15%" class="layui-form" action="">
     	 <div class="layui-form-item">
    <label class="layui-form-label">版本号*</label>
    <div class="layui-input-block">
      <input type="text"  name="versionNo"
     
       value="${version.versionNo}" readonly="readonly"   lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">版本大小*</label> 
    <div class="layui-input-block">
      <input type="text" readonly="readonly" name="versionSize" value="${version.versionSize}" lay-verify="num" lay-reqtext="必填项!" placeholder="请输入软件大小,单位为MB" autocomplete="off" class="layui-input">
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
      <textarea  name="versionInfo"  readonly="readonly"  style="width: 500px;" placeholder="请输入内容" class="layui-textarea">${version.versionInfo}</textarea>
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
   <label class="layui-form-label">apk文件*</label>
    <div class="layui-input-block">
       	${version.apkFileName}
      	 <button id="link" type="button" class="layui-btn"><i class="layui-icon"></i></button>
    </div>
  </div>
  
     </form>
   
  </body>

 <script>
       var  form;
  layui.config({
    base: '${pageContext.request.contextPath}/statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table','form'], function(){
    var table = layui.table;
       form = layui.form;
       
       $("#link").click(function(){
 		if($("#src5").html()!=""){
 			alert("下载链接:${version.downloadLink}",{icon:1});
 		}else{
   			alert("无apk信息",{icon:2});
   		}
 	})
       
       $(".layui-btn").click(function(){
       		var status=3;
       		if($(this).html()=="审核通过"){
       			status=2;
       		}
       		if($(this).html()!="返回"){
       			$.getJSON("sys/setStatus.html","status="+status+"&id="+"${appinfo.id}",function(data){
       				if(data.result=="success"){
       					layer.alert("操作成功！");
       				history.back(-1);
       				}else{
       					layer.alert("程序繁忙,请联系系统管理员！");
       				}
       		})	
       		}
       		
       })	
         });
     </script>
  
  
 
</html>
