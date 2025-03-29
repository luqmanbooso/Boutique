package com.customer.servlet;

import jakarta.servlet.RequestDispatcher;  
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.customer.dao.CustomerDAO;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 @Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("udid");
			int udid = Integer.parseInt(id);
			
			 // Retrieve the current session, if it exists
	        HttpSession session = request.getSession(false); // Use false to avoid creating a new session if none exists

			boolean isTrue = CustomerDAO.deleteUser(udid);
			if(isTrue) {
				if (session != null) {
		            // Invalidate the session, effectively logging out the user
		            session.invalidate();
		            response.sendRedirect("login.jsp");
		        }	
			}else {
	            // Optionally, handle the case where the delete fails
	            //request.setAttribute("deletemsg", "Room Deletion Failed");
	            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	            rd.forward(request, response);
	        }
			
		}

}
