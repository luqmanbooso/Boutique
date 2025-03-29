package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Review;
import com.hotel.util.DatabaseConnection;

public class ReviewDAO {

	public boolean addReview(Review review) throws ClassNotFoundException, SQLException {

		Connection connection = DatabaseConnection.getInstance().getConnection();
		PreparedStatement stm = connection
				.prepareStatement("Insert into reviews (user_id, user_name, review_text, rating)  Values (?,?,?,?)");
		stm.setObject(1, review.getUserId());
		stm.setObject(2, review.getUserName());
		stm.setObject(3, review.getReviewText());
		stm.setObject(4, review.getRating());
		int res = stm.executeUpdate();
		return res > 0;
	}

	public List<Review> getAllReviews() throws ClassNotFoundException, SQLException {

		ResultSet rst = DatabaseConnection.getInstance().getConnection().createStatement()
				.executeQuery("Select * From reviews ORDER BY created_at DESC LIMIT 5");
		List<Review> reviews = new ArrayList<>();
		while (rst.next()) {
			Review review = new Review(rst.getInt("id"), rst.getInt("user_id"), rst.getString("user_name"),
					rst.getString("review_text"), rst.getInt("rating"), rst.getTimestamp("created_at"));
			reviews.add(review);
		}
		return reviews;
	}

	public boolean deleteReview(int reviewId) {
		String sql = "DELETE FROM reviews WHERE id = ?";
		try (Connection conn = DatabaseConnection.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, reviewId); // Set the parameter for the prepared statement
			return pstmt.executeUpdate() > 0; // Execute the update and return true if at least one row is affected
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace(); // Log the exception (consider using a logging framework)
			return false; // Return false if an exception occurs
		}
	}

	public List<Review> getUserReviews(int userId) {
		List<Review> reviews = new ArrayList<>();
		String sql = "SELECT * FROM reviews WHERE user_id = ? ORDER BY created_at DESC";
		try (Connection conn = DatabaseConnection.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Review review = new Review();
				review.setId(rs.getInt("id"));
				review.setUserId(rs.getInt("user_id"));
				review.setUserName(rs.getString("user_name"));
				review.setReviewText(rs.getString("review_text"));
				review.setRating(rs.getInt("rating"));
				review.setCreatedAt(rs.getTimestamp("created_at"));
				reviews.add(review);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return reviews;
	}
	// Add updateReview method if needed


	public boolean updateReview(int reviewId, String reviewText, int rating) {
		
	    try {
	        String query = "UPDATE reviews SET review_text = ?, rating = ? WHERE id = ?";
	        Connection conn = DatabaseConnection.getInstance().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, reviewText);
	        pstmt.setInt(2, rating);
	        pstmt.setInt(3, reviewId);
	         
	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException | ClassNotFoundException e) { 
	        e.printStackTrace();
	        return false;
	    }
	}



}

