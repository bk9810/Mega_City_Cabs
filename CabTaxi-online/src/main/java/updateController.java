

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dao.customerDAO;
import com.example.service.CustService;

/**
 * Servlet implementation class updateController
 */
@WebServlet("/reg/updateProfile")
public class updateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
private CustService custservice;
	
	public void init() throws ServletException{
		custservice = CustService.getInstance();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateController() {
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
		try {
			int customerId =Integer.parseInt(request.getParameter("customerId"));
			 String name = request.getParameter("name");
		     String email = request.getParameter("email");
		     String phone = request.getParameter("phone");
		     String address = request.getParameter("address");
		     String password = request.getParameter("password");
		     
		     System.out.println("Update Profile Request Received:");
		        System.out.println("Customer ID: " + customerId);
		        System.out.println("Name: " + name);
		        System.out.println("Email: " + email);
		        System.out.println("Phone: " + phone);
		        System.out.println("Address: " + address);

		        boolean isUpdated = custservice.updateCustomer(customerId, name, email, phone, address, password);

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
