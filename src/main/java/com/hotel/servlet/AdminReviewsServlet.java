package com.hotel.servlet;

import java.io.IOException;
import java.util.List;

import com.hotel.dao.ReviewDAO;
import com.hotel.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminReviews")
public class AdminReviewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Review> allReviews = new ReviewDAO().getAllReviews();
			request.setAttribute("reviews", allReviews);
			request.getRequestDispatcher("adminReviews.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}
}
