

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;



public class RegisterDao {
	private String dburl= "jdbc:mysql://localhost:3306/voterdb";
	private String dbuname="root";
	private String dbpass="";
	private String dbdriver ="com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbdriver) {
		try {
			Class.forName(dbdriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		
		Connection con = null;
		
		try {
			con=DriverManager.getConnection(dburl, dbuname, dbpass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	
public String insert(Voters voter) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Data Entered Successfully";
		String sql = "Insert into voters values(default,?,?,?,?,?,default)";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, voter.getUname());
			ps.setString(2, voter.getEmailid());
			ps.setString(3, voter.getPhone());
			ps.setString(4, voter.getAdharno());
			ps.setString(5, voter.getPass());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="Data NOT Entered Successfully";
		}
		
		return result;
		
	}

public String addcandidate(Candidate candidate) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Data Entered Successfully";
		String sql = "Insert into candidate_table values(default,?,?,?,?,?,default)";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, candidate.getCandidate_name());
			ps.setString(2, candidate.getParty_name());
			ps.setString(3, candidate.getSymbol());
			ps.setString(4, candidate.getProfile());
			ps.setString(5, candidate.getCategory());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="Data NOT Entered Successfully";
		}
		
		return result;
		
	}

public String newVoting(String vname, String vtype) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Data Entered Successfully";
		String sql = "Insert into voting values(default,?,?,default,default)";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, vname);
			ps.setString(2, vtype);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="Data NOT Entered Successfully";
		}
		
		return result;
		
	}
public String doVoting(String canid, String vemail,String vid) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Data Entered Successfully";
		String sql = "Insert into dovoting values(default,?,?,?,default)";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, canid);
			ps.setString(2, vemail);
			ps.setString(3, vid);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="Data NOT Entered Successfully";
		}
		
		return result;
		
	}

public String checkVoter(String uemail,String pass) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Success";
		
		String sql = "SELECT * from  voters where emailid=? and pass=?";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, uemail);
			ps.setString(2, pass);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String uname = rs.getString("emailid");
				result =uname;
			}
			else {
				result = "invalid-user";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="error";
		}
		
		return result;
		
	}


public String getPass(String adhaar,String mobi) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Success";
		
		String sql = "SELECT * from  voters where adharno=? and phone=?";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, adhaar);
			ps.setString(2, mobi);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String pass = rs.getString("pass");
				result =pass;
			}
			else {
				result = "invalid-details";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="error";
		}
		
		return result;
		
	}

public String checkAdmin(String ademail,String adpass) {
	loadDriver(dbdriver);
		Connection con = getConnection();
		String result ="Success";
		
		String sql = "SELECT * from  admin where admin_email=? and admin_pass=?";
		
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, ademail);
			ps.setString(2, adpass);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String uname = rs.getString("admin_email");
				result =uname;
			}
			else {
				result = "invalid-user";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result ="error";
		}
		
		return result;
		
	}

}
