<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <style>
    	.faq-wrapper {
		    font-family: 'Poppins', sans-serif;
		    background-color: #f4f6fa;
		    margin: 0;
		    padding: 0;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    min-height: 100vh;
		    background: linear-gradient(135deg, #5A3FFF, #FF3D81);
		}
    	 .faq-container {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.1);
            width: 40%;
            padding: 40px;
            max-width: 700px;
            margin: 40px 20px;
        }
        .faq-header {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            font-size: 32px;
            font-weight: bold;
            color: #2B2D42;
            margin-bottom: 10px;
        }
    	        .faq-header i {
            font-size: 32px;
            color: #6c63ff;
        }

        .faq-item {
            border-bottom: 1px solid #ddd;
            margin-bottom: 15px;
            padding-bottom: 10px;
        }

        .faq-item:last-child {
            border-bottom: none;
        }
        .faq-question {
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-size: 18px;
            font-weight: 500;
            padding: 12px 0;
            color: #333;
            position: relative;
        }

        .faq-question .toggle {
            font-size: 20px;
            color: #6c63ff;
            font-weight: bold;
        }

        .faq-answer {
            display: none;
            font-size: 16px;
            color: #666;
            text-align: left;
            padding: 10px 0;
            line-height: 1.6;
        }

        .faq-question.active .toggle {
            transform: rotate(45deg);
        }

        .faq-question.active + .faq-answer {
            display: block;
        }
        .booking-form {
      background-color: #f8f9fa;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
      max-width: 700px;
      margin: auto;
  }

  .booking-form .form-label {
      font-weight: bold;
      font-size: 1.1em;
      color: #343a40;
  }

  .booking-form .form-select, .booking-form .form-control {
      padding: 15px;
      font-size: 1.1em;
  }

  .booking-form .btn {
      padding: 12px 30px;
      font-size: 1.2em;
      background-color: #007bff;
      color: white;
  }

  .booking-form .btn:hover {
      background-color: #0056b3;
  }

  .form-section-title {
      font-size: 1.4em;
      font-weight: 600;
      margin-bottom: 20px;
      color: #495057;
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
    <title>Boutique</title>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    
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
<a href="log.jsp" 
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
                <li><a href="./viewbooking.jsp">Pages</a>
                    <ul class="dropdown">
                        <li><a href="./room-details.jsp">Room Details</a></li>
                        <li><a href="#">Deluxe Room</a></li>
                        <li><a href="#">Family Room</a></li>
                        <li><a href="#">Premium Room</a></li>
                    </ul>
                </li>
                <li><a href="./customerView.jsp">FAQ</a></li>
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
        <div class="top-nav" style="padding: 10px 0;">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <!-- Left side: Contact Info -->
                    <div class="d-flex align-items-center">
                        <ul class="tn-left list-unstyled d-flex mb-0" style="gap: 20px; font-size: 14px;">
                            <li class="me-4">
                                <i class="fa fa-phone" style="color: #FFA500; margin-right: 5px;"></i> 
                                <span>(011) 349 76190</span>
                            </li>
                            <li>
                                <i class="fa fa-envelope" style="color: #FFA500; margin-right: 5px;"></i>
                                <span>Boutique@gmail.com</span>
                            </li>
                        </ul>
                    </div>
        
                    <!-- Right side: Social Media, Booking Button, Login/Register -->
                    <div class="d-flex align-items-center">
                        <!-- Booking Now Button -->
                        <a href="rooms.jsp" class="btn btn-custom me-3" style="background-color: #333; color: white; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
                            Booking Now
                        </a>
        
                                               <% 
    // Assuming you store the user ID or username in the session when the user logs in
   Integer userId = (Integer) session.getAttribute("userID"); // replace with your session attribute name

    if (userId != null) {
%>
    <!-- If user is logged in (session is active), display Logout and Profile buttons -->
    <a href="userAcc.jsp" class="btn btn-custom me-3" style="background-color: silver; color: black; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
        User Profile
    </a>

    <a href="logout.jsp" class="btn btn-custom" style="background-color: silver; color: black; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
        Logout
    </a>
<%
    } else {
%>
    <!-- If no session, display Login and Register buttons -->
    <a href="login.jsp" class="btn btn-custom me-3" style="background-color: silver; color: black; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
        Login
    </a>

    <a href="register.jsp" class="btn btn-custom" style="background-color: silver; color: black; border-radius: 30px; padding: 10px 20px; font-weight: bold; text-decoration: none;">
        Register
    </a>
<%
    }
%>
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
                                <img src="img/logo1.png" alt="">
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
                                    <li><a href="./customerView.jsp">FAQ</a></li>
                                    <li><a href="./contact.jsp">Contact</a></li>
                                    <li><a href="./viewbooking.jsp">Booking</a>
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
