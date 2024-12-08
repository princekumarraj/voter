import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/vlogin")
public class vlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public vlogin() {
		super();
	}

	// doPost() method
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Set the content type of response to "text/html"
		response.setContentType("text/html");

		// Get the print writer object to write into the response
		PrintWriter out = response.getWriter();

		// Get the session object
		HttpSession session = request.getSession();

		// Get User entered details from the request using request parameter.
		String user = request.getParameter("uname");
		String password = request.getParameter("pass");

		// Validate the password - If password is correct,
		// set the user in this session
		// and redirect to welcome page
		if (password.equals("geek")) {
			session.setAttribute("user", user);
			response.sendRedirect("welcome.jsp?name=" + user);
		}
		// If the password is wrong, display the error message on the login page.
		else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			out.println("<font color=red>Password is wrong.</font>");
			rd.include(request, response);
		}
		// Close the print writer object.
		out.close();
	}
}
