

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		String uname = request.getParameter("uname");
		String emailid = request.getParameter("emailid");
		String phone = request.getParameter("phone");
		String adharno = request.getParameter("adharno");
		String pass = request.getParameter("pass");
		
		RequestDispatcher rd = null;
		
		Voters voter = new Voters(uname,emailid,phone,adharno,pass);
		
		RegisterDao rdao = new RegisterDao();
		
		String res= rdao.insert(voter);
		rd = request.getRequestDispatcher("voter-login.jsp");
		request.setAttribute("msg",res);
		rd.forward(request, response);
	}

}
