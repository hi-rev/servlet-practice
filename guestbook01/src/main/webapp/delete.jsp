<%@page import="com.douzone.guestbook.dao.GuestBookDao01"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String noStr = request.getParameter("no");
	Long no = Long.parseLong(noStr);
	String password = request.getParameter("password");
	
	GuestBookVo01 vo = 	new GuestBookVo01();
	
	new GuestBookDao01().deleteByEmail(no, password);
	
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