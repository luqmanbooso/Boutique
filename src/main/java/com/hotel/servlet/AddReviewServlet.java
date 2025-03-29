package com.hotel.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.hotel.dao.ReviewDAO;
import com.hotel.model.Review;

public class AddReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddReviewServlet() {
		super();
	}

	//Handle POST requests when a user submit a review
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userID");
		String userName = (String) session.getAttribute("userName");

		if (userId == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		//Get review text and  rating from the form submitted by user
		String reviewText = request.getParameter("reviewText");
		int rating = Integer.parseInt(request.getParameter("rating"));

		//Create a new review object
		Review review = new Review();
		review.setUserId(userId);
		review.setUserName(userName);
		review.setReviewText(reviewText);
		review.setRating(rating);

		ReviewDAO reviewDAO = new ReviewDAO();
		try {
			reviewDAO.addReview(review);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("index.jsp");

	}

}
