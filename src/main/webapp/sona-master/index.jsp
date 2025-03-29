<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hotel.model.Review"%>
<%@ page import="com.hotel.dao.ReviewDAO"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <style>
    .logo{
    	padding:none;
    }
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
    <link rel="stylesheet" href="css/reviewModal.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
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
        
                        <!-- Login Button -->
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
                                <img src="img/logo1.png" alt="not working">
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

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero-text">
                        <h1>Experience the Luxury</h1>
                        <p>Here are the best hotel booking sites, including recommendations for international
                            travel and for finding low-priced hotel rooms.</p>
                        <a href="#" class="primary-btn">Discover Now</a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                    <div class="booking-form">
                        <h3>Book Your Hotel Now</h3>
                        <form action="#">
                            
                            <button type="submit">Check Availability</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="img/hero/hero-1.jpg"></div>
            <div class="hs-item set-bg" data-setbg="img/hero/hero-2.jpg"></div>
            <div class="hs-item set-bg" data-setbg="img/hero/hero-3.jpg"></div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- About Us Section Begin -->
    <section class="aboutus-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-text">
                        <div class="section-title">
                            <span>About Us</span>
                            <h2>Intercontinental LA <br />Westlake Hotel</h2>
                        </div>
                        <p class="f-para">Sona.com is a leading online accommodation site. We’re passionate about
                            travel. Every day, we inspire and reach millions of travelers across 90 local websites in 41
                            languages.</p>
                        <p class="s-para">So when it comes to booking the perfect hotel, vacation rental, resort,
                            apartment, guest house, or tree house, we’ve got you covered.</p>
                        <a href="#" class="primary-btn about-btn">Read More</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-pic">
                        <div class="row">
                            <div class="col-sm-6">
                                <img src="img/about/about-1.jpg" alt="">
                            </div>
                            <div class="col-sm-6">
                                <img src="img/about/about-2.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Us Section End -->

    <!-- Services Section End -->
    <section class="services-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>What We Do</span>
                        <h2>Discover Our Services</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-036-parking"></i>
                        <h4>Travel Plan</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-033-dinner"></i>
                        <h4>Catering Service</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-026-bed"></i>
                        <h4>Babysitting</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-024-towel"></i>
                        <h4>Laundry</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-044-clock-1"></i>
                        <h4>Hire Driver</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-012-cocktail"></i>
                        <h4>Bar & Drink</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

    <!-- Home Room Section Begin -->
    <section class="hp-room-section">
        <div class="container-fluid">
            <div class="hp-room-items">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="hp-room-item set-bg" data-setbg="img/room/room-b1.jpg">
                            <div class="hr-text">
                                <h3>Double Room</h3>
                                <h2>199$<span>/Pernight</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Size:</td>
                                            <td>30 ft</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max persion 5</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td>King Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td>Wifi, Television, Bathroom,...</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="rooms.jsp" class="primary-btn">More Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="hp-room-item set-bg" data-setbg="img/room/room-b2.jpg">
                            <div class="hr-text">
                                <h3>Premium King Room</h3>
                                <h2>159$<span>/Pernight</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Size:</td>
                                            <td>30 ft</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max persion 5</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td>King Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td>Wifi, Television, Bathroom,...</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="rooms.jsp" class="primary-btn">More Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="hp-room-item set-bg" data-setbg="img/room/room-b3.jpg">
                            <div class="hr-text">
                                <h3>Deluxe Room</h3>
                                <h2>198$<span>/Pernight</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Size:</td>
                                            <td>30 ft</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max persion 5</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td>King Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td>Wifi, Television, Bathroom,...</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="rooms.jsp" class="primary-btn">More Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="hp-room-item set-bg" data-setbg="img/room/room-b4.jpg">
                            <div class="hr-text">
                                <h3>Family Room</h3>
                                <h2>299$<span>/Pernight</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Size:</td>
                                            <td>30 ft</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max persion 5</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td>King Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td>Wifi, Television, Bathroom,...</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="rooms.jsp" class="primary-btn">More Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Home Room Section End -->

	<!---------------------- Start Review section --------------------------------->
	<!-- Testimonial Section Begin -->

	<%
	// Fetch all reviews from the database
	List<Review> allReviews = new ReviewDAO().getAllReviews();
	request.setAttribute("reviews", allReviews); // Pass the list to the request
	%>

	<section class="testimonial-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span>Testimonials</span>
						<h2>What Customers Say?</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="testimonial-slider owl-carousel">

						<!-- Loop through reviews and display them -->
						<c:forEach var="review" items="${reviews}">
							<div class="ts-item">
								<p>${review.reviewText}</p>
								<div class="ti-author">
									<div class="rating">
										<p style="color: gold;">${review.getStars()}</p>
									</div>
									<h5>- ${review.userName}</h5>
								</div>
								<img src="img/testimonial-logo.png" alt="">
							</div>
						</c:forEach>

					</div>
				</div>
			</div>

			<!-- Add Review Button for registered users -->
			<c:if test="${not empty sessionScope.userID}">
				<div class="row">
					<div class="col-lg-12 text-center">
						<button id="openModalBtn" class="btn btn-primary"
							style="margin-top: 50px; background-color: #4CAF50; border: none; padding: 15px 32px; border-radius: 8px; font-size: 16px;">
							Add Review</button>
					</div>
				</div>
			</c:if>
		</div>

	</section>
	<!-- Testimonial Section End -->

	<!-- The Review Modal -->
	<div id="addReviewModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="hideAddReview()">&times;</span>
			<h2>Add Review</h2>
			<form action="addReview" method="post" onsubmit="return validateReviewForm(event)">
    <textarea id="reviewText" name="reviewText" required placeholder="Write your review..."></textarea>
    <span id="reviewTextError" style="color: red;"></span>
    <br><br>
    
    <label for="rating">Rating:</label> 
    <select id="rating" name="rating">
        <option value="" selected disabled>None</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <span id="ratingError" style="color: red;"></span>
    
    <br><br> 
    <input type="submit" value="Submit Review" style="background-color: #4CAF50; border: none; color: white; padding: 10px 20px; border-radius: 5px;">
    
    <button type="button" style="background-color: #f44336; border: none; color: white; padding: 10px 20px; border-radius: 5px;" onclick="hideAddReview()">Cancel</button>
