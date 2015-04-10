<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>添加学院列表</title>
  <link rel="stylesheet" href="Style/table.css" />
  <link rel="stylesheet" href="Style/send.css" />
</head>
<body>
  <form action="addschool" method="post">
    <table>
    <tr>
      <td class="title" colspan="2">添加学院列表</td>
    </tr>
    <tr>
      <td width="100px">学院名称：</td>
      <td><input id="towho" type="text" name="name"/></td>
    </tr>
   	 <tr>
      <td colspan="2"><input id="su" type="submit" value="提交" /></td>
    </tr>
    </table>
  </form>
</body>
</html>