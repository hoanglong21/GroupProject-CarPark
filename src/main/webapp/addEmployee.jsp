<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="./css/style.css" />
<style>
table {
	width: 60%;
	border-collapse: collapse;
}

td {
	padding: 0.5rem;
	font-weight: bold;
}

td input[type="text"], input[type="date"], select {
	width: 100%;
	padding: 0.5rem;
	border: #ccc 1px solid;
	border-radius: 6px;
}

tr:last-child {
	text-align: center;
}

tr:last-child button i {
	font-weight: bold;
	font-size: medium;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="header">
		<div class="header_left" style="color: #777777;">
			<i class="fa-solid fa-users"></i> Employee
		</div>
		<div class="header_right">
			<p class="welcome" style="color: #5BA4D6;">Welcome</p>
			<a href="#" style="color: #5BA4D6;"><i
				class="fa-solid fa-right-from-bracket"></i> Logout</a>
		</div>
	</div>
	<div class="row">
		<div class="contentcms col-md-2">
			<a href="view-content.html">
				<div class="content1">
					<i class="fa-solid fa-gauge-high"></i> Dashboard
				</div>
			</a>
			<hr />
			<div class="dropdown">
				<div class="content2" onclick="displayDropdownList(this)"
					style="color: #007bff">
					<i class="fa-solid fa-chart-column"></i> Employee manager <i
						class="fa-solid fa-angle-down" style="margin-left: 15px"></i>
				</div>
				<div class="dropdown-list">
					<div class="dropdown-item">
						<a href=""> <i class="fa-solid fa-list"></i> Employee list
						</a>
					</div>
					<div class="dropdown-item">
						<a href=""> <i class="fa-solid fa-plus"></i> Add Employee
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="editprofile col-md-9">
			<h3 class="form-signin-heading">Add Employee</h3>
			<hr />
			<div class="infor-table">
				<form class="add" action="">
					<table border="0">
						<tr>
							<td>Full name <span style="color: red">(*)</span>:
							</td>
							<td><input class="required" type="text" name="employeeFullName"
								id="" placeholder="Enter Full Name"></td>
						</tr>
						<tr>
							<td>Phone number <span style="color: red">(*)</span>:
							</td>
							<td><input class="required" type="text" name="employeePhone"
								id="" placeholder="Enter phone number"></td>
						</tr>
						<tr>
							<td>Date of birth <span style="color: red">(*)</span>:
							</td>
							<td><input class="required" type="date" name="employeeBirthdate"
								id="" placeholder="dd/mm/yyyy"></td>
						</tr>
						<tr>
							<td>Sex <span style="color: red">(*)</span>:
							</td>
							<td><input type="radio" name="sex" id="" checked>Male
								<input type="radio" name="sex" id="">Female</td>
						</tr>
						<tr>
							<td>Address :</td>
							<td><input type="text" name="employeeAddress" id=""
								placeholder="Enter address"></td>
						</tr>
						<tr>
							<td>Email :</td>
							<td><input type="text" name="employeeEmail" id=""
								placeholder="Enter email"></td>
						</tr>
						<tr>
							<td>Account <span style="color: red">(*)</span>:
							</td>
							<td><input class="required" type="text" name="account"
								id="" placeholder="Enter account"></td>
						</tr>
						<tr>
							<td>Password <span style="color: red">(*)</span>:
							</td>
							<td><input class="required" type="text" name="password"
								id="" placeholder="Enter password"></td>
						</tr>
						<tr>
							<td>Department <span style="color: red">(*)</span>:
							</td>
							<td><select name="department" id="">
									<option value="">Employee</option>
									<option value="">Manager</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button"
									style="background-color: #5BC0DE; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5BC0DE 1px solid;">
									<i class="fa-solid fa-backward"></i> Back
								</button>
								<button type="reset"
									style="background-color: #F0B25D; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #F0B25D;">
									<i class="fa-solid fa-arrow-rotate-left"></i>Reset
								</button>
								<button type="submit"
									style="background-color: #5CB85C; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5CB85C;">
									<i class="fa fa-plus"></i> Add
								</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>