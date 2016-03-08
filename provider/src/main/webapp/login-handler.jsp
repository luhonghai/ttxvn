<%@ page import="com.project.ttxvn.service.UserProvider" %>
<%@ page import="com.project.ttxvn.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	UserProvider service = new UserProvider();
	User user = service.login(email, password);
	if (user != null) {
		session.setAttribute("admin", user);
		response.sendRedirect(request.getContextPath() + "/news.jsp");
	} else {
		session.setAttribute("error", "Invalid username or password");
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
%>