<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認頁面</title>
<!-- <link rel="stylesheet" href="../../../../js/jquery-3.5.1.min.js"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
</head>
<body>
	<form:form method="POST" modelAttribute="Daily1"
		enctype="multipart/form-data" action="../../../../upddateSche">

		<table class="table-active">
			<tr class="table-active">
				<td colspan="2"><form:input type="hidden" path="sch_dno" value="${Daily1.sch_dno}"/>
				<form:input type="hidden" path="sch_no" value="${Daily1.sch_no}"/>
			一個行程</td>
			</tr>
			<tr>
				<td>行程日期</td>
				<td><form:input path="sch_Daily"  /></td>
			</tr>
			<tr>
				<td>第一個景點</td>
				<td><form:select id="firPla" path="sch_Pla1" 
						value="${Daily1.sch_Pla1}">
						<c:forEach items="${allPlace}" var="place">

							<form:option value="${place.pla_no}">${place.pla_name}</form:option>

						</c:forEach>
					</form:select></td>

			</tr>
			<tr>
				<td>第二個景點</td>
				<td><form:select id="secPla" path="sch_Pla2"
						value="${Daily1.sch_Pla2}">
						<c:forEach items="${allPlace}" var="place">

							<form:option value="${place.pla_no}">${place.pla_name}</form:option>

						</c:forEach>
					</form:select></td>
			</tr>
			
			<c:if test="${!empty Daily1.sch_Pla3}">
			<tr>
				<td>第三個景點</td>
				<td><form:select id="thrPla" path="sch_Pla3" 
						value="${Daily1.sch_Pla3}">
						<c:forEach items="${allPlace}" var="place">

							<form:option value="${place.pla_no}">${place.pla_name}</form:option>

						</c:forEach>
					</form:select></td>
			</tr>
			</c:if>
			
			<c:if test="${!empty Daily1.sch_Pla4}">
			<tr>
				<td>第四個景點</td>
				<td><form:select id="fouPla" path="sch_Pla4" 
						value="${Daily1.sch_Pla4}">
						<c:forEach items="${allPlace}" var="place">

							<form:option value="${place.pla_no}">${place.pla_name}</form:option>

						</c:forEach>
					</form:select></td>
			</tr>
			</c:if>
			<c:if test="${!empty Daily1.sch_Pla5}">
			<tr>
				<td>第五個景點</td>
				<td><form:select id="fifPla" path="sch_Pla5" 
						value="${Daily1.sch_Pla5}">
						<c:forEach items="${allPlace}" var="place">

							<form:option value="${place.pla_no}">${place.pla_name}</form:option>

						</c:forEach>
					</form:select></td>
			</tr>
			</c:if>
			<tr>
				<td colspan="2">總距離 為:<form:input type="hidden" path="distance" value="${Daily1.distance}"/><p id="distanced">${(Daily1.distance)/1000}公里</p></td>

			</tr>
			<tr>
				<td colspan="2">行程總金額 :<form:input type="hidden" path="amount" value="${Daily1.amount}"/><p id="amountc">${Daily1.amount}元</p></td>

			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit"
					value="重新確認行程"></td>
			</tr>
			<tr>
			
			</tr>
		</table>
	</form:form>
	<script type="text/javascript">
	
	var dailyArr= [];
	var pla_1 = 0;
	var pla_2 = 0;
	var pla_3 =0;
	var pla_4 = 0;
	var pla_5 = 0;
	$("select").change(function(){
		dailyArr.push($("#firPla").val());
		dailyArr.push($("#secPla").val());
		dailyArr.push($("#thrPla").val());
		dailyArr.push($("#fouPla").val());
		dailyArr.push($("#fifPla").val());
		pla_1 = $("#firPla").val();
		pla_2 = $("#secPla").val();
		pla_3 = $("#thrPla").val();
		pla_4 = $("#fouPla").val();
		pla_5 = $("#fifPla").val();
		console.log(pla_1);
		$.ajax({
			url : 'getplaceLan',
			type : 'POST',
			data : {
				pla1 : dailyArr.toString(),
		
			},
			success : function(dsch) {
				console.log(dsch[pla_1.toString()]);
				console.log(dsch[pla_2.toString()]);
				console.log(dsch[pla_3.toString()]);
				console.log(dsch[pla_4.toString()]);
				console.log(dsch[pla_5.toString()]);
				$("#firPla").val(pla_1);
				$("#secPla").val(pla_2);
				$("#thrPla").val(pla_3);
				$("#fouPla").val(pla_4);
				$("#fifPla").val(pla_5);

				}
		})
	});
	
	function recountDistance(pla){
		
	}
	</script>
</body>
</html>