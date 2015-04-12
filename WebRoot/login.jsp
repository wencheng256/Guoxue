<%@ page language="java" import="com.*" contentType="text/html; charset=utf-8" %>
<%MyLogger.open(); %>
<%
	Admin admin=(Admin)session.getAttribute("admin");
	if(admin!=null)
	{
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>拼图后台管理-管理员登录</title>
    <link rel="stylesheet" href="Style/pintuer.css">
    <link rel="stylesheet" href="Style/admin.css">
</head>

<body>
<div class="container">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move">
            <br /><br />
            <div class="media media-y">
                <img src="images/logo.png" class="radius" alt="后台管理系统" />
            </div>
            <br /><br />
            <form action="login" method="post">
            <div class="panel">
                <div class="panel-head"><strong>登录拼图后台管理系统</strong></div>
                <div class="panel-body" style="padding:30px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input" name="name" placeholder="登录账号" />
                            <span class="icon icon-user"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input" name="pass" placeholder="登录密码" />
                            <span class="icon icon-key"></span>
                        </div>
                    </div>
                </div>
                <div class="panel-foot text-center"><input type="submit" value="立即登录后台" class="button button-block bg-main text-big"></div>
            </div>
            </form>
            <div class="text-right text-small text-gray padding-top">基于拼图前端框架构建</div>
        </div>
    </div>
</div>

</body>
</html>