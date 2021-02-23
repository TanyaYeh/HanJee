<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="/css/JQueryUi.css"> -->
<meta charset="UTF-8">
<title>HanJee</title>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->



<!-- Bootstrap -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> -->


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>

/* tooltip容器 */
.tooltip1 {
	/* 	trigger: item; */
	position: absolute;
	/* 	position: relative; */
	/* 	position: top; */
	display: inline-block;
	border-bottom: 1px dotted black;
	top: 5px;
	left: 50px;
	box-shadow: 3px 3px 12px gray;
}

.tooltip2 {
	/* 	trigger: item; */
	position: absolute;
	/* 	position: relative; */
	/* 	position: top; */
	display: inline-block;
	border-bottom: 1px dotted black;
	top: 60px;
	left: -75px;
	box-shadow: 3px 3px 12px gray;
}

.tooltip3 {
	/* 	trigger: item; */
	position: absolute;
	/* 	position: relative; */
	/* 	position: top; */
	display: inline-block;
	border-bottom: 1px dotted black;
	top: 300px;
	left: -100px;
	box-shadow: 3px 3px 12px gray;
}

.tooltip4 {
	/* 	trigger: item; */
	position: absolute;
	/* 	position: relative; */
	/* 	position: top; */
	display: inline-block;
	border-bottom: 1px dotted black;
	top: 300px;
	right: -50px;
	box-shadow: 3px 3px 12px gray;
}

.tooltip5 {
	/* 	trigger: item; */
	position: absolute;
	/* 	position: relative; */
	/* 	position: top; */
	display: inline-block;
	border-bottom: 1px dotted black;
	top: 5px;
	right: -100px;
	box-shadow: 3px 3px 12px gray;
}

/* Tooltip 文本 */
.tooltiptext {
	/* 	visibility: hidden; */
	width: 200px;
	background-color: black;
	color: #fff;
	text-align: center;
	padding: 5px 0;
	border-radius: 6px;
	/* 定位 */
	position: relative;
	/* 	z-index: 1; */
}

h4 {
	margin-top: 5px;
	margin-bottom: 5px;
}

/* 滑鼠移上去時出現提示框 */
/* .tooltip:hover .tooltiptext { */
/* 	visibility: visible; */
/* } */
#HangJeeMap {
	width: 490px;
	height: 596px;
	position: relative;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

img {
	position: absolute;
	/* 	position: relative; */
	/* 	left: 20%; */
	/* 	right: 20%; */
	/* 	top: 20% ; */
	padding: 0;
	margin: auto;
}

.flex-container {
	display: flex;
	height: 600px;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
}

.item {
	width: 25%;
	margin: 5px;
	justify-content: center;
	align-items: center;
	/*   font-size: 2rem; */
	padding: 10px;
}

#Rightdiv {
	justify-content: center;
	align-items: center;
	width: 30%;
}

#leftdiv {
	width: 30%;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 85%;
	margin-left: 15px;
	
}

ul li {
	/* 	margin: 0 3px 3px 3px; */
	margin: 3px;
	/*  	padding: 0.4em; */
	padding: 0.2em;
	/* 	padding-left: 1.5em; */
	font-size: 1.1em;
	height: 30px;
	width: 220px;
}

ul li span {
	position: absolute;
	margin-left: -1.3em;
	padding: 0;
}

#shopping_cart {
	background-color: rgba(247, 242, 146, .7);
	display: none;
	box-shadow: 3px 3px 12px gray;
	text-align: center;
	height: 350px;
	padding: 10px;
	width: 260px;
	float: right;
	border-radius: 6px;
	position:fixed;
	
	margin-top: 30px;
    margin-left: 80px;
    
   
}

h3 {
	margin-top: 10px;
	margin-bottom: 10px;
}

#divday1 {
	text-align: left;
}

.ui-icon {
	margin: 10px;
	margin-left: 3px;
	margin-right: 7px;
}

.ui-icon-closethick {
	/* margin-left:3em; */
	position: absolute;
	right: 0;
	margin-right: 30px;
}

/* #ShoppingCartIcon{ */
/* height: 40px; */
/* width: 50px; */
/* background-color: #FFCBB3; */
/*  position: absolute;   */
/* box-shadow: 3px 3px 12px gray; */
/*   float:left;  */
/*  position: absolute; */
/* display: inline-block; */
/* } */
b {
	margin-left: 35px;
}

