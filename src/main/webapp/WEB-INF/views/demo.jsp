<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Login</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
	<form method="post"
		action="<c:url value='/tw/hanjee/schedule/controller/demo'/>">
		<select name="test" multiple size="5">
			<option value="6">花蓮</option>
			<option value="7">台+</option>
			<option value="8">Saab</option>
			<option value="9">Benz</option>
			<option value="10">Audi</option>
			<option value="1">Volvo1</option>
			<option value="2">BMW2</option>
			<option value="3">Saab6</option>
			<option value="4">Benz4</option>
			<option value="5">Audi5</option>
		</select>
		<input type="submit" value="submit" name="測試">
	</form>

</body>
</html>