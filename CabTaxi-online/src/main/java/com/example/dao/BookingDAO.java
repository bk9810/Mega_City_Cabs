package com.example.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.sql.Timestamp;
	import java.util.ArrayList;
	import java.util.List;

	import com.example.model.Booking;

	public class BookingDAO {
	    
	    public int createBooking(Booking booking) throws SQLException {
	        String sql = "INSERT INTO bookings (customer_id, pickup_location_id, drop_location_id, " +
	                     "distance_km, total_amount, booking_date) VALUES (?, ?, ?, ?, ?, ?)";
	        
	        try (Connection conn = DBConnectionFactory.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
	            
	            stmt.setInt(1, booking.getCustomerId());
	            stmt.setInt(2, booking.getPickupLocationId());
	            stmt.setInt(3, booking.getDropLocationId());
	            stmt.setDouble(4, booking.getDistanceKm());
	            stmt.setDouble(5, booking.getTotalAmount());
	            
	            // If booking date is provided, use it; otherwise, use current timestamp
	            if (booking.getBookingDate() != null) {
	                stmt.setTimestamp(6, booking.getBookingDate());
	            } else {
	                stmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
	            }
	            
	            int affectedRows = stmt.executeUpdate();
	            
	            if (affectedRows == 0) {
	                throw new SQLException("Creating booking failed, no rows affected.");
	            }
	            
	            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
	                if (generatedKeys.next()) {
	                    return generatedKeys.getInt(1);
	                } else {
	                    throw new SQLException("Creating booking failed, no ID obtained.");
	                }
	            }
	        }
	    }
	    
	    public Booking getBookingById(int id) throws SQLException {
	        String sql = "SELECT * FROM bookings WHERE id = ?";
	        
	        try (Connection conn = DBConnectionFactory.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            
	            stmt.setInt(1, id);
	            
	            try (ResultSet rs = stmt.executeQuery()) {
	                if (rs.next()) {
	                    return mapResultSetToBooking(rs);
	                }
	            }
	        }
	        
	        return null;
	    }
	    
	    public List<Booking> getBookingsByCustomerId(int customerId) throws SQLException {
	        List<Booking> bookings = new ArrayList<>();
	        String sql = "SELECT * FROM bookings WHERE customer_id = ? ORDER BY booking_date DESC";
	        
	        try (Connection conn = DBConnectionFactory.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            
	            stmt.setInt(1, customerId);
	            
	            try (ResultSet rs = stmt.executeQuery()) {
	                while (rs.next()) {
	                    bookings.add(mapResultSetToBooking(rs));
	                }
	            }
	        }
	        
	        return bookings;
	    }
	    
	    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
	        Booking booking = new Booking();
	        booking.setId(rs.getInt("id"));
	        booking.setCustomerId(rs.getInt("customer_id"));
	        booking.setPickupLocationId(rs.getInt("pickup_location_id"));
	        booking.setDropLocationId(rs.getInt("drop_location_id"));
	        booking.setDistanceKm(rs.getDouble("distance_km"));
	        booking.setTotalAmount(rs.getDouble("total_amount"));
	        booking.setBookingDate(rs.getTimestamp("booking_date"));
	        return booking;
	    }
	
}
