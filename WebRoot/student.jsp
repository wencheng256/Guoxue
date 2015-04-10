<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="data" class="bean.data" scope="page"></jsp:useBean>
<%
String sql="SELECT a.num,a.name,b.name from `user` as a,class as b WHERE b.id=a.class order by a.class";
data.query(sql);
ResultSet rs=data.getRs();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>学生选手列表</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/send.css" />
</head>
<body>
  <form action="sendemail" method="post">
    <table>
    <tr>
      <td class="title_pink" colspan="3">山东大学（威海）学生选手列表</td>
    </tr>
    <tr>
      <td width="150px">学号</td>
      <td width="150px">姓名</td>
      <td width="150px">班级</td>
    </tr>

    <%while(rs.next()){ %>
    <tr>
      <td width="150px"><%=rs.getString(1) %></td>
      <td width="150px"><%=rs.getString(2) %></td>
      <td width="150px"><%=rs.getString(3) %></td>
    </tr>
    <%} %>
    </table>
  </form>
</body>
</html>