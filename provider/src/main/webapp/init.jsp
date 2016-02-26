<%@ page import="com.project.ttxvn.service.UserService" %>
<%@ page import="com.project.ttxvn.model.User" %>
<%@ page import="com.project.ttxvn.model.NewsRequest" %>
<%@ page import="com.project.ttxvn.service.NewsRequestService" %><%
    NewsRequestService newsRequestService = new NewsRequestService();
    if (newsRequestService.count() == 0) {
        NewsRequest nr = new NewsRequest();
        nr.setEmail("luhonghai@gmail.com");
        nr.setMessage("Please add new post about Hanoi");
        newsRequestService.save(nr);
    }

    UserService userService = new UserService();
    if (userService.count() == 0) {
        User user = new User();
        user.setRoleEnum(User.Role.ADMINISTRATOR);
        user.setEmail("admin@ttxvn.com");
        user.setPassword("123456");
        user.setFirstName("Admin");
        user.setLastName("TTXVN");
        user.setGender(true);
        userService.save(user);
    }
%>