<%@ page import="com.project.ttxvn.service.UserProvider" %>
<%@ page import="com.project.ttxvn.model.User" %>
<%@ page import="com.project.ttxvn.model.NewsRequest" %>
<%@ page import="com.project.ttxvn.service.NewsRequestService" %>
<%
    NewsRequestService newsRequestService = new NewsRequestService();
    if (newsRequestService.count() == 0) {
        NewsRequest nr = new NewsRequest();
        nr.setEmail("luhonghai@gmail.com");
        nr.setMessage("Please add new post about Hanoi");
        newsRequestService.save(nr);
    }

    UserProvider userProvider = new UserProvider();
    if (userProvider.count() == 0) {
        User user = new User();
        user.setRoleEnum(User.Role.ADMINISTRATOR);
        user.setEmail("admin@ttxvn.com");
        user.setPassword("123456");
        user.setFirstName("Admin");
        user.setLastName("TTXVN");
        user.setGender(true);
        userProvider.save(user);
    }
%>