<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.project.ttxvn.service.NewsService" %>
<%@ page import="com.project.ttxvn.model.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.ttxvn.service.CategoryService" %>
<%@ page import="com.project.ttxvn.model.Category" %>
<!DOCTYPE html>
<html>
<head>
    <title>Express News</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- for bootstrap working -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
    <!-- web-fonts -->
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <script src="js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <!--/script-->
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 900);
            });
        });
    </script>
</head>
<body>
<!-- header-section-starts-here -->
<div class="header">
    <div class="header-top">
        <div class="wrap">
            <div class="top-menu">
                <ul>
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="about.html">Về chúng tôi</a></li>
                    <li><a href="privacy-policy.html">Quyền cá nhân</a></li>
                    <li><a href="contact.html">Liên hệ</a></li>
                </ul>
            </div>
            <div class="num">
                <p> Gọi cho chúng tôi : 0984 733 783</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="logo text-center">
            <a href="index.jsp"><img src="images/logo.jpg" alt=""/></a>
        </div>
        <div class="navigation">
            <nav class="navbar navbar-default" role="navigation">
                <div class="wrap">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>
                    <!--/.navbar-header-->

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp">Trang chủ</a></li>
                            <li><a href="sports.html">Thể thao</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Giải trí<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="entertainment.html">Điện ảnh</a></li>
                                    <li class="divider"></li>
                                    <li><a href="entertainment.html">Trong nước</a></li>
                                    <li class="divider"></li>
                                    <li><a href="entertainment.html">Nước ngoài</a></li>

                                </ul>
                            </li>
                            <li><a href="shortcodes.html">Sức khỏe</a></li>

                            <li><a href="technology.html">Công nghệ</a></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="search">
                            <!-- start search-->
                            <div class="search-box">
                                <div id="sb-search" class="sb-search">
                                    <form>
                                        <input class="sb-search-input" placeholder="Tìm kiếm..." type="search"
                                               name="search" id="search">
                                        <input class="sb-search-submit" type="submit" value="">
                                        <span class="sb-icon-search"> </span>
                                    </form>
                                </div>
                            </div>
                            <!-- search-scripts -->
                            <script src="js/classie.js"></script>
                            <script src="js/uisearch.js"></script>
                            <script>
                                new UISearch(document.getElementById('sb-search'));
                            </script>
                            <!-- //search-scripts -->
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!--/.navbar-collapse-->
                    <!--/.navbar-->
                </div>
            </nav>
        </div>
    </div>
    <!-- header-section-ends-here -->
    <div class="wrap">
        <div class="move-text">
            <div class="breaking_news">
                <h2>Tin nóng</h2>
            </div>
            <div class="marquee">
                <div class="marquee1"><a class="breaking" href="single.jsp">>>Tin nóng 1</a></div>
                <div class="marquee2"><a class="breaking" href="single.jsp">>>Tin nóng 2</a></div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            <script type="text/javascript" src="js/jquery.marquee.min.js"></script>
            <script>
                $('.marquee').marquee({pauseOnHover: true});
                //@ sourceURL=pen.js
            </script>
        </div>
    </div>
    <!-- content-section-starts-here -->
    <div class="main-body">
        <div class="wrap">
            <ol class="breadcrumb">
                <li><a href="index.jsp">Trang chủ</a></li>
                <li class="active">Tin tức</li>
            </ol>
            <div class="single-page">
                <div class="col-md-2 share_grid">
                    <h3>Chia sẻ</h3>
                    <ul>
                        <li>
                            <a href="#">
                                <i class="facebook"></i>
                                <div class="views">
                                    <span>FACEBOOK</span>
                                    <label>180</label>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="twitter"></i>
                                <div class="views">
                                    <span>TWEET</span>
                                    <label>355</label>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="linkedin"></i>
                                <div class="views">
                                    <span>LinkedIn</span>
                                    <label>28</label>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="email"></i>
                                <div class="views">
                                    <span>Email</span>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                    </ul>
                </div>
                <%
                    String sid = request.getParameter("id");
                    int id = Integer.parseInt(sid);
                    NewsService service = new NewsService();
                    News n = service.find(id);
                %>
                <div class="col-md-6 content-left single-post">
                    <div class="blog-posts">
                        <h3 class="post"><%=n.getTitle()%>
                        </h3>
                        <div class="last-article">
                            <p class="artext"><%=n.getDescription()%>
                            </p>
                            <img src="<%=n.getImage()%>" alt=""/>
                            <p class="artext"><%=n.getContent()%>
                            </p>

                            <ul class="categories">
                                <li><a href="#">Thể thao</a></li>
                                <li><a href="#">Giải trí</a></li>
                                <li><a href="#">Sức khỏe</a></li>
                                <li><a href="#">Công nghệ</a></li>
                            </ul>
                            <div class="clearfix"></div>
                            <!--related-posts-->
                            <div class="row related-posts">
                                <h4>Tin liên quan</h4>
                                <div class="col-xs-6 col-md-3 related-grids">
                                    <a href="single.jsp" class="thumbnail">
                                        <img src="images/f2.jpg" alt=""/>
                                    </a>
                                    <h5><a href="single.jsp">Lorem Ipsum is simply</a></h5>
                                </div>
                                <div class="col-xs-6 col-md-3 related-grids">
                                    <a href="single.jsp" class="thumbnail">
                                        <img src="images/f1.jpg" alt=""/>
                                    </a>
                                    <h5><a href="single.jsp">Lorem Ipsum is simply</a></h5>
                                </div>
                                <div class="col-xs-6 col-md-3 related-grids">
                                    <a href="single.jsp" class="thumbnail">
                                        <img src="images/f3.jpg" alt=""/>
                                    </a>
                                    <h5><a href="single.jsp">Lorem Ipsum is simply</a></h5>
                                </div>
                                <div class="col-xs-6 col-md-3 related-grids">
                                    <a href="single.jsp" class="thumbnail">
                                        <img src="images/f6.jpg" alt=""/>
                                    </a>
                                    <h5><a href="single.jsp">Lorem Ipsum is simply</a></h5>
                                </div>
                            </div>
                            <!--//related-posts-->


                            <div class="clearfix"></div>
                        </div>
                    </div>

                </div>
                <div class="col-md-4 side-bar">
                    <div class="first_half">
                        <div class="newsletter">
                            <h1 class="side-title-head">Bản tin</h1>
                            <p class="sign">Đăng ký nhận bản tin!</p>
                            <form>
                                <input type="text" class="text" value="Địa chỉ Email" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = 'Email Address';}">
                                <input type="submit" value="Xác nhận">
                            </form>
                        </div>
                        <div class="list_vertical">
                            <section class="accordation_menu">
                                <div>
                                    <input id="label-1" name="lida" type="radio" checked/>
                                    <label for="label-1" id="item1"><i class="ferme"> </i>Tin đọc nhiều<i
                                            class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                                    <div class="content" id="a1">
                                        <div class="scrollbar" id="style-2">
                                            <div class="force-overflow">
                                                <div class="popular-post-grids">
                                                    <div class="popular-post-grid">
                                                        <div class="post-img">
                                                            <a href="single.jsp"><img src="images/bus2.jpg" alt=""/></a>
                                                        </div>
                                                        <div class="post-text">
                                                            <a class="pp-title" href="single.jsp"> The section of the
                                                                mass media industry</a>
                                                            <p>On Feb 25 <a class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-comment"></span>3 </a><a
                                                                    class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-eye-open"></span>56 </a>
                                                            </p>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="popular-post-grid">
                                                        <div class="post-img">
                                                            <a href="single.jsp"><img src="images/bus1.jpg" alt=""/></a>
                                                        </div>
                                                        <div class="post-text">
                                                            <a class="pp-title" href="single.jsp"> Lorem Ipsum is simply
                                                                dummy text printing</a>
                                                            <p>On Apr 14 <a class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-comment"></span>2 </a><a
                                                                    class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-eye-open"></span>56 </a>
                                                            </p>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="popular-post-grid">
                                                        <div class="post-img">
                                                            <a href="single.jsp"><img src="images/bus3.jpg" alt=""/></a>
                                                        </div>
                                                        <div class="post-text">
                                                            <a class="pp-title" href="single.jsp">There are many
                                                                variations of Lorem</a>
                                                            <p>On Jun 25 <a class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-comment"></span>0 </a><a
                                                                    class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-eye-open"></span>56 </a>
                                                            </p>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="popular-post-grid">
                                                        <div class="post-img">
                                                            <a href="single.jsp"><img src="images/bus4.jpg" alt=""/></a>
                                                        </div>
                                                        <div class="post-text">
                                                            <a class="pp-title" href="single.jsp">Sed ut perspiciatis
                                                                unde omnis iste natus</a>
                                                            <p>On Jan 25 <a class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-comment"></span>1 </a><a
                                                                    class="span_link" href="#"><span
                                                                    class="glyphicon glyphicon-eye-open"></span>56 </a>
                                                            </p>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <input id="label-2" name="lida" type="radio"/>
                                    <label for="label-2" id="item2"><i class="icon-leaf" id="i2"></i>Tin mới<i
                                            class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                                    <div class="content" id="a2">
                                        <div class="scrollbar" id="style-1">
                                            <div class="force-overflow">
                                                <div class="popular-post-grids">
                                                    <%--<%--%>
                                                    <%--List<News> listN = service.getTop4Newest();--%>
                                                    <%--for (News news : listN) { %>--%>
                                                    <%--<div class="popular-post-grid">--%>
                                                    <%--<div class="post-img">--%>
                                                    <%--<a href="single.jsp"><img src="<%=news.getImage()%>" alt=""/></a>--%>
                                                    <%--</div>--%>
                                                    <%--<div class="post-text">--%>
                                                    <%--<a class="pp-title" href="single.jsp"><%=news.getTitle()%>--%>
                                                    <%--</a>--%>
                                                    <%--<p><%=news.getDateTime()%><a class="span_link" href="#"><span--%>
                                                    <%--class="glyphicon glyphicon-comment"></span>1 </a><a--%>
                                                    <%--class="span_link" href="#"><span--%>
                                                    <%--class="glyphicon glyphicon-eye-open"></span>56 </a></p>--%>
                                                    <%--</div>--%>
                                                    <%--<div class="clearfix"></div>--%>
                                                    <%--</div>--%>
                                                    <%--<%}%>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <input id="label-3" name="lida" type="radio"/>
                                    <label for="label-3" id="item3"><i class="icon-trophy" id="i3"></i>Bình luận<i
                                            class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                                    <div class="content" id="a3">
                                        <div class="scrollbar" id="style-2">
                                            <div class="force-overflow">
                                                <div class="response">
                                                    <div class="media response-info">
                                                        <div class="media-left response-text-left">
                                                            <a href="#">
                                                                <img class="media-object" src="images/icon1.png"
                                                                     alt=""/>
                                                            </a>
                                                            <h5><a href="#">Nguyễn Văn A</a></h5>
                                                        </div>
                                                        <div class="media-body response-text-right">
                                                            <p>Bài viết rất hay.</p>
                                                            <ul>
                                                                <li>21/3/2016</li>
                                                                <li><a href="single.jsp">Trả lời</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="media response-info">
                                                        <div class="media-left response-text-left">
                                                            <a href="#">
                                                                <img class="media-object" src="images/icon1.png"
                                                                     alt=""/>
                                                            </a>
                                                            <h5><a href="#">Phạm Văn B</a></h5>
                                                        </div>
                                                        <div class="media-body response-text-right">
                                                            <p>Thông tin kịp thời</p>
                                                            <ul>
                                                                <li>26/3/2016</li>
                                                                <li><a href="single.jsp">Trả lời</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="media response-info">
                                                        <div class="media-left response-text-left">
                                                            <a href="#">
                                                                <img class="media-object" src="images/icon1.png"
                                                                     alt=""/>
                                                            </a>
                                                            <h5><a href="#">Đào Văn C</a></h5>
                                                        </div>
                                                        <div class="media-body response-text-right">
                                                            <p>Mong trang tin tức sẽ ngày càng phát triển</p>
                                                            <ul>
                                                                <li>27/3/2016</li>
                                                                <li><a href="single.jsp">Trả lời</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="side-bar-articles">
                            <div class="side-bar-article">
                                <a href="single.jsp"><img src="images/sai.jpg" alt=""/></a>
                                <div class="side-bar-article-title">
                                    <a href="single.jsp">Băng tuyết ở thành phố New York - Mỹ</a>
                                </div>
                            </div>
                            <div class="side-bar-article">
                                <a href="single.jsp"><img src="images/sai2.jpg" alt=""/></a>
                                <div class="side-bar-article-title">
                                    <a href="single.jsp">Đường tàu hỏa trên cao</a>
                                </div>
                            </div>
                            <div class="side-bar-article">
                                <a href="single.jsp"><img src="images/sai3.jpg" alt=""/></a>
                                <div class="side-bar-article-title">
                                    <a href="single.jsp">Lính cứu hỏa chữa cháy</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="secound_half">
                        <div class="tags">
                        </div>

                        <div class="popular-news">
                            <header>
                                <h3 class="title-popular">Quảng cáo</h3>
                            </header>
                            <div class="popular-grids">

                                <div class="popular-grid">
                                    <a href="single.jsp"><img src="images/popular-1.jpg" alt=""/></a>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- content-section-ends-here -->
