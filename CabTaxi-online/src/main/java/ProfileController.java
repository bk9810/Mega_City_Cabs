

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.example.dao.DBConnection;
import com.example.dao.customerDAO;
import com.example.model.Customer;
import com.example.service.CustService;

/**
 * Servlet implementation class ProfileController
 */

@WebServlet("/reg/customerProfile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustService custService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() {
    	custService = custService.getInstance();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("customer") == null) {
			response.sendRedirect(request.getContextPath() + "/reg/Login.jsp");  
			return;
		}
		
		Customer customer = (Customer) session.getAttribute("customer");
		
		
		
		if (customer != null) {
			session.setAttribute("customerName", customer.getName());
			request.setAttribute("customer", customer);
			
			request.getRequestDispatcher("/reg/profile.jsp").forward(request, response);
		}else {
			response.sendRedirect("/reg/Login.jsp");
		}
		
		
		
		
		if (customer != null) {
            // Store customer details in session
            session.setAttribute("customerName", customer.getName());
            request.setAttribute("customer", customer);

            // Forward to dashboard.jsp
          
            
        } else {
            response.sendRedirect("/reg/Login.jsp");  // Redirect if customer not found
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part filePart = request.getPart("profileImage");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + "img/uploads";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Store only the file path in session (not the database)
            HttpSession session = request.getSession();
            session.setAttribute("profileImage", "uploads/" + fileName);
        }

        response.sendRedirect("dashboard.jsp"); // Redirect back to profile page
    }
	

}
