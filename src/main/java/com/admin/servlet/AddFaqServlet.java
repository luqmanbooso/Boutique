package com.admin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.admin.dao.FAQDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addFaq")
public class AddFaqServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve form parameters
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        FAQDAO faqDAO = new FAQDAO();

        try {
            // Use DAO to add FAQ
            boolean isInserted = faqDAO.addFaq(question, answer);

            // If insertion is successful, redirect to the FAQ list page
            if (isInserted) {
                response.sendRedirect("faqList");  // Change "faqList" to the actual list page
            } else {
                // Redirect to error page if insertion failed
                response.sendRedirect("error.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();  // Handle the exception
            response.sendRedirect("error.jsp");  // Redirect to an error page
        }
    }
}
