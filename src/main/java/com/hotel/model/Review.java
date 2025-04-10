package com.hotel.model;

import java.sql.Timestamp;

public class Review {
	private int id;
    private int userId;
    private String userName;
    private String reviewText;
    private int rating; 
    private Timestamp createdAt;

    public Review() {}
    
    public Review(int id, int userId, String userName, String reviewText, int rating, Timestamp createdAt) {
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.reviewText = reviewText;
		this.rating = rating;
		this.createdAt = createdAt;
	}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
    public String getStars() {
        StringBuilder stars = new StringBuilder();
        for (int i = 1; i <= 5; i++) {
            if (i <= rating) {
                stars.append("★"); // Filled star for rating
            } else {
                stars.append("☆"); // Empty star for remaining
            }
        }
        return stars.toString();
    }

}
