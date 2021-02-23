<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- <div id="scheduleLink"><a href="<c:url value=''/>">自由行</a></div>
            <div id="ticketLink"><a href="<c:url value='/product_Index'/>">車票</a></div>
            <div id="fixScheduleLink"><a href="<c:url value='/fixSchedule_index'/>">主題旅遊</a></div>
            <div id="insuranceLink"><a href="<c:url value=''/>">旅遊保險</a></div>
            <div id="shoppingcartLink"><a href="<c:url value='/index_shoppingcart'/>">檢視購物車</a></div>
            <div id="orderListLink"><a href="<c:url value='/index_orderList'/>">檢視訂單</a></div> -->


<ul class="list-unstyled templatemo-accordion">
	<ul class="collapse show list-unstyled pl-3">
		<li><a href="<c:url value='/'/>" class="text-decoration-none">
				自由行 </a></li>
		<li><a href="<c:url value='/product_Index'/>"
			class="text-decoration-none">車票 </a></li>
		<li><a href="<c:url value='/fixSchedule_index'/>"
			class="text-decoration-none"> 主題旅遊 </a></li>
		<li><a href="<c:url value='/index_shoppingcart'/>"
			class="text-decoration-none"> 檢視購物車 </a></li>
		<li><a href="<c:url value='/insEnter'/>" class="text-decoration-none">
				旅遊保險 </a></li>
		<li><a href="<c:url value='/index_orderList'/>"
			class="text-decoration-none"> 檢視訂單 </a></li>
	</ul>

</ul>

