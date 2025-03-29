package com.booking.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import com.booking.dao.BookingDAO;
import com.booking.model.Booking;



@WebServlet("/insertbooking")
public class insertBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String userIdStr = request.getParameter("user_id");
         int userId = Integer.parseInt(userIdStr);  // Parse the user_id from String to int

         // Retrieve room_id from the hidden form field
         String roomIdStr = request.getParameter("room_id");
         int roomId = Integer.parseInt(roomIdStr);  // Parse the room_id from String to int

         System.out.println("user_id: " + userIdStr);  // Add this for debugging
         System.out.println("room_id: " + roomIdStr);  // Add this for debugging
         // Retrieve check-in and check-out dates
         String checkInStr = request.getParameter("checkin");
         String checkOutStr = request.getParameter("checkout");

         // Retrieve number of members and room type
         String nomemStr = request.getParameter("nomem");
         int noOfMembers = Integer.parseInt(nomemStr);  // Parse number of members

         String roomType = request.getParameter("rtype");

         // Convert check-in and check-out dates from String to LocalDate, then to java.sql.Date
         LocalDate checkInDate = LocalDate.parse(checkInStr);
         LocalDate checkOutDate = LocalDate.parse(checkOutStr);
         Date sqlCheckInDate = Date.valueOf(checkInDate);
         Date sqlCheckOutDate = Date.valueOf(checkOutDate);
         
         BookingDAO bookingDAO = new BookingDAO();

         
         try {
        	 System.out.println(sqlCheckInDate+"\n"+ sqlCheckOutDate+"\n"+ userId+"\n"+ roomId+"\n"+ roomType+"\n"+noOfMembers);
             // Call the method to insert booking details into the database
        	 Booking booking = new Booking();
        	 booking.setCheckInDate(sqlCheckInDate);
        	 booking.setCheckOutDate(sqlCheckOutDate);
        	 booking.setUserId(userId);
        	 booking.setRoomId(roomId);
        	 booking.setRoomType(roomType);
        	 booking.setNoOfMembers(noOfMembers);

        	 // Call the method to insert the booking
        	 boolean insertBooking = bookingDAO.insertbooking(booking);
        	 
            if (insertBooking  == false) {
                request.setAttribute("message", "Room available!");
            } else {
                request.setAttribute("message", "Sorry All Rooms Booked.");
            }
           
            // Forward request to result JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooking.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
        
	}

}
