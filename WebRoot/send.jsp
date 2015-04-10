<%@page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <title>发送邮件</title>
  <link rel="stylesheet" href="./Style/table.css" />
  <link rel="stylesheet" href="./Style/send.css" />
</head>
<body>
  <form action="sendmail" method="post">
    <table>
    <tr>
      <td class="title" colspan="2">群体发送通知邮件</td>
    </tr>
    <tr>
      <td width="100px">发送到：</td>
      <td><input id="towho" type="text" name="user" /></td>
    </tr>
    <tr>
      <td width="100px">主题：</td>
      <td><input id="towho" type="text" name="sub" /></td>
    </tr>
    <tr>
      <td width="100px">内容：</td>
      <td><input id="towho" type="text" name="content" /></td>
    </tr>
     <tr>
      <td colspan="2"><input id="su" type="submit" value="提交" /></td>
    </tr>
    </table>
  </form>
</body>
</html>