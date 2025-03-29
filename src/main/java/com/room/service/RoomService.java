package com.room.service;

import com.room.model.*;
import java.util.List;

public interface RoomService {
    boolean addRoom(Room room) throws ClassNotFoundException;            // Add a room (CREATE)
    List<Room> getAllRooms() throws ClassNotFoundException;              // Retrieve all rooms (READ)
    Room getRoomById(int id);              // Retrieve room by ID
    boolean deleteRoom(int roomId);        // Delete a room (DELETE)
    boolean updateRoom(Room room);         // Update a room (UPDATE)
}
