<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.user-form{
width:400px;
padding:20px;
background-color:lightgreen;
border:1px solid blue;
}
</style>
</head>
<body>
<h1>User Registration</h1>
<div class='user-form'>
<form action="register" method="post">
<table>
<tr><td><label>Name</label></td><td><input type="text" name="uname" placeholder="User Name"></input></td></tr>
<tr><td><label>Email Id</label></td><td><input type="email" name="emailid" placeholder="Email Id"></input></td></tr>
<tr><td><label>Phone</label></td><td><input type="text" name="phone" placeholder="User Phone"></input></td></tr>
<tr><td><label>Password</label></td><td><input type="password" name="pass" placeholder="Passworde"></input></td></tr>
<tr><td colsapan="2"><input type="submit" name="submit" value="Register"></input></td></tr>

</table>

</form>
</div>

</body>
</html>