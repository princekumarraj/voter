

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteVoter
 */
@WebServlet("/deleteVoter")
public class deleteVoter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteVoter() {
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
		int vtid = Integer.parseInt(request.getParameter("vtid"));
		 Connection conn = DBConnection.getConn();
		  String sql = "DELETE FROM voters  where id= '"+vtid+"'";
		  PreparedStatement ps;
		  try {
		   ps = conn.prepareStatement(sql);
		   ps.executeUpdate();
		   System.out.println("Voter deleted : "+vtid);
		   response.sendRedirect("admin_home.jsp?msg='Voter Verified'");
		  } catch (SQLException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			   response.getOutputStream().flush();
			   response.getOutputStream().close();
			   response.sendRedirect("admin_home.jsp?msg='Something Went Wrong'");
			  }
	}

}
