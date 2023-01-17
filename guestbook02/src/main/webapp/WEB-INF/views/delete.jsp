<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

	String noStr = request.getParameter("no");
	Long no = Long.parseLong(noStr);
	String password = request.getParameter("password");
	
	GuestBookVo vo = 	new GuestBookVo();
	
	new GuestBookDao().deleteByEmail(no, password);
	
	response.sendRedirect("/guestbook01");
%>    
    



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>