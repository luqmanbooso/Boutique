package com.admin.servlet;

import java.io.IOException;
import java.util.List;

import com.admin.dao.FAQDAO;
import com.admin.model.FAQ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/faqList")
public class FAQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FAQDAO faqDAO = new FAQDAO();  // Create an instance of the DAO
        try {
            // Fetch the FAQ list from the DAO
            List<FAQ> faqList = faqDAO.getAllFaqs();

            // Set the FAQ list as an attribute in the request object
            request.setAttribute("faqList", faqList);

            // Forward the request to the JSP page to display the FAQ list
            RequestDispatcher dispatcher = request.getRequestDispatcher("faqList.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page in case of an exception
        }
    }
}
