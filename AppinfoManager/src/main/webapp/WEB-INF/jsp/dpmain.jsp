<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>开发者主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/lib/layui/css/layui.css" />
	  <script type="text/javascript" src="${pageContext.request.contextPath}/statics/lib/layui/layui.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
  </head>
  <body  class="layui-layout-body">
    	<div class="layui-layout layui-layout-admin">
      	<div class="layui-header">
    		<div class="layui-logo">APP BMS</div>
    		
    		<ul class="layui-nav layui-layout-right">
      			<li class="layui-nav-item">
        		  <a href="javascript:;">
          			<img src="1.jpg" class="layui-nav-img">开发者用户：${du.devName}
        		  </a>
        		  <dl class="layui-nav-child">
          			<dd><a href="javascript:;">基本资料</a></dd>
        		  </dl>
      			</li>
      			<li class="layui-nav-item"><a href="dev/dploginout.html">LoginOut</a></li>
    		</ul>
  		</div>
  
  		<div class="layui-side layui-bg-black">
    	  <div class="layui-side-scroll">
      		<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      		<ul class="layui-nav layui-nav-tree"  lay-filter="test">
        		<li class="layui-nav-item layui-nav-itemed">
          			<a class="" href="javascript:;">APP账户管理</a>
          			<dl class="layui-nav-child">
            			<dd><a href="javascript:;" target="frame1">修改密码</a></dd>
          			</dl>
        		</li>
        		<li class="layui-nav-item">
          			<a href="javascript:;">APP应用管理</a>
          			<dl class="layui-nav-child">
            			<dd><a href="sys/tolist.html" onclick="del()" target="frame1">APP维护</a></dd>
          			</dl>
          			
        		</li>
      		</ul>
    	   </div>
  		</div>
 
  		<div class="layui-body">
  			 <h1 style="font-size: 35px" id="d">欢迎你，${du.devName}。</h1>
    		<!-- 内容主体区域 -->
    		<div style="padding: 15px;">
              <iframe name="frame1" id="frame1" width="1200" height="900" frameborder="0">
              </iframe>
            </div>
  		</div>
  
  		<div class="layui-footer">
    		<!-- 底部固定区域 -->     
    		© layui.com - 底部固定区域
  		</div>
</div>

<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>

<script>
	  function del(){
		$("#d").remove();
}
</script>
  </body>
  
  
 <!--  <body> -->
  
  <!-- </body> -->
</html>
