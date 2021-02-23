<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Information Form</title>
<style>
form {
	margin: 0 auto;
	width: 600px;
}

body { 
  background-color: #FAF0E6;
  font-family: verdana;
  font-size: 15pt;
}

/* input[type="text"] { */
/*     font-size:18px */
/* } */
/* input[type="submit"] { */
/*     font-size:18px */
/* } */
/* select { */
/*     font-size:18px */
/* } */

/* .title_font { */
/* 	color: #0000FF; */
/* 	font-size:17px;	 */
/* 	background-color: #FFCF90; */
/* } */

/* .table_color { */
/* 	color: #660000; */
/* 	background-color: #EEE8AA; */
/* } */

/* .customer_color { */
/* 	color: #800080; */
/* 	background-color: #99cc99; */
/* } */

/* input.rightAligned { */
/*      text-align: right; */
/* } */

/* .InputClass {  */
/*   font-size: 15px;  */
/* }  */

/* #message { */
/*   position:absolute; */
/*   left:620px; */
/*   top:30px; */
/*   color: #FF0660; */
/*   background-color: #EEE8AA; */
/* } */


/* #insert { */
/* position:relative; */
/* left:280px; */
/* top:70px; */
/* } */
/* #deleteMsg { */
/* position:relative; */
/* left:280px; */
/* top:10px; */
/* } */

/* #backToBookMaintainList { */
/* position:relative; */
/* left:280px; */
/* top:70px; */
/* } */

/* #afterBookInsert { */
/* position:relative; */
/* left:0px; */
/* top:100px; */
/* } */

/* #bpaging { */
/* position:relative; */
/* left:120px; */
/* top:5px; */
/* }   */
/* #blfirst { */
/* position:relative; */
/* left:2px; */
/* top:2px; */
/* } */

/* #blprev { */
/* position:relative; */
/* left:2px; */
/* top:2px; */
/* } */
/* #blnext { */
/* position:relative; */
/* left:2px; */
/* top:2px; */
/* } */
/* #bllast { */
/* position:relative; */
/* left:2px; */
/* top:2px; */
/* } */

</style>
<%-- <link href="${pageContext.request.contextPath}/css/style.css" --%>
<!-- 	rel="stylesheet" type="text/css"> -->
</head>
<body>
 <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

	<div align="center">
	<form method='POST' action="<c:url value='/friend/piForm' />" enctype="multipart/form-data" >
		<form:form method='POST' modelAttribute="PIBean" enctype="multipart/form-data" action="<c:url value='/friend/piForm' />" >
			<c:if test='${Person_InfoBean.getBean().member_id != null}'>
				<form:hidden path="member_id" />
				<br>&nbsp;
			</c:if>
<!-- 			<fieldset class="fieldset-auto-width"> -->		
				<table border="1">
			<tr>
				<td height="80" colspan="2" align="center">
					<font size='+2'><b>基本交友資料</b></font><br>
				</td>
			</tr>	
					<tr>
						<td align='left'>身高：<br>&nbsp;
						</td>
						<td width="400"><form:input path="per_high" /><br>&nbsp; 
						<!-- 			
										<form:errors path="per_high" cssClass="error" /> -->
						</td>
					</tr>
					<tr>
						<td align='left'>體重：<br>&nbsp;
						</td>
						<td><form:input path="per_wei" /><br>&nbsp; 
						<!-- 						    <form:errors path="per_wei" cssClass="error" /> -->
						</td>
					</tr>
					<tr>
						<td align='left'>感情狀態：<br>&nbsp;
						</td>
						<td>
						<form:radiobutton path="per_rel" value="秘密"/>秘密
						<form:radiobutton path="per_rel" value="單身"/>單身 
						<form:radiobutton path="per_rel" value="曖昧"/>曖昧
						<form:radiobutton path="per_rel" value="穩交"/>穩交
						<form:radiobutton path="per_rel" value="已婚"/>已婚
						<!-- 						    <form:errors path="per_rel" cssClass="error" /> -->
						</td>
					</tr>
					<tr>
						<td align='left'>職業：<br>&nbsp;
						</td>
						<td><form:input path="per_job" /><br>&nbsp; 
						<!-- 						    <form:errors path="per_job" cssClass="error" /> -->
						</td>
					</tr>
					<tr>
						<td align='left'>收入：<br>&nbsp;
						</td>
						<td>
