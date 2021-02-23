<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QRCode Page</title>
<style>
body{
	background-color: #C5D0D8;
}
h1 {
	text-align: center;
	background-color: #236E7B;
	color: white;
	font-size: 28px;
	height: 150%;
}

div {
	width:500px;
	margin: 80px auto;
}
</style>
</head>
<body>
	<h1>請嘗試掃描</h1>
	<div>
		<img src="${pageContext.request.contextPath}/images/qrCode.png"
			width="500" id="qr" />
	</div>

</body>
</html>