

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotPass
 */
@WebServlet("/forgotPass")
public class forgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPass() {
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
		String adhaar = request.getParameter("adhaar_no");
		
		String mobi = request.getParameter("mobi");
		
		
		
		RequestDispatcher dispatcher = null;
		
		RegisterDao rdao = new RegisterDao();
		
		String res= rdao.getPass(adhaar,mobi);
		if(res.equalsIgnoreCase("error")) {
			request.setAttribute("status", "faliled");
			dispatcher = request.getRequestDispatcher("voter-login.jsp");
			response.getWriter().print(res);
			response.getWriter().print("error");
		}
		else if(res.equalsIgnoreCase("invalid-user")){
			request.setAttribute("status", "invalid user");
			dispatcher = request.getRequestDispatcher("voter-login.jsp");
			response.getWriter().print(res);
			//response.getWriter().print("invalid user");
			
		}
		else {
			request.setAttribute("status", "successr");
			dispatcher = request.getRequestDispatcher("voter-login.jsp");
			response.getWriter().print("Your Password "+res);
			
		}
		
		
		
		
	}

}
