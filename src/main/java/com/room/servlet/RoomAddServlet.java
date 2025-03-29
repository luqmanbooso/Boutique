package com.room.servlet;

import java.io.IOException; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.room.service.RoomService;
import com.room.service.RoomServiceImpl;  // Import the implementation class
import com.room.model.Room;

@WebServlet("/addRoom")
public class RoomAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // Use the implementation of RoomService
    private RoomService roomService = new RoomServiceImpl();

    //Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Forward the request to "/addRooms.jsp" 
        request.getRequestDispatcher("/addRooms.jsp").forward(request, response);
    }

    //Handles HTTP POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Room room = new Room();
        room.setRoomName(request.getParameter("roomName"));
        room.setPrice(Double.parseDouble(request.getParameter("price")));
        room.setSize(Double.parseDouble(request.getParameter("size")));
        room.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        room.setBedType(request.getParameter("bedType"));
        room.setServices(request.getParameter("services"));

        //Try block to handle potential errors
        try {
			if (roomService.addRoom(room)) {
			    response.sendRedirect("roomList");
			} else {
			    response.sendRedirect("error.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
