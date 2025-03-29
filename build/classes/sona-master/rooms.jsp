<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="com.room.service.*"%>
<%@ page import="com.room.model.Room"%>
<%@ page import="java.util.List"%>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Our Rooms</h2>
                        <div class="bt-option">
                            <a href="./home.jsp">Home</a>
                            <span>Rooms</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Rooms Section Begin -->
   <%
   RoomService rs = new RoomServiceImpl();
   List<Room> rooms = rs.getAllRooms(); // Assuming roomDAO retrieves all rooms from DB
   request.setAttribute("roomsList", rooms); // Set rooms as a request attribute
   %>
<%
    List<Room> roomsList = (List<Room>) request.getAttribute("roomsList"); // Retrieve the list
%>

<div class="container">
    <div class="row">
        <% if (roomsList != null) { 
            for (int i = 0; i < roomsList.size(); i++) { 
                Room room = roomsList.get(i);
        %>
        <div class="col-md-4">
            <div class="card">
                <img src="img/room/room-1.jpg" class="card-img-top" alt="Room Image">
                <div class="card-body">
					<h5 class="card-title"><%= room.getRoomName() %></h5>
					<p class="card-text">
					    Price: <%= room.getPrice() %> $/Per night<br>
					    Size: <%= room.getSize() %> ft²<br>
					    Capacity: <%= room.getCapacity() %> persons<br>
					    Bed Type: <%= room.getBedType() %><br>
					    Services: <%= room.getServices() %>
					</p>
					 <%
						    if (session.getAttribute("userID") == null) {
						        // Redirect to the login page if userID is not present in session
						        response.sendRedirect("login.jsp");
						        return; // Prevent further execution of the page
						    }else{
						%>
                           <a href="roomdetails?id=<%= room.getId() %>" class="primary-btn" style="color:black;">More Details</a>
                        <%
						    }
                        %>
                </div>
            </div>
        </div>
        <% if ((i + 1) % 3 == 0) { %> <!-- Close row and start a new one every 3 cards -->
        </div>
        <br><br>
        <div class="row">
        <% } 
            } 
        } %>
    </div>
</div>

    <!-- Rooms Section End -->
<br><br><br>
<%@ include file="footer.jsp" %>