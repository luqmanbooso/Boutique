package com.customer.servlet;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.customer.dao.CustomerDAO;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		int uuid = Integer.parseInt(uid);
		String uname = request.getParameter("uname");
		String uemail = request.getParameter("uemail");
		String upass = request.getParameter("upass");
		
		try {
			boolean isTrue = CustomerDAO.updateUser(uuid, uname, uemail, upass);
			if(isTrue) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("userAcc.jsp");
	        dispatcher.forward(request, response);
			}else {
				System.out.println("Sql failed");
			}
			}catch(Exception e) {
	        	e.printStackTrace();
	        }
	}

}