pday1 {
	text-align: center;
}

.ui-widget-header {

}

#logo{


}
</style>

<body style="background-color: rgba(108, 137, 146,.4); margin: 0">
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSAzVL_iu7GLMHmoCb5I8qeXVlFtJlCQQ"></script>
	<!-- 	google map api -->
<!-- 	<div -->
<!-- 		style="background-color: #273037; height: 50px; margin: 0; padding-top: 10px; text-align: center;"> -->
<!-- 		<img id="logo" src="images/HanjeeLogo_250.png" style="float: left;position: relative;"> -->
<!-- <!-- 		<h1 style="text-align: center; margin: 0; color: #FFFFFF">HanJee</h1> -->
<!-- 	</div> -->
<%-- 	<div style="background-color: rgba(39, 48, 55); margin: 0 auto;"><jsp:include page="/fragment/Top.jsp" /> --%>
<!-- 	</div> -->
<jsp:include page="_header.jsp" />

	
	<div class="flex-container">
		<div id="leftdiv"></div>
		<div id='HangJeeMap' class="item"
			style='background-color: #C5DOD8; margin: auto;'>
			<img alt="Taiwan" src="images/taiwan_v2_new.png" usemap="#image-map">
			<map name="image-map">

				<area target="_self" alt="<c:out value='1'/>" title="台北101"
					coords="219,6,217,14,216,27,217,37,216,45,224,46,222,16"
					shape="poly" class="tooltip" id="1">

				<area target="_self" alt="<c:out value='2'/>" title="饒河夜市"
					coords="231,44,242,43,242,52,231,52" shape="poly" class="tooltip"
					id="2">

				<area target="_self" alt="<c:out value='3'/>" title="擎天崗"
					coords="237,38,229,35,237,32" shape="poly" class="tooltip" id="3">

				<area target="_self" alt="<c:out value='4'/>" title="西門町(紅樓)"
					coords="200,46,193,52,191,63,209,63,207,53" shape="poly"
					class="tooltip" id="4">

				<area target="_self" alt="<c:out value='5'/>" title="野柳"
					coords="244,23,246,30,243,36,249,36,251,26" shape="poly"
					class="tooltip" id="5">

				<area target="_self" alt="<c:out value='6'/>" title="淡水漁人碼頭"
					coords="186,22,192,34,205,39,194,42,189,38,176,37,190,36,189,30,192,34"
					shape="poly" class="tooltip" id="6">

				<area target="_self" alt="<c:out value='7'/>" title="九份"
					coords="264,42,256,46,252,50,257,55,263,60,268,60,270,48"
					shape="poly" class="tooltip" id="7">

				<area target="_self" alt="<c:out value='8'/>" title="平溪老街"
					coords="243,67,239,74,243,82,252,81,251,69" shape="poly"
					class="tooltip" id="8">

				<area target="_self" alt="<c:out value='9'/>" title="碧潭"
					coords="217,65,214,70,215,80,225,80,223,68" shape="poly"
					class="tooltip" id="9">

				<area target="_self" alt="<c:out value='10'/>" title="深坑老街"
					coords="234,56,227,62,234,67,243,63" shape="poly" class="tooltip"
					id="10">

				<area target="_self" alt="<c:out value='11'/>" title="小烏來天空步道"
					coords="182,83,197,84,210,82,210,90,198,93,182,91" shape="poly"
					class="tooltip" id="11">

				<area target="_self" alt="<c:out value='12'/>" title="拉拉山"
					coords="177,100,168,110,171,120,181,127,192,120,190,110,198,108,190,98"
					shape="poly" class="tooltip" id="12">

				<area target="_self" alt="<c:out value='13'/>" title="冬山河親水公園"
					coords="255,94,268,94,272,107,271,115,256,113,254,107" shape="poly"
					class="tooltip" id="13">

				<area target="_self" alt="<c:out value='14'/>" title="豆腐岬風景區"
					coords="258,126,252,133,252,140,248,148,244,164,230,170,280,170,267,156,263,148,265,142,263,135"
					shape="poly" class="tooltip" id="14">

				<area target="_self" alt="<c:out value='15'/>" title="武陵農場"
					coords="160,202,161,216,159,242,197,240,193,230,181,234,180,222,175,222,196,217,197,203,185,202,180,213,173,206"
					shape="poly" class="tooltip" id="15">

				<area target="_self" alt="<c:out value='16'/>" title="雪霸國家公園"
					coords="132,148,126,156,122,156,111,174,135,174,141,168,139,161,140,154"
					shape="poly" class="tooltip" id="16">

				<area target="_self" alt="<c:out value='17'/>" title="彩虹眷村"
					coords="66,235,61,227,69,220,82,220,91,230,78,236,86,236"
					shape="poly" class="tooltip" id="17">

				<area target="_self" alt="<c:out value='18'/>" title="台中國家歌劇院"
					coords="87,202,88,190,96,190,107,189,116,192,117,202" shape="poly"
					class="tooltip" id="18">

				<area target="_self" alt="<c:out value='19'/>" title="逢甲夜市"
					coords="107,241,122,241,123,249,123,255,125,262,107,262,107,254,103,249"
					shape="poly" class="tooltip" id="19">

				<area target="_self" alt="<c:out value='20'/>" title="高美濕地"
					coords="55,183,53,186,37,198,55,193,58,216,56,194,70,202,64,191,61,188,61,186,61,172,55,183"
					shape="poly" class="tooltip" id="20">

				<area target="_self" alt="<c:out value='21'/>" title="大雪山國家森林遊樂區"
					coords="149,174,131,196,179,195" shape="poly" class="tooltip"
					id="21">

				<area target="_self" alt="<c:out value='22'/>" title="安平古堡"
					coords="10,299,8,305,8,320,6,328,37,329,34,322,35,316,31,312,18,313,15,322,13,322,14,305,15,322"
					shape="poly" class="tooltip" id="22">

				<area target="_self" alt="<c:out value='23'/>" title="赤崁樓"
					coords="41,333,33,342,32,357,53,357,52,339" shape="poly"
					class="tooltip" id="23">

				<area target="_self" alt="<c:out value='24'/>" title="大魯閣草衙道"
					coords="61,412,53,420,40,424,41,434,49,434,56,428,59,436,66,434,57,427,66,420"
					shape="poly" class="tooltip" id="24">

				<area target="_self" alt="<c:out value='25'/>" title="義大遊樂世界"
					coords="75,378,14" shape="circle" class="tooltip" id="25">

				<area target="_self" alt="<c:out value='26'/>" title="鳳儀書院"
					coords="81,401,70,408,71,416,97,416,99,406,90,402" shape="poly"
					class="tooltip" id="26">

				<area target="_self" alt="<c:out value='27'/>" title="六合觀光夜市"
					coords="27,369,46,369,47,387,27,386" shape="poly" class="tooltip"
					id="27">
				<area target="_self" alt="<c:out value='28'/>" title="遠雄海洋公園"
					coords="242,286,237,281,222,283,213,284,211,298,212,307,215,313,213,321,223,316,216,308,223,296,229,293,233,295,235,288"
					shape="poly" class="tooltip" id="28">

				<area target="_self" alt="<c:out value='29'/>" title="太魯閣國家公園"
					coords="183,253,173,260,155,278,212,278,197,259,193,262"
					shape="poly" class="tooltip" id="29">

				<area target="_self" alt="<c:out value='30'/>" title="鹿野高台"
					coords="177,384,171,369,167,357,174,344,190,352,187,366,181,383"
					shape="poly" class="tooltip" id="30">



			</map>


		</div>
		<%-- 	<div style='float: right; width: 300px'><jsp:include --%>
		<%-- 			page="/fragment/list.jsp" /> --%>
		<!-- 	</div> -->
		<div class="item" id="Rightdiv">
			<!-- 		<div id="ShoppingCartIcon"> -->
			<!-- 		<img src="images/OrangeCart.png"></div> -->
			<div id="shopping_cart">
				<h3>我的自由行行程</h3>
				旅行日期:<input id='datepicker' type='text' />
				<!-- 			 <select> -->
				<!-- 				<option>想要玩幾天</option> -->
				<!-- 				<option>2</option> -->
				<!-- 				<option>3</option> -->
				<!-- 				<option>4</option> -->
				<!-- 				<option>5</option> -->
				<!-- 				<option>6</option> -->
				<!-- 			</select> -->
				<div id="divday1">
					<p id='pday1'></p>
					<ul id="day1" class="">
					</ul>
				</div>
				<!-- 			<ul id="day2" class=""> -->
				<!-- 			</ul> -->
				<!-- 			<ul id="day3" class=""> -->
				<!-- 			</ul> -->
				<!-- 			<ul id="day4" class=""> -->
				<!-- 			</ul> -->
				<!-- 			<ul id="day5" class=""> -->
				<!-- 			</ul> -->
				<!-- 			<ul id="day6" class=""> -->
				<!-- 			</ul> -->
				<%-- <a href="<c:url value='/tw/hanjee/schedule/controller/demo1'/>"><button  name="TEST" type="button" value="234">加入購物車</button></a> --%>
				<button id='shoppingCartbut' name='TEST' type='button' value='234'
					style="display: none">加入購物車</button>

			</div>


		</div>


	</div>

	<div id="dialog" title="自由行旅程"></div>
	<!-- <button id="opener">打开对话框</button> -->
