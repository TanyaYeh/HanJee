<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>PostDetaile</title>

  <link href="https://fonts.googleapis.com/css?family=Merriweather:900|Noto+Sans" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
  
<style>
/** =VARIABLES**/
@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(5px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(5px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
*,
*:before,
*:after {
  box-sizing: border-box;
}

.group:after {
  content: "";
  display: table;
  clear: both;
}

html, body, div, span, h1, h2, h3, p, fieldset {
  border: 0;
  margin: 0;
  padding: 0;
}

html, body {
  font-size: 12px;
}

h2 {
  font: 2rem/1.3 "merriweather";
  margin-bottom: 2rem;
}

p {
  margin-bottom: 1.5rem;
}

.meta {
  color: rgba(18, 22, 24, 0.7);
}

.button {
  border: none;
  font: 600 1rem/1.2 "noto sans";
  padding: 1rem 2rem;
  text-align: center;
  text-decoration: none;
  letter-spacing: 1px;
  text-transform: uppercase;
}
.button_primary {
  background: #121618;
  color: #FFF;
}
.button:hover {
  background: #1701EF;
}

label {
  font: 700 1.2rem "noto sans";
  margin-bottom: 1rem;
}

label, input {
  display: block;
  width: 100%;
}

input {
  background: transparent;
  border: none;
  border-bottom: 1px solid rgba(18, 22, 24, 0.5);
  font: 1.2rem "noto sans";
  margin-bottom: 3rem;
  padding: 0.5rem 0;
  transition: 0.4s 0.1s ease;
}
input:focus {
  outline: none;
  background: #F2F2EE;
  border-color: #1701EF;
}

fieldset > div:focus-within label {
  color: #1701EF;
}

/** =STRUCTURE **/
.main {
  background-color: #F2F2EE;
  font: 12px "noto sans";
  padding: 3rem 0;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.card_content {
  padding: 2rem;
  font-size: 1.2rem;
  position: relative;
  transition: 0.4s 0.1s ease;
  z-index: 2;
}

.cardContent_main {
  background: white;
  opacity: 1;
  transition: 0.4s 0.1s ease;
  transition-delay: 1s;
  position: relative;
  text-align: center;
  z-index: 1;
}


}
.cardContent_back h2, .cardContent_back fieldset {
  opacity: 0;
  transition: ease 0.4s 0.2s;
}
.cardContent_back h2 {
  margin-bottom: 2rem;
}
.cardContent_back fieldset {
  border: none;
}
.cardContent_back .wrap {
  opacity: 0;
  transition: 0.4s 0.1s ease;
}
.cardContent_back .loading {
  left: 0;
  opacity: 0;
  position: absolute;
  text-align: center;
  top: 49%;
  transition: 0.4s 0.1s ease;
  width: 100%;
}

.card_image {
  width: 360px;
  height: 180px;
  z-index: 1;
  position: relative;
}
.card_image:before, .card_image:after {
  content: "";
  background-size: cover;
  background-position: center bottom;
  background-image: url("http://www.eloudesign.com/i_photography.jpg");
  transition: 0.4s 0.1s ease;
  transition-timing-function: cubic-bezier(0.67, 0.13, 0.1, 0.81);
}
.card_image:before {
  height: 180px;
  position: fixed;
  left: calc(50% - 180px);
  top: 3rem;
  width: 360px;
}
.card_image:after {
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
}

.card_register {
  margin-top: 4rem;
}

.card {
  background: #fff;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
  height: 504px;
  margin: 0 auto;
  position: relative;
  width: 360px;
}
.card.is-active .card_content {
  background: transparent;
}
.card.is-active .card_image:before {
  display: block;
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  z-index: 1;
}
.card.is-active .card_image:after {
  opacity: 0;
  z-index: 0;
}
.card.is-active .card_register {
  display: none;
}
.card.is-active .cardContent_back {
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
  left: calc(50% - 20rem);
  min-height: 360px;
  top: 6rem;
  width: 480px;
  z-index: 1;
}
.card.is-active .cardContent_back h2, .card.is-active .cardContent_back fieldset, .card.is-active .cardContent_back .wrap {
  opacity: 1;
}
.card.is-active .cardContent_main {
  background: transparent;
  opacity: 0;
}
.card.pending.is-active .cardContent_main {
  transition: 0.4s 0.1s ease;
  transition-delay: 0.5s;
}
.card.pending.is-active .cardContent_back .wrap {
  opacity: 0;
}
.card.pending.is-active .cardContent_back .loading {
  -webkit-animation: 0.5s fadeInUp forwards;
          animation: 0.5s fadeInUp forwards;
}
</style>

  <script>
  window.console = window.console || function(t) {};
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

<body translate="no" >
  <main id="main" class="main" role="main">
			<div class="card">
				<div class="card_image"></div>
				<div class="card_content">
					<div class="cardContent_main">
					
					<td><img
						src="<c:url value='/tw/hanjee/getPicture/${post.post_no}' />" /></td>

					<td>
						<h2>文章明細</h2>
						<h3>${post.post_tit}</h3>
						<p>作者: ${post.mb.nickname}</p>
						<p>時間: ${post.post_time}</p>

				<p>文章內容: ${post.post_content}</p>
						
						<div class="card_register">
							<button href="#" class="button button_primary toggle-card" id="js_trigger-register">Register</button>
						</div>
					</div>
					
					
				<table>


					<tr>
						<td colspan='2' align='center'><a
							href="<c:url value='/tw/hanjee/PostUpdate/${post.post_no}' />">編輯</a>

						</td>
					</tr>
				</table>
					
					
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
		
		var postBeantest = ${post.post_no}
		console.log(postBeantest)
		
			$("#comsub").click(function() {
				
// 				value = $("#comtext").val();
// 				console.log(value)
				$.ajax({
					url : 'Comadd',
					type : 'POST',
					data : {
						co : $("#comtext").val(),
						post: postBeantest,
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
					
					
					
					
					
					
					
					
					
					
				</div>
			</div>
		</main>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
      <script id="rendered-js" >
$(document).ready(function () {
  // Configure/customize these variables.
  var toggle = '#js_trigger-register';
  var close = '#js_trigger-submit';
  var card = '.card';

  $(toggle).click(function () {
    $(card).addClass('is-active');
    return false;
  });
  $(close).click(function () {
    $(card).addClass('pending');
    setTimeout(function () {
      $(card).removeClass("is-active").removeClass('pending');
    }, 1000);
    return false;
  });
});
//# sourceURL=pen.js
    </script>

  

  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
</body>

</html>
 
