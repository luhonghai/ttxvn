<%@ page import="com.project.ttxvn.service.UserService" %>
<%@ page import="com.project.ttxvn.model.User" %><%
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