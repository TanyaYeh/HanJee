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
<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111" />

<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111" />

<style>
body {
	font-family: arial;
	font-size: 14px;
	color: #fff;
	line-height: 1.6em;
}

a {
	color: #000;
	text-decoration: none;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

#container {
	width: 980px;
	margin: 120px auto;
}

#slider {
	width: 940px;
	height: 350px;
	position: relative;
	overflow: hidden;
	float: left;
	padding: 3px;
	border: #666 solid 2px;
	border-radius: 5px;
}

#slider img {
	width: 940px;
	height: 350px;
}

.slide {
	position: absolute;
}

.slide-copy {
	position: absolute;
	bottom: 0;
	left: 0;
	padding: 20px;
	background: #f7f7f7;
	background: rgba(0, 0, 0, 0.5);
}

#prev, #next {
	float: left;
	margin-top: 130px;
	cursor: pointer;
	position: relative;
	z-index: 100;
}

#prev {
	margin-right: -45px;
}

#next {
	margin-left: -45px;
}

@import url(https://fonts.googleapis.com/css?family=Raleway);

*, *:before, *:after {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	background: #f9f9f9;
	font-size: 16px;
	font-family: 'Raleway', sans-serif;
}

.main-title {
	color: #2d2d2d;
	text-align: center;
	text-transform: capitalize;
	padding: 0.7em 0;
}

.container {
	padding: 1em 0;
	float: left;
	width: 50%;
}

@media screen and (max-width: 640px) {
	.container {
		display: block;
		width: 100%;
	}
}

@media screen and (min-width: 900px) {
	.container {
		width: 33.33333%;
	}
}

.container .title {
	color: #1a1a1a;
	text-align: center;
	margin-bottom: 10px;
}

.content {
	position: relative;
	width: 90%;
	max-width: 400px;
	margin: auto;
	overflow: hidden;
}

.content .content-overlay {
	background: rgba(0, 0, 0, 0.7);
	position: absolute;
	height: 99%;
	width: 100%;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	opacity: 0;
	-webkit-transition: all 0.4s ease-in-out 0s;
	-moz-transition: all 0.4s ease-in-out 0s;
	transition: all 0.4s ease-in-out 0s;
}

.content:hover .content-overlay {
	opacity: 1;
}

.content-image {
	width: 100%;
}

.content-details {
	position: absolute;
	text-align: center;
	padding-left: 1em;
	padding-right: 1em;
	width: 100%;
	top: 50%;
	left: 50%;
	opacity: 0;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-webkit-transition: all 0.3s ease-in-out 0s;
	-moz-transition: all 0.3s ease-in-out 0s;
	transition: all 0.3s ease-in-out 0s;
}

.content:hover .content-details {
	top: 50%;
	left: 50%;
	opacity: 1;
}

.content-details h3 {
	color: #fff;
	font-weight: 500;
	letter-spacing: 0.15em;
	margin-bottom: 0.5em;
	text-transform: uppercase;
}

.content-details p {
	color: #fff;
	font-size: 0.8em;
}

.fadeIn-bottom {
	top: 80%;
}

.fadeIn-top {
	top: 20%;
}

.fadeIn-left {
	left: 20%;
}

.fadeIn-right {
	left: 80%;
}
</style>

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

			<div style="color: blue" align='center'>
				<c:if test="${! empty ManageLoginOK }">
					<a href="<c:url value='AddForum' />">新增主題</a>
				</c:if>
			</div>



		</div>
	</section>

	<!-- slider start 輪播-->
	<div id="container">
		<img
			src="https://res.cloudinary.com/dbvyp7222/image/upload/v1456862030/arrow-left_y4lb1y.png"
			alt="previous" id="prev">

		<div id="slider">
			<c:forEach var="forum" items="${forums}">
				<div class="slide">
					<div class="slide-copy">
						<a href="<spring:url value='forum?forum_no=${forum.forum_no}'/>">
							<h2>${forum.forum_name}</h2>
							<p>${forum.forum_des}</p>
					</div>

					<img
						src="https://res.cloudinary.com/dbvyp7222/image/upload/v1456862040/slide5_cvczs2.jpg"
						alt="slide 1"></a>
				</div>
			</c:forEach>
		</div>

		<img
			src="https://res.cloudinary.com/dbvyp7222/image/upload/v1456862029/arrow-right_jwnpst.png"
			alt="next" id="next" />
	</div>
	<!-- slider end -->






	<!-- Images Block start 1-1固定-->
	<div class="container">
		<h3 class="title">好景在眼前</h3>
		
		<div class="content">
			<a href="<c:url value='/friend/piForm'/>">
				<div class="content-overlay"></div> <img class="content-image"
				src="<c:url value='/images/tp.png' />">
				<div class="content-details fadeIn-bottom">
					<h3 class="content-title">行程規劃</h3>
					<p class="content-text">用在地風情去滋養你</p>

					<c:url value='/tw/hanjee' />
				</div>
			</a>
		</div>
	</div>


	<div class="container">
		<h3 class="title">交友</h3>
		
		<div class="content">
			<a href="<c:url value='/friend/piForm'/>">
				<div class="content-overlay"></div> <img class="content-image"
				src="<c:url value='/images/makef.jpg' />">
				<div class="content-details fadeIn-bottom">
					<h3 class="content-title">旅伴</h3>
					<p class="content-text">你我從現在沒有距離</p>

					<c:url value='/friend/piForm' />
				</div>
			</a>
		</div>
	</div>



	<div class="container">
		<h3 class="title">券住你的心</h3>
	
		<div class="content">
			<a href="<c:url value='/friend/piForm'/>">
				<div class="content-overlay"></div> <img class="content-image"
				src="<c:url value='/images/ticket2.png' />">
				<div class="content-details fadeIn-bottom">
					<h3 class="content-title">票券</h3>
					<p class="content-text">用票券讓你賺更多</p>

					<c:url value='/friend/piForm' />
				</div>
			</a>
		</div>
	</div>


	<!-- Images Block start -->
	<c:forEach var="forum" items="${forums}">
		<div class="container">
			<h3 class="title">${forum.forum_name}</h3>
			<div style="text-align: center">
				<c:if test="${! empty ManageLoginOK }">
					<a href="<c:url value='/tw/hanjee/forum/${forum.forum_no}'/>">編輯</a>
				</c:if>
			</div>



			<div class="content">
				<a href="<spring:url value='forum?forum_no=${forum.forum_no}'/>">
					<div class="content-overlay"></div> <img class="content-image"
					src="https://images.unsplash.com/photo-1433360405326-e50f909805b3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=359e8e12304ffa04a38627a157fc3362">
					<div class="content-details fadeIn-bottom">
						<h3 class="content-title">${forum.forum_name}</h3>
						<p class="content-text">${forum.forum_des}</p>

					</div>
				</a>
			</div>
		</div>
	</c:forEach>
	<!-- Images Block end -->

	<script
		src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script id="rendered-js">
		$(document).ready(function() {
			// set option
			var speed = 500; // fade speed
			var autoswitch = true; // auto slider option
			var autoswitch_speed = 4000; // aut slider speed

			// add initial active class
			$('.slide').first().addClass('active');

			// hide all slides
			$('.slide').hide();

			// show first slide
			$('.active').fadeIn();

			// Next slide handler
			$('#next').on('click', nextSlide);

			// Prev slide handler
			$('#prev').on('click', prevSlide);

			// Set auto rotate
			if (autoswitch === true) {
				var slideIntv = setInterval(nextSlide, autoswitch_speed);

				// pause on hover
				$("#slider").mouseenter(function() {
					clearInterval(slideIntv);
				});
				// start again
				$("#slider").mouseleave(function() {
					slideIntv = setInterval(nextSlide, autoswitch_speed);
				});
			}

			// switch to the next slide
			function nextSlide() {
				// remove active class
				$('.active').removeClass('active').addClass('oldActive');

				// check to see if we're on the last image
				if ($('.oldActive').is(':last-child')) {
					$('.slide').first().addClass('active');
				} else {
					$('.oldActive').next().addClass('active');
				}

				$('.oldActive').removeClass('oldActive');
				$('.slide').fadeOut(speed);
				$('.active').fadeIn(speed);
			}

			// switch to the previous slide
			function prevSlide() {
				// remove active class
				$('.active').removeClass('active').addClass('oldActive');

				// check to see if we're on the fist image
				if ($('.oldActive').is(':first-child')) {
					$('.slide').last().addClass('active');
				} else {
					$('.oldActive').prev().addClass('active');
				}

				$('.oldActive').removeClass('oldActive');
				$('.slide').fadeOut(speed);
				$('.active').fadeIn(speed);
			}
		});
		//# sourceURL=pen.js
	</script>
</body>
</html>