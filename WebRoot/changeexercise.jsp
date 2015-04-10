<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="data" class="bean.data"></jsp:useBean>
<%
	int id;
	id=Integer.parseInt(request.getParameter("id"));
	String sql="SELECT * FROM exercise where id="+id;
	data.query(sql);
	ResultSet rs=data.getRs();
	rs.next();
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
  <form action="updateexercise" method="post">
    <table>
    <tr>
      <td class="title_green" colspan="5">国学达人题库修改</td>
    </tr>
    <tr>
      <td width="150px" class="head" style="height:100px;width:784px;">题目信息</td><td colspan="4"><textarea name="content" style="width:784px;height:100px; border:0px none; font-size:14px;"><%=rs.getString(2) %></textarea></td>
     </tr>
     <tr style="height:20px;">
      <td width="150px" class="head">选项A(1)</td>
      <td width="150px" class="head">选项B(2)</td>
      <td width="150px" class="head">选项C(3)</td>
      <td width="150px" class="head">选项D(4)</td>
      <td width="150px" class="head">正确答案（数字）</td>

      </tr>
      <tr>
      <td width="150px" >
      <input name="id" type="hidden" value="<%=rs.getString(1) %>"/>
      <input type="text" name="select_A" style="border:0px none;" value="<%=rs.getString(3) %>"/></td>
      <td width="150px" ><input type="text" name="select_B" style="border:0px none;" value="<%=rs.getString(4) %>"/></td>
      <td width="150px"><input type="text" name="select_C" style="border:0px none;" value="<%=rs.getString(5) %>"/></td>
      <td width="150px"><input type="text" name="select_D" style="border:0px none;" value="<%=rs.getString(6) %>"/></td>
      <td width="150px"><input type="text" name="select_correct" style="border:0px none;" value="<%=rs.getString(7) %>"/></td>
      </tr>
      <tr>
        <td colspan=5><input type="submit"value="提交" style="width:100px;height:30px;" /><a href="exercise.jsp"><input type="button"value="取消" style="width:100px;height:30px;margin-left:20px;" /></a></td>
      </tr>
    </table>
  </form>
</body>
</html>