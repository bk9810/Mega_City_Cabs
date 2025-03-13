package com.example.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;


    // Getters and Setters
public class Booking {
	 private int id;
	    private int customerId;
	    private int pickupLocationId;
	    private int dropLocationId;
	    private double distanceKm;
	    private double totalAmount;
	    private Timestamp bookingDate;
	    
	    public Booking() {}
	    
	    public Booking(int id, int customerId, int pickupLocationId, int dropLocationId, 
	                  double distanceKm, double totalAmount, Timestamp bookingDate) {
	        this.id = id;
	        this.customerId = customerId;
	        this.pickupLocationId = pickupLocationId;
	        this.dropLocationId = dropLocationId;
	        this.distanceKm = distanceKm;
	        this.totalAmount = totalAmount;
	        this.bookingDate = bookingDate;
	        
	    }

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
	    
		  @Override
		    public String toString() {
		        return "Booking [id=" + id + ", customerId=" + customerId + 
		               ", pickupLocationId=" + pickupLocationId + ", dropLocationId=" + dropLocationId + 
		               ", distanceKm=" + distanceKm + ", totalAmount=" + totalAmount + 
		               ", bookingDate=" + bookingDate + "]";
		    }
   
}


