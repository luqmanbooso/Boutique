package com.hotel.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hotel.dao.ReviewDAO;
import com.hotel.model.Review;

@WebServlet
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReviewDAO reviewDAO = new ReviewDAO();
		//Initialized an empty list to storage
		List<Review> reviews = new ArrayList<>();
		try {
			//Fetch all reviews from the database 
			reviews = reviewDAO.getAllReviews();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("reviews", reviews);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
