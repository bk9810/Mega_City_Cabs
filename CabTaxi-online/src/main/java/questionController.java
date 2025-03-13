

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.question;
import com.example.service.quesService;

/**
 * servlet implementation class questionController
 */
@WebServlet("/dri/submitQA")
public class questionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private quesService questionService;
	
	public void init() throws ServletException{
		questionService = quesService.getInstance();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public questionController() {
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
		HttpSession session = request.getSession();
		Integer id = (Integer) session.getAttribute("id");
		
		if(id == null) {
			response.getWriter().write("Error");
			return;
		}
		
		System.out.println("Driver ID passed");
		String[] questions = request.getParameterValues("questions");
		String[] answers = request.getParameterValues("answers");
		
		boolean success = true;
		for(int i = 0; i < questions.length; i++) {
			question questi = new question(0, id, questions[i], answers[i]);
			if (!questionService.SubmitQuestion(questi)) {
				success = false;
			}
		}
		
		if(success) {
			response.sendRedirect("DriverLog.jsp");
		} else {
			response.getWriter().write("Submission Failed!");
		}
	}

}
