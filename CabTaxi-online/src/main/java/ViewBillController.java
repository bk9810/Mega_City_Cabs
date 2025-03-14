

import java.io.IOException;
import java.sql.SQLException;

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
import com.example.service.CustService;

import com.example.service.LocationService;

@WebServlet("/reg/viewBill")
public class ViewBillController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    private LocationService locationService;
    private CustService customerService;
       
    public ViewBillController() {
        super();
        this.bookingService = new BookingService();
        this.locationService = new LocationService();
        this.customerService = new CustService();
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
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            
            // Get booking details
            Booking booking = bookingService.getBookingById(bookingId);
            
            // Check if booking exists and belongs to the current customer
            if (booking == null || booking.getCustomerId() != customerId) {
                request.setAttribute("error", "Booking not found or you don't have permission to view it.");
                request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
                return;
            }
            
            // Check if booking is confirmed
            if (!"Confirmed".equals(booking.getStatus())) {
                request.setAttribute("error", "This booking has not been confirmed yet. Bill is only available for confirmed bookings.");
                request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
                return;
            }
            
            // Get location names
            Location pickupLocation = locationService.getLocationById(booking.getPickupLocationId());
            Location dropLocation = locationService.getLocationById(booking.getDropLocationId());
            
            // Get customer details
            Customer customer = customerService.getCustomerById(customerId);
            
            // Set attributes for the view
            request.setAttribute("booking", booking);
            request.setAttribute("pickupLocation", pickupLocation.getLocationName());
            request.setAttribute("dropLocation", dropLocation.getLocationName());
            request.setAttribute("customer", customer);
            
            request.getRequestDispatcher("/reg/viewBill.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid booking ID.");
            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
        } catch (SQLException e) {
            System.err.println("Error retrieving booking: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve booking: " + e.getMessage());
            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
        }
    }
}