<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.booking.model.*" %>
<%@ page import="com.booking.dao.*" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <style>
        .booking-form {
            background: transparent;
            text-align: center; 
            margin-top: 400px;
        }

        .header-configure-area {
            display: flex;
            justify-content: flex-end; 
            margin-top: 10px; 
        }

        .btn-custom {
            border-radius: 5px; 
            padding: 10px 15px; 
            margin-left: 10px; 
            transition: background-color 0.3s, color 0.3s; 
        }

        .btn-primary {
            background-color: silver; 
            color: #000; 
        }

        .btn-primary:hover {
            background-color: #a0a0a0;
        }

        .btn-secondary {
            background-color: silver; 
            color: #000; 
        }

        .btn-secondary:hover {
            background-color: #a0a0a0;
        }

        .bk-btn {
            background-color: black; 
            color: white;
        }

        .bk-btn:hover {
            background-color: #333; 
        }

        .nav-item a {
            color: #000; 
            transition: color 0.3s;
        }

        .nav-item a:hover {
            color: #6c757d;
        }

       
    .btn-custom {
        transition: background-color 0.3s, color 0.3s;
    }

    .btn-custom:hover {
        background-color: #FFD700; 
        color: black; 
    }

   
    .bk-btn:hover {
        background-color: darkorange; 
    }


    .btn-primary:hover {
        background-color: #a0a0a0; 
    }

    .btn-secondary:hover {
        background-color: #a0a0a0; 
    }

    </style>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Boutique</title>


    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">


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

    <div id="preloder">
        <div class="loader"></div>
    </div>


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
                <li><a href="customerView.jsp">FAQ</a></li>
                <li><a href="./contact.jsp">Contact</a></li>
            </ul>
        </nav>
  
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

<%
if (session.getAttribute("userID") == null) {
    response.sendRedirect("login.jsp");
    return; // Prevent further execution
}
%>
 <%
 BookingDAO dao = new BookingDAO();
    ArrayList<Booking> itemL=dao.getAllItems(userId);
    request.setAttribute("itemList", itemL);
    %>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Our Bookings</h2>
                        <div class="bt-option">
                            <a href="./index.jsp">Home</a>
                            <span>Booking</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

<% 
    String deleteMessage = (String) session.getAttribute("deletemsg");
    if (deleteMessage != null) {
%>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <%= deleteMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
<%
        session.removeAttribute("deletemsg");
    }
