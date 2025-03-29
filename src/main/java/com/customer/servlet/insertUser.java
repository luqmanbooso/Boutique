package com.customer.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.customer.dao.CustomerDAO;

@WebServlet("/registerUser")
public class insertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
	    System.out.println(fname+email+pass);

		
		boolean isTrue;
		try {
			isTrue = CustomerDAO.insertUser(fname, email, pass);
			
			// Forward the request to the JSP
		    if(isTrue) {
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		    dis.forward(request, response);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
