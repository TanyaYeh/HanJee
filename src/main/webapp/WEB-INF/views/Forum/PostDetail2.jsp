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
<title>PostDetaile</title>


<script src="https://code.jquery.com/jquery-3.5.1.js"
	data-integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	data-crossorigin="anonymous"></script>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>文章明細</h2>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">

			<div class="col-md-5">
				<h3>${post.post_tit}</h3>
				<p>作者: ${post.mb.nickname}</p>
				<p>時間: ${post.post_time}</p>

				<p>文章內容: ${post.post_content}</p>



				<table>


					<tr>
						<td colspan='2' align='center'><a
							href="<c:url value='/tw/hanjee/PostUpdate/${post.post_no}' />">編輯</a>

						</td>
					</tr>
				</table>



			</div>
		</div>

		<p>
			<a href="<spring:url value='/tw/hanjee/posts' />"
				class="btn btn-default"> <span
				class="glyphicon-hand-left glyphicon"></span>返回
			</a>

		</p>

		<c:forEach var="com" items="${com}">

			<div>
				<p>${com.com_text }</p>
			</div>


			<a href="<c:url value='/tw/hanjee/ComDelet/${com.com_no}'  />">刪除</a>

		</c:forEach>
		<div id="commentArea">
			<div>
				<input type="text" id="comtext" placeholder="輸入留言..."></input>
				<button id="comsub" name="co" class="blog_btn">送出留言</button>

			</div>

		</div>


		<!-- 下面是給客戶KEY -->



		<script type="text/javascript">
			var postBeantest = $
			{
				post.post_no
			}
			console.log(postBeantest)

			$("#comsub").click(function() {

				// 				value = $("#comtext").val();
				// 				console.log(value)
				$.ajax({
					url : 'Comadd',
					type : 'POST',
					data : {
						co : $("#comtext").val(),
						post : postBeantest,
					// 						id: 6,

					},
					success : function(cb) {
						alert("留言新增完成");
						$("#commentArea").append(cb);

					}
				// 					fail :function(data){
				// 						alert("新增失敗");

				// 					}
				}

				)
			})
		</script>
	</section>
</body>
</html>
