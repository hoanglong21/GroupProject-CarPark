<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Employee</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/style.css" />
<style>
body{
font-size: 16px;
}
table {
	width: 60%;
	border-collapse: collapse;
}

td {
	padding: 0.5rem;
	font-weight: bold;
}

td input[type="text"], input[type="password"],input[type="email"], input[type="date"], select {
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
			<a href="LogoutServlet" style="color: #5BA4D6;"><i
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
			<hr/>
			<div class="dropdown">
				<div class="content2" onclick="displayDropdownList(this)"
					style="color: #007bff">
					<i class="fa-solid fa-chart-column"></i> Employee manager <i
						class="fa-solid fa-angle-down" style="margin-left: 15px"></i>
				</div>
				<div class="dropdown-list">
					<div class="dropdown-item">
						<a href="ListEmployeeServlet"> <i class="fa-solid fa-list"></i>
							Employee list
						</a>
					</div>
					<div class="dropdown-item">
						<a href="AddEmployeeServlet"> <i class="fa-solid fa-plus"></i>
							Add Employee
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="editprofile col-md-9">
			<h3 class="form-signin-heading">View Employee</h3>
			<hr />
			<div class="infor-table">
				<form class="add" action="UpdateEmployeeServlet" method="post">
					<table border="0">
						<tr>
							<td>Full name :</td>
							<td><input type="text" pattern="[a-zA-Z0-9 ]*$" name="employeeFullName"
								value="${user.getEmployeeFullName()}"
								placeholder="Enter Full Name" required=""></td>
						</tr>
						<tr>
							<td>Phone number :</td>
							<td><input type="text" name="employeePhone" pattern="(\+84|0)\d{9,10}"
								value="${user.getEmployeePhone()}"
								placeholder="Enter phone number" required=""></td>
						</tr>
						<tr>
							<td>Date of birth :</td>
							<td><input type="date" name="employeeBirthdate"
								value="${user.getEmployeeBirthdate()}" placeholder="dd/mm/yyyy"
								required="" min="1962-01-01" max="2004-12-31"></td>
						</tr>
						<tr>
							<td>Sex :</td>
							<td><input type="radio" id="Male" name="sex"
								${user.getSex()==1?"checked":""} value="1" /> <label for="Male">Male</label>
								<input type="radio" id="Female" name="sex"
								${user.getSex()==0?"checked":""} value="0" /> <label
								for="Female">Female</label></td>
						</tr>
						<tr>
							<td>Address :</td>
							<td><input type="text" pattern="[a-zA-Z0-9 ]*$" name="employeeAddress"
								value="${user.getEmployeeAddress()}" placeholder="Enter address"
								required=""></td>
						</tr>
						<tr>
							<td>Email :</td>
							<td><input type="email" name="employeeEmail"
								value="${user.getEmployeeEmail()}" placeholder="Enter email"
								required=""></td>
						</tr>
						<tr>
							<td>Account :</td>
							<td><input type="text" name="account"
								value="${user.getAccount()}" placeholder="Enter account"
								required=""></td>
						</tr>
						<tr>
							<td>Password :</td>
							<td><input type="text" name="password"
								value="${user.getPassword()}" placeholder="Enter password"
								required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters"></td>
						</tr>
						<tr>
							<td>Department :</td>
							<td><select name="department" aria-controls="zero-conf"
								class="custom-select custom-select-sm form-control form-control-sm">
									<option ${user.getDepartment()=="Training"?"selected":""}
										value="Training">Training</option>
									<option ${user.getDepartment()=="Marketing"?"selected":""}
										value="Marketing">Marketing</option>
									<option
										${user.getDepartment()=="Human Resources"?"selected":""}
										value="Human Resources">Human Resources</option>
									<option
										${user.getDepartment()=="Product Management"?"selected":""}
										value="Product Management">Product Management</option>
									<option
										${user.getDepartment()=="Research and Development"?"selected":""}
										value="Research and Development">Research and Development</option>
									<option ${user.getDepartment()=="Sales"?"selected":""}
										value="Sales">Sales</option>
									<option ${user.getDepartment()=="Support"?"selected":""}
										value="Support">Support</option>
									<option
										${user.getDepartment()=="Business Development"?"selected":""}
										value="Business Development">Business Development</option>
									<option ${user.getDepartment()=="Legal"?"selected":""}
										value="Legal">Legal</option>
									<option ${user.getDepartment()=="Services"?"selected":""}
										value="Services">Services</option>
									<option ${user.getDepartment()=="Accounting"?"selected":""}
										value="Accounting">Accounting</option>
							</select></td>
						</tr>
						<tr>
							<td>Role :</td>
							<td><input type="radio" id="HRM Staff" name="roleId"
								${user.getRoleId()==1?"checked":""} value="1" /> <label
								for="HRM Staff">HRM Staff</label> <input type="radio"
								id="Car park operation administration staff" name="roleId"
								${user.getRoleId()==2?"checked":""} value="2" /> <label
								for="Car park operation administration staff">Car park
									operation administration staff</label></td>
						</tr>
						<tr>
							<td colspan="2"><a href="#deleteModal"
								onclick="myFunction(${user.employeeId})" data-toggle="modal"
								style="background-color: #E53E31; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #E53E31 1px solid; text-decoration: none;"><i
									class="fa-solid fa-trash"></i> Delete</a> 
									<button type="submit"
								style="background-color: #5CB85C; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5CB85C; text-decoration: none;"><i
									class="fa-solid fa-pen"></i> Update</button></td>
						</tr>
					</table>
					<div class="input-group">
					<input class="form-control" name="employeeId" type="text"
						value="${user.getEmployeeId()}" style="display: none" />
				</div>
				</form>
			</div>
		</div>
	</div>
	<div id="deleteModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="DeleteEmployeeServlet" method="get">
					<div class="modal-header">
						<h4 class="modal-title">Alert</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete employee?</p>
						<input type="text" id="employeeId" name="employeeId" readonly=""
							style="display: none">
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-secondary"
							data-dismiss="modal" value="Cancel"> <input type="submit"
							class="btn btn-danger" value="Delete">
					</div>
				</form>
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
		function myFunction(employeeId) {
            $(".modal-body #employeeId").val(employeeId);
        }
	</script>
</body>
</html>