<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	background-color: #C5D0D8;
}
h2 {
	text-align: center;
	background-color: #236E7B;
	color: white;
	font-size: 28px;
	height: 150%;
}
#qrcode_here {
	width:500px;
	margin: 80px auto;
}
.qrc{
	width:100px;
	margin: 20px auto;
	text-align: center;
}
</style>
</head>
<body>
	<h2>這將會接上賊蓉最後的confirm頁面</h2>
	<div class=qrc>
		<button id="qrc">產生 QRCode</button>
	</div>
	<div id="qrcode_here"></div>
	<script>
		document.querySelector('#qrc').addEventListener("click",
				function() {
					fetch("qrCode", {
						method : "POST"
					}).then(function(response) {
						return response.blob(); //將回應轉成二進制物件
					}).then(function(data) {
						console.log(data);
						let img = document.createElement('IMG')
						img.src = URL.createObjectURL(data); //創立一個暫時的圖片路徑

						document.querySelector('#qrcode_here').appendChild(img);
					})
				})
	</script>

</body>
</html>