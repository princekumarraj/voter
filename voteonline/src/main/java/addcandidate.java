

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addcandidate
 */
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
@WebServlet("/addcandidate")

public class addcandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public addcandidate() {
		super();
	}
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("image/jpeg");
		  int id = Integer.parseInt(request.getParameter("id"));
		  Connection conn = DBConnection.getConn();
		  String sql = "SELECT * FROM candidate_table WHERE ID ='"+id+"'";
		  PreparedStatement ps;
		  try {
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   if(rs.next()){
		    byte [] imageData = rs.getBytes("cimg"); // extract byte data from the resultset..
		    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
		             os.write(imageData);
		             os.flush();
		             os.close();
		   }
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		   response.getOutputStream().flush();
		   response.getOutputStream().close();
		  }
		  
		 }  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cname = request.getParameter("cname");
		String partyname = request.getParameter("party-name");
		//String phone = request.getParameter("symbol");
		String profile = request.getParameter("profile");
		String category= request.getParameter("category");
		String constituency= request.getParameter("constituency");
		Part file=request.getPart("symbol");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		System.out.println("Selected Image File Name : "+imageFileName);
		
		Part filePart = request.getPart("symbol");
	    String fileName = filePart.getSubmittedFileName();
	    System.out.println("Selected Image File Name : "+fileName);
		
		
		RequestDispatcher rd = null;
		int result = 0;
		
		String res = "Candidate Added Success fully";
		
		Candidate candidate = new Candidate(cname,partyname,imageFileName,profile,category);
		
		DBConnection dbcon = new DBConnection();
		
		Connection con = dbcon.getConn();
		
		
		try {
			 PreparedStatement ps;
			ps = con.prepareStatement("Insert into candidate_table values(default,?,?,?,?,default)");
		
		 
		 ps.setString(1, cname);
			ps.setString(2, partyname);
			ps.setString(3,imageFileName);
			ps.setString(4, profile);
			ps.setString(5, category);
			
		    InputStream is = filePart.getInputStream();
		    
		    ps.setBlob(6, is);
		   result=  ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res="Something Went Wrong";
		}
		
		
		rd = request.getRequestDispatcher("add_candidate.jsp");
		request.setAttribute("msg",res);
		rd.forward(request, response);
	}
	}


