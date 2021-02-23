<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form:form method="POST" modelAttribute="loginBean"> 

	<table width="300" border="1">
			<tr>
				<td colspan="2">登入視窗</td>
			</tr>
			<tr>
				<td>使用者名稱</td>
				<td>  <form:input  path="account" size="10" /></td>
			</tr>
			<tr>
				<td>密碼</td>
				<td><form:input path="password" size="10"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit" value="登入">
					註冊</td>
			</tr>
		</table>

   
</form:form>
</body>
</html>