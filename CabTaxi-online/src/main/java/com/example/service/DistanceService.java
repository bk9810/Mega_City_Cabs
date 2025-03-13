package com.example.service;

import java.sql.SQLException;

import com.example.dao.DistanceDAO;
import com.example.model.Distance;

public class DistanceService {
	
	 private DistanceDAO distanceDAO;
	    public DistanceService() {
	        this.distanceDAO = new DistanceDAO();
	    }
	    public void addOrUpdateDistance(int fromLocationId, int toLocationId, double distanceKm) throws SQLException {
	        try {
	            distanceDAO.getDistance(fromLocationId, toLocationId);
	            Distance distance = new Distance();
	            distance.setFromLocationId(fromLocationId);
	            distance.setToLocationId(toLocationId);
	            distance.setDistanceKm(distanceKm);
	            distanceDAO.updateDistance(distance);
	        } catch (SQLException e) {
	            Distance distance = new Distance();
	            distance.setFromLocationId(fromLocationId);
	            distance.setToLocationId(toLocationId);
	            distance.setDistanceKm(distanceKm);
	            distanceDAO.addDistance(distance);
	            
	            Distance reverseDistance = new Distance();
	            reverseDistance.setFromLocationId(toLocationId);
	            reverseDistance.setToLocationId(fromLocationId);
	            reverseDistance.setDistanceKm(distanceKm);
	            try {
	                distanceDAO.addDistance(reverseDistance);
	            } catch (SQLException ex) {
	               
	            }
	        }
	    }
	    public double getDistance(int fromLocationId, int toLocationId) throws SQLException {
	        try {
	            return distanceDAO.getDistance(fromLocationId, toLocationId);
	        } catch (SQLException e) {
	            throw new SQLException("No distance information found between these locations. Please add distance information first.");
	        }
	    }

}
