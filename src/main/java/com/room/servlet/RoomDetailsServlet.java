package com.room.servlet;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.room.service.*;
import com.room.model.*;

@WebServlet("/roomdetails")
public class RoomDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

  //Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomId = request.getParameter("id");
        RoomService rs = new RoomServiceImpl();
        // Get room details by ID using the service
        Room room = null;
		try {
			room = rs.getRoomById(Integer.parseInt(roomId));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Set room as a request attribute
        request.setAttribute("room", room);

        // Forward the request to room-details.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("room-details.jsp");
        dispatcher.forward(request, response);
    }
}