</form>

<script>
    function validateReviewForm(event) {
        var reviewText = document.getElementById("reviewText").value.trim();
        var rating = document.getElementById("rating").value;
        var isValid = true;

        document.getElementById("reviewTextError").innerHTML = "";
        document.getElementById("ratingError").innerHTML = "";

        if (reviewText === "") {
            document.getElementById("reviewTextError").innerHTML = "Please fill out this field.";
            isValid = false;
            hideErrorAfterDelay("reviewTextError");
        }

        if (rating === "") {
            document.getElementById("ratingError").innerHTML = "Please select a rating.";
            isValid = false;
            hideErrorAfterDelay("ratingError");
        }

        if (!isValid) {
            event.preventDefault();
        }

        return isValid;
    }

    function hideErrorAfterDelay(elementId) {
        setTimeout(function () {
            document.getElementById(elementId).innerHTML = "";
        }, 3000);
    }
</script>

		</div>
	</div>



	<!---------------------- End Review section --------------------------------->


   

<% 
    // Check if the userID session attribute is not set (i.e., user is not logged in)
    if (session.getAttribute("userID") == null) {
%>
    <div class="container mt-5">
        <div class="row align-items-center" style="padding-bottom:10px">
            <!-- Text Section -->
            <div class="col-md-6">
                <h3>Join NH DISCOVERY Loyalty Program</h3>
                <p>
                    As a member of NH DISCOVERY, you'll be recognized and rewarded across the global collection of hotels
                    of Global Hotel Alliance. We offer recognition from Day One — so our benefits, DISCOVERY Dollars (D$),
                    Experiences and Live Local are available to you instantly, at all membership tiers at any of our properties,
                    at home or away, with or without a stay.
                </p>
                <a href="register.jsp" class="btn btn-dark">Sign up</a>
                <br><br><br><br>
            </div>
        </div>
    </div>
<% 
    } 
%>



    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="footer-text">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="ft-about">
                            <div class="logo">
                                <a href="#">
                                    <img src="img/footer-logo1.png" alt="">
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
                                <li>(011) 349 76190</li>
                                <li>Boutique@gmail.com</li>
                                <li>45 Braybrooke Street, 02, Colombo, Sri Lanka</li>
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
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved 
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
    <script src="js/reviewModal.js"></script>
</body>

</html>