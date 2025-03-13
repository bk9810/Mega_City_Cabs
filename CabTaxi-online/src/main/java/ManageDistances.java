

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
 * Servlet implementation class ManageDistances
 */
@WebServlet("/admin/manageDistances")
public class ManageDistances extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LocationService locationService;
    private DistanceService distanceService;
    
   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageDistances() {
        super();
        this.locationService = new LocationService();
        this.distanceService = new DistanceService();
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
	            request.getRequestDispatcher("/reg/manageDistances.jsp").forward(request, response);
	        } catch (SQLException e) {
	            request.setAttribute("error", "Failed to retrieve locations: " + e.getMessage());
	            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  try {
	            int fromLocationId = Integer.parseInt(request.getParameter("fromLocation"));
	            int toLocationId = Integer.parseInt(request.getParameter("toLocation"));
	            double distanceKm = Double.parseDouble(request.getParameter("distance"));
	            
	            if (fromLocationId == toLocationId) {
	                request.setAttribute("error", "From and To locations cannot be the same.");
	            } else if (distanceKm <= 0) {
	                request.setAttribute("error", "Distance must be greater than zero.");
	            } else {
	                distanceService.addOrUpdateDistance(fromLocationId, toLocationId, distanceKm);
	                request.setAttribute("message", "Distance information saved successfully!");
	            }
	            
	            // Refresh the locations list
	            List<Location> locations = locationService.getAllLocations();
	            request.setAttribute("locations", locations);
	            
	            request.getRequestDispatcher("/reg/manageDistances.jsp").forward(request, response);
	        } catch (NumberFormatException e) {
	            request.setAttribute("error", "Invalid input. Please check your values.");
	            doGet(request, response);
	        } catch (SQLException e) {
	            request.setAttribute("error", "Operation failed: " + e.getMessage());
	            request.getRequestDispatcher("/reg/error.jsp").forward(request, response);
	        }
	}

}
