package com.example.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.example.dao.BookingDAO;
import com.example.model.Booking;

public class BookingService {
    
    private BookingDAO bookingDAO;
    
    public BookingService() {
        this.bookingDAO = new BookingDAO();
    }
    
    public double calculateAmount(double distance) {
        // Base fare of Rs. 50
        double baseFare = 50.0;
        
        // Rs. 15 per kilometer
        double perKmRate = 15.0;
        
        // Calculate total amount
        return baseFare + (distance * perKmRate);
    }
    
    public int createBooking(int customerId, int pickupLocationId, int dropLocationId ) throws SQLException {
        // Get distance service to get the distance
        DistanceService distanceService = new DistanceService();
        double distance = distanceService.getDistance(pickupLocationId, dropLocationId);
        
        // Calculate the amount
        double amount = calculateAmount(distance);
        
        // Create a new booking
        Booking booking = new Booking();
        booking.setCustomerId(customerId);
        booking.setPickupLocationId(pickupLocationId);
        booking.setDropLocationId(dropLocationId);
        booking.setDistanceKm(distance);
        booking.setTotalAmount(amount);
        booking.setStatus("Pending"); // Set initial status to Pending
        
        // Save booking to database
        return bookingDAO.createBooking(booking);
    }
    
    public Booking getBookingById(int bookingId) throws SQLException {
        return bookingDAO.getBookingById(bookingId);
    }
    
    public List<Booking> getBookingsByCustomerId(int customerId) throws SQLException {
        return bookingDAO.getBookingsByCustomerId(customerId);
    }
   
    public List<Booking> getPendingBookings() throws SQLException {
        return bookingDAO.getPendingBookings();
    }
    
    public boolean updateBookingStatus(int bookingId, String status) throws SQLException {
        return bookingDAO.updateBookingStatus(bookingId, status);
    }
}