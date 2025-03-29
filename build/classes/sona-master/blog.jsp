<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <style>
        .booking-form {
            background: transparent;
            text-align: center; /* Center text horizontally */
            margin-top: 400px;
        }

        .header-configure-area {
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            margin-top: 10px; /* Adjust top margin */
        }

        .btn-custom {
            border-radius: 5px; /* Add border radius */
            padding: 10px 15px; /* Add padding */
            margin-left: 10px; /* Space between buttons */
            transition: background-color 0.3s, color 0.3s; /* Transition effect */
        }

        .btn-primary {
            background-color: silver; /* Silver color for Login */
            color: #000; /* Text color */
        }

        .btn-primary:hover {
            background-color: #a0a0a0; /* Darker silver on hover */
        }

        .btn-secondary {
            background-color: silver; /* Silver color for Register */
            color: #000; /* Text color */
        }

        .btn-secondary:hover {
            background-color: #a0a0a0; /* Darker silver on hover */
        }

        .bk-btn {
            background-color: black; /* Black color for Booking Now */
            color: white; /* Text color */
        }

        .bk-btn:hover {
            background-color: #333; /* Darker black on hover */
        }

        .nav-item a {
            color: #000; /* Change text color */
            transition: color 0.3s;
        }

        .nav-item a:hover {
            color: #6c757d; /* Change text color on hover */
        }

        /* Custom button styles */
    .btn-custom {
        transition: background-color 0.3s, color 0.3s;
    }

    .btn-custom:hover {
        background-color: #FFD700; /* Dark yellow on hover */
        color: black; /* Change text color on hover */
    }

    /* Booking Now button specific style */
    .bk-btn:hover {
        background-color: darkorange; /* Specific hover effect for Booking Now */
    }

    /* General button hover effects */
    .btn-primary:hover {
        background-color: #a0a0a0; /* Darker silver for Login on hover */
    }

    .btn-secondary:hover {
        background-color: #a0a0a0; /* Darker silver for Register on hover */
    }

    </style>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sona | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Section Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="canvas-open">
        <i class="icon_menu"></i>
    </div>
    <div class="offcanvas-menu-wrapper">
        <div class="canvas-close">
            <i class="icon_close"></i>
        </div>
        <div class="search-icon search-switch">
            <i class="icon_search"></i>
        </div>
        <div class="header-configure-area">
            <div class="mt-3">
                <!-- Login Button -->
                <!-- Login Button -->
<a href="log.html" 
style="background-color: silver; 
       color: #000; 
       border-radius: 5px; 
       padding: 10px 15px; 
       margin-left: 10px; 
       font-weight: bold; 
       transition: background-color 0.3s, color 0.3s; 
       text-decoration: none; 
       border: none;"
onmouseover="this.style.backgroundColor='#6c757d'; this.style.color='#fff';" 
onmouseout="this.style.backgroundColor='silver'; this.style.color='#000';">
 Login
</a>

<!-- Register Button -->
<a href="register.jsp" 
style="background-color: silver; 
       color: #000; 
       border-radius: 5px; 
       padding: 10px 15px; 
       margin-left: 10px; 
       font-weight: bold; 
       transition: background-color 0.3s, color 0.3s; 
       text-decoration: none; 
       border: none;"
onmouseover="this.style.backgroundColor='#a0a0a0'; this.style.color='#fff';" 
onmouseout="this.style.backgroundColor='silver'; this.style.color='#000';">
 Register
