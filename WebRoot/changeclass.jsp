<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="data" class="bean.data"></jsp:useBean>
<%
	if(request.getParameter("id")==null)
	{
		response.sendRedirect("error.html");
		return;
	}
	int id=Integer.parseInt(request.getParameter("id"));
	String sql="SELECT name,school from class where id="+id;
	data.query(sql);
	ResultSet rs=data.getRs();
	rs.next();
	String name=rs.getString(1);
	int school=rs.getInt(2);
%>
<%
	sql="SELECT * FROM school";
	data.query(sql);
	rs=data.getRs();
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
      <td><input id="towho" type="text" name="name" value="<%=name%>"/></td>
    </tr>
    <tr>
      <td width="100px">所属学院：</td>
      <td><select name="school">
      <%while(rs.next()){ %>
        <option value="<%=rs.getString(1)%>"  <%if(Integer.parseInt(rs.getString(1))==school){out.println("selected='selected'");} %>><%=rs.getString(2)%></option>
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