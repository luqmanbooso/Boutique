package com.customer.dao;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.customer.model.Customer;
import com.hotel.util.DatabaseConnection;


public class CustomerDAO {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
    
	//insert user details method
public static boolean insertUser(String name, String email, String passU) throws SQLException {
	    
	    boolean isSuccess = false;
	    
	    try {
	        // Get the connection
	        con = DatabaseConnection.getInstance().getConnection();
	        
	        // SQL query using placeholders (?)
	        String sql = "INSERT INTO customer VALUES (?, ?, ?, ?,?)";
	        
	        // Create PreparedStatement
	        pstmt = con.prepareStatement(sql);
	        
	        // Set the values for each placeholder
	        pstmt.setInt(1, 0);
	        pstmt.setString(2, name);  
	        pstmt.setString(3, email);        
	        pstmt.setString(4, passU); 
	        pstmt.setInt(5, 0);


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


	//validate the email and password 
	public static boolean validate(String email, String password) {
		
		try {
			con = DatabaseConnection.getInstance().getConnection();
			String sql = "select * from customer where email=? and passU=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//get customer details by passing the email
	public static Customer getCustomer(String email) {
		
		Customer cus = null;
		
		try {
			
			con = DatabaseConnection.getInstance().getConnection();
			String sql = "select * from customer where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String em = rs.getString(3);
				String password = rs.getString(4);
				boolean utype = rs.getBoolean(5);
				
				cus = new Customer(id,name,em,password,utype);	
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			
		}
		
		return cus;	
	}
	
	public static Customer getCustomer(int pid) {
		
		Customer cus = null;
		
		try {
			
			con = DatabaseConnection.getInstance().getConnection();
			String sql = "select * from customer where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String em = rs.getString(3);
				String password = rs.getString(4);
				boolean utype = rs.getBoolean(5);
				
				cus = new Customer(id,name,em,password,utype);	
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			
		}
		
		return cus;	
	}
	
	//update the user details 
public static boolean updateUser(int id, String name,String email,String pass) {
    	
    	try {
    		
    		con = DatabaseConnection.getInstance().getConnection();
    		
    		String sql = "update customer set name=? ,email=? ,passU=? where id=? ";
    		
    		pstmt = con.prepareStatement(sql);
    		
    		pstmt.setString(1, name);
    		pstmt.setString(2, email);
    		pstmt.setString(3, pass);
    		pstmt.setInt(4, id);
    		
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
// delete user details
public static boolean deleteUser(int id) {
	

	try {
		
		con = DatabaseConnection.getInstance().getConnection();
		String sql = "delete from customer where id=?";
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
    
}

