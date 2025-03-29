package com.customer.servlet;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import com.customer.dao.CustomerDAO;
import com.customer.model.Customer;

@WebServlet("/loginUser")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		boolean isTrue;
		
		isTrue = CustomerDAO.validate(email, pass);
		
		if (isTrue) {
		    // Retrieve and set the customer details
		    Customer cusDetails = CustomerDAO.getCustomer(email);
		    request.setAttribute("cusDetails", cusDetails.getName());
		    request.setAttribute("cusemail", cusDetails.getEmail());
		    
		 // After successful login
		    HttpSession session = request.getSession();
		    session.setAttribute("userID", cusDetails.getId());  // Store the user ID in session
		    session.setAttribute("userName", cusDetails.getName());
		    
		    // Retrieve and set the list of customers
		    //Customer cuslist = CustomerDBUtil.ListCus();
		    //request.setAttribute("cuslist", cuslist);
		    
		    // Forward the request to the JSP
		    RequestDispatcher dis;
		    if(cusDetails.isUtype()==true) {
		    	 dis = request.getRequestDispatcher("adminDashboard.jsp");
			    
		    }else {
		     dis = request.getRequestDispatcher("index.jsp");
		    }
		    dis.forward(request, response);
		    return;
		}
 else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");
		}
		
	}

}
