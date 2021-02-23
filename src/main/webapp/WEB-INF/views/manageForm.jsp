<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	padding-top: 60px;
	background-color: black;
}
</style>
<link rel="stylesheet" type="text/css"
	href="../../css/bootstrap.min.css" />

<link href="../../css/main.css" rel="stylesheet">
<link href="../../css/font-style.css" rel="stylesheet">
<link href="../../css/flexslider.css" rel="stylesheet">

<title>管理頁面</title>
</head>
<body>

	<table >
		<c:if test="${! empty ManageLoginOK}">
			<tr width='100%'>
				<td width='10%' style='text-align: center'>
				<div class="container">
		<div class="row">
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<h1>會員管理</h1>

					<div class="thumbnail">
						<img src="../../images/face80x80.jpg" alt="Marcel Newman"
							class="img-circle">
					</div>


					<br>
					<div class="info-user">
						<span aria-hidden="true" class="li_user fs1"></span> <span
							aria-hidden="true" class="li_settings fs1"></span> <span
							aria-hidden="true" class="li_mail fs1"></span> <span
							aria-hidden="true" class="li_key fs1"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
				<a href="<c:url value='/tw/hanjee/init'/>"><font color='#F7F292'>初始值設定</font></a>
				</td>

				<td width='20%' style='text-align: center'><a
					href="<c:url value='/tw/hanjee/membermanage'/>"><font
						color='#F7F292'>會員管理</font></a></td>
				<td width='20%' style='text-align: center'><a
					href="<c:url value='/tw/hanjee/forums'/>"><font color='#F7F292'>論
							壇</font></a></td>
				<td width='20%' style='text-align: center'><a
					href="<c:url value='/friend/piForm'/>"><font color='#F7F292'>交友系統</font></a></td>

			</tr>
			<tr>
				<td width='20%' style='text-align: center'><a
					href="<c:url value='/ticketProduct_manager'/>"><font
						color='#F7F292'>車票</font></a></td>
				<td width='20%' style='text-align: center'><a
					href="<c:url value='/order_manager'/>"><font color='#F7F292'>訂單</font></a></td>
				<td width='20%' style='text-align: center'><a
					href="<c:url value='/fixSchProduct_manager'/>"><font
						color='#F7F292'>主題旅遊</font></a></td>
				<td width='20%' style='text-align: center'><a
					href="<c:url value='/tw/hanjee/managerlogout'/>"><font
						color='#F7F292'>登出</font></a></td>
			</tr>
		</c:if>
	</table>

	
</body>
</html>