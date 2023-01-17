package com.douzone.guestbook.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.douzone.guestbook.dao.GuestBookDao;
import com.douzone.guestbook.vo.GuestBookVo;

@WebServlet("/gb")
public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("a");
		if ("deleteform".equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
			rd.forward(request, response);
		} else if ("add".equals(action)) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String message = request.getParameter("message");
			
			GuestBookVo vo = new GuestBookVo();
			vo.setName(name);
			vo.setPassword(password);
			vo.setMessage(message);
			
			Date today = new Date();
			Locale currentLocale = new Locale("KOREAN", "KOREA");
			String pattern = "yyyyMMddHHmmss";
			SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
			vo.setRegDate(formatter.format(today));
			new GuestBookDao().insert(vo);
			
			response.sendRedirect("/guestbook02/gb");
		} else if ("delete".equals(action)) {
			String noStr = request.getParameter("no");
			Long no = Long.parseLong(noStr);
			String password = request.getParameter("password");
			
			new GuestBookDao().deleteByEmail(no, password);
			
			response.sendRedirect("/guestbook02/gb");
		} else {
			List<GuestBookVo> list = new GuestBookDao().findAll();
			request.setAttribute("list", list);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
