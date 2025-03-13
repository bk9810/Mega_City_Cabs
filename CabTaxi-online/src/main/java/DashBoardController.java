

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dao.DBConnection;
import com.example.dao.customerDAO;
import com.example.model.Customer;
import com.example.service.CustService;

@WebServlet("/reg/customerDashboard")
public class DashBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustService custservice;
	
	public void init() {
		custservice =  CustService.getInstance();
	}
   
    public DashBoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setHeader("Expires", "0");  
		 HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("customer") == null) {
	            response.sendRedirect(request.getContextPath() + "/reg/Login.jsp");  // Redirect to login if session doesn't exist
	            return;
	        }
	        Customer customer = (Customer) session.getAttribute("customer");
	        if(customer != null) {
	        	session.setAttribute("customerName", customer.getName());
	        	request.setAttribute("customer", customer);
	        	 request.getRequestDispatcher("/reg/dashboard.jsp").forward(request, response);
	        } else {
	        	response.sendRedirect(request.getContextPath() + "/reg/Login.jsp");
	        }
	        if (customer != null) {
	            // Store customer details in session
	            session.setAttribute("customerName", customer.getName());
	            request.setAttribute("customer", customer);
	            request.getRequestDispatcher("/reg/dashboard.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("/reg/Login.jsp");  // Redirect if customer not found
	        }
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
