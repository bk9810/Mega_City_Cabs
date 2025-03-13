package com.example.service;

import java.util.List;

import com.example.dao.vehicleDAO;
import com.example.model.Vehicle;

public class vehicleService {

	private static vehicleService instance;
	private vehicleDAO vehicledao;;
	
	private vehicleService() {
		this.vehicledao = new vehicleDAO();
	}
	
	public static vehicleService getInstance() {
		if(instance == null) {
			synchronized (quesService.class) {
				if(instance == null) {
					instance = new vehicleService();
				}
			}
		}
		return instance;
	}
	
	public boolean saveVehicle(Vehicle vehicle) {
		return vehicledao.addVehicle(vehicle);
	}
	
	public List<Vehicle> getvehicles(){
		return vehicledao.getAllVehicles();
	}
	
	
}
