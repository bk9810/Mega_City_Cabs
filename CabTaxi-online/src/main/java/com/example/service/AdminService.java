package com.example.service;

import com.example.dao.AdminDAO;
import com.example.model.Admin;

public class AdminService {
	private AdminDAO adminDAO = new AdminDAO();

    public boolean authenticateAdmin(String username, String password) {
        Admin admin = adminDAO.getAdminByUsername(username);
        return admin != null && admin.getPassword().equals(password);
    }

}
