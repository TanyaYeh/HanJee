<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/fragment/Top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Basic Info</title>

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
	  text-align: left;
	  overflow: hidden;
	  width: 70%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td, .container th {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:2%;  
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

<div align="center">
	
		<table class="container">
			<tr>
				<td align="center" colspan="2"><img
					style="width: 150px; height: 120px; border-radius: 50%;"
					src='<c:url value="/friend/getPicture/${ra.getBean().member_id}" />'></td>
			</tr>

			<tr>
				<td align='left'>身高 :</td>
				<td width="400">${ra.per_high}<br>&nbsp;
				</td>
			</tr>

			<tr>
				<td align='left'>體重 :</td>
				<td>${ra.per_wei}<br>&nbsp;</td>
			</tr>

			<tr>
				<td align='left'>感情狀態 :</td>
				<td>${ra.per_rel}</td>
			</tr>

			<tr>
				<td align='left'>職業 :</td>
				<td>${ra.per_job}<br>&nbsp;</td>
			</tr>

			<tr>
				<td align='left'>收入 :</td>
				<td>${ra.per_inc}</td>
			</tr>

			<tr>
				<td align='left'>興趣 :</td>
				<td>${ra.per_int}<br>&nbsp;</td>
			</tr>

			<tr>
				<td align='left'>星座 :</td>
				<td>${ra.per_con}</td>
			</tr>

			<tr>
				<td align='left'>夢想 :</td>
				<td>${ra.dream}<br>&nbsp;</td>
			</tr>

			<tr>
				<td colspan='2' align="center">
				<input type="button" value="前往交友首頁" onclick="location.href='<c:url value="/friend/piForm" />'">
				</td>
			</tr>

		</table>
	</div>

</body>
</html>