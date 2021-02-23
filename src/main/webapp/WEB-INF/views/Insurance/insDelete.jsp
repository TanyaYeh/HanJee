<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Complete</title>
<style>
body{
	background-color: #E2E7DB;
}
h2 {
	text-align: center;
	background-color: #152432;
	color: white;
	font-size: 28px;
	height: 150%;
}
.btn_back{
	width:200px;
	margin: 30px auto;
}
.icon {
	margin: auto;
	cursor: pointer; 
}
</style>
</head>
<body>
 <div style="background-color:#152432; margin: 0 auto;">
                    <jsp:include page="/fragment/Top.jsp" />
                </div>
	<h2>已成功刪除投保</h2>
	<div class="btn_back"><a href="${pageContext.request.contextPath}/product_Index" ><img alt=""
			src="${pageContext.request.contextPath}/images/insImages/backToCart.jpg"
			width="200"	class="icon" /></a></div>
</body>
</html>