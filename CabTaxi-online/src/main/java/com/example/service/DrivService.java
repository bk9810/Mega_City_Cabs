package com.example.service;

import com.example.dao.driverDAO;
import com.example.model.Customer;
import com.example.model.Driver;

public class DrivService {
	
	private static DrivService instance;
	private driverDAO driverdao;
	
	public DrivService() {
		this.driverdao = new driverDAO();
	}
	
	public static DrivService getInstance() {
		if(instance == null) {
			synchronized (DrivService.class) {
				if(instance ==  null) {
					instance =new DrivService();
				}
			}
		}
		return instance;
	}
	
	public boolean registerDriver(Driver driver, int[] generatedId) {
		
		
		boolean isRegistered = driverDAO.addDriver(driver, generatedId);
		if(!isRegistered) {
			System.err.println("Failed Register");
		}else {
			int id = generatedId[0];
			System.out.println("Driver regster success" + id);
		}
		return isRegistered;
	}
	
	public boolean update(int driverId, String name, String email, String phone, String address, String password, String dob, String nic) {
	    // Additional Business Logic (if needed)
		  if (name == null || name.trim().isEmpty() || 
			        email == null || email.trim().isEmpty() || 
			        phone == null || phone.trim().isEmpty() || 
			        address == null || address.trim().isEmpty() || 
			        password == null || password.trim().isEmpty() ||
		  			dob == null || dob.trim().isEmpty() ||
		  			nic == null || nic.trim().isEmpty()){
			        return false;
			    }

	    Driver driver = new Driver();
	    driver.setId(driverId);
	    driver.setName(name);
	    driver.setEmail(email);
	    driver.setPhone(phone);
	    driver.setAddress(address);
	    driver.setPassword(password);
	    driver.setDob(dob);
	    driver.setNic(nic);
	    
	    return driverdao.update(driver);
	}
	
	public Driver getLogins(String email, String password) {
		return driverdao.getDriver(email, password);
	}
	
	public Driver getdriv(int driverId) {
		return driverdao.getDriverById(driverId);
	}
	
	

}
