

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Customer;
import com.example.service.CustService;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/reg/customer")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustService custservice;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		this.custservice= new CustService();
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
	    
		Customer customer = new Customer(0, name, email, phone, password, address, dob);
		
		try {
			boolean isRegistered = custservice.registerCustomer(customer);
			if(isRegistered) {
				response.sendRedirect("Login.jsp");
			}else {
				response.getWriter().write("Customer Registered Failed");
			}
		}catch(IllegalArgumentException e) {
			response.getWriter().write("Error: " + e.getMessage());
		}
	}

}
