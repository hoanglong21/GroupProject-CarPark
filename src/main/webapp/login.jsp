<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/styles.css" />
</head>
<body>
	<c:set var="cookie" value="${pageContext.request.cookies}" />
	<div class="wrapper">
		<form class="form-signin" action="LoginServlet" method="post">
			<h3 class="form-signin-heading">Please Sign In</h3>
			<div class="form-error">
				<h2 class="text-danger"
					style="color: red; font-size: 14px; font-family: sans-serif;">${requestScope.msgCommon}</h2>
			</div>
			<input type="text" class="form-control" name="email" id="email"
				value="${cookie.user.value}" placeholder="E-mail" required=""/> <input
				type="password" class="form-control" name="password" id="password"
				value="${cookie.pass.value}" placeholder="Password" required=""/> <label
				class="checkbox"> <input
				${(cookie.remember.value eq 'ON')?"checked":""} type="checkbox"
				value="remember-me" id="remember" name="remember" value="ON" />
				Remember me
			</label>
			<button class="btn btn-lg btn-block btn-success" type="submit"
				onclick="validateLogin()">Login</button>
			<a href="register.jsp" class="register">Click here to Register</a>
		</form>
	</div>
</body>
</html>