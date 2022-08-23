<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	width: 40%;
	margin: auto;
	background: white;
	padding: 10px;
	box-shadow: 5px 9px 15px -2px gray;
	font-size: 16px;
}

* {
	box-sizing: border-box;
}

/* Add padding to containers */
.container {
	padding: 16px;
	background-color: white;
}

/* Full-width input fields */
input[type="text"], input[type="password"], input[type="email"], input[type="date"] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type="text"]:focus, input[type="password"]:focus {
	background-color: #ddd;
	outline: none;
}

/* Overwrite default styles of hr */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
	background-color: #5cb85c;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.registerbtn{
	font-size: 18px;
}

.registerbtn:hover {
	opacity: 1;
}

.signin {
	background-color: #f1f1f1;
	text-align: center;
}
</style>
</head>
<body>
	<form action="RegisterServlet" method="post">
		<div class="container">
			<h1>Register</h1>
			<p>Please fill in this form to create an account.</p>
			<hr />
			<label for="fullName"><b>Full Name</b></label> 
			<input type="text" pattern="[a-zA-Z0-9 ]*$" class="form-control" name="employeeFullName"
				id="employeeFullName" value="${name}" placeholder="Full Name" required/>

			<label for="phone"><b>Phone</b></label> 
			<input type="text" pattern="(\+84|0)\d{9,10}" class="form-control" name="employeePhone"
				id="employeePhone" value="${phone}" placeholder="Phone Number" required/>

			<label for="birthdate"><b>Date Of Birth</b></label> 
			<input type="date" class="form-control" name="employeeBirthdate"
				placeholder="dd/mm/yyyy" min="1962-01-01" max="2004-12-31" value="${birthdate}" required /> 
			
			<label for="email"><b>Sex </b></label>
       		<input type="radio" name="sex" value="1" checked />Male
        	<input type="radio" name="sex" value="0" />Female
       		<br />
        	<br />
        
			<label for="address"><b>Address</b></label>
			<input type="text" pattern="[a-zA-Z0-9 ]*$" class="form-control"
				name="employeeAddress" placeholder="Address" value="${address}"
				required/> 
				
			<label for="email"><b>Email</b></label> 
			<input type="email" class="form-control"
				name="employeeEmail"placeholder="Your Email" value="${email}"
				required/> 
			
			<label for="account"><b>Account</b></label> 
			<input type="text" pattern="[a-zA-Z0-9]+" class="form-control"
				name="account" placeholder="Your Account" value="${account1}" required /> 
			
			<label for="password1"><b>Password</b></label>
			<input type="password" name="password" id="password" placeholder="Password" value="${password1}" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters"/> 
			
			<label for="repass1"><b>Repeat Password</b></label> 
			<input type="password" name="repass" id="repass" value="${confirm}" placeholder="Re Password" required=""  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters"/>
			<hr />
			<p class="text-danger" style="color: #E53E31;">${requestScope.error}</p>
			<hr />
			<p>
				By creating an account you agree to our <a href="#">Terms & Privacy</a>.
			</p>

			<button type="submit" class="registerbtn">Register</button>
		</div>

		<div class="container signin">
			<p>
				Already have an account? <a href="LoginServlet">Log in</a>.
			</p>
		</div>
	</form>
</body>
</html>
