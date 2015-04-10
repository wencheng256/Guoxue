<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="bean.data"></jsp:useBean>
<%!int pagesize=20; %>
<%
request.setCharacterEncoding("utf-8");
int type=request.getParameter("type")==null?1:Integer.parseInt(request.getParameter("type"));
int pages=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
int	clas=Integer.parseInt(request.getParameter("class"));


String count="SELECT count(*) from user where `check`="+type;
data.query(count);
ResultSet rs=data.getRs();
rs.next();
int con=Integer.parseInt(rs.getString(1));

int maxpage=con/pagesize+1;

int prev=pages>1?pages-1:1;
int next=pages<maxpage?pages+1:maxpage;


String sql=type==1?"SELECT a.num,a.name,b.name,c.score,c.time from `user` as a,class as b,grade as c WHERE b.id=a.class AND c.`user`=a.num AND class="+clas+" ORDER BY c.score DESC, c.time ASC":
	"SELECT a.num,a.name,b.name,'未答题','未答题' from user as a,class as b where a.class=b.id and a.`check`=0 AND class="+clas;

data.query(sql);
rs=data.getRs();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>学生选手列表</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/send.css" />
  <link rel="stylesheet" href="Style/person.css" />
</head>
<body>
    <table>
    <tr>
      <td class="title_green" colspan="7">山东大学（威海）学生选手列表</td>
    </tr>
    <tr>
    <td colspan="7"><a href="classperson.jsp?type=1&class=<%=clas%>"><button class="but">按照成绩排序</button></a><a href="classperson.jsp?type=0&class=<%=clas%>"><button class="but">尚未答题学生</button></a></td>
    </tr>
    <tr>
   	  <td width="150px">排名</td>
      <td width="150px">学号</td>
      <td width="150px">姓名</td>
      <td width="150px">班级</td>
      <td width="150px">成绩</td>
      <td width="150px">用时</td>
      <td width="150px">操作</td>
    </tr>

    <%int i=1;
    while(rs.next()){%>
    <tr>
      <td width="150px"><%=i++ %></td>
      <td width="150px"><%=rs.getString(1) %></td>
      <td width="150px"><%=rs.getString(2) %></td>
      <td width="150px"><%=rs.getString(3) %></td>
      <td width="150px"><%=rs.getString(4) %></td>
      <td width="150px"><%=rs.getString(5) %></td>
      <td width="150px"><a href="reset?num=<%=rs.getString(1) %>">重置分数</a>/<a href="deleteperson?num=<%=rs.getString(1) %>">删除此人</a></td>
    </tr>
    <%}%>

     <tr>
      <td style="textalign:center;"colspan="7"><a href="classperson.jsp?page=<%=prev%>&type=1&class=<%=clas%>" class="page">上一页</a><span class="xin">当前第 <%=pages%> 页共 <%=maxpage%>  页 <%=con%> 个学生</span><a href="classperson.jsp?page=<%=next%>&type=1&class=<%=clas%>" class="page">下一页</a></td>
   	  </tr>
    </table>
</body>
</html>