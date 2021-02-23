<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>PostDetaile</title>

<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111" />


<title>CodePen - Blog entry layouts</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">



<style>
body {
	background: #e5ded8;
	box-sizing: border-box;
}

.blog-container {
	background: #fff;
	border-radius: 5px;
	box-shadow: rgba(0, 0, 0, 0.2) 0 4px 2px -2px;
	font-family: "adelle-sans", sans-serif;
	font-weight: 100;
	margin: 48px auto;
	width: 20rem;
}

@media screen and (min-width: 480px) {
	.blog-container {
		width: 28rem;
	}
}

@media screen and (min-width: 767px) {
	.blog-container {
		width: 40rem;
	}
}

@media screen and (min-width: 959px) {
	.blog-container {
		width: 50rem;
	}
}

.blog-container a {
	color: #4d4dff;
	text-decoration: none;
	transition: 0.25s ease;
}

.blog-container a:hover {
	border-color: #ff4d4d;
	color: #ff4d4d;
}

.blog-cover {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/17779/yosemite-3.jpg");
	background-size: cover;
	border-radius: 5px 5px 0 0;
	height: 15rem;
	box-shadow: inset rgba(0, 0, 0, 0.2) 0 64px 64px 16px;
}

.blog-author, .blog-author--no-cover {
	margin: 0 auto;
	padding-top: 0.125rem;
	width: 80%;
}

.blog-author h3::before, .blog-author--no-cover h3::before {
	background:
		
	background-size: cover;
	border-radius: 50%;
	content: " ";
	display: inline-block;
	height: 32px;
	margin-right: 0.5rem;
	position: relative;
	top: 8px;
	width: 32px;
}

.blog-author h3 {
	color: #fff;
	font-weight: 100;
}

.blog-author--no-cover h3 {
	color: #999999;
	font-weight: 100;
}

.blog-body {
	margin: 0 auto;
	width: 80%;
}

.video-body {
	height: 100%;
	width: 100%;
}

.blog-title h1 a {
	color: #333;
	font-weight: 100;
}

.blog-summary p {
	color: #4d4d4d;
}

.blog-tags ul {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	list-style: none;
	padding-left: 0;
}

.blog-tags li+li {
	margin-left: 0.5rem;
}

.blog-tags a {
	border: 1px solid #999999;
	border-radius: 3px;
	color: #999999;
	font-size: 0.75rem;
	height: 1.5rem;
	line-height: 1.5rem;
	letter-spacing: 1px;
	padding: 0 0.5rem;
	text-align: center;
	text-transform: uppercase;
	white-space: nowrap;
	width: 5rem;
}

.blog-footer {
	border-top: 1px solid #e6e6e6;
	margin: 0 auto;
	padding-bottom: 0.125rem;
	width: 80%;
}

.blog-footer ul {
	list-style: none;
	display: flex;
	flex: row wrap;
	justify-content: flex-end;
	padding-left: 0;
}

.blog-footer li:first-child {
	margin-right: auto;
}

.blog-footer li+li {
	margin-left: 0.5rem;
}

.blog-footer li {
	color: #999999;
	font-size: 0.75rem;
	height: 1.5rem;
	letter-spacing: 1px;
	line-height: 1.5rem;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	white-space: nowrap;
}

.blog-footer li a {
	color: #999999;
}

.comments {
	margin-right: 1rem;
}

.published-date {
	border: 1px solid #999999;
	border-radius: 3px;
	padding: 0 0.5rem;
}

.numero {
	position: relative;
	top: -0.5rem;
}

.icon-star, .icon-bubble {
	fill: #999999;
	height: 24px;
	margin-right: 0.5rem;
	transition: 0.25s ease;
	width: 24px;
}

.icon-star:hover, .icon-bubble:hover {
	fill: #ff4d4d;
}
</style>

<script>
	window.console = window.console || function(t) {
	};
</script>



<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	data-integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	data-crossorigin="anonymous"></script>
</head>


<body translate="no">
	<svg display="none" version="1.1" xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink">
<defs>

