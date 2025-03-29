package com.admin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.admin.dao.FAQDAO;
import com.admin.model.FAQ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/editFaq")
public class EditFAQServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FAQDAO faqDAO = new FAQDAO();  // DAO instance for FAQ operations

    // Handle GET requests to fetch and display the current FAQ
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String faqId = request.getParameter("id");

        try {
            // Fetch the FAQ by ID using the DAO
            FAQ faq = faqDAO.getFaqById(Integer.parseInt(faqId));

            if (faq != null) {
                request.setAttribute("faq", faq);
                RequestDispatcher dispatcher = request.getRequestDispatcher("editFaq.jsp");
                dispatcher.forward(request, response);
            } else {
                // If no FAQ is found, redirect to the FAQ list
                response.sendRedirect("faqList");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }

    // Handle POST requests to update the FAQ
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String faqId = request.getParameter("id");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        try {
            // Update the FAQ using the DAO
            faqDAO.updateFaq(Integer.parseInt(faqId), question, answer);

            // Redirect back to the FAQ list after the update
            response.sendRedirect("faqList");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page in case of an exception
        }
    }
}
