<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insurance Creater</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/insCss/uiIcon.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/insCss/hsiangD.css">
<style>
.icon1:hover {
	box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.7);
}

.icon2:hover {
	box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.7);
}

.icon3:hover {
	box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.7);
}
.tab{
	margin:auto;
}
.tab tr, td {
	border: 1px white solid;
	width: 500px;
	font-size:18px;
	text-align: center;
	line-height:2em;
}

.tab th {
	border: 1px white solid;
	width: 500px;
	text-align: center;
	font-size: 26px;
	line-height:2em;
}
</style>
</head>
<body class="back">
 <div style="background-color:#152432; margin: 0 auto;">
                    <jsp:include page="/fragment/Top.jsp" />
                </div>


	<div id="accordion">
		<h3 id="hh">&nbsp;Q:為什麼要投保旅平險?</h3>
		<div id="inner">
			<p><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出門在外，難免遇到意外，不管是受傷、疾病還是行李遺失、班機延誤，投保旅遊保險能降低這些意外事故帶來的困擾。所謂「旅遊綜合保險」包含旅平險、海外急難救助、海外疾病以及旅遊不便險。單就旅平險來看，保障範圍與意外險雷同，尤其意外險是不分發生所在地，只要符合理賠條件即可，因此也有意外險搭配醫療險可取代旅遊保險一說，而且意外險的保費相對較便宜。不過，到保險公司投保旅遊險時，保險囊括海外急難救助、海外疾病等理賠，還是有相對優勢，建議有出國的人即便有意外險，還是要加保旅遊綜合保險。</font></p>
		</div>
		<h3 id="hh">&nbsp;Q:有什麼樣方案選擇?</h3>
		<div id="inner">
			<table class="tab">
				<tr>
					<th>商品項目</th>
					<th>保障內容</th>
				</tr>
				<tr>
					<td>漢吉寶平安旅行平安險 A 計畫</td>
					<td>
						<li>意外身故保險金或喪葬費用保險金</li>
						<li>意外失能保險金</li>
						<li>傷害醫療保險金</li>
					</td>
				</tr>
				<tr>
					<td>漢吉寶平安旅行平安險 B 計畫</td>
					<td>
						<li>突發疾病住院醫療保險金</li>
						<li>突發疾病門診醫療保險金</li>
					</td>
				</tr>
				<tr>
					<td>漢吉寶平安旅行平安險 C 計畫</td>
					<td>
						<li>突發疾病住院醫療保險金</li>
						<li>突發疾病門診醫院保險金</li>
						<li>突發疾病急診醫療保險金</li>
						<li>突發疾病住院補償保險金</li>
						<li>重大燒燙傷保險金</li>
					</td>
				</tr>
			</table>
		</div>
		<h3 id="hh">&nbsp;Q:發生事情的時候該怎麼處理?</h3>
		<div id="inner">
			<img alt="" src="${pageContext.request.contextPath}/images/insImages/travel.png">
		</div>
	</div>


	<script src="${pageContext.request.contextPath}/js/insJs/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/insJs/jquery-ui.js"></script>
	<script>
		$(function() {
			var icons = {
				header : "ui-icon-circle-plus",
				activeHeader : "ui-icon-circle-minus"
			};
			$("#accordion").accordion({
				icons : icons,
				heightStyle : "content",
				event : "click"
			});
			$("#toggle").on("click", function() {
				console.log($("#accordion").accordion("option", "icons"))
				if ($("#accordion").accordion("option", "icons")) {
					$("#accordion").accordion("option", "icons", null);
				} else {
					$("#accordion").accordion("option", "icons", icons);
				}
			});
		});
	</script>

	<div class="icon">
		<img alt=""
			src="${pageContext.request.contextPath}/images/insImages/insInput.jpg"
			width="200" data-toggle="modal" data-target="#exampleModal"
			class="icon1" /> <a href="index_shoppingcart"> <img alt=""
			src="${pageContext.request.contextPath}/images/insImages/insNoInput.jpg"
			width="200" class="icon2" /></a> <img alt=""
			src="${pageContext.request.contextPath}/images/insImages/insOther.jpg"
			width="200" data-toggle="modal" data-target="#showData" id="getData"
			class="icon3" />

	</div>







	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="header modal-header">
					<h5 class="modal-title" id="exampleModalLabel">請填寫詳細資料</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 				----------- -->
					<form:form method="post" modelAttribute="inputModel" id="dia">
						<form:hidden path="insId" />
						<div class="innerDiv">
							<label for="recipient-name" class="lab col-form-label">姓名</label>
						</div>
						<input  type="text" class="form-control"
							value="${LoginOK.realname}" id="name" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">出生年月日</label>
						</div>
						<form:input path="insBirth" type="date" class="form-control"
							id="birth" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">身分證字號</label>
						</div>
						<form:input path="insIdentify" type="text" class="form-control"
							value="F123456789" id="identify" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">性別</label><br>
						</div>
						<form:radiobutton path="insGender" value="Male" label="男" />
						<form:radiobutton path="insGender" value="Female" label="女" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">地址</label>
						</div>
						<form:input path="insAddress" type="text" class="form-control"
							value="台北市大安區復興南路一段390號2樓" id="address" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">連絡電話</label>
						</div>
						<form:input path="insPhone" type="text" class="form-control"
							value="0987654321" id="phone" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">計畫別</label><br>
						</div>
						<form:radiobutton path="insPlan" value="planA" label="A計畫" />
						<form:radiobutton path="insPlan" value="planB" label="B計畫" />
						<form:radiobutton path="insPlan" value="planC" label="C計畫" />
						<br>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">受益人姓名</label>
						</div>
						<form:input path="insBenefit" type="text" class="form-control"
							value="小三" id="benefit" />
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">受益人關係</label>
						</div>
						<form:select path="insBenefitRelation" class="sel" id="relationId">
							<form:option value="-1" label="請選擇" />
							<form:options items="${relationList}" />
						</form:select>
						<br>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">旅遊地點</label>
						</div>
						<form:select path="insTravLocation" class="sel" id="locationId">
							<form:option value="-1" label="請選擇" />
							<form:options items="${locationList}" />
						</form:select>
						<br>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">開始旅遊日期</label>
						</div>
						<input  type="date"
							class="form-control" id="start" value="${scheduleBean.sch_startD}"/>
						<br>
						<div class="innerDiv">
							<label for="message-text" class="col-form-label">結束旅遊日期</label>
						</div>
						<input  type="date" class="form-control" value="${scheduleBean.sch_startD}"
							id="end" />
					</form:form>
					<!-- 				----------- -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<input type="button" class="btn btn-primary" value="送出投保資料"
						id="send" />
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#send").click(function() {
			alert("新增送出資料");

			$.ajax({
				url : 'insEnter',
				type : 'POST',
				data : {
					name : $("#name").val(),
					birth : $("#birth").val(),
					identify : $("#identify").val(),
					gender : $("input[name='insGender']:checked").val(),
					address : $("#address").val(),
					phone : $("#phone").val(),
					plan : $("input[name='insPlan']:checked").val(),
					benefit : $("#benefit").val(),
					relationId : $("#relationId").val(),
					locationId : $("#locationId").val(),
					start : $("#start").val(),
					end : $("#end").val()
				},
				success : function(data) {
					$(location).prop('href', 'confirm');
				}
			});
		});
	</script>

	<div class="modal fade" id="showData" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="header modal-header">
					<h5 class="modal-title" id="exampleModalLabel">其他人投保選擇</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<canvas id="polar" width="200" height="200"></canvas>
					<br>
					<hr>
					<br>
					<canvas id="polar2" width="200" height="200"></canvas>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
	<div class="test0257" id="test0257"></div>
	
	<input type="hidden" value="${countA}" id="countA" />
	<input type="hidden" value="${countB}" id="countB" />
	<input type="hidden" value="${countC}" id="countC" />
	<input type="hidden" value="${countM}" id="countM" />
	<input type="hidden" value="${countF}" id="countF" />

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<script>
		var ctx = document.getElementById("polar");
		var a = document.getElementById("countA").value;
		var b = document.getElementById("countB").value;
		var c = document.getElementById("countC").value;
		example = new Chart(ctx, {
			type : "polarArea",
			data : {
				labels : [ "A-計畫", "B-計畫", "C-計畫" ],
				datasets : [ {
					data : [ a, b, c ],
					backgroundColor : [ 'rgba(21,36,50,0.5)',
							'rgba(164,200,197,0.5)', 'rgba(102,130,153,0.5)' ],
					borderWidth : 2
				} ]
			}
		})
	</script>
	
	<script>
		var ctx = document.getElementById("polar2");
		var a = document.getElementById("countM").value;
		var b = document.getElementById("countF").value;
		example = new Chart(ctx, {
			type : "pie",
			data : {
				labels : [ "男生", "女生" ],
				datasets : [ {
					data : [ a, b ],
					backgroundColor : [ 'rgba(21,36,50,0.5)',
							'rgba(164,200,197,0.5)' ],
					borderWidth : 2
				} ]
			}
		})
	</script>





</body>
</html>