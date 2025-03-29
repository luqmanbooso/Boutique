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

@WebServlet("/editBooking")
public class EditBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isTrue;
		String bid = request.getParameter("id");
		int id = Integer.parseInt(bid);
		
		String checkInStr = request.getParameter("checkin");
    	String checkOutStr = request.getParameter("checkout");
    	
    	String rtype = request.getParameter("rtype");
    	String nomem = request.getParameter("nomem");
    	int nomember =Integer.parseInt(nomem);	

    	
    	LocalDate checkInDate = LocalDate.parse(checkInStr); 
    	LocalDate checkOutDate = LocalDate.parse(checkOutStr); 

        // Convert LocalDate to java.sql.Date
        Date sqlCheckInDate = Date.valueOf(checkInDate);
        Date sqlCheckOutDate = Date.valueOf(checkOutDate);
        BookingDAO bookingDAO = new BookingDAO();

        try {
		isTrue = bookingDAO.updateBooking(id, sqlCheckInDate, sqlCheckOutDate, rtype, nomember);
		if(isTrue) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooking.jsp");
        dispatcher.forward(request, response);
		}else {
			System.out.println("Sql failed");
		}
		}catch(Exception e) {
        	e.printStackTrace();
        }
    }

}
