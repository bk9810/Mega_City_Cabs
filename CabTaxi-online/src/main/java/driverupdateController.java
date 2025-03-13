

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.service.CustService;
import com.example.service.DrivService;

/**
 * Servlet implementation class driverupdateController
 */
@WebServlet("/driverupdateController")
public class driverupdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DrivService drivservice;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException{
		drivservice = DrivService.getInstance();
	}
	
    public driverupdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int driverId =Integer.parseInt(request.getParameter("driverId"));
			 String name = request.getParameter("name");
		     String email = request.getParameter("email");
		     String phone = request.getParameter("phone");
		     String address = request.getParameter("address");
		     String password = request.getParameter("password");
		     String dob = request.getParameter("dob");
		     String nic = request.getParameter("nic");
		     
		     System.out.println("Update Profile Request Received:");
		        System.out.println("Driver ID: " + driverId);
		        System.out.println("Name: " + name);
		        System.out.println("Email: " + email);
		        System.out.println("Phone: " + phone);
		        System.out.println("Address: " + address);
		        System.out.println("DOB: " + dob);
		        System.out.println("nic " + nic);

		        boolean isUpdated = drivservice.update(driverId, name, email, phone, address, password, dob, nic);

		        if (isUpdated) {
		            response.getWriter().write("success");  // Changed to return "success" instead of redirect
		        } else {
		        	System.out.println("Update failed in service layer");
		            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		            response.getWriter().write("error");
		        }
					
		} catch(Exception e) {
			e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().write("error: " + e.getMessage());
		}
	}

}
