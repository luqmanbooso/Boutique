package com.booking.servlet;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.booking.dao.BookingDAO;

@WebServlet("/deleteBooking")
public class DeleteBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid = request.getParameter("did");
		int id = Integer.parseInt(bid);
		BookingDAO bookingDAO = new BookingDAO();

		
		try{
		boolean isTrue = bookingDAO.deleteBooking(id);
		if(isTrue) {
           
			// Set a delete message as a session attribute, so it persists after redirect
            request.setAttribute("deletemsg", "Room Deleted Successfully");
            RequestDispatcher rd = request.getRequestDispatcher("viewbooking.jsp");
            rd.forward(request, response);
            
		}else {
            // Optionally, handle the case where the delete fails
            request.setAttribute("deletemsg", "Room Deletion Failed");
            RequestDispatcher rd = request.getRequestDispatcher("viewbooking.jsp");
            rd.forward(request, response);
        }
		
		}catch(Exception e) {
			 e.printStackTrace(); // Log the exception for debugging
		        request.setAttribute("deletemsg", "An error occurred while deleting the room. Please try again.");
		        RequestDispatcher rd = request.getRequestDispatcher("viewbooking.jsp");
		        rd.forward(request, response);

		}
		
	}

}
