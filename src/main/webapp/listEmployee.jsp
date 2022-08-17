<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Employee</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="./css/style.css" />
<style>
tr:nth-child(even) {
	background-color: #f9f9f9;
}

table {
	margin: 10px;
}

td, th {
	border: 1px solid #a6a6a6;
	text-align: left;
	padding: 10px;
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
			<h3 class="form-signin-heading">Employee List</h3>
			<hr />
			<div class="search-container">
				<form action="" class="filter_form">
					<div class="filter_input" style="height: 40px;">
						<i class="fa fa-search" style="padding: 12px;"></i><input
							type="text" placeholder="User search"
							style="width: 400px; height: 40px; margin-top: -1px;">
					</div>
					<div class="filter_by" style="height: 40px;">
						<i class="fa-solid fa-filter"></i>Filter By <select name="" id=""
							style="width: 150px; height: 40px; margin-top: -1px;">
							<option value="">a</option>
						</select>
					</div>
					<input class="search" type="submit" value="Search"
						style="color: #fff">
				</form>
			</div>
			<div class="infor-table">
				<table>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Date of Birth</th>
						<th>Address</th>
						<th>Phone number</th>
						<th>Department</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${requestScope.data}" var="p">
					<tr>
						<td>${p.getEmployeeId()}</td>
						<td>${p.getEmployeeFullName()}</td>
						<td>${p.getDate()}</td>
						<td>${p.getEmployeeAddress()}</td>
						<td>${p.getEmployeePhone()}</td>
						<td>${p.getDepartment()}</td>
						<td><a href=""><i class="fa-solid fa-eye"></i> View</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script>
		function displayDropdownList(event) {
			const dropDown = event.parentElement;
			const dropdownList = dropDown
					.getElementsByClassName("dropdown-list")[0];
			dropdownList.classList.toggle("show");
			console.log(dropdownList);
		}
	</script>
</body>
</html>