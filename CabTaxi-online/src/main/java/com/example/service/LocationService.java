package com.example.service;

import java.sql.SQLException;
import java.util.List;

import com.example.dao.LocationDAO;
import com.example.model.Location;

public class LocationService {
	
private LocationDAO locationDAO;
    
    public LocationService() {
        this.locationDAO = new LocationDAO();
    }
    
    public int addLocation(String locationName) throws SQLException {
        Location location = new Location();
        location.setLocationName(locationName);
        return locationDAO.addLocation(location);
    }
    
    public Location getLocationById(int id) throws SQLException {
        return locationDAO.getLocationById(id);
    }
    
    public Location getLocationByName(String name) throws SQLException {
        return locationDAO.getLocationByName(name);
    }
    
    public List<Location> getAllLocations() throws SQLException {
        return locationDAO.getAllLocations();
    }
    
    public Location getOrCreateLocation(String locationName) throws SQLException {
        Location location = locationDAO.getLocationByName(locationName);
        if (location == null) {
            int id = addLocation(locationName);
            location = new Location(id, locationName);
        }
        return location;
    }

}
