package com.booking.servlet;

import jakarta.servlet.RequestDispatcher;  
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.booking.dao.BookingDAO;
import com.booking.model.Booking;

@WebServlet("/showBooking")
public class ShowBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid = request.getParameter("id");
		int id = Integer.parseInt(bid);
		System.out.println("Passing ID : "+bid);
	    
		BookingDAO bookingDAO = new BookingDAO();

		Booking bList = bookingDAO.getBookingDetails(id);  // Assuming 'bookingId' is retrieved correctly
	  
	    if (bList != null) {
            // Set the Booking object as a request attribute
            request.setAttribute("bList", bList);
        }
	    if (bList == null) {
	        System.out.println("Booking details not found for ID: " + bid);
	    } else {
	        System.out.println("Booking details retrieved successfully");
	    }
	    request.setAttribute("bid", bList.getBid());
	    request.setAttribute("checkinDate", bList.getCheckInDate());
	    request.setAttribute("checkoutDate", bList.getCheckOutDate());
	    request.setAttribute("roomType", bList.getRoomType());
	    request.setAttribute("nomem", bList.getNoOfMembers());
	    RequestDispatcher rd = request.getRequestDispatcher("viewbooking.jsp");
	    rd.forward(request, response);

	}

}
