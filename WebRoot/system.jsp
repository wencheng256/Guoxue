<%@ page language="java" import="com.*" contentType="text/html; charset=utf-8" %>
<%
	Admin admin=(Admin)session.getAttribute("admin");
	if(admin==null)
	{
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>山东大学（威海）国学达人后台系统</title>
    <link rel="stylesheet" href="Style/pintuer.css">
    <link rel="stylesheet" href="Style/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/admin.js"></script>
    <link type="image/x-icon" href="/favicon.ico" rel="shortcut icon" />
    <link href="/favicon.ico" rel="bookmark icon" />
    <script type="text/javascript">
    	alert("本页中所有操作均涉及到数据安全问题，请慎重操作！");
    </script>
</head>

<body>
<div class="lefter">
    <div class="logo"><a href="#" target="_blank"><img src="images/logo.png" alt="后台管理系统" /></a></div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
            	<a class="button button-little bg-main" href="#" target="_blank">前台首页</a>
                <a class="button button-little bg-yellow" href="login.html">注销登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
                <li><a href="index.jsp" class="icon-home">管理</a>
                    <ul><li><a href="exercise.jsp" target="right">题库管理</a></li><li><a href="school.jsp" target="right">学院管理</a></li><li><a href="class.jsp" target="right">班级管理</a></li><li ><a href="student.jsp" target="right">学生管理</a></li></ul>
                </li>
                <li><a href="search.jsp" class="icon-cog"> 查询</a>
            		<ul><li><a href="#">全局设置</a></li><li class="active"><a href="#">系统设置</a></li><li><a href="#">会员设置</a></li><li><a href="#">积分设置</a></li></ul>
                </li>
                <li class="active"><a href="system.jsp" class="icon-file-text"> 设置</a>
					<ul><li><a href="cleanexercise">清空题库</a></li><li><a href="resetall">所有学生重置</a></li><li><a href="#">管理员管理</a></li></ul>
                </li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，admin，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="index.jsp" class="icon-home"> 开始</a></li>
                <li>后台首页</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
	<iframe src="information.html" name="right"  width="100%" height="2250px"></iframe>
</div>


</body>
</html>