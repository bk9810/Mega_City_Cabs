package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.model.Customer;
import com.example.model.Driver;

public class driverDAO {
	
	public static boolean addDriver(Driver driver, int[] generatedId) {
		String query = "INSERT INTO driver(name, email, phone, password, address, dob, nic) VALUES (?,?,?,?,?,?,?)";
		
		try {
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
			statement.setString(1, driver.getName());
			statement.setString(2, driver.getEmail());
			statement.setString(3, driver.getPhone());
			statement.setString(4, driver.getPassword());
			statement.setString(5, driver.getAddress());
			statement.setString(6, driver.getDob());
			statement.setString(7, driver.getNic());
			
			int rowsInserted = statement.executeUpdate();
			if(rowsInserted > 0) {
				ResultSet rs = statement.getGeneratedKeys();
				if(rs.next()) {
					generatedId[0] = rs.getInt(1);
					return true;
				}
;			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		generatedId[0] = -1;
		return false;
	}
	
	public Driver getDriver(String email, String password) {
		String query = "SELECT driver_id, name, email, phone, password, address, dob, nic  FROM driver WHERE email=? AND password=?";
		
		try
		{
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, email);
			statement.setString(2, password);
			
			
			ResultSet rs = statement.executeQuery();
				if(rs.next()) {
					Driver driver = new Driver();
	                driver.setId(rs.getInt("driver_id"));
	                driver.setName(rs.getString("name"));
	                driver.setEmail(rs.getString("email"));
	                driver.setPhone(rs.getString("phone"));
	                driver.setAddress(rs.getString("address"));
	                driver.setDob(rs.getString("dob"));
	                driver.setNic(rs.getString("nic"));
	                return driver;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	 public Driver getDriverById(int driverId) {
	        Driver driver = null;
	        try (Connection conn = DBConnectionFactory.getConnection()) {
	            String sql = "SELECT * FROM driver WHERE driver_id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, driverId);
	            ResultSet rs = stmt.executeQuery();
	            
	            if (rs.next()) {
	                driver = new Driver();
	                driver.setId(rs.getInt("driver_id"));
	                driver.setName(rs.getString("name"));
	                driver.setEmail(rs.getString("email"));
	                driver.setPhone(rs.getString("phone"));
	                driver.setAddress(rs.getString("address"));
	                driver.setDob(rs.getString("dob"));
	                driver.setNic(rs.getString("nic"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return driver;
	    }
	 
	 
	 public boolean update(Driver driver) {
		    boolean isUpdated = false;
		    
		    try {
		        Connection connection = DBConnectionFactory.getConnection();
		        String sql = "UPDATE driver SET name = ?, email = ?, phone = ?, address = ?, password = ?, dob, nic WHERE driver_id = ?";
		        
		        System.out.println("Executing Update SQL:");
		        System.out.println("Driver ID: " + driver.getId());
		        System.out.println("Name: " + driver.getName());
		        System.out.println("Email: " + driver.getEmail());
		        System.out.println("Phone: " + driver.getPhone());
		        System.out.println("Password: " + driver.getPassword());
		        System.out.println("Address: " + driver.getAddress());
		        System.out.println("DOB: " + driver.getDob());
		        System.out.println("NIC" + driver.getNic());

		        PreparedStatement preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, driver.getName());
		        preparedStatement.setString(2, driver.getEmail());
		        preparedStatement.setString(3, driver.getPhone());
		        preparedStatement.setString(4, driver.getAddress());
		        preparedStatement.setString(6, driver.getPassword());
		        preparedStatement.setString(7, driver.getDob());
		        preparedStatement.setString(8, driver.getNic());
		        preparedStatement.setInt(9, driver.getId()); // Ensure this is set correctly

		        int rowsAffected = preparedStatement.executeUpdate();
		        
		        // Check if the update was successful
		        if (rowsAffected > 0) {
		            isUpdated = true;
		            System.out.println("Update successful for Customer ID: " + driver.getId());
		        } else {
		            System.out.println("Update failed. No rows affected for Customer ID: " + driver.getId());
		        }

		        connection.close();
		    } catch (Exception e) {
		    	System.out.println("Exception during update:");
		        e.printStackTrace(); 
		    }

		    return isUpdated;
		}

	

}
