<%@ page language="java"  import="java.sql.*" pageEncoding="utf-8"%>
<jsp:useBean id="data" class="bean.data"></jsp:useBean>
<%
	String sql="select a.id,a.name,b.count,b.co from school as a LEFT JOIN(SELECT a.id,a.name,a.school,c.coun as co,count(a.id) as count FROM class as a LEFT JOIN (select count(a.id) as coun,b.school as school from user as a ,class as b  where a.class=b.id GROUP BY(class)) as c ON a.school=c.school GROUP BY a.school) as b ON b.school=a.id";
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
      <td class="title" colspan="5">山东大学（威海）学院列表</td>
    </tr>
    <tr>
      <td width="150px">学院编号</td>
      <td>学院名</td>
      <td width="150px">班级数量</td>
      <td width="150px">参与学生数量</td>
      <td width="150px">操作</td>
    </tr>
    <%while(rs.next()){ %>
    <tr>
      <td width="150px"><%=i++%></td>
      <td><%=rs.getString(2)%></td>
      <td width="150px"><%=rs.getInt(3)%></td>
      <td width="150px"><%=rs.getInt(4)%></td>
      <td width="150px"><a href="schoolclass.jsp?id=<%=rs.getInt(1)%>">查看班级</a></td>
    </tr>
    <%} %>
    </table>
  </form>
</body>
</html>
