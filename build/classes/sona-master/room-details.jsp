<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="com.room.model.Room"%>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Our Rooms</h2>
                        <div class="bt-option">
                            <a href="./home.jsp">Home</a>
                            <a href="./rooms.jsp">Rooms</a>
                            <span>Room-Details</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->


<%
    Room room = (Room) request.getAttribute("room");
%>

    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="room-details-item">
                        <img src="img/room/room-details.jpg" alt="">
                        <div class="rd-text">
                            <div class="rd-title">
                                <h3><%= room.getRoomName() %></h3>
                                <div class="rdt-right">
                                    
                                    <button class="btn btn-primary" id="bb"  disabled>Booking Now</button>

<!-- Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookingModalLabel">Book Your Stay</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Booking Form -->
<form id="bookingForm" action="insertbooking" method="post" novalidate>
    <input type="hidden" name="user_id" value="<%= session.getAttribute("userID") %>">
    <input type="hidden" name="room_id" id="room_id" value="<%= room.getId() %>">

    <div class="mb-3">
        <label for="checkin" class="form-label text-start">Check-In Date</label>
        <input type="date" class="form-control" name="checkin" id="checkin"
               value="<%= request.getAttribute("chkIN") != null ? request.getAttribute("chkIN") : "" %>" required>
    </div>

    <div class="mb-3">
        <label for="checkout" class="form-label">Check-Out Date</label>
        <input type="date" class="form-control" name="checkout" id="checkout"
               value="<%= request.getAttribute("chkOUT") != null ? request.getAttribute("chkOUT") : "" %>" required>
    </div>

    <div class="mb-3 row align-items-center">
        <label for="adults" class="col-md-4 col-form-label text-md-end">No Of Members</label>
        <div class="col-md-8">
            <select class="form-select" name="nomem" id="adults" required>
                <option value="" selected disabled>Choose number of members</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
             <div class="invalid-feedback" id="editNoMemFeedback">Please select the number of members.</div>
        </div>
    </div>

    <div class="mb-3 row align-items-center">
        <label for="room" class="col-md-4 col-form-label text-md-end">Room Type</label>
        <div class="col-md-8">
            <select class="form-select" id="room" name="rtype" required>
                <option value="" selected disabled>Choose a room type</option>
                <option value="Single">Single</option>
                <option value="Double">Double</option>
                <option value="Standard">Standard</option>
                <option value="Suite">Suite</option>
            </select>
             <div class="invalid-feedback" id="errorRoomType">Please select the number of members.</div>
        </div>
    </div>

    <button type="submit" class="btn btn-primary">Book Now</button>
</form>

<script>
    document.getElementById('bookingForm').addEventListener('submit', function(event) {
        var roomSelect = document.getElementById('room');
        var noMemSelect = document.getElementById('adults');
        var isValid = true;

        if (roomSelect.value === "") {
            isValid = false;
            document.getElementById("errorRoomType").style.display = "block";
        }else{
        	  document.getElementById("errorRoomType").style.display = "none";
        }
        

        if (!noMemSelect.value) {
            isValid = false;
            noMemSelect.classList.add('is-invalid');
            document.getElementById("editNoMemFeedback").style.display = "block";
        }else{
      	  document.getElementById("editNoMemFeedback").style.display = "none";
      }
        if (!isValid) {
            event.preventDefault();
        }

        
    });
    document.getElementById("adults").onchange = function(){
    	 var noMemSelect = document.getElementById('adults');
         if (!noMemSelect.value) {
             isValid = false;
             noMemSelect.classList.add('is-invalid');
             document.getElementById("editNoMemFeedback").style.display = "block";
         }else{
       	  document.getElementById("editNoMemFeedback").style.display = "none";
       }
    	}
    document.getElementById("room").onchange = function(){
    	 var roomSelect = document.getElementById('room');
        if (!roomSelect.value) {
            isValid = false;
            document.getElementById("errorRoomType").style.display = "block";
        }else{
        	  document.getElementById("errorRoomType").style.display = "none";
        }
        
   	}
</script>





      </div>
    </div>
  </div>
</div>
                                </div>
                            </div>
                            <h2><%= room.getPrice() %>$<span>/Pernight</span></h2>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td><%= room.getSize() %> ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td> <%= room.getCapacity() %></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td><%= room.getBedType() %></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td><%= room.getServices() %></td>
                                    </tr>
                                </tbody>
                            </table>
                            <p class="f-para">Motorhome or Trailer that is the question for you. Here are some of the
                                advantages and disadvantages of both, so you will be confident when purchasing an RV.
                                When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth
                                wheeler? The advantages and disadvantages of both are studied so that you can make your
                                choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an
                                achievement of a lifetime. It can be similar to sojourning with your residence as you
                                search the various sites of our great land, America.</p>
                            <p>The two commonly known recreational vehicle classes are the motorized and towable.
                                Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth
                                wheel has the attraction of getting towed by a pickup or a car, thus giving the
                                adaptability of possessing transportation for you when you are parked at your campsite.
                            </p>
                        </div>
                    </div>
                    
                </div>
                <div class="col-lg-4">
                    <div class="room-booking">
                        <h3>Your Reservation</h3>
                       <form action="checkAvailability" method="post" id="availabilityForm">
    <div class="check-date">
        <label for="date-in">Check In:</label>
        <input type="date" id="checkInDate" name="checkInDate" required>
    </div>
    <div class="check-date">
        <label for="date-out">Check Out:</label>
        <input type="date" id="checkOutDate" name="checkOutDate" required>
    </div>
    <input type="hidden" name="roomId" value="<%= room.getId() %>">
    <div class="d-flex justify-content-center">
        <input type="submit" value="Check Availability" class="btn btn-dark">
    </div>
    
    <%
        String message = (String) request.getAttribute("message");
        if ("Room available!".equals(message)) {
    %>
    <div class="alert alert-primary" role="alert"><%= message %></div>
    <script>
        document.getElementById("bb").removeAttribute("disabled");
        document.getElementById("bb").addEventListener("click", function() {
            var bookingModal = new bootstrap.Modal(document.getElementById('bookingModal'));
            bookingModal.show();
        });
    </script>
    <%
        } else if ("Sorry All Rooms Booked.".equals(message)) {
    %>
    <div class="alert alert-danger" role="alert"><%= message %></div>
    <%
        }
    %>
</form>

<script>
    document.getElementById('availabilityForm').addEventListener('submit', function(event) {
        var checkInDate = new Date(document.getElementById('checkInDate').value);
        var checkOutDate = new Date(document.getElementById('checkOutDate').value);

        if (checkOutDate <= checkInDate) {
            event.preventDefault(); 
            alert("Check-out date must be greater than check-in date.");
        }
    });
</script>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Room Details Section End -->
<%@ include file="footer.jsp" %>
    