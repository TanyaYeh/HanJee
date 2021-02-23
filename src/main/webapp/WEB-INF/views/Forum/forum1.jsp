<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>forum</title>
<link rel='stylesheet' href="<c:url value='/css/styles.css'/>"
	type="text/css" />
</head>
<body>
	<div>
		<jsp:include page="/fragment/Top.jsp"></jsp:include>
	</div>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>論壇</h1>
			</div>


			<div align='center'>
				<a href="<c:url value='/' />">回首頁</a>
			</div>

			<div align='center'>
				<c:if test="${! empty ManageLoginOK }">
					<a href="<c:url value='AddForum' />">新增主題</a>
				</c:if>
			</div>



		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var="forum" items="${forums}">
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<div class="caption">
							<p>

								<b style='font-size: 16px;'>${forum.forum_name}</b>
							</p>
							<p>${forum.forum_des}</p>
							<p>${forum.forum_status}</p>
							<p>${forum.froum_lastupdate}</p>


							<div>
								<table>
									<tr>
										<td colspan='2' align='center'><c:if
												test="${! empty ManageLoginOK }">
												<a href="<c:url value='/tw/hanjee/ForumUpdate/${forum.forum_no}' />">編輯</a>
											</c:if></td>
									</tr>
								</table>
							</div>
							<p>
								<a href="<spring:url value='forum?forum_no=${forum.forum_no}'/>"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon">文章列表</span>


								</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>