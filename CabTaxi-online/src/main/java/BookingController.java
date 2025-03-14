
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Booking;
import com.example.model.Customer;
import com.example.model.Driver;
import com.example.model.Location;
import com.example.service.BookingService;
import com.example.service.DistanceService;
import com.example.service.LocationService;

@WebServlet("/reg/booking")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LocationService locationService;
    private DistanceService distanceService;
    private BookingService bookingService;
       
    public BookingController() {
        super();
        this.locationService = new LocationService();
        this.distanceService = new DistanceService();
        this.bookingService = new BookingService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Location> locations = locationService.getAllLocations();
            System.out.println("Loaded " + locations.size() + " locations");
            request.setAttribute("locations", locations);
            
            // Check if there is a calculation result to display
            HttpSession session = request.getSession();
            if (session.getAttribute("calculatedDistance") != null) {
                request.setAttribute("calculatedDistance", session.getAttribute("calculatedDistance"));
                request.setAttribute("calculatedAmount", session.getAttribute("calculatedAmount"));
                request.setAttribute("fromLocationId", session.getAttribute("fromLocationId"));
                request.setAttribute("toLocationId", session.getAttribute("toLocationId"));
                
                // Clear session attributes after retrieving them
                session.removeAttribute("calculatedDistance");
                session.removeAttribute("calculatedAmount");
                session.removeAttribute("fromLocationId");
                session.removeAttribute("toLocationId");
            }
            
            // If customer ID is in session, get their bookings
            Integer customerId = (Integer) session.getAttribute("customerId");
            if (customerId == null && session.getAttribute("customer") != null) {
                Customer customer = (Customer) session.getAttribute("customer");
                customerId = customer.getId();
            }
            
            if (customerId != null) {
                List<Booking> customerBookings = bookingService.getBookingsByCustomerId(customerId);
                request.setAttribute("customerBookings", customerBookings);
            }
            
            Integer driverId = (Integer) session.getAttribute("driverId");
            if (driverId == null && session.getAttribute("driver") != null) {
                Driver driver = (Driver) session.getAttribute("customer");
                driverId = driver.getId();
            }
            
            if (driverId != null) {
                List<Booking> customerBookings = bookingService.getBookingsByCustomerId(driverId);
                request.setAttribute("customerBookings", customerBookings);
            }
            
            request.getRequestDispatcher("/reg/booking.jsp").forward(request, response);
        } catch (SQLException e) {
            System.err.println("Error loading locations: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve locations: " + e.getMessage());
            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            int pickupLocationId = Integer.parseInt(request.getParameter("pickupLocation"));
            int dropLocationId = Integer.parseInt(request.getParameter("dropLocation"));
            
            if (pickupLocationId == dropLocationId) {
                request.setAttribute("error", "Pickup and Drop locations cannot be the same.");
                doGet(request, response);
                return;
            }
            
            double distance = distanceService.getDistance(pickupLocationId, dropLocationId);
            double amount = bookingService.calculateAmount(distance);
            
            if ("calculate".equals(action)) {
                HttpSession session = request.getSession();
                session.setAttribute("calculatedDistance", distance);
                session.setAttribute("calculatedAmount", amount);
                session.setAttribute("fromLocationId", pickupLocationId);
                session.setAttribute("toLocationId", dropLocationId);
                
                response.sendRedirect(request.getContextPath() + "/reg/booking");
                return;
            } else if ("book".equals(action)) {
                HttpSession session = request.getSession();
                Integer customerId = (Integer) session.getAttribute("customerId");
                
                if (customerId == null) {
                    Customer customer = (Customer) session.getAttribute("customer");
                    if (customer != null) {
                        customerId = customer.getId(); 
                        session.setAttribute("customerId", customerId);
                    } else {
                        request.setAttribute("error", "Please login to make a booking.");
                        doGet(request, response);
                        return;
                    }
                }
                
                // Create booking with initial status as "Pending"
             // Create booking with initial status as "Pending"
                int bookingId = bookingService.createBooking(customerId, pickupLocationId, dropLocationId);
                Booking booking = bookingService.getBookingById(bookingId);
                System.out.println("Created booking #" + bookingId + " with status: " + booking.getStatus());
                
                // Redirect to booking confirmation page
                request.setAttribute("booking", booking);
                request.setAttribute("pickupLocation", locationService.getLocationById(pickupLocationId).getLocationName());
                request.setAttribute("dropLocation", locationService.getLocationById(dropLocationId).getLocationName());
                request.getRequestDispatcher("/reg/bookingConfirmationjsp.jsp").forward(request, response);
                return;
            }
            	
            
                
            request.setAttribute("error", "Invalid action specified.");
            doGet(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input. Please check your values.");
            doGet(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Operation failed: " + e.getMessage());
            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
        }
    }
}