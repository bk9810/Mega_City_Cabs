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
import com.example.model.Driver;
import com.example.model.Location;
import com.example.service.BookingService;
import com.example.service.LocationService;

@WebServlet("/dri/bookings")
public class DriverBookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private LocationService locationService;
    
    public DriverBookingController() {
        super();
        this.bookingService = new BookingService();
        this.locationService = new LocationService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Driver driver = (Driver) session.getAttribute("driver");
        
        if (driver == null) {
            response.sendRedirect(request.getContextPath() + "/dri/DriverLog.jsp");
            return;
        }
        
        try {
            // Get all pending bookings
            List<Booking> pendingBookings = bookingService.getPendingBookings();
            
            // Add debug message
            request.setAttribute("debugMessage", "Found " + pendingBookings.size() + " pending bookings");
            
            // Get location names for pending bookings
            Map<Integer, String> pickupLocations = new HashMap<>();
            Map<Integer, String> dropLocations = new HashMap<>();
            
            for (Booking booking : pendingBookings) {
                Location pickupLocation = locationService.getLocationById(booking.getPickupLocationId());
                Location dropLocation = locationService.getLocationById(booking.getDropLocationId());
                
                pickupLocations.put(booking.getId(), pickupLocation.getLocationName());
                dropLocations.put(booking.getId(), dropLocation.getLocationName());
            }
            
            request.setAttribute("pendingBookings", pendingBookings);
            request.setAttribute("pickupLocations", pickupLocations);
            request.setAttribute("dropLocations", dropLocations);
            
            request.getRequestDispatcher("/dri/driverBookings.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to retrieve pending bookings: " + e.getMessage());
            request.getRequestDispatcher("/dri/driverBookings.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("confirmBooking".equals(action)) {
            try {
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                HttpSession session = request.getSession();
                Driver driver = (Driver) session.getAttribute("driver");
                
                if (driver == null) {
                    response.sendRedirect(request.getContextPath() + "/dri/DriverLog.jsp");
                    return;
                }
                
                // Update booking status to confirmed and assign driver
                boolean updated = bookingService.updateBookingStatus(bookingId, "Confirmed");
                
                if (updated) {
                    request.getSession().setAttribute("successMessage", "Booking #" + bookingId + " confirmed successfully!");
                } else {
                    request.getSession().setAttribute("errorMessage", "Failed to confirm booking #" + bookingId);
                }
                
                response.sendRedirect(request.getContextPath() + "/dri/bookings");
            } catch (Exception e) {
                e.printStackTrace();
                request.getSession().setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/dri/bookings");
            }
        }
    }
}