<!-- 						value="" disabled selected hidden -->
						<form:select path="per_inc" >
						<form:option value="0" selected="selected" hidden="hidden">------請選擇-----</form:option>
						<form:option value="25000以下">25000以下</form:option>
						<form:option value="25001~30000">25001~30000</form:option>
						<form:option value="30001~35000">30001~35000</form:option>
						<form:option value="35001~40000">35001~40000</form:option>
						<form:option value="40001~45000">40001~45000</form:option>
						<form:option value="45001~50000">45001~50000</form:option>
						<form:option value="50001~55000">50001~55000</form:option>
						<form:option value="55001~60000">55001~60000</form:option>
						<form:option value="60001~100000">60001~100000</form:option>
						<form:option value="100000以上">100000以上</form:option>
						</form:select>
						<!-- 						    <form:errors path="per_inc" cssClass="error" /> -->
						
						</td>
					</tr>
					<tr>
						<td align='left'>興趣：<br>&nbsp;
						</td>
						<td>
						<form:input path="per_int" /><br>&nbsp;
						<!-- 						    <form:errors path="per_int" cssClass="error" /> -->
						</td>
						
					</tr>
					<tr>
						<td align='left'>星座：<br>&nbsp;
						</td>
						<td>
						<form:select path="per_con" >
						<form:option value="0" selected="selected" hidden="hidden">---------------請選擇--------------</form:option>
						<form:option value="牡羊座">牡羊座(3月21日 - 4月19日)</form:option>
						<form:option value="金牛座">金牛座(4月20日 - 5月20日)</form:option>
						<form:option value="雙子座">雙子座(5月21日 - 6月20日)</form:option>
						<form:option value="巨蟹座">巨蟹座(6月21日 - 7月22日)</form:option>
						<form:option value="獅子座">獅子座(7月23日 - 8月22日)</form:option>
						<form:option value="處女座">處女座(8月23日 - 9月22日)</form:option>
						<form:option value="天秤座">天秤座(9月23日 - 10月22日)</form:option>
						<form:option value="天蠍座">天蠍座(10月23日 - 11月21日)</form:option>
						<form:option value="射手座">射手座(11月22日 - 12月21日)</form:option>
						<form:option value="摩羯座">摩羯座(12月22日 - 1月19日)</form:option>
						<form:option value="水瓶座">水瓶座(1月20日 - 2月18日)</form:option>
						<form:option value="雙魚座">雙魚座(2月19日 - 3月20日)</form:option>
						</form:select>
						<!-- 						    <form:errors path="per_con" cssClass="error" /> -->
						</td>
					</tr>
					<tr>
						<td align='left'>夢想：<br>&nbsp;
						</td>
						<td><form:input path="dream" /><br>&nbsp; 

						</td>
					</tr>
					<tr>
						<td align='left'>照片：<br>&nbsp;
						</td>
						<td><form:input path="multipartFile" type='file' /><br>&nbsp;

						</td>
					</tr>

					<tr>
						<td colspan='2' align='center'>
						<input type='submit' id="add" value='送出'>&nbsp;&nbsp;<input type='reset'
							value='重置'></td>
							
					</tr>
				</table>
<!-- 			</fieldset> -->
		</form:form>
		</form>
		<br> 
		<hr>
		<a href="<c:url value='/'/> ">回地圖首頁</a>
	</div>
	
<script type="text/javascript">
	$("#add").click(function(){
		alert("新增成功");
	})
	</script>

</body>
</html>