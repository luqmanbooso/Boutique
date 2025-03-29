package com.room.model;

public class Room {
    private int id;
    private String roomName;
    private double price;
    private double size;
    private int capacity;
    private String bedType;
    private String services;

    // Constructor, getters and setters
    public Room() {}

    public Room(int id, String roomName, double price, double size, int capacity, String bedType, String services) {
        this.id = id;
        this.roomName = roomName;
        this.price = price;
        this.size = size;
        this.capacity = capacity;
        this.bedType = bedType;
        this.services = services;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getBedType() {
        return bedType;
    }

    public void setBedType(String bedType) {
        this.bedType = bedType;
    }

    public String getServices() {
        return services;
    }

    public void setServices(String services) {
        this.services = services;
    }
   
}





