<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConfirmPage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	data-integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	data-crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	data-integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	data-crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	data-integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	data-crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	data-integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	data-crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="css/insCss/hsiangD.css">
<style>
body{
	background-color: #E2E7DB;
}
h2 {
	text-align: center;
	background-color: #152432;
	color: white;
	font-size: 28px;
	height: 150%;
}


table{
	border: 1px black solid;
	margin: 30px auto;
}
tr{
	border: 1px black solid;
	height: 50px;
}
th{
	border: 1px black solid;
	text-align:center;
	width:160px;
	background-color: #272F3C;
	color: #E2E7DB;
}
td{
	border: 1px black solid;
	text-align: center;
	width:160px;
	background-color:#668299;
	color:white;
}

td:hover{
	background-color:#A4C8C5;
}
.confirm_btn{
	width:100px;
	margin: 30px auto;
}
</style>
</head>
<body>
 <div style="background-color:#152432; margin: 0 auto;">
                    <jsp:include page="/fragment/Top.jsp" />
                </div>
	<h2>投保資訊一覽</h2>
	<table>
		<tr>
			<th>保單號碼</th>
			<th>被保險人姓名</th>
			<th>出生年月日</th>
			<th>身分證字號</th>
			<th>性別</th>
			<th>聯絡地址</th>
			<th>連絡電話</th>
			<th>計畫方案</th>
			
		</tr>
		<tr>
			<td>${myData.insNum}</td>
			<td>${myData.insName}</td>
			<td>${myData.insBirth}</td>
			<td>${myData.insIdentify}</td>
			<td>${myData.insGender}</td>
			<td>${myData.insAddress}</td>
			<td>${myData.insPhone}</td>
			<td>${myData.insPlan}</td>
		</tr>
		<tr>
			<th>受益人姓名</th>
			<th>受益人關係</th>
			<th>旅遊地點</th>
			<th>旅遊開始日期</th>
			<th>旅遊結束日期</th>
			<th>旅遊天數</th>
			<th>總保費</th>
			<th>操作</th>
		</tr>
		<tr>
			<td>${myData.insBenefit}</td>
			<td>${myData.insBR.relation}</td>
			<td>${myData.insLF.location}</td>
			<td>${myData.insTravStartDate}</td>
			<td>${myData.insTravEndDate}</td>
			<td>${myData.insTravDays}</td>
			<td>NT.   ${50+(myData.insLF.feePerDay)*(myData.insTravDays)}</td>
			<td><input type="button" value="更正" id="update" data-toggle="modal" data-target="#exampleModal"  /> <a href="delete/${myData.insId}" ><input type="button" value="刪除" id="goto" /></a></td>
		</tr>
		
	</table>
	<div class="confirm_btn">
		<a href="index_shoppingcart"><input type="button" value="確定投保" ></a>
	</div>
	



	
	
<!-- 	<div class="icon"> -->
<%-- 		<img alt=""	src="${pageContext.request.contextPath}/images/insIcon.jpg" --%>
<!-- 			width="200" data-toggle="modal" data-target="#exampleModal" -->
<!-- 			class="icon1" />  -->
<%-- 		<a href="confirm"> <img alt=""	src="${pageContext.request.contextPath}/images/insIconReject.jpg" --%>
<!-- 			width="200" class="icon2" /></a> -->
<!-- 	</div> -->
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="header modal-header">
					<h5 class="modal-title" id="exampleModalLabel">請更新詳細資料</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 				----------- -->
					<form:form method="post" modelAttribute="myData"  >
						<form:hidden path="insId" />
						<div class="innerDiv">
							<label for="recipient-name" class="lab col-form-label">姓名</label>
						</div>
						<form:input path="insName"  type="text" class="form-control" value="${myData.insName }" id="name" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">出生年月日</label>
						</div>
						<form:input path="insBirth"  type="date" class="form-control" id="birth" value="${myData.insBirth}" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">身分證字號</label>
						</div>
						<form:input path="insIdentify"  type="text" class="form-control" value="${myData.insIdentify }" id="identify" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">性別</label><br>
						</div>
						<form:radiobutton path="insGender" value="Male"  label="男"   />
						<form:radiobutton path="insGender" value="Female" label="女"  />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">地址</label>
						</div>
						<form:input path="insAddress" type="text" class="form-control" value="${myData.insAddress }" id="address" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">連絡電話</label>
						</div>
						<form:input path="insPhone" type="text" class="form-control" value="${myData.insPhone }" id="phone" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">計畫別</label><br>
						</div>
						<form:radiobutton path="insPlan" value="planA" label="A計畫"  />
						<form:radiobutton path="insPlan" value="planB" label="B計畫"  />
						<form:radiobutton path="insPlan" value="planC" label="C計畫"  />
						<br>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">受益人姓名</label>
						</div>
						<form:input path="insBenefit" type="text" class="form-control" value="${myData.insBenefit }" id="benefit" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">受益人關係</label>
						</div>
						<form:select path="insBenefitRelation" class="sel" id="relationId">
							<form:option value="${myData.insBR.id}" label="${myData.insBR.relation}" />
							<form:options items="${relationList}" />
						</form:select>
						<br>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">旅遊地點</label>
						</div>
						<form:select path="insTravLocation" class="sel" id="locationId">
							<form:option value="${myData.insLF.id}" label="${myData.insLF.location}" />
							<form:options items="${locationList}"  />
						</form:select>
						<br>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">開始旅遊日期</label>
						</div>
						<form:input path="insTravStartDate" type="date" class="form-control" id="start" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">結束旅遊日期</label>
						</div>
						<form:input path="insTravEndDate" type="date" class="form-control" id="end" />
						</form:form>
						<!-- 				----------- -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<input type="button" class="btn btn-primary" value="送出更新資料" id="send" />
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/insJs/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$("#send").click(function(){
			alert("送出更新資料");
		
			$.ajax({
				url:'insUpdate',
				type:'POST',
				data:{
					name:$("#name").val(),
					birth:$("#birth").val(),
					identify:$("#identify").val(),
					gender:$("input[name='insGender']:checked").val(),
					address:$("#address").val(),
					phone:$("#phone").val(),
					plan:$("input[name='insPlan']:checked").val(),
					benefit:$("#benefit").val(),
					relationId:$("#relationId").val(),
					locationId:$("#locationId").val(),
					start:$("#start").val(),
					end:$("#end").val()
				},
				success:function(data){
					$(location).prop('href', 'confirm');
				}
			});
		});
	</script>
	
	

	
</body>
</html>