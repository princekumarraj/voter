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
<title>Add Candidate</title>

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
			<%
String message = (String) request.getAttribute("msg");
out.println(" "+ message); %>
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Add Candidate </h2>
					
						<form action="addcandidate" method="post" class="register-form"
							id="register-form" enctype="multipart/form-data">
							
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="cname" id="name" placeholder="Candidate Name" />
							</div>
							<div class="form-group">
								<label for="pname"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="party-name" id="pname" placeholder="Party Name" />
							</div>
							<div class="form-group">
								<label for="symbol"><i
									class="zmdi zmdi-account material-icons-file"></i></label> <input
									type="file" name="symbol" id="symbol"  />
							</div>
							<div class="form-group">
								<label for="pname"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="constituency" id="pname" placeholder="Constituency" />
							</div>
							<div class="form-group">
								<label for="email"></label> 
								<textarea rows="4" cols="30" name="profile"></textarea>
								
							</div>
							
							
							<div class="form-group">
								<label for="contact"></label>
								<select name="category">
								<option>MLA</option>
								<option>MP</option>
								<option>MUKHIYA</option>
								<option>OTHERS</option>
								
								</select>
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="submit"  id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="voter-login.jsp" class="signup-image-link">I am already
							member</a>
							<br>
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