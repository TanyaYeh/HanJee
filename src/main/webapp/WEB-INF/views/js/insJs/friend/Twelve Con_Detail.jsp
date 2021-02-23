<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Twelve Constellations Detail</title>
<style type="text/css">
#output {
	width: 600px;
/* 	text-align: center; */
/* 	align: center; */
	border: solid 1px;
	/* padding:220px; */
}

</style>
</head>
<body>
	<div id="output" align="center"></div>

	<script>
		var data = JSON.parse('${jsonStringCon}');
		var i;
		for (i = 0; i < 16; i++) {
			document.getElementById("output").innerHTML += data[i]
		}
	</script>

	<hr>
	<div align="center">
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp; <a
			href="<c:url value='/friend/piForm'/> ">回交友首頁</a>
	</div>
</body>
</html>