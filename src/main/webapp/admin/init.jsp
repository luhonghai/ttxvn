<%@ page import="com.project.ttxvn.service.UserService" %>
<%@ page import="com.project.ttxvn.model.User" %>
<%@ page import="com.project.ttxvn.service.ImageNewsService" %>
<%@ page import="com.project.ttxvn.model.ImageNews" %>
<%@ page import="java.util.Date" %><%
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
    ImageNewsService imageNewsService = new ImageNewsService();
    if (imageNewsService.count() == 0) {
        ImageNews imageNews = new ImageNews();
        imageNews.setStatus(0);
        imageNews.setCatId(0);
        imageNews.setAuthor("HH");
        imageNews.setDateTime(new Date(System.currentTimeMillis()));
        imageNews.setCaption("Ngày 10/3 nhiệt độ miền Bắc có thể xuống thấp dưới 15 độ C");
        imageNews.setTitle("Đêm mai miền Bắc đón không khí lạnh");
        imageNews.setInfoSource("VNExpress");
        imageNews.setLocation("Hanoi");
        imageNews.setImageLink("images/news/kkl-2130-1457405741.jpg");
        imageNewsService.save(imageNews);
    }
%>