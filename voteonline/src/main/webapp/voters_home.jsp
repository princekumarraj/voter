
<%
String email = "";
if (session.getAttribute("email") == null) {
	response.sendRedirect("voter-login.jsp");
} else {
	email = session.getAttribute("email").toString();
	email = email.toLowerCase();
}
DConnection dbcon = new DConnection();

Connection con = dbcon.getConn();

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
			<a class="navbar-brand" href="#page-top">Voter Home</a>
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">Do
							Voting</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">View
							Result</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=email%></a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	String msg="";
	boolean vrignt=true;
	String message = (String) request.getAttribute("msg");
	out.println(" "+ message);
	
	String sql = "SELECT * FROM voters where emailid='"+email+"'";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		
		String status = rs.getString(7);
		if(!status.equalsIgnoreCase("verified"))
		{
			 msg="Your Adhaar id Not Yet Verified by Admin";
			 
			 vrignt= false;
			
		}
	}
		
		
 %>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5"
				src="assets/img/portfolio/voting3.jpg" alt="..." />
			<!-- Masthead Heading-->
			<h1 class=" mb-0">Welcome To Unique Online Voting System</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Java
				Project Developed using - JSP and Servlet</p>
				<h4 class="text-center text-danger mb-0"><%=msg %></h4>
		</div>
	</header>
	
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2 class=" text-center  text-white">Active Voting</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-1 me-auto"></div>
				<div class="col-lg-10 ms-auto">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Vote Name</th>
								<th scope="col">Vote Type</th>
								<th scope="col">Voting Done</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							

							int cnt = 0;
							int vcount=0;
							int vtid=0;
							String sqll = "SELECT * FROM voting where action='started'";
							PreparedStatement pss = con.prepareStatement(sqll);
							ResultSet rss = pss.executeQuery();
							while (rss.next()) {
								cnt++;
								 vtid=rss.getInt(1);
								String sqlc = "SELECT  COUNT(*) as vcunt FROM dovoting where vote_id='"+vtid+"'";
								PreparedStatement psc = con.prepareStatement(sqlc);
								ResultSet rsc = psc.executeQuery();
								if(rsc.next()){
									vcount =rsc.getInt(1);
								}
							%>


							<tr>
								<th scope="row" class="align-middle"><%=cnt%></th>

								<td class="align-middle"><%=rss.getString(2)%></td>
								<td class="align-middle text-center"><%=rss.getString(3)%></td>
								<td class="align-middle text-center"><%=vcount%></td>
								<% if(vrignt){%>
								<td class="align-middle text-center"><a class="text-dark"
									href="doVoting.jsp?vid=<%=rss.getInt(1)%>">Do Voting</a></td>
									<%}else{ %>
<td class="align-middle text-center text-danger">NOT VERIFIED VOTER</td>
							</tr>
							<%
									}
							}
							%>
						</tbody>
					</table>
				</div>
				<div class="col-lg-1 me-auto"></div>
			</div>
			<!-- About Section Button-->

		</div>
	</section>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2 class=" text-center  text-secondary mb-0">View Result</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
			<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Vote Name</th>
								<th scope="col">Vote Type</th>
								<th scope="col">Voting Done</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
					

							 cnt = 0;
							 vcount=0;
							 String status="";

							String sqlr = "SELECT * FROM voting";
							PreparedStatement psr = con.prepareStatement(sqlr);
							ResultSet rsr = psr.executeQuery();
							while (rsr.next()) {
								cnt++;
								 vtid=rsr.getInt(1);
								String sqlc = "SELECT  COUNT(*) as vcunt FROM dovoting where vote_id='"+vtid+"'";
								PreparedStatement psc = con.prepareStatement(sqlc);
								ResultSet rsc = psc.executeQuery();
								if(rsc.next()){
									vcount =rsc.getInt(1);
								}
								String sts = rsr.getString(4);
								if(sts.equalsIgnoreCase("created"))
									status="Not Started";
								else if(sts.equalsIgnoreCase("started"))
									status="Active";
								else if(sts.equalsIgnoreCase("stoped"))
									status="Voting Ends";
								else if(sts.equalsIgnoreCase("result"))
									status="Result Decleared";
								
									
							%>


							<tr>
								<th scope="row" class="align-middle"><%=cnt%></th>

								<td class="align-middle"><%=rsr.getString(2)%></td>
								<td class="align-middle text-center"><%=rsr.getString(3)%> Election</td>
								<td class="align-middle text-center"><%=vcount%></td>
								<td class="align-middle text-center"><%=status%></td>
								<td class="align-middle text-center"><a class="text-dark"
									href="viewResult.jsp?vid=<%=rsr.getInt(1)%>">View Result</a></td>

							</tr>
							<%
							
							}
							%>
						</tbody>
					</table>
			
			</div>
		</div>

	</section>

	<!-- Footer-->
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
						We Are MCA Students from <a href="#">VBU, Hazaribagh</a> .
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
</html>
