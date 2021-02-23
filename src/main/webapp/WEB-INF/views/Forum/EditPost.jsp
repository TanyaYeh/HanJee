
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>CodePen - Responsive Table</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
  <style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
/* 	display: inline-block; */
    width: 500px;
    border: 2px solid white;
	margin: 20px auto 20px auto;
	text-align: center;
}
</style>
<style>
body {
  background-color: #91ced4;
}
body * {
  box-sizing: border-box;
}

.header {
  background-color: #327a81;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

img {
  border-radius: 50%;
  height: 60px;
  width: 60px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
  text-align: left;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table ttf:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: center;
}


table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: "";
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: "Name:";
  }
  td:nth-child(3):before {
    content: "Email:";
  }
  td:nth-child(4):before {
    content: "Phone:";
  }
  td:nth-child(5):before {
    content: "Comments:";
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: 0.8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
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

<script type="text/javascript">

function confirmDelete(id) {
	 console.log("123")
	if (confirm("確定刪除此筆帖子(${bean.post_tit})?")){
		document.forms[0].action = "<c:url value='/tw/hanjee/PostDelete/${bean.post_no}'/>";
		document.forms[0].method = "POST";
		document.forms[0].submit();
		
	}else{
		
	}
		}
function confirmUpdate(id){
	  var result = confirm("確定更新並送出此筆記錄(帳號:" + id.trim() + ")?");
	  if (result) {
//		  document.forms[0].putOrDelete.name = "_method";
//		  document.forms[0].putOrDelete.value = "PUT";
	      return true;
	  }
	  return false;
}
</script>


</head>

<body translate="no" >
  <div class="table-users">
   <div class="header">Users</div>
   
   <table cellspacing="0">
      <div>
		<form:form method='POST' modelAttribute="bean">
			<input type="hidden" name="noname" id='putOrDelete' value="">
			<c:if test='${bean.post_no != null}'>
				<form:hidden path="post_no" />
				<br>&nbsp;
			</c:if>

			<fieldset class="fieldset-auto-width" >
				<legend style="font-size:23px">文章標題/內容修改</legend>
<!-- 				<table style="font-size:23px"> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>標題：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input path="post_tit" /><br>&nbsp;</td> --%>
<!-- 					</tr> -->

<!-- 					<tr> -->
<!-- 						<td align='left'>文章內容：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td width="400"><form:textarea path="post_content" rows="4" --%>
<%-- 								cols="20"></form:textarea> <br>&nbsp;</td> --%>
<!-- 					</tr> -->

<!-- 					<tr> -->
<!-- 					<td align='left'>修改照片：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input type="file" path="productImage" /></td> --%>

<!-- 					</tr> -->




<!-- 					<tr> -->
<!-- 						<td style="text-align: center;" colspan='2' align='center'><input type='submit' -->
<!-- 							value='修改' name='updateBtn' -->
<%-- 							onclick="confirmUpdate('${bean.post_no}');">&nbsp; <input --%>
<!-- 							type='submit' value='刪除' name='deleteBtn' -->
<%-- 							onclick="confirmDelete(${bean.post_no})"></td> --%>
<!-- 					</tr> -->

<!-- 				</table> -->
					<br>	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>標題：</label><form:input path="post_tit" /><br><br>
					<label>文章內容：</label><form:textarea path="post_content" rows="4" cols="20"></form:textarea> <br>&nbsp;
					<div>
						<input type="submit" value="修改" name="updateBtn" onclick="confirmUpdate('${bean.post_no}')" />
						<input type="submit" value="刪除" name="deleteBtn" onclick="confirmDelete('${bean.post_no}')"  />
					</div>





			</fieldset>
		</form:form>
		<div style="text-align: center; style="font-size:23px"">
		<a href="<c:url value='/tw/hanjee/posts'/>">回首頁</a>
		</div>
   </table>
</div>
  
  
  
  

  <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
</body>

</html>
 