%>


      
<% 
    ArrayList<Booking> itemList = (ArrayList<Booking>)  request.getAttribute("itemList");
	System.out.print(itemList);
	if(itemList==null){
		%>
			<p>No Booking Available</p>
		<% 
	}
    if (itemList != null) {
        for (Booking item : itemList) {
%>

	    <div class="container mt-5">
    <div class="row">
        <!-- First Card -->
        <div class="col-md-12">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <h5 class="card-title"><strong>Booking ID: </strong><%= item.getBid() %></h5>
                    <p class="card-text"><strong>Room Type: </strong><%= item.getRoomType() %></p>
                    <div class="d-flex">

                        <a href="showBooking?id=<%= item.getBid() %>" class="btn btn-info" style="margin-right: 10px;">Edit</a>
                        <a href="deleteBooking?did=<%= item.getBid()  %>" class="btn btn-secondary" onclick="return confirm('Are you sure you want to delete this Booking?');">Delete</a>
  	
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

  
    
<% Booking bList = (Booking) request.getAttribute("bList"); 

%>


  <!-- Booking Details Modal -->
  <div class="modal fade" id="bookingDetailsModal" tabindex="-1" aria-labelledby="bookingDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
        
          <h5 class="modal-title" id="bookingDetailsModalLabel">Booking Details</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        
          <!-- Display Booking Details -->
          <% if (bList != null) { %>
          
           <script>

        window.onload = function() {
            var myModal = new bootstrap.Modal(document.getElementById('bookingDetailsModal'));
            myModal.show();
        };
    </script>
          <p><strong>Booking ID:</strong> <%= bList.getBid() %></p>
          <p><strong>Room ID : </strong> <%= bList.getRoomId() %> </p>
          <p><strong>Check-in Date:</strong> <%= bList.getCheckInDate() %></p>
          <p><strong>Check-out Date:</strong>  <%= bList.getCheckOutDate() %></p>
          <p><strong>Room Type:</strong> <%= bList.getRoomType() %></p>
          <p><strong>No Of Members :</strong> <%= bList.getNoOfMembers() %></p>
          
          <% } else { %>
    <p>No booking details available.</p>
<% } %>


        </div>
       
       
        
       <div class="modal-footer">

<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.location.href='viewbooking.jsp';">Close</button>


<button type="button" class="btn btn-primary" id="openEditModal">Edit Booking</button>
</div>

      </div>
    </div>
  </div>
  
  <script>
  document.getElementById('openEditModal').addEventListener('click', function() {
	   

	    var editModal = new bootstrap.Modal(document.getElementById('editBookingModal'));
	    editModal.show();
		});



		
</script>
  <!-- Edit Booking Modal -->

  <div class="modal fade" id="editBookingModal" tabindex="-1" aria-labelledby="editBookingModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editBookingModalLabel">Edit Booking</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

         <form id="editBookingForm" action="editBooking?id=${bid}" method="post">
    <div class="mb-3">
        <label for="editCheckinDate" class="form-label">Check-in Date</label>
        <input type="date" class="form-control" id="editCheckinDate" name="checkin" value="${checkinDate}" required>
        <div class="invalid-feedback">Please provide a valid check-in date.</div>
    </div>

    <div class="mb-3">
        <label for="editCheckoutDate" class="form-label">Check-out Date</label>
        <input type="date" class="form-control" id="editCheckoutDate" name="checkout" value="${checkoutDate}" required>
        <div class="invalid-feedback">Please provide a valid check-out date.</div>
    </div>

    <div class="mb-3 row align-items-center">
        <label for="editRoomType" class="col-md-4 col-form-label text-md-end">Room Type</label>
        <div class="col-md-8">
            <select class="form-select" id="editRoomType" name="rtype" required>
                <option value="${roomType}" selected>${roomType}</option>
                <option value="Single">Single</option>
                <option value="Double">Double</option>
                <option value="Standard">Standard</option>
                <option value="Suite">Suite</option>
            </select>
            <div class="invalid-feedback" id="editRoomTypeFeedback">Please select a valid room type.</div>
        </div>
    </div>

    <div class="mb-3 row align-items-center">
        <label for="editNoMem" class="col-md-4 col-form-label text-md-end">No of Members dfdf</label>
        <div class="col-md-8">
            <select class="form-select" id="editNoMem" name="nomem" required>
                <option value="${nomem}" selected disabled>${nomem}</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <div class="invalid-feedback" id="editNoMemFeedback">Please select the number of members.</div>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="window.location.href='viewbooking.jsp';">Close</button>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </div>
</form>

<script>
    document.getElementById('editBookingForm').addEventListener('submit', function(event) {
        var isValid = true;

        var checkinDate = document.getElementById('editCheckinDate');
        var checkoutDate = document.getElementById('editCheckoutDate');
        var roomType = document.getElementById('editRoomType');
        var noMembers = document.getElementById('editNoMem');

        if (!checkinDate.value) {
            checkinDate.classList.add('is-invalid');
            isValid = false;
        } else {
            checkinDate.classList.remove('is-invalid');
        }

        if (!checkoutDate.value || (new Date(checkinDate.value) >= new Date(checkoutDate.value))) {
            checkoutDate.classList.add('is-invalid');
            isValid = false;
        } else {
            checkoutDate.classList.remove('is-invalid');
        }

        if (!roomType.value) {
            roomType.classList.add('is-invalid');
            isValid = false;
        } else {
            roomType.classList.remove('is-invalid');
        }

        
        if (noMembers.value === "${nomem}" || !noMembers.value) {
            noMembers.classList.add('is-invalid');
            isValid = false;
           
        } else {
            noMembers.classList.remove('is-invalid');
        }

        if (!isValid) {
            event.preventDefault();  
        }
    });
</script>
</div>
      </div>
    </div>
  </div>
  

<%
        }
    }
%>
      
<br><br><br>

<%@ include file="footer.jsp" %>
    