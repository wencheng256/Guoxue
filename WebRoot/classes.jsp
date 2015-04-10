<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="data" class="bean.data" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	int	now=Integer.parseInt(request.getParameter("page")==null?""+1:request.getParameter("page"));
	int prev=0,next=0;
	int maxpage=0,pagesize=20;
	prev=now==1?1:now-1;
	String sql="SELECT count(a.id),b.name,c.name,b.id from `user` as a,class as b,school as c WHERE a.class=b.id and b.school=c.id order by b.school";
	
	if(request.getParameter("class")!=null)
	{
		String where="'%"+request.getParameter("class")+"%'";
		sql="SELECT count(a.id),b.name,c.name,b.id from `user` as a,class as b,school as c WHERE a.class=b.id and b.school=c.id AND b.name like "+where;
	}
	
	
	data.query(sql);
	ResultSet rs=data.getRs();
	rs.last();
	int con=rs.getRow();
	
	maxpage=con%pagesize==0?con/pagesize:con/pagesize+1;
	
	next=now==con?con:now+1;
	
	rs.beforeFirst();
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
    <table>
    <tr>
      <td class="title_orange" colspan="5">山东大学（威海）班级列表</td>
    </tr>
    <tr><td colspan="5"><form action="classes.jsp" method="post"><input type="text" name="class"/><input type="submit" value="搜索班级" id="add" style="margin-left:20px;"/></form></td></tr>
    <tr>
      <td width="150px">班级编号</td>
      <td>班级名</td>
       <td>学院名</td>
       <td>参与学生数量</td>
      <td width="150px">操作</td>
    </tr>
    <%while(rs.next()){ %>
       <tr>
      <td width="150px"><%=i++%></td>
      <td><%=rs.getString(2) %></td>
       <td><%=rs.getString(3) %></td>
       <td><%=rs.getString(1) %></td>
      <td width="150px"><a href="classperson.jsp?class=<%=rs.getString(4)%>">查看成绩</a></td>
   	 </tr>
   	 
   	  <tr>
      <td style="textalign:center;"colspan="6"><a href="classes.jsp?page=<%=prev%>" class="page">上一页 </a><span class="xin">当前第 <%=now%> 页共 <%=maxpage%>  页 <%=con%> 个班级 </span><a href="classes.jsp?page=<%=next%>"class="page">下一页</a></td>
   	  </tr>
   	  
    <%} %>
    </table>
</body>
</html>