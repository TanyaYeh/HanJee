<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Twelve Constellations</title>
<style type="text/css">
.flex-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	height: 200px;
}

.item {
	width: 300px;
}

p {
	text-align: center;
	margin: auto;
	margin-right: 5px;
	color: maroon;
}

img {
	width: 140px;
	height: 140px;
	align: center;
	margin-left: 78px;
	border-radius: 50%;
}
</style>
</head>
<body>

	<h1 align="center">
		<font color="blue">今日星座運勢⭐</font>
	</h1>
	<div align="center">
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp; <a
			href="<c:url value='/friend/piForm'/> ">回交友首頁</a>
	</div>
	<hr>
	<div class="flex-container">
		<div class="item">

			<a href="<c:url value='/getConDetailInf/0' />" title="測試超連結"><img
				src="<c:url value='images/牡羊座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♈牡羊座</p>
			<p>3月21日 - 4月19日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/1' />" title="測試超連結"><img
				src="<c:url value='images/金牛座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♉金牛座</p>
			<p>4月20日 - 5月20日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/2' />" title="測試超連結"><img
				src="<c:url value='images/雙子座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♊雙子座</p>
			<p>5月21日 - 6月20日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/3' />" title="測試超連結"><img
				src="<c:url value='images/巨蟹座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♋巨蟹座</p>
			<p>6月21日 - 7月22日</p>
		</div>
	</div>
	<div class="flex-container">
		<div class="item">
			<a href="<c:url value='/getConDetailInf/4' />" title="測試超連結"><img
				src="<c:url value='images/獅子座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♌獅子座</p>
			<p>7月23日 - 8月22日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/5' />" title="測試超連結"><img
				src="<c:url value='images/處女座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♍處女座</p>
			<p>8月23日 - 9月22日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/6' />" title="測試超連結"><img
				src="<c:url value='images/天秤座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♎天秤座</p>
			<p>9月23日 - 10月22日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/7' />" title="測試超連結"><img
				src="<c:url value='images/天蠍座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♏天蠍座</p>
			<p>10月23日 - 11月21日</p>
		</div>
	</div>
	<div class="flex-container">
		<div class="item">
			<a href="<c:url value='/getConDetailInf/8' />" title="測試超連結"><img
				src="<c:url value='images/射手座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♐射手座</p>
			<p>11月22日 - 12月21日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/9' />" title="測試超連結"><img
				src="<c:url value='images/摩羯座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♑摩羯座</p>
			<p>12月22日 - 1月19日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/10' />" title="測試超連結"><img
				src="<c:url value='images/水瓶座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♒水瓶座</p>
			<p>1月20日 - 2月18日</p>
		</div>
		<div class="item">
			<a href="<c:url value='/getConDetailInf/11' />" title="測試超連結"><img
				src="<c:url value='images/雙魚座.jpg' />" alt="測試圖片" border="0"></a>
			<p class="title">♓雙魚座</p>
			<p>2月19日 - 3月20日</p>
		</div>
	</div>

</body>
</html>