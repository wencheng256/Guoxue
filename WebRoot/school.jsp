<%@ page language="java"  import="java.sql.*" pageEncoding="utf-8"%>
<jsp:useBean id="data" class="bean.data"></jsp:useBean>
<%
	String sql="select a.id,a.name,b.count from school as a LEFT JOIN(SELECT a.id,a.name,a.school,count(a.id) as count FROM class as a GROUP BY school) as b ON b.school=a.id;";
	data.query(sql);
	ResultSet rs=data.getRs();
%>
<%int i=1;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>学院列表</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/send.css" />
</head>
<body>
  <form action="sendemail" method="post">
    <table>
    <tr>
      <td class="title" colspan="4">山东大学（威海）学院列表</td>
    </tr>
     <tr><td colspan="4"><a href="addschool.jsp"><input type="button" value="添加学院" id="add"/></a></td></tr>
    <tr>
      <td width="150px">学院编号</td>
      <td>学院名</td>
      <td width="150px">班级数量</td>
      <td width="150px">操作</td>
    </tr>
    <%while(rs.next()){ %>
    <tr>
      <td width="150px"><%=i++%></td>
      <td><%=rs.getString(2)%></td>
      <td width="150px"><%=rs.getInt(3)%></td>
      <td width="150px"><a href="addclass.jsp">添加</a>/<a href="changeschool.jsp?id=<%=rs.getString(1)%>">修改</a>/<a href="delete?table=school&id=<%=rs.getString(1)%>">删除</a></td>
    </tr>
    <%} %>
    </table>
  </form>
</body>
</html>
