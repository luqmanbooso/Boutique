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
import com.room.model.Room;
import com.room.service.*;



@WebServlet("/checkAvailability")
public class BookingAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String checkInStr = request.getParameter("checkInDate");
	        String checkOutStr = request.getParameter("checkOutDate");
	        
	        String rId = request.getParameter("roomId");
	        System.out.println("Room ID in serv : "+rId);
	        // Parse the room_id from String to int
	        int roomId = Integer.parseInt(rId);  

	        
	        System.out.println("A-in Date: " + checkInStr);
            System.out.println("B-out Date: " + checkOutStr);
            // Convert String to LocalDate
            LocalDate checkInDate = LocalDate.parse(checkInStr); 
            LocalDate checkOutDate = LocalDate.parse(checkOutStr); 

            // Convert LocalDate to java.sql.Date
            Date sqlCheckInDate = Date.valueOf(checkInDate);
            Date sqlCheckOutDate = Date.valueOf(checkOutDate);
	            //test
            System.out.println("Check-in Date: " + sqlCheckInDate);
            System.out.println("Check-out Date: " + sqlCheckOutDate);
            BookingDAO bookingDAO = new BookingDAO();

	        //pass the room object again in case room obect is lost after redirecting
            RoomService rs = new RoomServiceImpl();
            Room room = null;
	             try {
	             // Call DBUtil method to get available rooms
	             boolean availableRooms = bookingDAO.checkBookingAvailability(sqlCheckInDate, sqlCheckOutDate,roomId);
	             room = rs.getRoomById(roomId);
	             if (availableRooms  == false) {
	                 request.setAttribute("message", "Room available!");
	             } else {
	                 request.setAttribute("message", "Sorry All Rooms Booked.");
	             }
	             request.setAttribute("chkIN", checkInDate);
	             request.setAttribute("chkOUT", checkOutDate);
	             // Forward request to result JSP page
	             request.setAttribute("room", room);

	             
	             RequestDispatcher dispatcher = request.getRequestDispatcher("room-details.jsp");
	             dispatcher.forward(request, response);

	         } catch (Exception e) {
	             e.printStackTrace();
	         }
	}

  
}
