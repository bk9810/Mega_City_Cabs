

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Booking;
import com.example.model.Customer;
import com.example.model.Location;
import com.example.service.BookingService;
import com.example.service.LocationService;

@WebServlet("/reg/viewBookings")
public class ViewBookingsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private LocationService locationService;
       
    public ViewBookingsController() {
        super();
        this.bookingService = new BookingService();
        this.locationService = new LocationService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");
        
        if (customerId == null && session.getAttribute("customer") != null) {
            Customer customer = (Customer) session.getAttribute("customer");
            customerId = customer.getId();
        }
        
        if (customerId == null) {
            // Redirect to login if not logged in
            response.sendRedirect(request.getContextPath() + "/reg/login.jsp");
            return;
        }
        
        try {
            // Get all bookings for this customer
            List<Booking> customerBookings = bookingService.getBookingsByCustomerId(customerId);
            request.setAttribute("customerBookings", customerBookings);
            
            // Get location names for all bookings
            Map<Integer, Map<String, String>> bookingLocations = new HashMap<>();
            
            for (Booking booking : customerBookings) {
                Map<String, String> locations = new HashMap<>();
                
                Location pickupLocation = locationService.getLocationById(booking.getPickupLocationId());
                Location dropLocation = locationService.getLocationById(booking.getDropLocationId());
                
                locations.put("pickup", pickupLocation.getLocationName());
                locations.put("drop", dropLocation.getLocationName());
                
                bookingLocations.put(booking.getId(), locations);
            }
            
            request.setAttribute("bookingLocations", bookingLocations);
            
            request.getRequestDispatcher("/reg/viewBookings.jsp").forward(request, response);
        } catch (SQLException e) {
            System.err.println("Error loading bookings: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve bookings: " + e.getMessage());
            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
        }
    }
}