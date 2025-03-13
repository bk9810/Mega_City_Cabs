package com.example.service;

import java.sql.SQLException;
import java.util.List;

import com.example.dao.BookingDAO;
import com.example.model.Booking;

public class BookingService {
	
	  private BookingDAO bookingDAO;
	    private DistanceService distanceService;
	    private static final double PRICE_PER_KM = 100.0; 
	    
	    public BookingService() {
	        this.bookingDAO = new BookingDAO();
	        this.distanceService = new DistanceService();
	    }
	    
	    public int createBooking(int customerId, int pickupLocationId, int dropLocationId) throws SQLException {
	     
	        double distanceKm = distanceService.getDistance(pickupLocationId, dropLocationId);
	        
	        double totalAmount = calculateAmount(distanceKm);
	        
	        Booking booking = new Booking();
	        booking.setCustomerId(customerId);
	        booking.setPickupLocationId(pickupLocationId);
	        booking.setDropLocationId(dropLocationId);
	        booking.setDistanceKm(distanceKm);
	        booking.setTotalAmount(totalAmount);
	        
	        return bookingDAO.createBooking(booking);
	    }
	    
	    public double calculateAmount(double distanceKm) {
	        return distanceKm * PRICE_PER_KM;
	    }
	    
	    public Booking getBookingById(int id) throws SQLException {
	        return bookingDAO.getBookingById(id);
	    }
	    
	    public List<Booking> getBookingsByCustomerId(int customerId) throws SQLException {
	        return bookingDAO.getBookingsByCustomerId(customerId);
	    }

}
