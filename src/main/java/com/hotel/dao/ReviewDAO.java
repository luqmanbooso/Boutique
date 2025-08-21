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
				.prepareStatement("Insert into reviews (user_id, user_name, review_text, rating,status)  Values (?,?,?,?,?)");
		stm.setObject(1, review.getUserId());
		stm.setObject(2, review.getUserName());
		stm.setObject(3, review.getReviewText());
		stm.setObject(4, review.getRating());
		stm.setString(5, "pending");
		int res = stm.executeUpdate();
		return res > 0;
	}

	public List<Review> getAllReviews() throws ClassNotFoundException, SQLException {

		//ResultSet rst = DatabaseConnection.getInstance().getConnection().createStatement()
				//.executeQuery("Select * From reviews ORDER BY created_at DESC LIMIT 5");
		ResultSet rst = DatabaseConnection.getInstance().getConnection().createStatement()
				.executeQuery("Select * From reviews ORDER BY created_at");
		List<Review> reviews = new ArrayList<>();
		while (rst.next()) {
			Review review = new Review(rst.getInt("id"), rst.getInt("user_id"), rst.getString("user_name"),
					rst.getString("review_text"), rst.getInt("rating"), rst.getTimestamp("created_at"), rst.getString("status"));
			reviews.add(review);
		}
		return reviews;
	}

	public boolean deleteReview(int reviewId) {
		String sql = "DELETE FROM reviews WHERE id = ?";
		try (Connection conn = DatabaseConnection.getInstance().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, reviewId); 
			return pstmt.executeUpdate() > 0; 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace(); 
			return false; 
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

	public boolean updateReviewStatus(int reviewId, String newStatus) {
	    String query = "UPDATE reviews SET status = ? WHERE id = ?";
	    try (Connection con = DatabaseConnection.getInstance().getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ps.setString(1, newStatus);
	        ps.setInt(2, reviewId);

	        int rowsUpdated = ps.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}



	public List<Review> getReviewsByStatus(String status) {
	    List<Review> reviews = new ArrayList<>();
	    String sql = "SELECT * FROM reviews WHERE status = ? ORDER BY created_at DESC";
	    try (Connection conn = DatabaseConnection.getInstance().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, status);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Review review = new Review(
	                rs.getInt("id"),
	                rs.getInt("user_id"),
	                rs.getString("user_name"),
	                rs.getString("review_text"),
	                rs.getInt("rating"),
	                rs.getTimestamp("created_at"),
	                rs.getString("status")
	            );
	            reviews.add(review);
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return reviews;
	}


}

