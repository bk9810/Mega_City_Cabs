package com.example.model;

import java.sql.Timestamp;

public class Booking {
    private int id;
    private int customerId;
    private int pickupLocationId;
    private int dropLocationId;
    private double distanceKm;
    private double totalAmount;
    private Timestamp bookingDate;
    private String status;
    private int driverId;
    
    public Booking() {
    }
    
    public Booking(int id, int customerId, int pickupLocationId, int dropLocationId, 
                  double distanceKm, double totalAmount, Timestamp bookingDate, String status, int driverId) {
        this.id = id;
        this.customerId = customerId;
        this.pickupLocationId = pickupLocationId;
        this.dropLocationId = dropLocationId;
        this.distanceKm = distanceKm;
        this.totalAmount = totalAmount;
        this.bookingDate = bookingDate;
        this.status = status;
        this.driverId = driverId;
    }
    
    public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	// Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    public int getPickupLocationId() {
        return pickupLocationId;
    }
    
    public void setPickupLocationId(int pickupLocationId) {
        this.pickupLocationId = pickupLocationId;
    }
    
    public int getDropLocationId() {
        return dropLocationId;
    }
    
    public void setDropLocationId(int dropLocationId) {
        this.dropLocationId = dropLocationId;
    }
    
    public double getDistanceKm() {
        return distanceKm;
    }
    
    public void setDistanceKm(double distanceKm) {
        this.distanceKm = distanceKm;
    }
    
    public double getTotalAmount() {
        return totalAmount;
    }
    
    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public Timestamp getBookingDate() {
        return bookingDate;
    }
    
    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}