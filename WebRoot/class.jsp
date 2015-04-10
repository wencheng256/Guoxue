<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="data" class="bean.data" scope="page"></jsp:useBean>
<%
	String sql="SELECT class.id,class.name,school.name from class,school where class.school=school.id order by class.school";
	data.query(sql);
	ResultSet rs=data.getRs();
	int i=1;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>学院列表</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/send.css" />
   <link rel="stylesheet" href="Style/class.css" />
</head>
<body>
  <form action="sendemail" method="post">
    <table>
    <tr>
      <td class="title_orange" colspan="4">山东大学（威海）班级列表</td>
    </tr>
    <tr><td colspan="4"><a href="addclass.jsp"><input type="button" value="添加班级" id="add"/></a></td></tr>
    <tr>
      <td width="150px">班级编号</td>
      <td>班级名</td>
       <td>学院名</td>
      <td width="150px">操作</td>
    </tr>
    <%while(rs.next()){ %>
       <tr>
      <td width="150px"><%=i++%></td>
      <td><%=rs.getString(2) %></td>
       <td><%=rs.getString(3) %></td>
      <td width="150px"><a href="changeclass.jsp?id=<%=rs.getString(1)%>">修改</a>/<a href="delete?table=class&id=<%=rs.getString(1)%>">删除</a></td>
   	 </tr>
    <%} %>
    </table>
  </form>
</body>
</html>