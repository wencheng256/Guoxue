<%@ page language="java" import="java.sql.*" contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="data" class="bean.data" scope="page"></jsp:useBean>
<jsp:useBean id="co" class="bean.CountPage" scope="page"></jsp:useBean>
<%
	int pagesize=20;
	String find;
	int now=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
	if((find=request.getParameter("find"))!=null)
	{
		if(find!="")
			now=co.count(Integer.parseInt(find));
	}
	int start=(now-1)*pagesize;
%>
<%!	int count=1;
	int prev=1;
	int next=1;
	int pnum;
%>
<%
	count=data.count("exercise");
	String sql="select content,select_a,select_b,select_c,select_d,select_correct,id,num from exercise LIMIT "+start+","+pagesize+";";
	data.query(sql);
	ResultSet rs=data.getRs();
	pnum=count%pagesize==0?count/pagesize:count/pagesize+1;
	if(now<pnum)
		next=now+1;
	if(now>1)
		prev=now-1;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>题库管理</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/exercise.css" />
</head>
<body>
    <table>
    <tr>
      <td class="title_green" colspan="6">国学达人知识竞赛题库</td>
    </tr>
    <tr><td colspan="6">
    <form action="upload" method="post" enctype="multipart/form-data">
    <a href="addexercise.jsp"><input type="button" value="添加问题" id="add"/></a>
    <input type="submit" value="上传EXCEl文档" id="add1"/>
    <input type="file" name="file" style="margin-left:10px;"/>
     </form>
     </td></tr>
     <tr><td colspan="6">
     <form action="exercise.jsp" method="get">
    <input type="text" name="find"  id="inp"/>
    <input type="submit" value="搜索"  id="search"/>
     </form>
    </td></tr>
   	<%while(rs.next()){%>
    <tr>
      <td width="150px" class="head">题目信息</td><td colspan="5"><%=rs.getString(8)+"."%><%=rs.getString(1) %></td>
     </tr>
     <tr style="height:20px;">
      <td width="150px" class="head">选项A</td>
      <td width="150px" class="head">选项B</td>
      <td width="150px" class="head">选项C</td>
      <td width="150px" class="head">选项D</td>
      <td width="150px" class="head">正确答案</td>
      <td width="150px" class="head">操作</td>
      </tr>
      <tr>
      <td width="150px" class="ti"><%=rs.getString(2) %></td>
      <td width="150px" class="ti"><%=rs.getString(3) %></td>
      <td width="150px" class="ti"><%=rs.getString(4) %></td>
      <td width="150px" class="ti"><%=rs.getString(5) %></td>
      <td width="150px" class="ti"><%switch(rs.getInt(6)){
      case 1:out.println("A");break;
      case 2:out.println("B");break;
      case 3:out.println("C");break;
      case 4:out.println("D");break;
      default:out.println("NULL");break;
      } %></td>
      <td width="150px" ><a href="changeexercise.jsp?id=<%=rs.getString(7)%>">修改</a>/<a href="delete?table=exercise&id=<%=rs.getString(7)%>">删除</a></td>
      </tr>
      <%} %>
      <tr>
      <td style="textalign:center;"colspan="6"><a href="exercise.jsp?page=<%=prev%>" class="page">上一页</a><span class="xin">当前第 <%=now%> 页共 <%=pnum%>  页 <%=count%> 个题目</span><a href="exercise.jsp?page=<%=next%>"  class="page">下一页</a></td>
   	  </tr>
    </table>
</body>
</html>