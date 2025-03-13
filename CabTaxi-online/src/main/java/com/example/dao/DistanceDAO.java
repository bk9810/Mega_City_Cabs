package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.example.model.Distance;

public class DistanceDAO {
	
	public int addDistance(Distance distance) throws SQLException {
        String sql = "INSERT INTO distances (from_location_id, to_location_id, distance_km) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, distance.getFromLocationId());
            stmt.setInt(2, distance.getToLocationId());
            stmt.setDouble(3, distance.getDistanceKm());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating distance failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating distance failed, no ID obtained.");
                }
            }
        }
    }
    
    public double getDistance(int fromLocationId, int toLocationId) throws SQLException {
        String sql = "SELECT distance_km FROM distances WHERE from_location_id = ? AND to_location_id = ?";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, fromLocationId);
            stmt.setInt(2, toLocationId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("distance_km");
                } else {
                    // Try reverse order (distance from A to B = distance from B to A)
                	String reverseSql = "SELECT distance_km FROM distances WHERE from_location_id = ? AND to_location_id = ?";
                    try (PreparedStatement reverseStmt = conn.prepareStatement(reverseSql)) {
                        reverseStmt.setInt(1, toLocationId);
                        reverseStmt.setInt(2, fromLocationId);
                        
                        try (ResultSet reverseRs = reverseStmt.executeQuery()) {
                            if (reverseRs.next()) {
                                return reverseRs.getDouble("distance_km");
                            }
                        }
                    }
                }
            }
        }
        
        // If no distance is found in either direction
        throw new SQLException("No distance found between the specified locations.");
    }
    
    public boolean updateDistance(Distance distance) throws SQLException {
        String sql = "UPDATE distances SET distance_km = ? WHERE from_location_id = ? AND to_location_id = ?";
        
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setDouble(1, distance.getDistanceKm());
            stmt.setInt(2, distance.getFromLocationId());
            stmt.setInt(3, distance.getToLocationId());
            
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        }
    }

}
