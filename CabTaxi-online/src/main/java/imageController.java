

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



/**
 * Servlet implementation class imageController
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet("/uploadServlet")
public class imageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPLOAD_DIR = "src/main/webapp/img";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imageController() {
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
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Resolve upload directory path
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        try {
            Part filePart = request.getPart("profileImage");

            if (filePart == null || filePart.getSize() == 0) {
                out.println("<script>alert('No file selected!');window.location='dri/driver.jsp';</script>");
                return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (fileName == null || fileName.isEmpty()) {
                out.println("<script>alert('Invalid file!');window.location='dri/driver.jsp';</script>");
                return;
            }

            File savedFile = new File(uploadPath, fileName);
            filePart.write(savedFile.getAbsolutePath());

            // Store relative path
            String imagePath = UPLOAD_DIR + "/" + fileName;
            request.getSession().setAttribute("profileImagePath", imagePath);

            out.println("<script>alert('Profile picture updated successfully!');window.location='dri/driver.jsp';</script>");

        } catch (Exception e) {
            out.println("<script>alert('Upload failed: " + e.getMessage() + "');window.location='dri/driver.jsp';</script>");
        }
	}
	
	
	

}
