package com.hotel.servlet;

import java.io.IOException;

import com.hotel.dao.ReviewDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateReviewStatus")
public class UpdateReviewStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idParam = request.getParameter("id");
        String status = request.getParameter("status");

        if(idParam != null && !idParam.trim().isEmpty() && status != null && !status.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                boolean result;

                if("delete".equalsIgnoreCase(status)) {
                    result = new ReviewDAO().deleteReview(id);
                } else {
                    result = new ReviewDAO().updateReviewStatus(id, status);
                }

                if(result){
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }

            } catch(NumberFormatException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            } catch(Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
