

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class doVoting
 */
@WebServlet("/doVoting")
public class doVoting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doVoting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		  Connection conn = DBConnection.getConn();
		  String sql = "UPDATE voting set action='stopped' where id= '"+id+"'";
		  PreparedStatement ps;
		  try {
		   ps = conn.prepareStatement(sql);
		   ps.executeUpdate();
		   System.out.println("Selected Image File Name : "+id);
		   response.sendRedirect("admin_home.jsp?msg='Voting Started'");
		  } catch (SQLException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			   response.getOutputStream().flush();
			   response.getOutputStream().close();
			   response.sendRedirect("admin_home.jsp?msg='Something Went Wrong'");
			  }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String canid = request.getParameter("canid");
		String vemail= request.getParameter("vemail");
		String vid = request.getParameter("vid");
		
		
		
		System.out.println("vname : "+canid + "Vtype"+vemail);
RequestDispatcher rd = null;
		
		
		
		RegisterDao rdao = new RegisterDao();
		
		String res= rdao.doVoting(canid,vemail,vid);

		rd = request.getRequestDispatcher("voters_home.jsp");
		request.setAttribute("msg",res);
		rd.forward(request, response);
	}
	}


