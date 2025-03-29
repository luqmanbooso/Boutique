package com.room.service;

import com.room.model.*; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.hotel.util.DatabaseConnection;

public class RoomServiceImpl implements RoomService {

    // Add a room (CREATE)
    @Override
    public boolean addRoom(Room room) throws ClassNotFoundException {
        String query = "INSERT INTO rooms (roomName, price, size, capacity, bedType, services) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, room.getRoomName());
            ps.setDouble(2, room.getPrice());
            ps.setDouble(3, room.getSize());
            ps.setInt(4, room.getCapacity());
            ps.setString(5, room.getBedType());
            ps.setString(6, room.getServices());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve all rooms (READ)
    @Override
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String query = "SELECT * FROM rooms";

        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setRoomName(rs.getString("roomName"));
                room.setPrice(rs.getDouble("price"));
                room.setSize(rs.getDouble("size"));
                room.setCapacity(rs.getInt("capacity"));
                room.setBedType(rs.getString("bedType"));
                room.setServices(rs.getString("services"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving rooms from the database.");
            e.printStackTrace();
        } catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        return rooms;
    }

    // Retrieve room by ID (For editing)
    @Override
    public Room getRoomById(int id) {
        Room room = null;
        String query = "SELECT * FROM rooms WHERE id=?";

        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                room = new Room();
                room.setId(rs.getInt("id"));
                room.setRoomName(rs.getString("roomName"));
                room.setPrice(rs.getDouble("price"));
                room.setSize(rs.getDouble("size"));
                room.setCapacity(rs.getInt("capacity"));
                room.setBedType(rs.getString("bedType"));
                room.setServices(rs.getString("services"));
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return room;
    }

    // Delete a room (DELETE)
    @Override
    public boolean deleteRoom(int roomId) {
        String query = "DELETE FROM rooms WHERE id=?";

        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, roomId);

            return ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update a room (UPDATE)
    @Override
    public boolean updateRoom(Room room) {
        String query = "UPDATE rooms SET roomName=?, price=?, size=?, capacity=?, bedType=?, services=? WHERE id=?";

        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, room.getRoomName());
            ps.setDouble(2, room.getPrice());
            ps.setDouble(3, room.getSize());
            ps.setInt(4, room.getCapacity());
            ps.setString(5, room.getBedType());
            ps.setString(6, room.getServices());
            ps.setInt(7, room.getId());

            return ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
