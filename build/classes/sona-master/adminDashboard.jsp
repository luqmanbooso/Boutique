<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="com.room.service.RoomServiceImpl"%>
<%@ page import="com.room.model.*"%>
<%@ page import="com.hotel.util.*"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Boutique</title>
        <style>
            @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);

/* Bootstrap Icons */
@import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");

        </style>
    </head>
    <body>
        

<!-- Dashboard -->
<div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
    <!-- Vertical Navbar -->
    <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
        <div class="container-fluid">
            <!-- Toggler -->
            <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Brand -->
            <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="#">
               <img src="img/logo1.png" alt="">            </a>
            <!-- User menu (mobile) -->
            <div class="navbar-user d-lg-none">
                <!-- Dropdown -->
                <div class="dropdown">
                    <!-- Toggle -->
                    <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar-parent-child">
                            <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar- rounded-circle">
                            <span class="avatar-child avatar-badge bg-success"></span>
                        </div>
                    </a>
                    <!-- Menu -->
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                        <a href="#" class="dropdown-item">Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="#" class="dropdown-item">Billing</a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">Logout</a>
                    </div>
                </div>
            </div>
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidebarCollapse">
                <!-- Navigation -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashboard.jsp">
                            <i class="bi bi-house"></i> Dashboard
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="faqList">
                            <i class="bi bi-chat"></i> FAQ
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="adminReviews">
                            <i class="bi bi-star"></i> Reviews
                        </a>
                    </li>
                    
                </ul>
                <!-- Divider -->
                <hr class="navbar-divider my-5 opacity-20">
                <!-- Navigation -->
                
                <div class="mt-auto"></div>
                <!-- User (md) -->
                <ul class="navbar-nav">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">
                            <i class="bi bi-box-arrow-left"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Main content -->
    <div class="h-screen flex-grow-1 overflow-y-lg-auto">
        <!-- Header -->
        <header class="bg-surface-primary border-bottom pt-6">
            <div class="container-fluid">
                <div class="mb-npx">
                    <div class="row align-items-center">
                        <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                            <!-- Title -->
                            <h1 class="h2 mb-0 ls-tight">Admin Dashboard</h1>
                            
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </header>
        <br>
        <h2 style="padding-left:10px;">     Welcome ${userName}.....</h2>
         <%
 int totalUsers = TotalCountService.getCusCount();
         int totalBook = TotalCountService.getBookCount();
    %>
        <!-- Main -->
        <main class="py-6 bg-surface-secondary">
            <div class="container-fluid">
                <!-- Card stats -->
                <div class="row g-6 mb-6">
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">Total Bookings</span>
                                        <span class="h3 font-bold mb-0"><%=totalBook %></span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                            <i class="bi bi-credit-card"></i>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">Total Users</span>
                                        <span class="h3 font-bold mb-0"><%= totalUsers %></span>
                                    </div>
                                    <div class="col-auto">
                                        <div class="icon icon-shape bg-primary text-white text-lg rounded-circle">
                                            <i class="bi bi-people"></i>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="card shadow border-0">

                        </div>
                    </div>
                </div>
                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Room List</h5>
                    </div>
                    <div class="table-responsive">

	<%
	RoomServiceImpl rms= new RoomServiceImpl();
	List<Room> rooms = rms.getAllRooms();
	request.setAttribute("rooms", rooms);
%>

<table class="table table-hover table-nowrap">
    <thead class="thead-light">
        <tr>
            <th scope="col">Room Name</th>
            <th scope="col">Price</th>
            <th scope="col">Size</th>
            <th scope="col">Capacity</th>
            <th scope="col">Bed Type</th>
            <th scope="col">Services</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>
                    <p class="text-heading font-semibold" href="#">
                        ${room.roomName}
                    </p>
                </td>
                <td>
                    $${room.price}
                </td>
                <td>
                    ${room.size} sq ft
                </td>
                <td>
                    ${room.capacity}
                </td>
                <td>
                    ${room.bedType}
                </td>
                <td>
                    ${room.services}
                </td>
                <td class="text-end">
                    <a href="editRoom?id=${room.id}" class="btn btn-sm btn-neutral">Edit</a>

                    <a href="deleteRoom?id=${room.id}" class="btn btn-sm btn-square btn-neutral text-danger-hover" onclick="return confirmDelete();"><i class="bi bi-trash"></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<a href="addRoom" class="btn btn-sm btn-neutral">Add New Room</a>

                    </div>
                    
                </div>
            </div>
        </main>
    </div>
</div>
<script src="js/script.js"></script>
</body>

</html>