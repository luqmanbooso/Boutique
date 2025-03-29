package com.room.servlet;

import java.io.IOException; 
import com.room.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.room.model.*;

@WebServlet("/editRoom")
public class RoomEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 // Use the implementation of RoomService
    private RoomService roomService = new RoomServiceImpl();

  //Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("id"));
        Room room = roomService.getRoomById(roomId);
        request.setAttribute("room", room);
        request.getRequestDispatcher("/editRooms.jsp").forward(request, response);
    }

  //Handles HTTP POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("id"));
        //Create a new Room object and populate it with data from the request
        Room room = new Room();
        room.setId(roomId);
        room.setRoomName(request.getParameter("roomName"));
        room.setPrice(Double.parseDouble(request.getParameter("price")));
        room.setSize(Double.parseDouble(request.getParameter("size")));
        room.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        room.setBedType(request.getParameter("bedType"));
        room.setServices(request.getParameter("services"));

        //Use the service layer to update the room details in the database
        if (roomService.updateRoom(room)) {
            response.sendRedirect("roomList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
