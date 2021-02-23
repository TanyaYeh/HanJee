<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#footer {
	width: 100%;
	background-color: #273037;
	height: 75px;
	text-align: center;
}

* {
	margin: 0;
}

a {
	text-decoration: none;
}

body{
font-family:monospace,微軟正黑體;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="footer">
		<br> <span style="font-size: 13px;font-family:monospace;"><font
			color="#FFFFFF">Ⓒ Welcome to <strong>HanJee.</strong> Travel
				agency
		</font></span><br> <span style="font-size: 12px;font-family:monospace;"><font color="#FFFFFF">去首頁購買行程吧.<a
				href="<c:url value='/'/>"><font color="#ACD2C0">回地圖首頁</font></a></font></span>
	</div>
</body>
</html>