<symbol id="icon-bubble" viewBox="0 0 1024 1024">
	<title>bubble</title>
	<path class="path1"
			d="M512 224c8.832 0 16 7.168 16 16s-7.2 16-16 16c-170.464 0-320 89.728-320 192 0 8.832-7.168 16-16 16s-16-7.168-16-16c0-121.408 161.184-224 352-224zM512 64c-282.784 0-512 171.936-512 384 0 132.064 88.928 248.512 224.256 317.632 0 0.864-0.256 1.44-0.256 2.368 0 57.376-42.848 119.136-61.696 151.552 0.032 0 0.064 0 0.064 0-1.504 3.52-2.368 7.392-2.368 11.456 0 16 12.96 28.992 28.992 28.992 3.008 0 8.288-0.8 8.16-0.448 100-16.384 194.208-108.256 216.096-134.88 31.968 4.704 64.928 7.328 98.752 7.328 282.72 0 512-171.936 512-384s-229.248-384-512-384zM512 768c-29.344 0-59.456-2.24-89.472-6.624-3.104-0.512-6.208-0.672-9.28-0.672-19.008 0-37.216 8.448-49.472 23.36-13.696 16.672-52.672 53.888-98.72 81.248 12.48-28.64 22.24-60.736 22.912-93.824 0.192-2.048 0.288-4.128 0.288-5.888 0-24.064-13.472-46.048-34.88-56.992-118.592-60.544-189.376-157.984-189.376-260.608 0-176.448 200.96-320 448-320 246.976 0 448 143.552 448 320s-200.992 320-448 320z"></path>
</symbol>

	<title>star</title>
	<path class="path1"
			d="M1020.192 401.824c-8.864-25.568-31.616-44.288-59.008-48.352l-266.432-39.616-115.808-240.448c-12.192-25.248-38.272-41.408-66.944-41.408s-54.752 16.16-66.944 41.408l-115.808 240.448-266.464 39.616c-27.36 4.064-50.112 22.784-58.944 48.352-8.8 25.632-2.144 53.856 17.184 73.12l195.264 194.944-45.28 270.432c-4.608 27.232 7.2 54.56 30.336 70.496 12.704 8.736 27.648 13.184 42.592 13.184 12.288 0 24.608-3.008 35.776-8.992l232.288-125.056 232.32 125.056c11.168 5.984 23.488 8.992 35.744 8.992 14.944 0 29.888-4.448 42.624-13.184 23.136-15.936 34.88-43.264 30.304-70.496l-45.312-270.432 195.328-194.944c19.296-19.296 25.92-47.52 17.184-73.12zM754.816 619.616c-16.384 16.32-23.808 39.328-20.064 61.888l45.312 270.432-232.32-124.992c-11.136-6.016-23.424-8.992-35.776-8.992-12.288 0-24.608 3.008-35.744 8.992l-232.32 124.992 45.312-270.432c3.776-22.56-3.648-45.568-20.032-61.888l-195.264-194.944 266.432-39.68c24.352-3.616 45.312-18.848 55.776-40.576l115.872-240.384 115.84 240.416c10.496 21.728 31.424 36.928 55.744 40.576l266.496 39.68-195.264 194.912z"></path>
</symbol>
</defs>
</svg>

	<div class="blog-container">

		<div class="blog-header">
			<div class="blog-cover">
				<div class="blog-author">
					<h3>作者: ${post.mb.nickname}</h3>
				</div>
			</div>
		</div>



		<div class="blog-body">
			<div class="blog-title">
			
			
				<h1>
					<a href="#">${post.post_tit}</a>
				</h1>
			</div>
			<div class="blog-summary">
				<p>
					文章內容: ${post.post_content} <a
						href="https://www.youtube.com/watch?v=hANtM1vJvOo">breathe</a>
				</p>
			</div>
			<div class="blog-tags">
				<ul>
					<li></li>


					<li><a href="#">web design</a></li>
					
					
					<li><a href="<spring:url value='/tw/hanjee/posts' />"
						class="btn btn-default"> <span
							class="glyphicon-hand-left glyphicon"></span>返回
					</a></li>
					
					
					<li><a
					href="<c:url value='/tw/hanjee/PostUpdate/${post.post_no}' />">編輯</a></li>
				</ul>
			</div>
		</div>

		<div class="blog-footer">
			<ul>
				<li class="published-date">${post.post_time}</li>


			


			</ul>
		</div>

	</div>





	<script type="text/javascript" src="//use.typekit.net/wtt0gtr.js"></script>
	<script type="text/javascript">
		try {
			Typekit.load();
		} catch (e) {
		}
	</script>
	<script
		src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script id="rendered-js">

	</script>



</body>

</html>

