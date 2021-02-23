<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

span {
	color: #FF7575;
	font-size: 15px;
	font-weight: bold;
}

body {
	background-color: rgba(108, 137, 146, .3);
}

table {
	border-collapse: collapse;
	border: 1px;
	width: 600px;
	background-color: #F7F292;
	height: 800px;
	border-radius: 10px;
	margin-top: 30px;
	box-shadow: 3px 3px 12px gray;
}

td {
	font: 20px "微軟雅黑";
	text-align: left;
	color: blue;
	padding-left: 10px;
	width: auto;
	height: auto;
	word-break: keep-all;
}

td font {
	margin-left: 10px;
}

input {
	width: 400px;
	margin-left: 10px;
}


tr {
	margin: 10px
}

span {
	margin-left: 30px;
}
input[type=radio] {
    box-sizing: border-box;
    padding: 0;
    width: auto;
    text-align: center;
}
</style>
<meta charset="UTF-8">
<title>註冊頁面</title>
</head>
<body>

	<div align="center">
		<form:form method='POST' modelAttribute="mbBean">


			<table style="border-spacing: 10px;">
				<tr>
					<th style="text-align: center; color: rgba(39, 48, 55, .8)"
						colspan="2"><font size="40px">註冊</font><br></th>
				</tr>
				<tr>
					<td>姓名：<br><span></span></td>
					<td><form:input id="name" path="realname" /><br>
					<span id="nameSp"></span></td>
				</tr>
				<tr>
					<td>綽號：</td>
					<td><form:input id="nickkk" path="nickname" /> <form:errors
							path="nickname" cssClass="error" /></td>
				</tr>
				<tr>
					<td>帳號：<br><span></span></td>
					<td><form:input id="memberaccount" path="account" /><br>
						<span id="accountSp">最少六個字元</span> <form:errors path="account"
							cssClass="error" /></td>
				</tr>
				<tr>
					<td>密碼：<br><span></span></td>
					<td><form:input type="password" id="password" path="password" /><br> <span
						id="passwordSp">大小寫英文以及數字組合</span> <form:errors path="password"
							cssClass="error" /></td>
				</tr>
				<tr>
					<td>確認密碼：<br><span></span></td>
					<td><input type="password" id="confirmpassword"  /> <br>
					<span id="confirmpasswordSp"></span> <form:errors path="password"
							cssClass="error" /></td>
				</tr>

				<tr>
					<td>地址：<br><span></span></td>
					<td><form:input id="address" path="address" /><br> <span
						id="addSp"></span> <form:errors path="address" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Email：<br><span></span></td>
					<td><form:input id="email" path="email" /><br> <span
						id="emailsp"></span> <form:errors path="email" cssClass="error" /></td>
				</tr>

				<tr>
					<td>手機：<br><span></span></td>
					<td><form:input id="mobilephone" path="mobile_phone" /><br>
						<span id="phoneSp"></span> <form:errors path="mobile_phone"
							cssClass="error" /></td>
				</tr>
				<tr>
					<td>家電：<br><span></span></td>
					<td><form:input id="homephone" path="home_phone" /> <form:errors
							path="home_phone" cssClass="error" /></td>
				</tr>

				<tr>
					<td>性別：<br><span></span></td>
					<td><input type="radio" id="gender1" name="gender" value="男">男<input
						type="radio" id="gender2" name="gender" value="女">女<br><span></span></td>
				</tr>
				
					<tr>
						<td colspan="2" align='center'><input id="confirmButton" type='submit'
							value='提交'></td>
					</tr>
					<tr>
					<td colspan="2" align='center'><input id="enterby" type="button" value="帥氣"></td></tr>
					
				

			</table>

		</form:form>
		<br> <a href="<c:url value='index' />">回首頁</a>
	</div>
	<script type="text/javascript">
	$("#enterby").click(function(){
		$("#name").val("測試帳號")
		$("#nickkk").val("測試綽號")
		$("#memberaccount").val("test123")
		$("#password").val("123456")
		$("#confirmpassword").val("123456")
		$("#address").val("台北市忠孝東路四段150巷88號8樓")
		$("#email").val("steven1111@gmail.com")
		$("#mobilephone").val("0919211542")
		$("#homephone").val("0223884658")
		})
		var nameFlag = false;
		var phoneFlag = false;
		var addFlag = false;
		var accountFlag = false;
		var passwordFlag = false;
		var confirmpasswordFlag = false;
		
		var accounttest = $("#memberaccount").val()
		$("#name").keyup(function() {
			var receiveName = $("#name").val().trim();
			var receiveNameLength = receiveName.length;
			if (receiveName != "") {

				if (receiveNameLength >= 2) {
					if (/^[\u4e00-\u9fa5]+$/.test(receiveName)) {
						$("#nameSp").text("");
						$("#nameSp").text("輸入正確");
						nameFlag = true;
					} else {
						$("#nameSp").text("");
						$("#nameSp").text("輸入姓名必須全為中文字");
						nameFlag = false;
					}
				} else {
					$("#nameSp").text("");
					$("#nameSp").text("輸入姓名必須至少兩個字");
					nameFlag = false;

				}
			} else {

				$("#nameSp").text("");
				$("#nameSp").text("請填入姓名");
				nameFlag = false;
			}
		});

		$("#mobilephone").keyup(function() {

			var receivePhone = $("#mobilephone").val().trim();
			var receivePhoneLength = receivePhone.length;
			if (receivePhone != "") {
				if (receivePhoneLength == 10) {

					if ((/^09[123456789]{8}$/.test(receivePhone))) {
						$("#phoneSp").text("");
						$("#phoneSp").text("輸入正確");
						phoneFlag = true;
					} else {

						$("#phoneSp").text("");
						$("#phoneSp").text("請輸入開頭為09的手機號碼");
						phoneFlag = false;
					}
				} else {
					$("#phoneSp").text("");
					$("#phoneSp").text("請輸入10位手機號碼");
					phoneFlag = false;
				}
			} else {
				$("#phoneSp").text("");
				$("#phoneSp").text("請輸入電話");
				phoneFlag = false;
			}
		});

		$("#address").keyup(function() {
			var receiveAdd = $("#address").val().trim();
			if (receiveAdd != "") {
				$("#addSp").text("");
				$("#addSp").text("輸入正確");
				addFlag = true;
			} else {
				$("#addSp").text("");
				$("#addSp").text("請輸入地址");
				addFlag = false;
			}
		});
		$("#email")
				.keyup(
						function() {
							var receivePhone = $("#email").val().trim();
							var receivePhoneLength = receivePhone.length;
							if ((/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/
									.test(receivePhone))) {
								$("#emailsp").text("");
								$("#emailsp").text("輸入正確");
								phoneFlag = true;
							} else {

								$("#emailsp").text("");
								$("#emailsp").text("請輸入正確EMAIL");
								phoneFlag = false;
							}
						});

		$("#memberaccount").keyup(function() {
			var receiveAccount = $("#memberaccount").val().trim();
			if (receiveAccount.len >= 7) {
				$("#accountSp").text("");
				$("#accountSp").text("輸入正確");

			} else {
				$("#accountSp").text("");
				$("#accountSp").text("創造一個屬於你的帳號吧");

			}
		});
		$("#memberaccount").blur(function() {
			var receiveAccount = $("#memberaccount").val().trim();
			if (receiveAccount != "") {
				$.ajax({
					url : 'modifyAccount',
					type : 'POST',
					data : {
						reAccount : receiveAccount,
					},
					success : function(data) {
						console.log(data);
						if (data.length == 5) {
							$("#accountSp").text("此帳號已經存在，請想一個別的帳號");
						} else {
							$("#accountSp").text("哎喲，創意帳號喔");
							accountFlag = true;
						}

					}
				})

			}
		});
		$("#confirmButton").hide();
		console.log(confirmpasswordFlag);
		$("#confirmpassword").blur(function() {
			var receiveconfirmpassord = $("#confirmpassword").val().trim();
			var receivepassord = $("#password").val().trim();
			if(receivepassord == receiveconfirmpassord){
				$("#confirmpasswordSp").text("驗證正確");
				confirmpasswordFlag =true;
				$("#confirmButton").show();
				console.log(confirmpasswordFlag);
				}else{
					$("#confirmpasswordSp").text("請輸入一樣的密碼");
					}
		})
		
		
		
	
	</script>
</body>
</html>