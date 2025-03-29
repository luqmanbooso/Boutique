package com.admin.dao;

import java.sql.SQLException;
import java.util.List;

import com.admin.model.FAQ;

public abstract class AbstractFAQdao {
    
    public abstract boolean addFaq(String question, String answer) throws SQLException, ClassNotFoundException;
    
    public abstract List<FAQ> getAllFaqs() throws Exception;
    
    public abstract FAQ getFaqById(int faqId) throws SQLException, ClassNotFoundException;
    
    public abstract void updateFaq(int faqId, String question, String answer) throws SQLException, ClassNotFoundException;
    
    public abstract void deleteFaqById(int faqId) throws SQLException, ClassNotFoundException;
    
    public abstract List<FAQ> getAllFAQs() throws ClassNotFoundException;
}