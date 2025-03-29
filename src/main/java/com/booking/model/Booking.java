package com.booking.model;

import java.util.Date;

public class Booking {
    private int bid;           
    private Date checkInDate;   
    private Date checkOutDate;  
    private String roomType;    
    private int noOfMembers;     
    private int userId;         
    private int roomId;         
    
    // Overloaded Constructor
    public Booking(int bid, Date checkInDate, Date checkOutDate,  String roomType, int noOfMembers, int userId, int roomId) {
        this.bid = bid;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomType = roomType;
        this.noOfMembers = noOfMembers;
        this.userId = userId;
        this.roomId = roomId;
    }

    // Default constructor
    public Booking() {}

    // Getters and Setters
    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getNoOfMembers() {
        return noOfMembers;
    }

    public void setNoOfMembers(int noOfMembers) {
        this.noOfMembers = noOfMembers;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
}
