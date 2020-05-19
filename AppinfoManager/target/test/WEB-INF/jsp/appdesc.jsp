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
    
    <title>appcheck</title>
    
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
      <textarea name="appInfo" style="width: 500px;" placeholder="请输入内容" class="layui-textarea">${appinfo.appInfo}</textarea>
    </div>
  </div>
   <div class="layui-form-item">
     <label class="layui-form-label">LOGO图片*：</label>
    <div class="layui-upload">
  <div class="layui-upload-list">
  <p> 
  <img class="layui-upload-img" src="http://localhost:8080/upload/${appinfo.logoLocPath}" width="100px" height="100px" id="demo1" />
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<a href="JavaScript:history.back(-1)" class="layui-btn">返回</a>
  </p>
  </div>
</div>  
  </div>
 
  
  
    </form>
    
      <h2>历史版本信息</h2>
    <table class="layui-hide" id="demo" lay-filter="test"></table>
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
       
  var appId="${appinfo.id}";
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
         });
     </script>
  
  
 
</html>
