package com.example.model;

public class Distance {
	
	private int id;
    private int fromLocationId;
    private int toLocationId;
    private double distanceKm;
    
    public Distance() {}
    
    public Distance(int id, int fromLocationId, int toLocationId, double distanceKm) {
        this.id = id;
        this.fromLocationId = fromLocationId;
        this.toLocationId = toLocationId;
        this.distanceKm = distanceKm;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFromLocationId() {
		return fromLocationId;
	}

	public void setFromLocationId(int fromLocationId) {
		this.fromLocationId = fromLocationId;
	}

	public int getToLocationId() {
		return toLocationId;
	}

	public void setToLocationId(int toLocationId) {
		this.toLocationId = toLocationId;
	}

	public double getDistanceKm() {
		return distanceKm;
	}

	public void setDistanceKm(double distanceKm) {
		this.distanceKm = distanceKm;
	}
    
	  @Override
	    public String toString() {
	        return "Distance [id=" + id + ", fromLocationId=" + fromLocationId + 
	               ", toLocationId=" + toLocationId + ", distanceKm=" + distanceKm + "]";
	    }

}
