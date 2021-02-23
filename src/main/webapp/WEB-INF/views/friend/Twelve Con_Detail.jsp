<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/fragment/Top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Twelve Constellations Detail</title>
<style type="text/css">

p {
	width: 700px;
	height: 75px;
	/*   border:1px solid #000; */
	line-height: 25px;
	/*   text-align:center; */
	/*   align:center; */
	
	/*   position:absolut; */
}

div {
	margin: auto;
}

span{
line-height: 25px;
}

h1{
text-align:center;
}

</style>
</head>
<body style="background-color:#E6EBDF ">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	data-integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	data-crossorigin="anonymous"></script>

<h1>${constellation}</h1><br>

	<div style="width: 600px;">
		<div>
			<span id="output0"></span><br>
			<span id="output1"></span><br>
			<span id="output2"></span><br>
			<span id="output3"></span>
			<br>
		</div>
		<br>
		<div>
			<span id="output4"></span><br>
			<span id="output5"></span><br>
			<span id="output6"></span><br>
			<span id="output7"></span>
			<br>
		</div>
		<br>
		<div>
			<span id="output8"></span><br>
			<span id="output9"></span><br>
			<span id="output10"></span><br>
			<span id="output11"></span>
			<br>
		</div>
		<br>
		<div>
			<span id="output12"></span><br>
			<span id="output13"></span><br>
			<span id="output14"></span><br>
			<span id="output15"></span>
		</div>
	</div>

	<script>
		var data = JSON.parse('${jsonStringCon}');
		var i;
		for (i = 0; i < 16; i++) {
			document.getElementById("output"+${'i'}).innerHTML = data[i]
		}
	
	</script>


	<hr>
	<div align="center">
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp; <a
			href="<c:url value='/friend/piForm'/> ">回交友首頁</a>
	</div>
</body>
</html>