<!-- footer-section-starts-here -->
<div class="footer">
    <div class="footer-top">
        <div class="wrap">
            <div class="col-md-3 col-xs-6 col-sm-4 footer-grid">
                <h4 class="footer-head">Về chúng tôi</h4>
                <p>Kênh tin tức nóng hổi.</p>
                <p>Thông tin chính xác, kịp thời.</p>
            </div>
            <div class="col-md-2 col-xs-6 col-sm-2 footer-grid">
                <h4 class="footer-head">Danh mục</h4>
                <ul class="cat">
                    <li><a href="business.html">Thời sự</a></li>
                    <li><a href="technology.html">Công nghệ</a></li>
                    <li><a href="entertainment.html">Giải trí</a></li>
                    <li><a href="sports.html">Thể thao</a></li>

                </ul>
            </div>
            <div class="col-md-4 col-xs-6 col-sm-6 footer-grid">
                <h4 class="footer-head">Ảnh</h4>
                <ul class="flickr">
                    <li><a href="#"><img src="images/bus4.jpg"></a></li>
                    <li><a href="#"><img src="images/bus2.jpg"></a></li>
                    <li><a href="#"><img src="images/bus3.jpg"></a></li>
                    <li><a href="#"><img src="images/tec4.jpg"></a></li>
                    <li><a href="#"><img src="images/tec2.jpg"></a></li>
                    <li><a href="#"><img src="images/tec3.jpg"></a></li>
                    <li><a href="#"><img src="images/bus2.jpg"></a></li>
                    <li><a href="#"><img src="images/bus3.jpg"></a></li>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="col-md-3 col-xs-12 footer-grid">
                <h4 class="footer-head">Liên hệ</h4>
                <span class="hq">Số 79 Lý Thường Kiệt</span>
                <address>
                    <ul class="location">
                        <li><span class="glyphicon glyphicon-map-marker"></span></li>
                        <li>Tòa nhà EXPRESS</li>
                        <div class="clearfix"></div>
                    </ul>
                    <ul class="location">
                        <li><span class="glyphicon glyphicon-earphone"></span></li>
                        <li>+84 0984 733 783</li>
                        <div class="clearfix"></div>
                    </ul>
                    <ul class="location">
                        <li><span class="glyphicon glyphicon-envelope"></span></li>
                        <li><a href="mailto:info@example.com">mail@express.com</a></li>
                        <div class="clearfix"></div>
                    </ul>
                </address>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="wrap">
            <div class="copyrights col-md-6">
                <p> © 2015 Express News. All Rights Reserved
                </p>
            </div>
            <div class="footer-social-icons col-md-6">
                <ul>
                    <li><a class="facebook" href="#"></a></li>
                    <li><a class="twitter" href="#"></a></li>
                    <li><a class="flickr" href="#"></a></li>
                    <li><a class="googleplus" href="#"></a></li>
                    <li><a class="dribbble" href="#"></a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- footer-section-ends-here -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
         var defaults = {
         wrapID: 'toTop', // fading element id
         wrapHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */
        $().UItoTop({easingType: 'easeOutQuart'});
    });
</script>
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!---->
</body>
</html>