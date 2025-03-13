package com.example.model;

public class Customer {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String password;
	private String address;
	private String dob;
	
	
	
	
	
	public Customer(int id,String name, String email, String phone, String password, String address, String dob) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password  = password;
		this.address = address;
		this.dob = dob;
	}





	public Customer() {
		// TODO Auto-generated constructor stub
	}





	public String getDob() {
		return dob;
	}





	public void setDob(String dob) {
		this.dob = dob;
	}





	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getPhone() {
		return phone;
	}





	public void setPhone(String phone) {
		this.phone = phone;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	public String getAddress() {
		return address;
	}





	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
