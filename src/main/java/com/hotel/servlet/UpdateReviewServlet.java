package com.hotel.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hotel.dao.ReviewDAO;


@WebServlet("/UpdateReviewServlet")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateReviewServlet() {
        super();        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewId = request.getParameter("reviewId");
	    String reviewText = request.getParameter("reviewText");
	    String rating = request.getParameter("rating");

	    ReviewDAO reviewDAO = new ReviewDAO();
	    boolean isUpdated = reviewDAO.updateReview(Integer.parseInt(reviewId), reviewText, Integer.parseInt(rating));

	    if (isUpdated) {
	        response.sendRedirect("userAcc.jsp"); 
	    } else {
	        response.sendRedirect("editReview.jsp?error=Update failed");
	    }
	}

}
