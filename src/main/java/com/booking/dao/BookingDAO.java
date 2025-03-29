package com.booking.dao;

 
import com.booking.model.Booking;
import com.hotel.util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BookingDAO extends AbstractBookingDAO{
	private static boolean isSuccess;
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	@Override
	public boolean insertbooking(Booking booking) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        // Get the connection
	        con = DatabaseConnection.getInstance().getConnection();
	        
	        // SQL query using placeholders for each parameter
	        String sql = "INSERT INTO booking (check_in_date, check_out_date, user_id, room_id, rtype, no_of_members) VALUES (?, ?, ?, ?, ?, ?)";
	        
	        // Create PreparedStatement
	        pstmt = con.prepareStatement(sql);
	        
	        // Set the values for each placeholder in the SQL query
	        pstmt.setDate(1, (java.sql.Date) booking.getCheckInDate());    
	        pstmt.setDate(2, (java.sql.Date) booking.getCheckOutDate());   
	        pstmt.setInt(3, booking.getUserId());      
	        pstmt.setInt(4, booking.getRoomId());      
	        pstmt.setString(5, booking.getRoomType()); 
	        pstmt.setInt(6, booking.getNoOfMembers()); 

	        // Execute the query
	        int rs = pstmt.executeUpdate();
	        
	        // Check if insertion was successful
	        if (rs > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    } 

	    return isSuccess;
	}


	//getBookingDetails
	@Override
	public Booking getBookingDetails(int Id) {
		Booking book=null;
		try {
			con = DatabaseConnection.getInstance().getConnection();
    		
    		String sql = "select * from booking where booking_id= ? ";
    		
    		pstmt= con.prepareStatement(sql);	
    		
    		pstmt.setInt(1, Id);
    		
    		rs = pstmt.executeQuery();
    		System.out.println(rs);
    		if(rs.next()) {
    			int id = rs.getInt(1);                    
    		    Date checkInDate = rs.getDate(2);         
    		    Date checkOutDate = rs.getDate(3);       
    		    int userId = rs.getInt(4);                
    		    int roomId = rs.getInt(5);                
    		    String roomType = rs.getString(6);        
    		    int noOfMembers = rs.getInt(7);                
    		    
    		    book = new Booking(id, checkInDate, checkOutDate, roomType, noOfMembers, userId, roomId);
    		        		}else {
    		}
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return book;
		
	}
	//update the booking
	@Override
    public boolean updateBooking(int id, java.sql.Date cindate, java.sql.Date coutdate, String rtype, int nomem) {
    	
    	try {
    		
    		con =DatabaseConnection.getInstance().getConnection();
    		
    		String sql = "update booking set check_in_date=? ,check_out_date=? ,rtype=? ,no_of_members=? where booking_id=? ";
    		
    		pstmt = con.prepareStatement(sql);  
    		
    		pstmt.setDate(1,  cindate);
    		pstmt.setDate(2,  coutdate);
    		pstmt.setString(3, rtype);
    		pstmt.setInt(4, nomem);
    		pstmt.setInt(5,id);
    		int rs = pstmt.executeUpdate();
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(SQLException | ClassNotFoundException e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
    
    @Override
    public boolean deleteBooking(int id) {
    	

    	try {
    		
    		con = DatabaseConnection.getInstance().getConnection();
    		String sql = "delete from booking where booking_id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, id);
    		int r = pstmt.executeUpdate();
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
    
    //check availability method
    @Override
    public boolean checkBookingAvailability(java.sql.Date checkInDate, java.sql.Date checkOutDate,int rid) {
        boolean isSuccess = false; // Initialize to true by default
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM booking WHERE room_id = ?	 AND check_in_date < ? AND check_out_date > ?;";
            pstmt = con.prepareStatement(sql);

            // Set the requested booking dates
            pstmt.setInt(1, rid);
            pstmt.setDate(2, checkOutDate);  
            pstmt.setDate(3, checkInDate);  
            rs = pstmt.executeQuery();

            // If any record exists, set value to false
            while (rs.next()) {
                isSuccess = true; 
                // Conflict found, room is unavailable
            }
        } catch (Exception e) {
            e.printStackTrace(); 
            isSuccess = false;
            // Set to false in case of an exception
        } 
         

        return isSuccess;
    }

    //get all the items
    @Override
	public ArrayList<Booking>  getAllItems(int id) {
        ArrayList<Booking> itemList = new ArrayList<>();
        
        try {
            
        	con = DatabaseConnection.getInstance().getConnection();
			String sql = "select * from booking where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	Booking item = new Booking();
                item.setBid(rs.getInt("booking_id"));
                item.setRoomType(rs.getString("rtype"));
               
                // Add item to list
                itemList.add(item);
            }
            if (itemList.isEmpty()) {
                return null; 
            }
           

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return itemList;
    }


	
}
