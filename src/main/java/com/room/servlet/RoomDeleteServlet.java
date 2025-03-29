package com.room.servlet;

import java.io.IOException; 
import com.room.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/deleteRoom")
public class RoomDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 // Use the implementation of RoomService
    private RoomService roomService = new RoomServiceImpl();

  //Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("id"));
        //Use the service layer to delete the room by its ID
        if (roomService.deleteRoom(roomId)) {
            response.sendRedirect("roomList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
