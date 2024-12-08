

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admin_login
 */
@WebServlet("/admin_login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_login() {
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
		String uemail = request.getParameter("ademail");
		
		String pass = request.getParameter("adpass");
		
		HttpSession session = request.getSession();
		
		RequestDispatcher dispatcher = null;
		
		RegisterDao rdao = new RegisterDao();
		
		String res= rdao.checkAdmin(uemail,pass);
		if(res.equalsIgnoreCase("error")) {
			request.setAttribute("status", "faliled");
			dispatcher = request.getRequestDispatcher("admin_login.jsp");
			response.getWriter().print(res);
			response.getWriter().print("error");
		}
		else if(res.equalsIgnoreCase("invalid-user")){
			request.setAttribute("status", "invalid user");
			dispatcher = request.getRequestDispatcher("admin_login.jsp");
			response.getWriter().print(res);
			//response.getWriter().print("invalid user");
			
		}
		else {
			session.setAttribute("ademail", res);
			//dispatcher = request.getRequestDispatcher("voters_home.jsp");
			response.sendRedirect("admin_home.jsp");
			//response.getWriter().print(res);
			
		}
	}

}
