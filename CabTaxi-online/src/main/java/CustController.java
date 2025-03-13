

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Customer;
import com.example.service.CustService;

/**
 * Servlet implementation class CustController
 */
@WebServlet("/reg/login")  // ✅ Change to lowercase "login"
public class CustController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustService custservice;
	
	public void init() throws ServletException{
		custservice = CustService.getInstance();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustController() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
			
		 Customer customer = custservice.authenticateCustomer(email, password);
		    
		    if (customer != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("customer", customer); // ✅ Store full object
		        response.sendRedirect(request.getContextPath() + "/reg/customerDashboard");
		    } else {
		    	response.sendRedirect("Login.jsp?error=Invalid credentials");
		    }
		
	}

}
