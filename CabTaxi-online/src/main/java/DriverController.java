

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Driver;
import com.example.service.DrivService;

/**
 * Servlet implementation class DriverController
 */
@WebServlet("/dri/driverlog")
public class DriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DrivService drivservice;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
    	this.drivservice=new DrivService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String dob = request.getParameter("dob");
		String nic  = request.getParameter("nic");
		
		Driver driver = new Driver(0, name, email, phone, password, address, dob, nic);
		int[] generatedId = new int[1];
		
		try {
			boolean isRegistered = drivservice.registerDriver(driver, generatedId);
			if(isRegistered) {
				
				int id = generatedId[0];
				
				HttpSession session =  request.getSession()
;               session.setAttribute("id", id);
				
				response.sendRedirect("question.jsp");
			} else {
				response.getWriter().write("Driver Registered Failed");
			}
		}catch (IllegalArgumentException e) {
			response.getWriter().write("Error: "+ e.getMessage());
		}
	}

}
