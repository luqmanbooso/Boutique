package com.hotel.util;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TotalCountService {
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
    
public static int getCusCount() throws SQLException {
		int cusCount = 0;
	   try {
	        // Get the connection
	        con = DatabaseConnection.getInstance().getConnection();
	        

	        String sql = "SELECT COUNT(*) AS total_users FROM customer";
	        
	        // Create PreparedStatement
	        pstmt = con.prepareStatement(sql);
	        
	        // Execute the query
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
                cusCount = rs.getInt(1); // Extract the count value
            }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally {
	        if (pstmt != null) pstmt.close();
	        if (con != null) con.close();
	    }
	return cusCount;

}

public static int getBookCount() throws SQLException {
	int bCount = 0;
   try {
        // Get the connection
        con = DatabaseConnection.getInstance().getConnection();
        
        // SQL query using placeholders (?)
        String sql = "SELECT COUNT(*) AS total_users FROM booking";
        
        // Create PreparedStatement
        pstmt = con.prepareStatement(sql);
        
        // Execute the query
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            bCount = rs.getInt(1); // Extract the count value
        }
    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
return bCount;

}
}
