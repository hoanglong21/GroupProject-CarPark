<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Add Booking Office</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
.
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../resources/css/styles.css" rel="stylesheet">
<style>
table, tr, td {
	border: none;
}

.btn-last {
	padding: 0.1% 0.6%;
	color: #A17777;
	border: 1px solid #D6D6D6;
	background: #FFFFFF
}

.my-active {
	color: #FFFFFF;
	background: #337AB7;
}

tr>td:first-child {
	font-weight: 700;
}
</style>
</head>

<body>
	<div style="overflow-x: hidden;">
		<jsp:include page="../resources/jsp/header.jsp">
			<jsp:param name="icon"
				value="<a style='color: black;' href='/CarPark'><i
					class='fa-solid fa-users'></i>&nbsp Employee</a>" />
		</jsp:include>

		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center"
			style="margin-top: 20px; display: flex; align-items: stretch !important;">

			<jsp:include page="../resources/jsp/sidebar2.jsp">
				<jsp:param name="icon" value="add" />
			</jsp:include>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh;">
				<div style="margin-top: 3%;">
					<h3>Add Employee</h3>
				</div>
				<hr>

				<div style="margin: 1% auto 2%; clear: both;">
					<form class="add" action="AddEmployeeServlet" method="post">
						<table border="0">
							<tr>
								<td style="width: 45%;">Full name <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" type="text" pattern="[a-zA-Z0-9 ]*$"
									name="employeeFullName" value="${e.employeeFullName}"
									placeholder="Enter Full Name" required=""></td>
							</tr>
							<tr>
								<td>Phone number <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" type="text" name="employeePhone"
									pattern="(\+84|0)\d{9,10}" value="${e.employeePhone}"
									placeholder="Enter phone number" required=""></td>
							</tr>
							<tr>
								<td>Date of birth <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" type="date" style="width: 90%;"
									name="employeeBirthdate" value="${e.employeeBirthdate}"
									placeholder="dd/mm/yyyy" required="" min="1962-01-01"
									max="2004-12-31"></td>
							</tr>
							<tr>
								<td>Sex <span style="color: red">(*)</span>:
								</td>
								<td><input type="radio" checked id="Male" name="sex"
									${e.sex} value="1" /> <label for="Male">Male</label> <input
									type="radio" id="Female" name="sex" ${e.sex} value="0" /> <label
									for="Female">Female</label>
							</tr>
							<tr>
								<td>Address :</td>
								<td><input class="box" type="text" name="employeeAddress"
									pattern="[a-zA-Z0-9 ]*$" value="${e.employeeAddress}"
									placeholder="Enter address"></td>
							</tr>
							<tr>
								<td>Email :</td>
								<td><input class="box" type="email" name="employeeEmail"
									value="${e.employeeEmail}" placeholder="Enter email"></td>
							</tr>
							<tr>
								<td>Account <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" type="text" pattern="[a-zA-Z0-9]+"
									name="account" value="${e.account}" placeholder="Enter account"
									required=""></td>
							</tr>
							<tr>
								<td>Password <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" class="required" type="password"
									name="password" id="" placeholder="Enter password" required=""
									value="${e.password}"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
									title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters"></td>
							</tr>
							<tr>
								<td>Department <span style="color: red">(*)</span>:
								</td>
								<td><select class="box" style="width: 90%;"
									name="department" aria-controls="zero-conf"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option ${e.department} value="Training">Training</option>
										<option ${e.department} value="Marketing">Marketing</option>
										<option ${e.department} value="Human Resources">Human
											Resources</option>
										<option ${e.department} value="Product Management">Product
											Management</option>
										<option ${e.department} value="Research and Development">Research
											and Development</option>
										<option ${e.department} value="Sales">Sales</option>
										<option ${e.department} value="Support">Support</option>
										<option ${e.department} value="Business Development">Business
											Development</option>
										<option ${e.department} value="Legal">Legal</option>
										<option ${e.department} value="Services">Services</option>
										<option ${e.department} value="Accounting">Accounting</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="2"><a href="ListEmployeeServlet"
									style="background-color: #5BC0DE; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5BC0DE 1px solid; text-decoration: none">
										<i class="fa-solid fa-backward"></i> Back
								</a>
									<button type="reset"
										style="background-color: #F0B25D; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #F0B25D;">
										<i class="fa-solid fa-arrow-rotate-left"></i>Reset
									</button>
									<button type="submit"
										style="background-color: #5CB85C; padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5CB85C;">
										<i class="fa fa-plus"></i> Add
									</button></td>
							</tr>
						</table>
					</form>
				</div>


			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	$(".btn-last").on("click", (e) => {
		//e.preventDefault();
		var target = e.target;
		var page = target.id;
		if (page == 'p') {
			page = $('#page').val() - 1;
			if (page == 0) {
				page = 1;
			}
		} else if (page == 'n') {
			page = Number($('#page').val()) + Number(1);
			if (page > $('#totalPage').val()) {
				page = Number($('#totalPage').val());
			}
		}
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/ad/bookinglist',
				type: 'POST',
				data: {
					
					"search": $('#search').val(),
					"by": $('#by').val(),
					"page": page
				},
				success: function(data) {
					var parser = new DOMParser();
					var htmlDoc = parser.parseFromString(data, 'text/html');
					$("head").html(htmlDoc.head.innerHTML);
					$("body").html(htmlDoc.body.innerHTML);
				},
				error: function() {
					alert("Error !!");
				}
			}
		);
	});
	
	$("#search-form").on("submit", (e) => {
		e.preventDefault();
		var page = 1;
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/ad/bookinglist',
				type: 'POST',
				data: {
					"search": $('#search').val(),
					"by": $('#by').val(),
					"page": page
				},
				success: function(data) {
					var parser = new DOMParser();
					var htmlDoc = parser.parseFromString(data, 'text/html');
					$("head").html(htmlDoc.head.innerHTML);
					$("body").html(htmlDoc.body.innerHTML);
				},
				error: function() {
					alert("Error !!");
				}
			}
		);
	});
	</script>
</body>
</html>