package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Location;

public class LocationDAO {
	
	public int addLocation(Location location) throws SQLException {
        String sql = "INSERT INTO locations (location_name) VALUES (?)";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, location.getLocationName());
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating location failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating location failed, no ID obtained.");
                }
            }
        }
    }
    
    public Location getLocationById(int id) throws SQLException {
        String sql = "SELECT * FROM locations WHERE id = ?";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Location location = new Location();
                    location.setId(rs.getInt("id"));
                    location.setLocationName(rs.getString("location_name"));
                    return location;
                }
            }
        }
        return null;
    }
    
    public Location getLocationByName(String name) throws SQLException {
        String sql = "SELECT * FROM locations WHERE location_name = ?";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, name);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Location location = new Location();
                    location.setId(rs.getInt("id"));
                    location.setLocationName(rs.getString("location_name"));
                    return location;
                }
            }
        }
        return null;
    }
    
    public List<Location> getAllLocations() throws SQLException {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations ORDER BY location_name";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Location location = new Location();
                location.setId(rs.getInt("id"));
                location.setLocationName(rs.getString("location_name"));
                locations.add(location);
            }
        }
        
        return locations;
    }

}
