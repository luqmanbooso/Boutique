package com.admin.servlet;

import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;

import com.admin.dao.FAQDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteFaq")
public class DeleteFAQServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private FAQDAO faqDAO = new FAQDAO(); // Instance of FaqDAO

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve FAQ id from the request
        String faqId = request.getParameter("id");

        try {
            // Call the DAO method to delete the FAQ
            faqDAO.deleteFaqById(Integer.parseInt(faqId));

            // Redirect to the FAQ list page after deletion
            response.sendRedirect("faqList");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();  // Handle exceptions
            response.sendRedirect("error.jsp"); // Redirect to error page in case of an exception
        }
    }
}
