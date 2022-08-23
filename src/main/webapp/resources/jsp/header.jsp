<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	a {
		color: #897AB7;
	}
</style>
<body>
	<nav class="navbar navbar-expand-lg bg-light fixed-top border">
			<div class="container-fluid">
				${param.icon}

				<div style="text-align: right;">
					<a id="logout-link" href="/CarPark/hr/ViewEmployeeServlet?employeeId=${account.employeeId }"> ${account==null?'Login':'Welcome' } ${account.employeeFullName }</a> &nbsp &nbsp <a
						id="logout-link" href="/CarPark/LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i>
						Logout</a>

				</div>
			</div>
		</nav>
</body>
</html>