package com.hotel.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	// Static variable to hold a single instance of the Connection
	private static Connection connection;

	// Singleton instance of DatabaseConnection
	private static DatabaseConnection dBConnection;

	// Private constructor to prevent direct instantiation (Singleton pattern)
	private DatabaseConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_systemdb", "root", "1234");
	}

	// Static method to get the singleton instance of DatabaseConnection
	public static DatabaseConnection getInstance() throws ClassNotFoundException, SQLException {
		if (dBConnection == null) {
			dBConnection = new DatabaseConnection();
		} else if (DatabaseConnection.connection.isClosed()) {
			
			DatabaseConnection.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_systemdb",
					"root", "1234");
		}
		return dBConnection;
	}

	// Method to get the active connection
	public Connection getConnection() {
		if (connection == null) {
			throw new IllegalStateException("Connection not initialized.");
		}

		return connection;
	}

}
