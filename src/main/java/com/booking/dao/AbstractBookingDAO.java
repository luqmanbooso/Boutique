package com.booking.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.booking.model.Booking;

public abstract class AbstractBookingDAO {
    //abstract methods of the class
    public abstract boolean insertbooking(Booking booking);
    
    public abstract Booking getBookingDetails(int bookingId);
    
    public abstract boolean updateBooking(int bookingId, Date checkInDate, Date checkOutDate, String roomType, int numMembers);
    
    public abstract boolean deleteBooking(int bookingId);
    
    public abstract boolean checkBookingAvailability(Date checkInDate, Date checkOutDate, int rid);
    
    public abstract ArrayList<Booking> getAllItems(int id);
}
