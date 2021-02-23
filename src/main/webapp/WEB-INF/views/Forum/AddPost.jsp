
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111" />


<title>CodePen - Responsive Table</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
<link rel='stylesheet' href="<c:url value='/css/styles.css'/>"
	type="text/css" />

<style>
body {
	background-color: #ACD2D0;
}

body * {
	box-sizing: border-box;
}

.header {
	background-color: #27303C;
	color: white;
	font-size: 1.5em;
	padding: 1rem;
	text-align: center;
	text-transform: uppercase;
}

img {
	border-radius: 50%;
	height: 60px;
	width: 60px;
}

.table-users {
	border: 1px solid #327a81;
	border-radius: 10px;
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
	max-width: calc(100% - 2em);
	margin: 1em auto;
	overflow: hidden;
	width: 800px;
	background-color: #6C89A4;
	color: white;
}

table {
	width: 100%;
}

table td, table th {
	color: #2b686e;
	padding: 10px;
}

table td {
	text-align: center;
	vertical-align: middle;
}

table td:last-child {
	font-size: 0.95em;
	line-height: 1.4;
	text-align: left;
}

table th {
	background-color: #daeff1;
	font-weight: 300;
}

table tr:nth-child(2n) {
	background-color: white;
}

table tr:nth-child(2n+1) {
	background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
	table, tr, td {
		display: block;
	}
	td:first-child {
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		width: 100px;
	}
	td:not(:first-child) {
		clear: both;
		margin-left: 100px;
		padding: 4px 20px 4px 90px;
		position: relative;
		text-align: left;
	}
	td:not(:first-child):before {
		color: #91ced4;
		content: "";
		display: block;
		left: 0;
		position: absolute;
	}
	td:nth-child(2):before {
		content: "Name:";
	}
	td:nth-child(3):before {
		content: "Email:";
	}
	td:nth-child(4):before {
		content: "Phone:";
	}
	td:nth-child(5):before {
		content: "Comments:";
	}
	tr {
		padding: 10px 0;
		position: relative;
	}
	tr:first-child {
		display: none;
	}
}

@media screen and (max-width: 500px) {
	.header {
		background-color: transparent;
		color: white;
		font-size: 2em;
		font-weight: 700;
		padding: 0;
		text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
	}
	img {
		border: 3px solid;
		border-color: #daeff1;
		height: 100px;
		margin: 0.5rem 0;
		width: 100px;
	}
	td:first-child {
		background-color: #c8e7ea;
		border-bottom: 1px solid #91ced4;
		border-radius: 10px 10px 0 0;
		position: relative;
		top: 0;
		transform: translateY(0);
		width: 100%;
	}
	td:not(:first-child) {
		margin: 0;
		padding: 5px 1em;
		width: 100%;
	}
	td:not(:first-child):before {
		font-size: 0.8em;
		padding-top: 0.3em;
		position: relative;
	}
	td:last-child {
		padding-bottom: 1rem !important;
	}
	tr {
		background-color: white !important;
		border: 1px solid #6cbec6;
		border-radius: 10px;
		box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
		margin: 0.5rem 0;
		padding: 0;
	}
	.table-users {
		border: none;
		box-shadow: none;
		overflow: visible;
	}
}
</style>

<script>
	window.console = window.console || function(t) {
	};
</script>



<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>


</head>

<body translate="no">

	<div class="table-users">
		<div class="header">Users</div>

		<table cellspacing="0">
			<section>
				<div align="center">
					<h1 style="text-align: center">新增文章</h1>
				</div>
			</section>

			<hr
				style="height: 1px; border: none; color: #333; background-color: #333;">
			<section class="container">

				<!--       三個地方要完全一樣 -->
				<form:form method='POST' modelAttribute="poBean" action="add"
					class='form-horizontal' enctype="multipart/form-data">
					<form:hidden path="post_no" />
					<br>&nbsp;
			<table border="1" >
						<tr>
							<td colspan="2" align="center">新增文章內容</td>

						</tr>
						<tr>
							<td align='left'>標題：<br>&nbsp;
							</td>
							<td width="400"><form:input path="post_tit" /><br>&nbsp;
							</td>
						</tr>

						<tr>
							<td align='left'>留言者：<br>&nbsp;
							</td>
							<td width="400"><c:out value="${poBean.mb.nickname}"></c:out><br>&nbsp;
							</td>
						</tr>

						<tr>
							<td align='left'>留言內容：<br>&nbsp;
							</td>
							<td width="400"><form:textarea path="post_content" rows="4"
									cols="20"></form:textarea> <br>&nbsp;</td>
						</tr>
						<tr>

							<td align='left'>修改照片：<br>&nbsp;
							</td>
							<td><form:input type="file" path="productImage" /></td>



						</tr>




						<tr>
							<td style="text-align: center;" colspan='2' align='center'><input
								type='submit' value='提交'></td>
						</tr>




					</table>
				</form:form>
				<div style="text-align: center;">
					<br> <a href="<c:url value='/tw/hanjee/posts'/>" style="color: white" >回首頁</a>
				</div>

			</section>

			</html>