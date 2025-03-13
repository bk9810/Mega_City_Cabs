package com.example.service;

import java.util.List;

import com.example.dao.customerDAO;
import com.example.model.Customer;


public class CustService {
	
	private static CustService instance;
	private customerDAO customerdao;
	
	
	
	
	
	public CustService() {
		this.customerdao = new customerDAO();
	}
	
	public static CustService getInstance() {
		if(instance == null) {
			synchronized (CustService.class) {
				if(instance == null) {
					instance = new CustService();
				}
			}
		}
		return instance;
	}
	
public boolean registerCustomer(Customer customer) {
		
		boolean isRegistered = customerDAO.addCustomer(customer);
		if(!isRegistered) {
			System.err.println("Failed Register");
		}
		return isRegistered;
	}


public Customer getDash(int customerId) {
	return customerdao.getCustomerById(customerId);
}




public boolean update(int customerId, String name, String email, String phone, String address, String password) {
    // Additional Business Logic (if needed)
	  if (name == null || name.trim().isEmpty() || 
		        email == null || email.trim().isEmpty() || 
		        phone == null || phone.trim().isEmpty() || 
		        address == null || address.trim().isEmpty() || 
		        password == null || password.trim().isEmpty()) {
		        return false;
		    }

    Customer customer = new Customer();
    customer.setId(customerId);
    customer.setName(name);
    customer.setEmail(email);
    customer.setPhone(phone);
    customer.setAddress(address);
    customer.setPassword(password);
    
    return customerdao.update(customer);
}

public Customer authenticateCustomer(String email, String password) {
    return customerdao.getCustomer(email, password);
}

public List<Customer> getAllCustomers() {
	return customerDAO.getAllCustomers();
}

// Delete a customer
public boolean deleteCustomer(int customerId) {
	return customerdao.deleteCustomer(customerId);
}


}



