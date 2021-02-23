<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  <link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>PostDetaile</title>
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>CodePen - viewbox challenge - altBud!</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
  
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html,
body {
  height: 100%;
}

@font-face {
  font-family: "Blokk";
  src: url(./BLOKKNeue-Regular.woff2);
}

p:first-of-type {
  font-size: 2rem;
  letter-spacing: -0.05em;
}

body {
  font-family: system-ui, sans-serif;
  line-height: 1.5;
  font-size: 1.25rem;
  color: #10002b;
  -webkit-font-smoothing: antialiased;
}

.wrapper {
  max-width: 600px;
  margin: 0 auto;
}

#altBud {
  position: fixed;
  bottom: 0;
  right: 1rem;
  width: 140px;
  height: 140px;
  transition: transform 300ms ease;
  transform-origin: 100% 100%;
  transform: translateY(8px);
}

.content {
  margin: 0 auto;
  padding: 3rem 1.5rem;
  height: 100%;
  overflow-y: scroll;
}

p + p {
  margin-top: 1.5rem;
}

img {
  max-width: 100%;
  margin: 3rem 0;
}

g,
ellipse {
  transform-box: fill-box;
  transform-origin: center;
}

#altBudHair line {
  animation: hair 3000ms linear infinite;
  transform-origin: 50% 50%;
}

#altBudHair line:nth-of-type(2) {
  animation-delay: 250ms;
}

#altBudHair line:nth-of-type(2) {
  animation: hair2 5000ms ease infinite;
  animation-delay: 100ms;
}

@keyframes hair {
  0% {
    transform: rotate(-4deg);
  }

  50% {
    transform: rotate(4deg);
  }

  100% {
    transform: rotate(-4deg);
  }
}

@keyframes hair2 {
  0% {
    transform: rotate(6deg);
  }

  50% {
    transform: rotate(-6deg);
  }

  100% {
    transform: rotate(6deg);
  }
}

#altBudBody {
  transition: fill 500ms ease;
}

#altBudTexture > * {
  transition: fill 500ms ease;
}

@media (prefers-reduced-motion: reduce) {
  #altBudHair > * {
    animation: none !important;
  }

  * {
    transition: none !important;
  }
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
  <div class="content">
  <div class="wrapper">
    <p>
    <h2>文章明細</h2>
      <strong>
       <h3>${post.post_tit}</h3>
      </strong>
    </p>
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
    
    
    
    
    
    
    <img src="<c:url value='/tw/hanjee/getPicture/${post.post_no}' />"  alt="A group of happy puppies" />
   
  </div>
  <!-- AltBud character  -->
  <svg id="altBud" viewBox="0 0 100 100" aria-labelledby="altBudTitle altBudDesc" role="img">
    <!-- Title -->
    <title id="altBudTitle">AltBud</title>
    <!-- Description -->
    <desc id="altBudDesc">
      AltBud is a (generally) happy little character who hangs out on webpages
      and finds images without alt tags.
    </desc>
    <!-- Body outline -->
    <path id="altBudBody" d="M 15 100 
           C 0 20 100 20 85 100" fill="#e0aaff" stroke="#10002b" stroke-width="2" transform="translate(0, 2)" />
    <!-- Body clip -->
    <mask id="bodyClip">
      <path d="M 15 100 
            C 0 20 100 20 85 100" fill="#fff" stroke="#10002b" stroke-width="2" transform="translate(0, 2)" />
    </mask>
    <!-- Texture -->
    <g id="altBudTexture" mask="url(#bodyClip)">
      <circle cx="30" cy="40" r="16" fill="#c77dff"></circle>
      <circle cx="80" cy="43" r="16" fill="#9d4edd"></circle>
      <circle cx="30" cy="90" r="20" fill="#c77dff"></circle>
      <circle cx="80" cy="105" r="24" fill="#9d4edd"></circle>
    </g>
    <!-- Eyes Normal -->
    <g id="altBudEyesNormal" transform="translate(0, -5)">
      <!-- Eye left -->
      <g id="altBudEyeLeft">
        <!-- Outer -->
        <circle id="altBudEyeOuterLeft" cx="36" cy="75" r="6.5" fill="#fff" stroke="#10002b" stroke-width="1.5" />
        <!-- Inner -->
        <circle id="altBudEyeInnerLeft" cx="33" cy="75" r="3.5" fill="#10002b" />
      </g>
      <!-- Eye right -->
      <g id="altBudEyeRight">
        <!-- Outer-->
        <circle id="altBudEyeOuterRight" cx="64" cy="75" r="6.5" fill="#fff" stroke="#10002b" stroke-width="1.5" />
        <!-- Inner  -->
        <circle id="altBudEyeInnerRight" cx="61" cy="75" r="3.5" fill="#10002b" />
      </g>
    </g>
    <!-- Hair -->
    <g id="altBudHair">
      <line x1="50" y1="42" x2="50" y2="34" stroke="#10002b" stroke-width="1.5" stroke-linecap="round"></line>
      <line x1="50" y1="42" x2="58" y2="34" stroke="#10002b" stroke-width="1.5" stroke-linecap="round"></line>
      <line x1="50" y1="42" x2="42" y2="32" stroke="#10002b" stroke-width="1.5" stroke-linecap="round"></line>
    </g>
    <!-- Mouth -->
    <path id="altBudMouth" d="M 44 85
           A 5 4 0 0 0 56 85
        " stroke="#10002b" stroke-width="1.5" fill="transparent" stroke-linecap="round" />
  </svg>
