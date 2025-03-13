package com.example.model;

public class Vehicle {
	
	private int vehicle_id;
	private String registration_number;
	private String plate_number;
	private String registration_date;
	private String cab_type;
	private int seating_capacity;
	private String fuel_type;
	private int manufacturing_year;
	private int driver_id;
	
	public Vehicle(int vehicle_id, String registration_number, String plate_number, String registration_date,  String cab_type, int seating_capacity, String fuel_type, int manufacturing_year, int driver_id) {
		this.vehicle_id = vehicle_id;
		this.registration_number = registration_number;
		this.plate_number = plate_number;
		this.registration_date = registration_date;
		this.cab_type = cab_type;
		this.seating_capacity = seating_capacity;
		this.fuel_type = fuel_type;
		this.manufacturing_year = manufacturing_year;
		this.driver_id = driver_id;
	}

	
	public Vehicle() {
		// TODO Auto-generated constructor stub
	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	public String getRegistration_number() {
		return registration_number;
	}

	public void setRegistration_number(String registration_number) {
		this.registration_number = registration_number;
	}

	public String getPlate_number() {
		return plate_number;
	}

	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}

	public String getCab_type() {
		return cab_type;
	}

	public void setCab_type(String cab_type) {
		this.cab_type = cab_type;
	}

	public int getSeating_capacity() {
		return seating_capacity;
	}

	public void setSeating_capacity(int seating_capacity) {
		this.seating_capacity = seating_capacity;
	}

	public String getFuel_type() {
		return fuel_type;
	}

	public void setFuel_type(String fuel_type) {
		this.fuel_type = fuel_type;
	}

	public int getManufacturing_year() {
		return manufacturing_year;
	}

	public void setManufacturing_year(int manufacturing_year) {
		this.manufacturing_year = manufacturing_year;
	}

	public int getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}


	public Vehicle getInstance() {
		// TODO Auto-generated method stub
		return null;
	}


	public boolean saveVehicle(Vehicle vehicle) {
		// TODO Auto-generated method stub
		return false;
	}
	

}
