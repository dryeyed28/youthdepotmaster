<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login2.jsp</title>
</head>
<body>
<h3>�α���</h3>
<form name="f" action="<%=request.getContextPath() %>/admin/pages/login.do" 
method="post">
<table border="1">
<tr>
<td>id</td>
<td><input type="text" name="admin_id"></td>
</tr>
<tr>
<td>pwd</td>
<td><input type="password" name="admin_pwd"></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="�α���">
<a href="<%=request.getContextPath() %>/member/form.jsp">ȸ������</a>
</td>
</tr>
</table>
</form>
</body>
</html>