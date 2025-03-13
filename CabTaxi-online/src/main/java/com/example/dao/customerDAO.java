package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Customer;

public class customerDAO {
	
	public static boolean addCustomer(Customer customer){
		String query = "INSERT INTO register(name, email, phone, password, address, dob) VALUES (?,?,?,?,?,?)";
		
		try {
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, customer.getName());
			statement.setString(2, customer.getEmail());
			statement.setString(3, customer.getPhone());
			statement.setString(4, customer.getPassword());
			statement.setString(5, customer.getAddress());
			statement.setString(6, customer.getDob());
			
			int rowsInserted = statement.executeUpdate();
		    return rowsInserted > 0;		
		 } catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Customer getCustomer(String email, String password) {
		
		String query = "SELECT customer_id, name, email, phone, address, password FROM register WHERE email=? AND password=?";
		
		try (Connection connection = DBConnectionFactory.getConnection();
				PreparedStatement statement = connection.prepareStatement(query)){
			
			statement.setString(1, email);
			statement.setString(2, password);
			
			 ResultSet rs = statement.executeQuery();
		        if (rs.next()) {
		            Customer customer = new Customer();
		            customer.setId(rs.getInt("customer_id"));
		            customer.setName(rs.getString("name"));
		            customer.setEmail(rs.getString("email"));
		            customer.setPhone(rs.getString("phone"));
		            customer.setAddress(rs.getString("address"));
		            return customer;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return null;
		
	}
	
	 public Customer getCustomerById(int customerId) {
	        Customer customer = null;
	        try (Connection conn = DBConnectionFactory.getConnection()) {
	            String sql = "SELECT * FROM register WHERE customer_id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, customerId);
	            ResultSet rs = stmt.executeQuery();
	            
	            if (rs.next()) {
	                customer = new Customer();
	                customer.setId(rs.getInt("customer_id"));
	                customer.setName(rs.getString("name"));
	                customer.setEmail(rs.getString("email"));
	                customer.setPhone(rs.getString("phone"));
	                customer.setAddress(rs.getString("address"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return customer;
	    }
	 
	 public boolean update(Customer customer) {
		    boolean isUpdated = false;
		    
		    try {
		        Connection connection = DBConnectionFactory.getConnection();
		        String sql = "UPDATE register SET name = ?, email = ?, phone = ?, address = ?, password = ? WHERE customer_id = ?";
		        
		        // Debugging Statements
		        System.out.println("Executing Update SQL:");
		        System.out.println("Customer ID: " + customer.getId());
		        System.out.println("Name: " + customer.getName());
		        System.out.println("Email: " + customer.getEmail());
		        System.out.println("Phone: " + customer.getPhone());
		        System.out.println("Address: " + customer.getAddress());

		        PreparedStatement preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, customer.getName());
		        preparedStatement.setString(2, customer.getEmail());
		        preparedStatement.setString(3, customer.getPhone());
		        preparedStatement.setString(4, customer.getAddress());
		        preparedStatement.setString(5, customer.getPassword());
		        preparedStatement.setInt(6, customer.getId()); // Ensure this is set correctly

		        int rowsAffected = preparedStatement.executeUpdate();
		        
		        // Check if the update was successful
		        if (rowsAffected > 0) {
		            isUpdated = true;
		            System.out.println("Update successful for Customer ID: " + customer.getId());
		        } else {
		            System.out.println("Update failed. No rows affected for Customer ID: " + customer.getId());
		        }

		        connection.close();
		    } catch (Exception e) {
		    	System.out.println("Exception during update:");
		        e.printStackTrace(); // Print full error details
		    }

		    return isUpdated;
		}
	 
	 public static List<Customer> getAllCustomers() {
			List<Customer> customerList = new ArrayList<>();
			String query = "SELECT * FROM register";

			try (Connection connection = DBConnectionFactory.getConnection();
				 PreparedStatement statement = connection.prepareStatement(query);
				 ResultSet rs = statement.executeQuery()) {
				
				while (rs.next()) {
					Customer customer = new Customer();
					customer.setId(rs.getInt("customer_id"));
					customer.setName(rs.getString("name"));
					customer.setEmail(rs.getString("email"));
					customer.setPhone(rs.getString("phone"));
					customer.setAddress(rs.getString("address"));
					customer.setDob(rs.getString("dob"));
					customerList.add(customer);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return customerList;
		}
	 public static boolean deleteCustomer(int customerId) {
		 String query = "DELETE FROM register WHERE customer_id = ?";
			try (Connection connection = DBConnectionFactory.getConnection();
				 PreparedStatement statement = connection.prepareStatement(query)) {
				
				statement.setInt(1, customerId);
				int rowsAffected = statement.executeUpdate();
				return rowsAffected > 0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
}
