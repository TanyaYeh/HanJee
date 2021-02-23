<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/fragment/Top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show ALL Member</title>

<style type="text/css">

@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color:#A7A1AE;
  background-color: #E6EBDF;
  
}

h1 {
  font-size:3em; 
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: #4DC3FA;
}

h2 {
  font-size:1em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color: #FB667A;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color: #FB667A;
  text-decoration: none;
}

.blue { color: #185875; }
.yellow { color: #FFF842; }

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color: #185875;
}

.container td {
	  font-weight: normal;
	  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	  text-align: center;
	  overflow: hidden;
	  width: 50%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td, .container th {
	  padding-bottom: 2%;
	  padding-top: 2%;
/*   padding-left:2%;   */
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color: #323C50;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color: #2C3446;
}

.container th {
	  background-color: #1F2739;
}

.container td:first-child { color: #FB667A; }

.container tr:hover {
   background-color: #464A52;
-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	   -moz-box-shadow: 0 6px 6px -6px #0E1119;
	        box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
  background-color: #FFF842;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }

}

</style>

</head>
<body style="background-color:#E6EBDF ">

	<div align='center'>
		<h3>會員資料</h3>
		<hr>
		<table class="container">
			<tr>
				<th width='120'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='56'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='90'>星 座</th>
			</tr>

			<c:forEach var="person_Info" items="${Person_InfoList}" >
				<tr>
				<td align="center">
				<img style="width: 80px; height: 80px"
					src='<c:url value="/friend/getPicture/${person_Info.getBean().member_id}" />'></td>
	 				<td align="center">${person_Info.getBean().realname}</td>
					<td align="center">${person_Info.getBean().gender}</td>
			        <td align="center">${person_Info.per_rel}</td>
					<td align="center">${person_Info.per_con}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<hr>
		<a href="<c:url value='/'/> ">回地圖首頁</a>&nbsp;&nbsp;
		<a href="<c:url value='/friend/piForm'/> ">回交友首頁</a>

	</div>
</body>
</html>