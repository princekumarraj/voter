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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Create New Voting Activity</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Create New Voting Activity</h2>
					
						
						<form action="newVoting" method="post" class="register-form"
							id="register-form" >
							
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="vname" id="name" placeholder="Voting Activate Name" />
							</div>
						<!-- Email address input-->
						<div class="form-group mb-3">
							<select class="form-control" name="vtype" id="Vote Type"> 
							<option>MLA</option>
								<option>MP</option>
								<option>MUKHIYA</option>
								<option>OTHERS</option>
							</select>
							
						</div>
					
					
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl disabled" id="submitButton"
							type="submit">Create New Voting</button>
					</form>
					</div>
					<div class="signup-image">
						<figure>
							<img class="masthead-avatar mb-5" src="assets/img/portfolio/voting4.webp"
				alt="..." />
						</figure>
						<a href="admin_home.jsp" class="signup-image-link">ADMIN HOME</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>



</body>

</html>