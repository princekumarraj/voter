<%
String ademail="";
if(session.getAttribute("ademail")==null){
	response.sendRedirect("admin_login.jsp");
}
else{
	 ademail =session.getAttribute("ademail").toString();
	 ademail = ademail.toLowerCase();
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="voteonline.DConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Online Voting System:User Home</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="admin_home.jsp">Admin Home</a>
			<button
				class="navbar-toggler  font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">


					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=ademail%></a></li>

				</ul>
			</div>
		</div>
	</nav>
	 <section class="page-section  mb-0" id="about">
		<div class="container">

  <section class="page-section  mb-0" id="about">
		<div class="container">


<div class="container mt-5">
 
 <form>
 <table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Voter Name</th>
      <th scope="col">Email Id</th>
      <th scope="col">Adhar No</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
  <%
  DConnection dbcon = new DConnection();

  Connection con = dbcon.getConn();
	int cnt=0;
   
    String sql = "SELECT * FROM candidate_table ";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
    	cnt++;
    	
    	
     %>
  
 
    <tr>
      <th scope="row" class="align-middle"><%=cnt %></th>
      
      <td class="align-middle"><%=rs.getString(2) %></td>
       <td class="align-middle text-center"><%=rs.getString(3) %></td>
       <td class="align-middle text-center"><%=rs.getString(5) %></td>
       
        <td class="align-middle">
       
         <form action="deleteCandidate" method="post">
        <input type="hidden" name="vtid" value=<%=rs.getString(1) %>>
         
         <input type="submit" class="btn btn-danger" value="delete">
							
        </form>
       
        </td>
    </tr>
     <%}

    %>
  </tbody>
</table>
 </form>
</div>
</div>

    </section>
	</div>
	</header>
<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						MCA Student <br /> VBU, Hazaribagh
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Us</h4>
					<p class="lead mb-0">
						We Are MCA Students from <a href="voters_home.jsp">Voter Home</a> .
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; MCA VBU 2022</small>
		</div>
	</div>
	<!-- Portfolio Modals-->
	
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

