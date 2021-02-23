<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>交遊(友)網</title>

 <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../images/img/favicon.png" rel="icon">
  <link href="../images/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="../css/friend/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="../css/friend/font-awesome.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="../css/friend/style.css" rel="stylesheet">




<style type="text/css">

a:link {
	color: #00AEAE;
	text-decoration: none;
}

a:visited {
	color: #0066CC;
	text-decoration: none
}

a:hover {
	color: #D94600;
	text-decoration: none;
}

a:active {
	font-size: 30px;
	color: purple;
}





@import "compass/css3";

@import "compass/css3";
@import url(https://fonts.googleapis.com/css?family=Patua+One|Open+Sans);

* { 
  -moz-box-sizing: border-box; 
  -webkit-box-sizing: border-box; 
	box-sizing: border-box; 
}

table {
  border-collapse: separate;
  background:pink;
  @include border-radius(5px);
  margin:50px auto;
  @include box-shadow(0px 0px 5px rgba(0,0,0,0.3));
  width:800px;
}

thead {
  @include border-radius(5px);
}

thead th {
  font-family: 'Patua One', cursive;
  font-size:16px;
  font-weight:400;
  color:#fff;
  @include text-shadow(1px 1px 0px rgba(0,0,0,0.5));
  text-align:left;
  padding:20px;
  @include background-image(linear-gradient(#646f7f, #4a5564));
  border-top:1px solid #858d99;
  
  &:first-child {
   @include border-top-left-radius(5px); 
  }

  &:last-child {
    @include border-top-right-radius(5px); 
  }
}

tbody tr td {
  font-family: 'Open Sans', sans-serif;
  font-weight:400;
  color:#5f6062;
  font-size:13px;
  padding:20px 20px 20px 20px;
  border-bottom:1px solid #e0e0e0;
  
}

tbody tr:nth-child(2n) {
  background:#f0f3f5;
}

tbody tr:last-child td {
  border-bottom:none;
  &:first-child {
    @include border-bottom-left-radius(5px);
  }
  &:last-child {
    @include border-bottom-right-radius(5px);
  }
}

tbody:hover > tr td {
  @include opacity(0.5);
  
  /* uncomment for blur effect */
  /* color:transparent;
  @include text-shadow(0px 0px 2px rgba(0,0,0,0.8));*/
}

tbody:hover > tr:hover td {
  @include text-shadow(none);
  color:#2d2d2d;
  @include opacity(1.0);
}

</style>
</head>
<body style="background-color:#E6EBDF ">
<div height="60px">
<jsp:include page="../_header.jsp" />
</div>
  <div id="headerwrap">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
          <h1>優遊有友</h1>
          <h4>在旅行中，來場浪漫的邂逅吧。</h4>
        </div>
      </div>
    </div>
    <!-- /container -->
  </div>

  <section id="works"></section>
  <div class="container">
    <div class="row centered mt mb">

      <div class="col-lg-2 col-md-2 col-sm-2 gallery" style="width:50">
        <a href="<c:url value='/friend/showInf' />"><img src="../images/img/portfolio/BasicInformation.png" class="img-responsive" width="200px"></a>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 gallery">
        <a href="<c:url value='/showAllMyFriend' />"><img src="../images/img/portfolio/AllMyFriend.png" class="img-responsive" width="200px"></a>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 gallery">
        <a href="<c:url value='/queryFriendRequest' />"><img src="../images/img/portfolio/FriendRequest.png" class="img-responsive" width="200px"></a>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 gallery">
        <a href="<c:url value='/showAllMember' />"><img src="../images/img/portfolio/AllMember.png" class="img-responsive" width="200px"></a>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 gallery">
        <a href="<c:url value='/tw/hanjee/ShowAllSentence' />"><img src="../images/img/portfolio/TouchYourHeart.png" class="img-responsive" width="200px"></a>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 gallery">
        <a href="<c:url value='/queryCon' />"><img src="../images/img/portfolio/Horoscope.png" class="img-responsive" style=width:200></a>
      </div>
    </div>
  </div>


<div style="border:3px" align='center'>好友推薦清單</div>
			
			<div align='center'>
		<hr>
		<table style="border-radius:15px">
			<tr>
				<th width='120'>頭 貼</th>
				<th width='100'>姓 名</th>
				<th width='56'>性 別</th>
				<th width='90'>感 情 狀 態</th>
				<th width='90'>星 座</th>
				<th width='65'>按鍵</th>
			</tr>
			
			<c:choose>
				<c:when test="${empty Person_InfoList}">
					<tr>
						<td style="background-color:gray" colspan='6' align='center'><font color='red'>暫無建議好友:可藉由購買行程，來遇見你生命中的另一個(他/她)喔♥♥♥</font></td>
					</tr>
				</c:when>
				<c:otherwise>

			<c:forEach var="person_Info" items="${Person_InfoList}" >
				<tr>
				<td align="center">
				<img style="width: 80px; height: 80px"
					src='<c:url value="/friend/getPicture/${person_Info.getBean().member_id}" />'></td>
	 				<td align="center">${person_Info.getBean().realname}</td>
					<td align="center">${person_Info.getBean().gender}</td>
			        <td align="center">${person_Info.per_rel}</td>
					<td align="center">${person_Info.per_con}</td>
<%--   這個或下面那行都行,Show_Basic_Info.jsp有用到		 <td align="center"><input type="button" value="加好友" onclick="location.href='<c:url value="/" />'"></td> --%>
					<td align="center"><a href='<c:url value="/addFriend/${person_Info.getBean().member_id}/-1" />'><button id="add">加好友</button></a></td>
				
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<script type="text/javascript">
	$("#add").click(function(){
		alert("已送出邀請");
	})
	</script>



  <div id="copyrights">
    <div class="container">
      <p>
        &copy; Welcome to <strong>HanJee</strong>. Travel agency
      </p>
      <div class="credits">
        <!--
          You are NOT allowed to delete the credit link to TemplateMag with free version.
          You can delete the credit link only if you bought the pro version.
          Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/instant-bootstrap-personal-template/
          Licensing information: https://templatemag.com/license/
        -->
        去首頁購買行程吧 <a href="<c:url value='/'/>">回地圖首頁</a>
      </div>
    </div>
  </div>
  <!-- / copyrights -->

  <!-- JavaScript Libraries -->
  <script src="../css/friend/jquery.min.js"></script>
  <script src="../js/friend/bootstrap.min.js"></script>
  <script src="../js/friend/validate.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../js/friend/main.js"></script>
		
</body>
</html>