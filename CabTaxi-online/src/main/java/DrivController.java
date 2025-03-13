

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
 * Servlet implementation class DrivController
 */
@WebServlet("/dri/log")
public class DrivController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DrivService drivservice;
	
	public void init() throws ServletException{
		drivservice = DrivService.getInstance();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrivController() {
        super();
        // TODO Auto-generated constructor stub
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Driver driver = drivservice.getLogins(email, password);
		
		if(driver != null) {
			HttpSession session = request.getSession();
			session.setAttribute("driver", driver);
			
			  response.sendRedirect(request.getContextPath() + "/dri/profController");
		}else {
			response.sendRedirect("DriverLog.jsp?error=Invalid credentials");
		}
	}

}