<jsp:include page="_footer.jsp" />
	<script>
		// 	$(document).ready(function(){
		// 	$('#ShoppingCartIcon').click(function(){
		// 		$('#shopping_cart').animate({width:'toggle'},350);
		// 		});
		// 	});

		$(function() {
			$("#dialog").dialog({
				autoOpen : false,
				open: function (event, ui) {
					$(".ui-dialog-titlebar-close").hide();
				},
				show : {
					effect : "blind",
					duration : 1000},
				hide : {
					effect : "blind",
					duration : 1000},
					buttons:{
						"確定":function (){
							document.location.href="<c:url value='/product_Index'/>";
						}
					},
					modal: true,
			});

			$("#shoppingCartbut").click(function() {
				$("#dialog").dialog("open");
			});
		});

		var div1 = " <div class='tooltip1' id='tooltip";
		var div2 = " <div class='tooltip2' id='tooltip";
		var div3 = " <div class='tooltip3' id='tooltip";
		var div4 = " <div class='tooltip4' id='tooltip";
		var div5 = " <div class='tooltip5' id='tooltip";
		var divsecond= "'> <div class='tooltiptext'><h4> ";
		var divend = "</div></div>";
		var butclass = "<button type='button' class='";
		var butvalue = "' value='";
		var butname = "' name='";
		var butid = "' onclick='addplace(this)' id='";
		var butend = "'>加入</button>";

		var allData = JSON.parse('${pcdb}');
		// 	

		var clickChecked = false;
		var mouseliveChecked = false;
		$(function() {
			$("area")
					.mouseenter(
							function() {

								console.log(this.id);
								let targetId = this.id;

								data = allData.filter(function(item) {
									return item.pla_no == targetId
								});
								console.log(data);
								console.log(data[0].pla_des);

								if (1 <= data[0].pla_no && data[0].pla_no <= 4|| data[0].pla_no==6||data[0].pla_no==9||11 <= data[0].pla_no && data[0].pla_no <= 12) {

									$("#" + data[0].pla_no)
											.append(
													div1
															+ data[0].pla_no
															+ divsecond
															+ data[0].placeBean.pla_name
															+ "</h4>景點敘述:<br>"
															+ data[0].pla_des
															+ "<br>"
															+ butclass
															+ butvalue
															+ data[0].pla_no
															+ butname
															+ data[0].placeBean.pla_name
															+ butid
															+ data[0].pla_no
															+ butend

											);
								} else if (16 <= data[0].pla_no && data[0].pla_no <= 21) {
									$("#" + data[0].pla_no)
											.append(
													div2
															+ data[0].pla_no
															+ divsecond
															+ data[0].placeBean.pla_name
															+ "</h4>景點敘述:<br>"
															+ data[0].pla_des
															+ "<br>"
															+ butclass
															+ butvalue
															+ data[0].pla_no
															+ butname
															+ data[0].placeBean.pla_name
															+ butid
															+ data[0].pla_no
															+ butend

											);

								} else if (22 <= data[0].pla_no
										&& data[0].pla_no <= 27) {
									$("#" + data[0].pla_no)
											.append(
													div3
															+ data[0].pla_no
															+ divsecond
															+ data[0].placeBean.pla_name
															+ "</h4>景點敘述:<br>"
															+ data[0].pla_des
															+ "<br>"
															+ butclass
															+ butvalue
															+ data[0].pla_no
															+ butname
															+ data[0].placeBean.pla_name
															+ butid
															+ data[0].pla_no
															+ butend

											);

								} else if (28 <= data[0].pla_no
										&& data[0].pla_no <= 30
										|| data[0].pla_no == 15) {
									$("#" + data[0].pla_no)
											.append(
													div4
															+ data[0].pla_no
															+ divsecond
															+ data[0].placeBean.pla_name
															+ "</h4>景點敘述:<br>"
															+ data[0].pla_des
															+ "<br>"
															+ butclass
															+ butvalue
															+ data[0].pla_no
															+ butname
															+ data[0].placeBean.pla_name
															+ butid
															+ data[0].pla_no
															+ butend

											);

								}else if(data[0].pla_no==5|| 7 <= data[0].pla_no && data[0].pla_no <= 8|| data[0].pla_no==10 ||13 <= data[0].pla_no && data[0].pla_no <= 14){
									
									$("#" + data[0].pla_no)
									.append(
											div5
													+ data[0].pla_no
													+ divsecond
													+ data[0].placeBean.pla_name
													+ "</h4>景點敘述:<br>"
													+ data[0].pla_des
													+ "<br>"
													+ butclass
													+ butvalue
													+ data[0].pla_no
													+ butname
													+ data[0].placeBean.pla_name
													+ butid
													+ data[0].pla_no
													+ butend);
									
									
									
								}

							}).click(function() {
						clickChecked = true;
						get();

					}).mouseleave(function() {
						mouseliveChecked = true;
						get();
					});

			function get() {
				if (clickChecked == true) {

					function removieoption() {
						$("#tooltip" + data[0].pla_no).remove();
						clickChecked = false;
					}
					;
					setTimeout(removieoption, 1500);

				} else if (mouseliveChecked == true) {
					$("#tooltip" + data[0].pla_no).remove();
					mouseliveChecked = false;
				}
				;
			}
			;

		});

		function addplace(obj) { //點選加入行程按鈕時會在購物車加入景點

			var lifirst = "<li class='ui-state-default ";
		    var liclass="' id='";
			var limid="'><span class='ui-icon ui-icon-arrowthick-2-n-s'/>";
			var liend = "<span class='ui-icon ui-icon-closethick' id='deleteplace' onclick='removePlace(this)'>";
			var liendend = "</span></li>";

			var lis1 = $('#day1 li').length;
			var lis2 = $('#day2 li').length;
			// 			$('#sortable')
			// 			$('#shopping_cart').css("visibility", "visible");
			

			if($("#loginA").text()=='登 入'){
			    alert("請先登入");
			    window.location.href = "<c:url value='/tw/hanjee/login'/>";
			   }else{
			    $('#shopping_cart').show();
			    $('#day1').append(
			      lifirst + obj.id + liclass + obj.id + limid + obj.name
			        + liend + obj.id + liendend);
			    
			   }
			// 			if (lis1 <= 4) {
			// 				$('#day1')
			// 						.append(lifirst + obj.name + limid + obj.name + liend);
			// 				console.log(lis1)
			// 			} else if (lis1 > 4) {
			// 				$('#day2')
			// 						.append(lifirst + obj.name + limid + obj.name + liend);
			// 			}
			// 			;

		};

		   

		function removePlace(obj) {
			let classNo = $(obj).html();
			// 			 $("#deleteplace").closest("li #classNo").remove();
			console.log($("." + classNo));
			$("." + classNo).remove();
			// 			 let test =$("#deleteplace").val();
			// let test=obj.attr("value");

		};

		$(function() {
			$("#sortable").disableSelection();
		});

		var matrixService = new google.maps.DistanceMatrixService();
		var directionsService = new google.maps.DirectionsService();
		$(function() { //停止排列動作時會回傳序列至後端

			var arr = '';
			var sort = $("#day1")
					.sortable(
							{
								cursor : "pointer",
								opacity : 0.7,
								items : "li",
								start : function() {
									startarr = $("#day1").sortable('toArray')
											.toString();
									console.log("startarr=" + startarr);
								},
								stop : function() {

									arr = $("#day1").sortable('toArray')
											.toString();
									console.log(arr);

									$
											.ajax({
												type : 'post',
												url : 'tw/hanjee/schedule/controller/placeList',
												data : {
													place_list : arr,
												},
												success : function(data) {

													console.log(data);
													var len = data.length;
													console.log(len);

													var allplaceLan = [];

													var originLat = Number(data[0]);
													var originLng = Number(data[1]);
													var origin = new google.maps.LatLng(
															originLat,
															originLng);
													console.log("origin"
															+ origin);
													allplaceLan.push(originLat);

													var destinations = [];
													for (i = 2; i < len; i += 2) {
														destinations
																.push(new google.maps.LatLng(
																		data[i],
																		data[i + 1]));

													}

													matrixService
															.getDistanceMatrix(
																	{
																		origins : [ origin ],
																		destinations : destinations,
																		travelMode : 'DRIVING',
																		unitSystem : google.maps.UnitSystem.METRIC,
																		avoidHighways : false,
																		avoidTolls : false,
																	}, callback);

													function callback(response,
															status) {
														console.log(response)

														for (let j = 0, len = destinations.length; j < len; j++) {
															destinations[j].distance = response.rows[0].elements[j].distance.value;
															destinations[j].distance_text = response.rows[0].elements[j].distance.text;

														}
														destinations = destinations
																.sort(function(
																		a, b) {
																	return a.distance < b.distance ? 1
																			: -1;
																}); //利用距離由大到小排列，取得最遠的距離當作是終點
														// 														console.log(destinations);
														var jsonDes = JSON
																.stringify(destinations); //將陣列轉成json字串
														// 														console.log(jsonDes);
														var jsonparse = JSON
																.parse(jsonDes); //再將json字串轉成js的數值，可取得經緯度
														console.log(jsonparse);

														// 														var start=[originLat,originLng];
														var endLat = jsonparse[0].lat;
														var endLng = jsonparse[0].lng;
														var end = new google.maps.LatLng(
																endLat, endLng); //把距離最遠的點放到終點

														destinations = destinations
																.sort(function(
																		a, b) {
																	return a.distance > b.distance ? 1
																			: -1;
																}); //利用距離再由小到大排列，取出中間經過的景點

														var jsonDes1 = JSON
																.stringify(destinations);
														var jsonparse1 = JSON
																.parse(jsonDes1);
														console.log(jsonparse1);

														var waypts = [];

														for (e = 0; e < (jsonparse1.length - 1); e++) {
															wa = new google.maps.LatLng(
																	jsonparse1[e].lat,
																	jsonparse1[e].lng);
															waypts
																	.push({
																		location : wa,
																		stopover : false

																	});

															allplaceLan
																	.push(jsonparse1[e].lat);

															$("#day1Checkbox")
																	.append(
																			"<p>"
																					+ jsonparse1[e].lat
																					+ "</p>");

															// 															console.log("jsonparse[e].lat"+jsonparse[e].lat+"jsonparse[e].lng"+jsonparse[e].lng)
															console.log(waypts)
														}
														;
														// 														console.log("jsonparse.lat"+jsonparse.lat+"jsonparse.lng"+jsonparse.lng);

														var request = {
															origin : origin,
															destination : end,
															waypoints : waypts,
															optimizeWaypoints : true,
															travelMode : google.maps.DirectionsTravelMode.DRIVING,
															unitSystem : google.maps.UnitSystem.METRIC,
														};

														directionsService
																.route(
																		request,
																		function(
																				response,
																				status) {
																			console
																					.log(response);
																			console
																					.log(response.routes[0].legs[0].distance.text);
																			console
																					.log(response.routes[0].legs[0].distance.value);

																			allplaceLan
																					.push(endLat);
																			console
																					.log("allplaceLan"
																							+ allplaceLan);
																			var allplaceLanStr = allplaceLan
																					.toString(); //將陣列轉成JSON字串

																			var distanceValue = response.routes[0].legs[0].distance.value;
																			if (distanceValue > 260000) {
																				alert("單日旅程距離不建議超過260公里!")

																			}

																			$
																					.ajax({
																						url : "tw/hanjee/schedule/controller/GetPleaceBean",
																						type : 'POST',
																						data : {
																							LanStr : allplaceLanStr,
																						},
																						success : function(
																								data) {
																							if (data == "") {
																								alert("請先登入會員");
																								window.location.href = "<c:url value='/tw/hanjee/login'/>";
																							}

																							console
																									.log(data);
																							console
																									.log(data[1].pla_no);

																							console
																									.log("data.size()="
																											+ Object
																													.keys(data).length);
																							var schDay0 = $(
																									"#pday1")
																									.text();

																							if (schDay0 == "") {
																								
																								alert("請選擇日期");
// 																								break;
																							} else {
																								$(
																								"#shoppingCartbut")
																								.show();
																								
																							};

																							var showarr = [];
																							var dateplarr = [];
																							
																							$("#shoppingCartbut").click(function() {
																								$("#dialog").empty();
																								var schDay = $("#pday1").text();
																								showarr.push(schDay);
																								dateplarr.push(schDay);
																								$("#dialog").append("<p>旅遊日期:" + schDay + "</p><p>旅遊地點規劃:</p>");
																								dateplarr.push(distanceValue);
																								
																								for (i = 1; i <= Object.keys(data).length; i++) {
																									showarr.push(data[i].pla_name);
																									dateplarr.push(data[i].pla_no);
																									$("#dialog").append("<p>"+ data[i].pla_name + "</p>");
																								}

																								var dateplarrStr = dateplarr.toString();
																								console.log(dateplarrStr);
																								

																												$.ajax({
																															url : 'tw/hanjee/schedule/controller/sendSchedule',
																															type : 'POST',
																															data : {
																																scheduleList : dateplarrStr,
																															},
																															success : function(
																																	data) {
																																console
																																		.log("helllloooooooo"
																																				+ data["sch_no"]);

																																// 																									                                document.location.href="<c:url value='/product_Index'/>";
																															}
																														})
																											})

																						}
																					})
																		})
													}

												}
											});
								}
							});

		});

		// 		$(function() {
		// 			var arr = '';
		// 			var sort = $("#day1").sortable({
		// 				connectWith : ".ui-sortable",
		// 				opacity : 0.7,
		// 				stop : function() {
		// 					arr1 = $("#day1").sortable('toArray').toString();
		// 					console.log("#day1=" + arr1);

		// 				}
		// 			});

		// 		});

		// 		$(function() {
		// 			var arr = '';
		// 			var sort = $("#day2").sortable({
		// 				connectWith : ".ui-sortable",
		// 				opacity : 0.7,
		// 				stop : function() {
		// 					arr2 = $("#day2").sortable('toArray').toString();
		// 					console.log("#day2=" + arr2);

		// 				}
		// 			});

		// 		});

		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "yy-mm-dd",
				minDate : "dateToday",
				onSelect : function(date, obj) {
					$('.date').remove();
					$("#pday1").html("<b>" + date + "</b>");
					$('#day1Checkbox').append("<p>" + date + "</p>");
				}
			});

		});
	</script>
	<script>
		var loginmanager = 0
		$(document).keyup(function(event) {
			if (event.keyCode == 96) {
				loginmanager = 0
			}
			switch (event.keyCode) {
			case 72:
				console.log("H");
				loginmanager += 72;
				console.log(loginmanager)
				return;
			case 65:
				console.log("A");
				loginmanager += 65;
				console.log(loginmanager)
				return;
			case 78:
				console.log("N");
				loginmanager += 78;
				console.log(loginmanager)
				return;
			case 74:
				console.log("J");
				loginmanager += 74;
				console.log(loginmanager)
				return;
			case 69:
				console.log("E");
				loginmanager += 69;
				if (loginmanager == 427) {
					window.location.href = "tw/hanjee/managerlogin";
					loginmanager = 0
				}

				return;

			}
		});
	</script>
	<script type="text/javascript">
		var mbbph = "${LoginOK.mobile_phone}";
		if (mbbph.length >= 13) {
			alert("您違反了社群規範，若有疑義，請點擊論壇寄信至管理員信箱test123@gmail.com");
		}
	</script>
</body>
</html>