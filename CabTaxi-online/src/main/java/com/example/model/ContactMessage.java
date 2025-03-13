package com.example.model;

public class ContactMessage {
	
	private int id;
    private String name;
    private String email;
    private String message;
    private String timestamp;
    
    public ContactMessage() {
    }
    
    public ContactMessage(int id, String name, String email, String message, String timestamp) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.timestamp = timestamp;
    }

	public ContactMessage(String name2, String email2, String message2) {
		// TODO Auto-generated constructor stub
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
    

}
