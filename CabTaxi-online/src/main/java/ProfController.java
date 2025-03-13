

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
 * Servlet implementation class ProfController
 */
@WebServlet("/dri/profController")
public class ProfController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DrivService drivservice;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
		drivservice = drivservice.getInstance();
	}
	
    public ProfController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		    response.setHeader("Pragma", "no-cache");
		    response.setHeader("Expires", "0");

		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("driver") == null) {
			response.sendRedirect(request.getContextPath() + "/dri/DriverLog.jsp");
			return;
		}
		
		Driver driver = (Driver) session.getAttribute("driver");
		if(driver != null) {
			session.setAttribute("driverName", driver.getName());
			request.setAttribute("driver", driver);
			request.getRequestDispatcher("/dri/driver.jsp").forward(request,  response);
		} else {
			response.sendRedirect(request.getContextPath() + "/dri/DriverLog.jsp");
		}
		

        if (driver != null) {
            // Store customer details in session
            session.setAttribute("customerName", driver.getName());
            request.setAttribute("customer", driver);

            // Forward to dashboard.jsp
            request.getRequestDispatcher("/dri/driver.jsp").forward(request, response);
            
        } else {
            response.sendRedirect("/dri/DriverLog.jsp");  // Redirect if customer not found
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
