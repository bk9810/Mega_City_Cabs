package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Vehicle;

public class vehicleDAO {

	 public boolean addVehicle(Vehicle vehicle) {
	        String sql = "INSERT INTO vehicles (registration_number, plate_number, registration_date, cab_type, seating_capacity, fuel_type, manufacturing_year, driver_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        
	        try (Connection conn = DBConnectionFactory.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            
	            stmt.setString(1, vehicle.getRegistration_number());
	            stmt.setString(2, vehicle.getPlate_number());
	            stmt.setString(3, vehicle.getRegistration_date());
	            stmt.setString(4, vehicle.getCab_type());
	            stmt.setInt(5, vehicle.getSeating_capacity());
	            stmt.setString(6, vehicle.getFuel_type());
	            stmt.setInt(7, vehicle.getManufacturing_year());
	            stmt.setInt(8, vehicle.getDriver_id());
	            
	            return stmt.executeUpdate() > 0;
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    public List<Vehicle> getAllVehicles() {
	        List<Vehicle> vehicles = new ArrayList<>();
	        String sql = "SELECT * FROM vehicles";
	        
	        try (Connection conn = DBConnectionFactory.getConnection();
	             Statement stmt = conn.createStatement();
	             ResultSet rs = stmt.executeQuery(sql)) {
	            
	            while (rs.next()) {
	                Vehicle vehicle = new Vehicle(
	                    rs.getInt("vehicle_id"),
	                    rs.getString("registration_number"),
	                    rs.getString("plate_number"),
	                    rs.getString("registration_date"),
	                    rs.getString("cab_type"),
	                    rs.getInt("seating_capacity"),
	                    rs.getString("fuel_type"),
	                    rs.getInt("manufacturing_year"),
	                    rs.getInt("driver_id")
	                );
	                vehicles.add(vehicle);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return vehicles;
	    }
	
}
