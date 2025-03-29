package com.room.servlet;

import java.io.IOException; 

import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.room.service.*;
import com.room.model.*;

@WebServlet("/roomList")
public class RoomListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 // Use the implementation of RoomService
    private RoomService roomService = new RoomServiceImpl();
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> rooms = null;
		try {
			rooms = roomService.getAllRooms();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
