<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl로 파라미터 얻어서 적용하기 
	url에서 ?color=~ 로 들어온 파라미터를 받아온다.
	param.color로 얻어올 수 있음
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test='${param.color == "red" }'> <!-- if -->
			<h1 style="color:red">Hello World</h1>
		</c:when>
		<c:when test='${param.color == "blue" }'> <!-- else if -->
			<h1 style="color:blue">Hello World</h1>
		</c:when>
		<c:when test='${param.color == "green" }'> <!-- else if -->
			<h1 style="color:green">Hello World</h1>
		</c:when>
		<c:otherwise> <!-- else -->
			<h1>Hello World</h1>
		</c:otherwise>
	</c:choose>
</body>
</html>