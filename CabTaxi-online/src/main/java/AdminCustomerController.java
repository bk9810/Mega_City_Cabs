

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.example.model.Customer;
import com.example.service.CustService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dao.customerDAO;


/**
 * Servlet implementation class AdminCustomerController
 */
@WebServlet("/admin/customers")
public class AdminCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AdminCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustService customerService = CustService.getInstance();
		List<Customer> customerList = customerService.getAllCustomers();

		request.setAttribute("customerList", customerList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/customerManagement.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	    }
    
	

}
