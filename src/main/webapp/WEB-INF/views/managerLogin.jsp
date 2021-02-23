<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Login</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	background-image: url("../../images/taiwan_v2_new.png");
	background-position: top center;
	background-repeat: no-repeat;
}

.login_frame {
	width: 50%;
	height: 50%;
	padding: 13px;
	position: absolute;
	left: 30%;
	top: 40%;
	margin-left: -100px;
	margin-top: -100px;
	background-color: rgba(240, 255, 255, 0.5);
	border-radius: 10px;
	text-align: center;
}

form p>* {
	display: inline-block;
	vertical-align: middle;
}

#image_logo {
	margin-top: 22px;
}

.label_input {
	font-size: 14px;
	font-family: 宋體;
	width: 100px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	color: white;
	background-color: #236E7B;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

.text_field {
	width: 278px;
	height: 28px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 0;
}

.login {
	font-size: 14px;
	font-family: 宋體;
	width: 120px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	color: white;
	background-color: #4E7C99;
	border-radius: 6px;
	border: 0;
	float: left;
}

#forget_pwd {
	font-size: 12px;
	color: white;
	text-decoration: none;
	position: relative;
	float: right;
	top: 5px;
}

#forget_pwd:hover {
	color: blue;
	text-decoration: underline;
}

#login_control {
	padding: 0 28px; 
}
</style>
</head>
<body>

	<form class="login_frame" action="<c:url value='managerlogin' />"
		method="post" name="managerLoginForm">
		<div style="height:25%"></div>
		<table style=" margin: auto;">
			
			<tr >
				<td class="label_input" >管理員帳號</td>
			
				<td class="label_input" ><input type="text" name="manager_Name"
					class="text_field"></td>
			</tr>
			<tr>
				<td class="label_input" >管理員密碼</td>
				<td class="label_input" ><input type="password" name="manager_Pwd"
					class="text_field"></td>
			</tr>
			<tr>
				<td colspan="2"><input class="login" style="margin-right:40px" type="submit" name="submit" value="登入">
					
			</tr>
			
		</table>
	</form>
</body>
</html>