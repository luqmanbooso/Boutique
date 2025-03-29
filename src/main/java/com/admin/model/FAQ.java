package com.admin.model;
import java.sql.Timestamp;

public class FAQ {
    private int id;
    private String question;
    private String answer;
    private Timestamp createdAt;  // Add these two fields
    private Timestamp updatedAt;

    public FAQ(String question, String answer) {
        this.question = question;
        this.answer = answer;
    }
    
    // Constructor
    public FAQ(int id, String question, String answer, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    // Setters (if you want to allow updating)
    public void setId(int id) {
        this.id = id;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
