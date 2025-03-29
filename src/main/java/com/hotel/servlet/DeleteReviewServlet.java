package com.hotel.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hotel.dao.ReviewDAO;

@WebServlet("/deleteReview")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DeleteReviewServlet() {
        super();       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewIdParam = request.getParameter("reviewId");
        if (reviewIdParam != null) {
            int reviewId = Integer.parseInt(reviewIdParam);
            ReviewDAO reviewDAO = new ReviewDAO();
            reviewDAO.deleteReview(reviewId); 
        }
        response.sendRedirect("userAcc.jsp"); // Redirect back to profile after deletion
	}

}
