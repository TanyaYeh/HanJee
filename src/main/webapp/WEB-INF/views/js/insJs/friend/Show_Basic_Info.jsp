<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Basic Info</title>
</head>
<body>

<div align="center">
	
		<table border="1">
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