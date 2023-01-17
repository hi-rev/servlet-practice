<%@page import="com.douzone.guestbook.dao.GuestBookDao01"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String message = request.getParameter("message");
	
	GuestBookVo01 vo = new GuestBookVo01();
	vo.setName(name);
	vo.setPassword(password);
	vo.setMessage(message);
	
	Date today = new Date();
	Locale currentLocale = new Locale("KOREAN", "KOREA");
	String pattern = "yyyyMMddHHmmss";
	SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
	vo.setRegDate(formatter.format(today));
	new GuestBookDao01().insert(vo);
	
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