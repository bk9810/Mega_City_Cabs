package com.example.model;

public class Location {
    
    private int id;
    private String locationName;
    
    public Location() {}
    
    public Location(int id, String locationName) {
        this.id = id;
        this.locationName = locationName;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getLocationName() {
        return locationName;
    }
    
    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }
    
    @Override
    public String toString() {
        return "Location [id=" + id + ", locationName=" + locationName + "]";
    }
}