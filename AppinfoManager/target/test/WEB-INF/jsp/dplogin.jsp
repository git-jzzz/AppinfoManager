<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>APP用户登录</title>
    
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/lib/layui/css/layui.css" />
	  <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/statics/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/xadmin.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon" />
     <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/xadmin.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
  
  </head>
  
  <body class="login-bg">
  	
    
    <div class="login">
        <div class="message">
        <c:choose>
        	<c:when test="${d!=null}">后台管理系统</c:when>
        	<c:otherwise>APP开发者平台</c:otherwise>
        </c:choose>  </div>
        <div id="darkbannerwrap"></div>
         <c:choose>
        	<c:when test="${d!=null}">
        	 <form action="bu/buloginyan.html" method="post" class="layui-form" >
            <input name="userCode" placeholder="请输入用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="userPassword" lay-verify="required"  placeholder="请输入密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
        		
        	</c:when>
        	<c:otherwise>
        	  <form action="dev/dploginyan.html" method="post" class="layui-form" >
            <input name="devCode" placeholder="请输入用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="devPassword" lay-verify="required"  placeholder="请输入密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
        	</c:otherwise>
        </c:choose>
        
        
      
    </div>
    
     <script>
       $(function(){
        	var msg="${msg}";
           if(msg!=""){
           layui.use("layer",function(){
             layer.alert(msg, {icon: 2}); 
           })
           }
       })
          
    </script>
    

    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              
            });
        })

        
    </script>

    
   
</body>
  
</html>
