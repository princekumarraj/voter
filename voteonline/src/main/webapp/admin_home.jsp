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
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JavaProject - Online Voting System</title>
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
			<a class="navbar-brand" href="#page-top">Admin Home</a>
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">Candidate</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Voting</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%= ademail %></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<%
String message = (String) request.getAttribute("msg");
out.println(" "+ message); %>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/portfolio/voting1.png"
				alt="..." />
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
		</div>
	</header>
	
	<!-- About Section-->
	<section class="page-section bg-info text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class=" text-center  text-white">Manage Voters</h2>
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
				<div class="col-lg-4 ms-auto">
				<a class="btn btn-xl btn-outline-light"
					href="verify_voters.jsp"><i class="fa fa-address-card-o" aria-hidden="true"></i> Verify Voters
				</a>
				</div>
				<div class="col-lg-4 me-auto">
					<a class="btn btn-xl btn-outline-danger"
					href="delete_voter.jsp"> <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>Delete Voter
				</a>
				</div>
			</div>
			<!-- About Section Button-->
			
		</div>
	</section>
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class=" text-center  text-white">Manage Candidate</h2>
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
				<div class="col-lg-4 ms-auto">
				<a class="btn btn-xl btn-outline-light"
					href="add_candidate.jsp"><i class="fa fa-address-card-o" aria-hidden="true"></i> Add Candidate
				</a>
				</div>
				<div class="col-lg-4 me-auto">
					<a class="btn btn-xl btn-outline-danger"
					href="delete_candidate.jsp"> <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>Delete Candidate
				</a>
				</div>
			</div>
			<!-- About Section Button-->
			
		</div>
	</section>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class=" text-center  text-secondary mb-0">Manage Voting Activity</h2>
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
				
					<div class="col-lg-2 ms-auto">
				<a class="btn btn-xl btn-outline-primary"
					href="new_voting.jsp"><i class="fa fa-handshake-o" aria-hidden="true"></i></i> New Voting
				</a>
				</div>
				<div class="col-lg-2 ms-auto">
				<a class="btn btn-xl btn-outline-success"
					href="start_voting.jsp"><i class="fa fa-address-card-o" aria-hidden="true"></i> Start Voting
				</a>
				</div>
				<div class="col-lg-2 ms-auto">
				<a class="btn btn-xl btn-outline-warning"
					href="stop_voting.jsp"><i class="fa fa-address-card-o" aria-hidden="true"></i> Stop Voting
				</a>
				</div>
				<div class="col-lg-2 ms-auto">
				<a class="btn btn-xl btn-outline-info"
					href="do_result.jsp"><i class="fa fa-address-card-o" aria-hidden="true"></i> Show Result
				</a>
				</div>
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
