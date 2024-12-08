
public class Voters {
	
	private String uname,emailid,phone,pass,adharno;

	public Voters() {
		super();
	}

	

	public Voters(String uname, String emailid, String phone, String adharno,String pass ) {
		super();
		this.uname = uname;
		this.emailid = emailid;
		this.phone = phone;
		this.pass = pass;
		this.adharno = adharno;
	}



	public String getAdharno() {
		return adharno;
	}



	public void setAdharno(String adharno) {
		this.adharno = adharno;
	}



	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	

}
