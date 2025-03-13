package com.example.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class PasswordHasher {
	 public static String hash(String password) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] hashedBytes = md.digest(password.getBytes());
	            return Base64.getEncoder().encodeToString(hashedBytes);
	        } catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException("Password hashing failed", e);
	        }
	    }

	    public static boolean verify(String inputPassword, String storedHash) {
	        String hashedInput = hash(inputPassword);
	        return hashedInput.equals(storedHash);
	    }

}
