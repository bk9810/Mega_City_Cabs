

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Vehicle;
import com.example.service.quesService;
import com.example.service.vehicleService;

/**
 * Servlet implementation class vehicleController
 */
@WebServlet("/dri/vehicle")
@MultipartConfig
public class vehicleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private vehicleService vehicleservice;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	public void init() throws ServletException{
		vehicleservice= vehicleService.getInstance();
	}
	
    public vehicleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			 String seatingCapacityStr = request.getParameter("seating_capacity");
            // Validate required fields before parsing
            String registrationNumber = request.getParameter("registration_number");
            String plateNumber = request.getParameter("plate_number");
            String registrationDate = request.getParameter("registration_date");
            String cabType = request.getParameter("cab_type");
            String seatingCapacitystr = request.getParameter("seating_capacity");
            String fuelType = request.getParameter("fuel_type");
            String manufacturingYearStr = request.getParameter("manufacturing_year");
            
           
            System.out.println("Seating Capacity(Raw): " + seatingCapacityStr );
            
            if (seatingCapacityStr == null || seatingCapacityStr.trim().isEmpty()) {
           	 request.setAttribute("message", "Seating capacity is required");
                request.getRequestDispatcher("/dri/Vehicale.jsp").forward(request, response);
                return;
           }
            
            int seatingCapacity = 0;
            int manufacturingYear = 0;
            int driverId = 1; // Hardcoded for now, should be fetched from session/login

           
                try {
                    seatingCapacity = Integer.parseInt(seatingCapacityStr.trim());
                } catch (NumberFormatException e) {
                	 request.setAttribute("message", "Invalid seating capacity");
                     request.getRequestDispatcher("/dri/Vehicale.jsp").forward(request, response);
                    return;
                }
            
            

            if (manufacturingYearStr != null && !manufacturingYearStr.trim().isEmpty()) {
                try {
                    manufacturingYear = Integer.parseInt(manufacturingYearStr);
                } catch (NumberFormatException e) {
                	 request.setAttribute("message", "Invalid manufacturing year");
                     request.getRequestDispatcher("/dri/Vehicale.jsp").forward(request, response);
                    return;
                }
            } else {
            	request.setAttribute("message", "Manufacturing year is required");
                request.getRequestDispatcher("/dri/Vehicale.jsp").forward(request, response);
                return;
            }

            // Create a new Vehicle object
            Vehicle vehicle = new Vehicle(0, registrationNumber, plateNumber, registrationDate, cabType, seatingCapacity, fuelType, manufacturingYear, driverId);

            // Save vehicle and handle response
            if (vehicleservice.saveVehicle(vehicle)) {
                request.setAttribute("message", "Vehicle added successfully!");
            } else {
            	request.setAttribute("message", "Failed to save vehicle");
            }
            request.getRequestDispatcher("/dri/Vehicale.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Internal Server Error: " + e.getMessage());
            request.getRequestDispatcher("/dri/Vehicale.jsp").forward(request, response);
        }
		
	}

}
