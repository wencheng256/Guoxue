<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="data" class="bean.data"></jsp:useBean>
<%
	String sql="SELECT * FROM school";
	data.query(sql);
	ResultSet rs=data.getRs();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>添加班级</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/send.css" />
   <link rel="stylesheet" href="Style/class.css" />
</head>
<body>
  <form action="addclass" method="post">
    <table>
    <tr>
      <td class="title_orange" colspan="2">添加班级</td>
    </tr>
    <tr>
      <td width="100px">班级名称：</td>
      <td><input id="towho" type="text" name="name" /></td>
    </tr>
    <tr>
      <td width="100px">所属学院：</td>
      <td><select name="school">
      <%while(rs.next()){ %>
        <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
        <%} %>
      </select></td>
    </tr>
    <tr>
      <td colspan="2"><input id="su" type="submit" value="提交" /></td>
    </tr>
    </table>
  </form>
</body>
</html>