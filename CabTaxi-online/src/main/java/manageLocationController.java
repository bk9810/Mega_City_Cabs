

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Location;
import com.example.service.DistanceService;
import com.example.service.LocationService;

/**
 * Servlet implementation class manageLocationController
 */
@WebServlet("/admin/location")
public class manageLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LocationService locationService;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageLocationController() {
        super();
        this.locationService = new LocationService();
       
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
	            List<Location> locations = locationService.getAllLocations();
	            request.setAttribute("locations", locations);
	            request.getRequestDispatcher("/admin/manageLocation.jsp").forward(request, response);
	        } catch (SQLException e) {
	            request.setAttribute("error", "Failed to retrieve locations: " + e.getMessage());
	            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
        String locationName = request.getParameter("locationName");
        
        try {
            if ("add".equals(action) && locationName != null && !locationName.trim().isEmpty()) {
                locationService.addLocation(locationName.trim());
                request.setAttribute("message", "Location added successfully!");
            } else {
                request.setAttribute("error", "Invalid location name or action.");
            }
            
            // Refresh the locations list
            List<Location> locations = locationService.getAllLocations();
            request.setAttribute("locations", locations);
            
            request.getRequestDispatcher("/admin/manageLocation.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Operation failed: " + e.getMessage());
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
        }
	}

}
