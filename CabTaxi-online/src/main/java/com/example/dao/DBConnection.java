package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/customer";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "Bhanuka98@#10";
	
	private static DBConnection instance;
	private Connection connection;
	
	private DBConnection() {
		try {
			
			System.out.println("Driver is loading");
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("MySQL driver loaded Successfully!");
			
			System.out.println("Connecting to database: "+DB_URL);
			this.connection = DriverManager.getConnection(DB_URL, DB_USER,DB_PASSWORD);
			
		}catch(ClassNotFoundException | SQLException e){
			
			e.printStackTrace();
			
		}
	}
	public static DBConnection getInstance() {
		if(instance == null) {
			synchronized(DBConnection.class) {
				if(instance == null) {
					instance = new DBConnection();
				}
			}
		}
		return instance;
	}
	
	public Connection getConnection() {
		try {
			if (connection == null || connection.isClosed()) {
				System.out.println("Reconnecting to the database...");
				this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			}
		}catch (SQLException e) {
			System.err.println("Failed to reconnect to the database:" + e.getMessage());
			e.printStackTrace();
		}
		return connection;
	} 

}