</a>

        
                <!-- Booking Now Button -->
                <a href="rooms.jsp" 
                   style="background-color: black; 
                          color: white; 
                          border-radius: 5px; 
                          padding: 10px 15px; 
                          margin-left: 10px; 
                          font-weight: bold; 
                          transition: background-color 0.3s, color 0.3s; 
                          text-decoration: none;"
                   onmouseover="this.style.backgroundColor='#FFD700'; this.style.color='black';" 
                   onmouseout="this.style.backgroundColor='black'; this.style.color='white';">
                    Booking Now
                </a>
            </div>
        </div>
        
        <nav class="mainmenu mobile-menu">
            <ul>
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./rooms.jsp">Rooms</a></li>
                <li><a href="./about-us.jsp">About Us</a></li>
                <li><a href="./pages.jsp">Pages</a>
                    <ul class="dropdown">
                        <li><a href="./room-details.jsp">Room Details</a></li>
                        <li><a href="#">Deluxe Room</a></li>
                        <li><a href="#">Family Room</a></li>
                        <li><a href="#">Premium Room</a></li>
                    </ul>
                </li>
                <li><a href="./blog.jsp">News</a></li>
                <li><a href="./contact.jsp">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="top-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-tripadvisor"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
        </div>
        <ul class="top-widget">
            <li><i class="fa fa-phone"></i> (12) 345 67890</li>
            <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
        </ul>
    </div>
    <!-- Offcanvas Menu Section End -->

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="top-nav">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <!-- Left side: Contact Info -->
                    <div class="d-flex align-items-center">
                        <ul class="tn-left list-unstyled d-flex mb-0">
                            <li class="me-4"><i class="fa fa-phone"></i> (12) 345 67890</li>
                            <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
                        </ul>
                    </div>
    
                    <!-- Right side: Social Media, Booking Button, Login/Register -->
                    <div class="d-flex align-items-center">
                        <!-- Booking Now Button -->
                        <a href="rooms.jsp" class="bk-btn btn btn-custom me-4" style="background-color: #333; color: white; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
                            Booking Now
                        </a>
    
                        <!-- Login Button -->
                        <a href="log.jsp" class="btn btn-secondary ms-3 me-3 btn-custom" style="background-color: silver; color: black; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
                            Login
                        </a>
    
                        <!-- Register Button -->
                        <a href="register.jsp" class="btn btn-secondary ms-3 btn-custom" style="background-color: silver; color: black; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
                            Register
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    
        <div class="menu-item">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="logo">
                            <a href="./index.jsp">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul>
                                    <li class="active"><a href="./index.jsp">Home</a></li>
                                    <li><a href="./rooms.jsp">Rooms</a></li>
                                    <li><a href="./about-us.jsp">About Us</a></li>
                                    <li><a href="./blog.jsp">News</a></li>
                                    <li><a href="./contact.jsp">Contact</a></li>
                                    <li><a href="./pages.jsp">Booking</a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="nav-right search-switch">
                                <i class="icon_search"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Blog</h2>
                        <div class="bt-option">
                            <a href="./home.jsp">Home</a>
                            <span>Blog Grid</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog-section blog-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-1.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.jsp">Tremblant In Canada</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-2.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.jsp">Choosing A Static Caravan</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-3.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Event</span>
                            <h4><a href="./blog-details.jsp">Copper Canyon</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 21th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-4.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Trivago</span>
                            <h4><a href="./blog-details.jsp">A Time Travel Postcard</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 22th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-5.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.jsp">A Time Travel Postcard</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 25th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-6.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.jsp">Virginia Travel For Kids</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 28th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-7.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.jsp">Bryce Canyon A Stunning</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 29th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-8.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Event & Travel</span>
                            <h4><a href="./blog-details.jsp">Motorhome Or Trailer</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 30th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-9.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.jsp">Lost In Lagos Portugal</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 30th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="load-more">
                        <a href="#" class="primary-btn">Load More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="footer-text">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="ft-about">
                            <div class="logo">
                                <a href="#">
                                    <img src="img/footer-logo.png" alt="">
                                </a>
                            </div>
                            <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                            <div class="fa-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="ft-contact">
                            <h6>Contact Us</h6>
                            <ul>
                                <li>(12) 345 67890</li>
                                <li>info.colorlib@gmail.com</li>
                                <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="ft-newslatter">
                            <h6>New latest</h6>
                            <p>Get the latest updates and offers.</p>
                            <form action="#" class="fn-form">
                                <input type="text" placeholder="Email">
                                <button type="submit"><i class="fa fa-send"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <ul>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy</a></li>
                            <li><a href="#">Environmental Policy</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>