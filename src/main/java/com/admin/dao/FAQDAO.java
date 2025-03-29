package com.admin.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.admin.model.FAQ;
import com.hotel.util.DatabaseConnection;


public class FAQDAO extends AbstractFAQdao{
	// Method to add a new FAQ
	@Override
    public boolean addFaq(String question, String answer) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean isInserted = false;

        try {
            conn = DatabaseConnection.getInstance().getConnection();

            String sql = "INSERT INTO admin_faq (question, answer) VALUES (?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, question);
            stmt.setString(2, answer);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isInserted = true;  // Success if a row is affected
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return isInserted;
    }
    
	@Override
    public List<FAQ> getAllFaqs() throws Exception {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<FAQ> faqList = new ArrayList<>();

        try {
            conn = DatabaseConnection.getInstance().getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM admin_faq");

            while (rs.next()) {
                FAQ faq = new FAQ(
                    rs.getInt("id"),
                    rs.getString("question"),
                    rs.getString("answer"),
                    rs.getTimestamp("created_at"),  
                    rs.getTimestamp("updated_at")   
                );
                faqList.add(faq);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } 

        return faqList;
    }
    
 // Method to fetch a single FAQ by ID
	@Override
    public FAQ getFaqById(int faqId) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        FAQ faq = null;

        try {
            conn = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT * FROM admin_faq WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, faqId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                faq = new FAQ(
                    rs.getInt("id"),
                    rs.getString("question"),
                    rs.getString("answer"),
                    rs.getTimestamp("created_at"),    
                    rs.getTimestamp("updated_at")    
                );
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } 

        return faq;
    }

    // Method to update an FAQ by ID
	@Override
    public void updateFaq(int faqId, String question, String answer) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getInstance().getConnection();
            String sql = "UPDATE admin_faq SET question=?, answer=? WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, question);
            stmt.setString(2, answer);
            stmt.setInt(3, faqId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
    
    // Method to delete an FAQ by ID
    public void deleteFaqById(int faqId) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getInstance().getConnection();
            String sql = "DELETE FROM admin_faq WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, faqId);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        } 
    }
    
    @Override
        public List<FAQ> getAllFAQs() throws ClassNotFoundException {
            List<FAQ> faqList = new ArrayList<>();
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                conn = DatabaseConnection.getInstance().getConnection();
                String query = "SELECT question, answer FROM admin_faq";
                pstmt = conn.prepareStatement(query);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    String question = rs.getString("question");
                    String answer = rs.getString("answer");
                    FAQ faq = new FAQ(question, answer);
                    faqList.add(faq);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return faqList;
        }
    
}