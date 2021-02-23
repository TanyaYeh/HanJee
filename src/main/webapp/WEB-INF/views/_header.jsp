<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

a {
	text-decoration: none;
}

* {
	margin: 0;
}

#login {
	display: inline-block;
	width: 150px;
	float: right;
}

#logout {
	display: inline-block;
	width: 50px;
	float: right;
}

body{
font-family:monospace,微軟正黑體;
}
</style>
<script type="text/javascript">
		var mbbph = "${LoginOK.mobile_phone}";
		console.log("top==" + mbbph.length)
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body style="background-color: #273037;">
	<c:set var="mbbph" value="${LoginOK.mobile_phone.length()}"></c:set>
	<c:set var="nickname" value="${LoginOK.nickname}"></c:set>
	<div style="background-color: #273037;">
	<div style="background-color: #273037; height: 10px; margin: 0; padding-top: 5px; text-align: center;">
		
				<div id="logout">
			<c:if test="${ ! empty LoginOK }">
				<a id="loginA" href="<c:url value='/tw/hanjee/logout'/>"><font
					color="#FFFFFF">登出</font></a>
			</c:if>
			<c:if test="${ ! empty ManageLoginOK }">
				<a href="<c:url value='/tw/hanjee/managerlogout'/>"><font
					color="#FFFFFF">登出</font></a>
			</c:if>
		</div>
		
		<div id="login">
			<c:choose>
				<c:when test="${empty LoginOK}">
					<a id="loginA" href="<c:url value='/tw/hanjee/login'/>"><font
					color="#FFFFFF">登 入</font></a>
				</c:when>
				<c:otherwise>
					<font color="#FFFFFF">Hi~<c:out value="${nickname}"></c:out></font>
				</c:otherwise>
			</c:choose>
		</div>


		<!-- 		<h1 style="text-align: center; margin: 0; color: #FFFFFF">HanJee</h1> -->
	
</div>
	<table style="width: 100%;border:0;background-color: #273037;">

		<tr>
			<td width='10%' style='text-align: center; font-size: 25px'><img id="logo" src="<c:url value='/images/HanjeeLogo_250_whe.png'/>"
			style="float: left; position: relative; margin: 0;"></td>
			<td width='5%' style='text-align: center; font-size: 25px;'></td>
			<td width='20%' style='text-align: center; font-size: 20px'><a
				href="<c:url value='/product_Index'/>"><font color="#F7F292">
						商 城</font></a></td>
			<td width='20%' style='text-align: center; font-size: 20px'><c:choose>
					<c:when test="${mbbph >= 13}">
						<a href="<c:url value='mailto:test123@gmail.com'/>"><font
							color="#F7F292">只剩寄信</font> </a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/friend/piForm'/>"><font
							color="#F7F292">交友</font></a>
					</c:otherwise>
				</c:choose></td>
			<td width='20%' style='text-align: center; font-size: 20px'><c:choose>
					<c:when test="${mbbph >= 13}">
						<a href="<c:url value='mailto:test123@gmail.com'/>"><font
							color="#F7F292">寄信給管理員信箱</font> </a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/tw/hanjee/forums'/>"><font
							color="#F7F292">論 壇</font></a>
					</c:otherwise>
				</c:choose></td>

			<td width='20%' style='text-align: center; font-size: 20px'><a href="<c:url value='/tw/hanjee/aboutus'/>"><font
				color="#F7F292">關於我們</font></a></td>
			<td width='5%' style='text-align: center; font-size: 20px'></td>
		</tr>
	</table>
	<div style="height: 2px;"></div>
</div>
</body>
</html>