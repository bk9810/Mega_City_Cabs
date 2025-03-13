package com.example.service;

import java.util.Map;

public class FareCalculator {
	
	
	 private static final Map<String, Double> RATE_MAP = Map.of(
		        "4", 100.0,
		        "8", 200.0,
		        "14", 400.0
		    );

		    public static double calculateFare(double distance, String vehicleType) 
		        throws Exception {
		        
		        if (!RATE_MAP.containsKey(vehicleType)) {
		            throw new Exception("Invalid vehicle type: " + vehicleType);
		        }
		        return distance * RATE_MAP.get(vehicleType);
		    }

}
