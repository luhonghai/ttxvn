<%@ page import="com.project.ttxvn.service.UserService" %>
<%@ page import="com.project.ttxvn.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	UserService service = new UserService();
	User user = service.login(email, password);
	if (user != null) {
		session.setAttribute("admin", user);
		response.sendRedirect(request.getContextPath() + "/");
	} else {
		session.setAttribute("error", "Invalid username or password");
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
%>