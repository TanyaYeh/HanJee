<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#topContent {
 border-radius: 10px;
}

#topContent td {
 font: 30px "Microsoft JhengHei";
 text-align: center;
 background-color: #236E7B;
 border: 0px;
}

a {
    text-decoration:none;
}

td{

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <script type="text/javascript">
  var mbbph = "${LoginOK.mobile_phone}";
  console.log("top==" + mbbph.length)
 </script>
 <c:set var="mbbph" value="${LoginOK.mobile_phone.length()}"></c:set>
 <c:set var="nickname" value="${LoginOK.nickname}"></c:set>
 <table width='100%' border='0' accesskey="" lang="" itemtype=""
  itemscope="">

  <tr width='100%'>
  
   <td width='10%' >

   </td>

   <td width='18%' style='text-align: center;font-size:25px '>
   <c:choose>
   <c:when test="${empty LoginOK}">
   
     <a href="<c:url value='/tw/hanjee/login'/>"> <font color="#F7F292">登 入</font></a>
    </c:when>
    <c:otherwise>
    <font color="#F7F292">Hi~   <c:out value="${nickname}"></c:out></font>
    </c:otherwise>
    </c:choose>
    </td>
   <td width='18%' style='text-align: center;font-size:25px'><a
    href="<c:url value='/product_Index'/>"><font color="#F7F292"> 商
      城</font></a></td>
   <td width='18%' style='text-align: center;font-size:25px'><c:choose>
   <c:when test="${mbbph >= 13}">
     <a href="<c:url value='mailto:test123@gmail.com'/>"><font color="#F7F292">只剩寄信</font>
   </a> </c:when>
   <c:otherwise>
     <a href="<c:url value='/friend/piForm'/>"><font color="#F7F292">交友</font></a>
    </c:otherwise> 
     </c:choose></td>
   <td width='18%' style='text-align: center;font-size:25px'>
   <c:choose>
   <c:when test="${mbbph >= 13}">
     <a href="<c:url value='mailto:test123@gmail.com'/>"><font color="#F7F292">寄信給管理員信箱</font>
   </a> </c:when>
   <c:otherwise>
     <a href="<c:url value='/tw/hanjee/forums'/>"><font color="#F7F292">論 壇</font></a>
    </c:otherwise> 
     </c:choose>
    </td>

   <td width='18%' style='text-align: center;font-size:25px'><c:if
     test="${ ! empty LoginOK }">
     <a href="<c:url value='/tw/hanjee/logout'/>"><font color="#F7F292">登出</font></a>
    </c:if> <c:if test="${ ! empty ManageLoginOK }">
     <a href="<c:url value='/tw/hanjee/managerlogout'/>"><font color="#F7F292">登出</font></a>
    </c:if></td>
   <td width='18%' style='text-align: center;font-size:25px;'></td>
  </tr>
 </table>

</body>
</html>