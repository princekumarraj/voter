

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class voter_login
 */
@WebServlet("/voter_login")
public class voter_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail = request.getParameter("emailid");
	
		String pass = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		
		RequestDispatcher dispatcher = null;
		
		RegisterDao rdao = new RegisterDao();
		
		String res= rdao.checkVoter(uemail,pass);
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
			session.setAttribute("email", res);
			//dispatcher = request.getRequestDispatcher("voters_home.jsp");
			response.sendRedirect("voters_home.jsp");
			//response.getWriter().print(res);
			
		}
		
		
		
		

		
	}

}
