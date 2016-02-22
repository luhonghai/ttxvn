<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
session.setAttribute("admin", null);
response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>