</div>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  
      <script id="rendered-js" type="module">
import intersectionObserver from "https://cdn.skypack.dev/intersection-observer@0.11.0";
const altBud = {
  root: document.getElementById("altBud"),
  eyeLeft: document.getElementById("altBudEyeLeft"),
  eyeInnerLeft: document.getElementById("altBudEyeInnerLeft"),
  eyeInnerRight: document.getElementById("altBudEyeInnerRight"),
  eyeRight: document.getElementById("altBudEyeRight"),
  mouth: document.getElementById("altBudMouth"),
  arm: document.getElementById("altBudArm"),
  body: document.getElementById("altBudBody"),
  texture: document.getElementById("altBudTexture") };

const prefersReducedMotion = window.matchMedia(
"(prefers-reduced-motion: reduce)").
matches;
const allImages = document.querySelectorAll("img");

let activeWatchImg = null;

let isAngry = false;

const imgObserver = new IntersectionObserver(
entries => {
  for (const entry of entries) {
    if (entry.isIntersecting) {
      activeWatchImg = entry.target;
    } else {
      if (activeWatchImg === entry.target) {
        activeWatchImg = null;
      }
    }
  }
},
{
  threshold: 0 });



for (const img of allImages) {
  imgObserver.observe(img);
}

function rotateEye(target, eye) {
  const targetBounds = target.getBoundingClientRect();
  let { x: eyeX, y: eyeY } = eye.getBoundingClientRect();

  const targetX = targetBounds.x + targetBounds.width / 2;
  const targetY = targetBounds.y + targetBounds.height / 2;

  const angle = Math.atan2(targetY - eyeY, targetX - eyeX) - Math.PI;

  eye.style.transform = `rotate(${angle}rad)`;
}

function toggleAngry(angry) {
  if (angry) {
    altBud.eyeInnerLeft.setAttribute("cx", 36);
    altBud.eyeInnerRight.setAttribute("cx", 64);
    altBud.mouth.setAttribute("d", "M 44 87 A 5 4 0 0 1 56 87");

    altBud.body.setAttribute("fill", "#e01e37");
    const spots = altBud.texture.querySelectorAll("circle");

    spots[0].setAttribute("fill", "#bd1f36");
    spots[1].setAttribute("fill", "#c71f37");
    spots[2].setAttribute("fill", "#85182a");
    spots[3].setAttribute("fill", "#c71f37");

    if (!prefersReducedMotion) {
      altBud.root.style.transform = `rotate(-4deg) translateY(8px)`;
      setTimeout(() => {
        altBud.root.style.transform = `rotate(4deg) translateY(8px)`;
        setTimeout(() => {
          altBud.root.style.transform = `rotate(0deg) translateY(8px)`;
        }, 125);
      }, 125);
    }
  } else {
    altBud.eyeInnerLeft.setAttribute("cx", 33);
    altBud.eyeInnerRight.setAttribute("cx", 61);
    altBud.mouth.setAttribute("d", "M 44 85 A 5 4 0 0 0 56 85");

    altBud.body.setAttribute("fill", "#e0aaff");
    const spots = altBud.texture.querySelectorAll("circle");

    spots[0].setAttribute("fill", "#c77dff");
    spots[1].setAttribute("fill", "#9d4edd");
    spots[2].setAttribute("fill", "#c77dff");
    spots[3].setAttribute("fill", "#9d4edd");
  }
}

(function animLoop() {
  if (activeWatchImg) {
    rotateEye(activeWatchImg, altBud.eyeLeft);
    rotateEye(activeWatchImg, altBud.eyeRight);

    if (activeWatchImg.alt.length === 0 && !isAngry) {
      toggleAngry(true);

      isAngry = true;
    } else {
      if (activeWatchImg.alt.length !== 0 && isAngry) {
        toggleAngry(false);

        isAngry = false;
      }
    }
  }

  requestAnimationFrame(animLoop);
})();
//# sourceURL=pen.js
    </script>

  

</body>

</html>
 
