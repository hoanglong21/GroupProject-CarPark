<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<link href="resources/css/styles.css" rel="stylesheet">
<style>
table, tr, td {
	border: none;
}

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}

/*
tr>td:nth-child(2) {
	width: 100%;
}
*/
input, select {
	width: 100% !important;
}
</style>
</head>

<body>
	<div style="overflow-x: hidden;">
		<nav class="navbar navbar-expand-lg bg-light fixed-top border">
			<div class="container-fluid">
				<a style="color: black;" href="#"> <i class="fa-solid fa-ticket"
					style="transform: rotate(-45deg);"></i>&nbsp Trip
				</a>

				<div style="text-align: right;">
					<a id="logout-link"> Welcome Long</a> &nbsp &nbsp <a
						id="logout-link"><i class="fa-solid fa-right-from-bracket"></i>
						Logout</a>

				</div>
			</div>
		</nav>
		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center"
			style="margin-top: 20px; display: flex; align-items: stretch !important;">
			<div class="col-2 border"
				style="padding-right: 0; min-height: 100vh;">

				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed"
								style="background: #F8F8F8; padding-left: 7px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse2" aria-expanded="false"
								aria-controls="collapse2">
								<i class="fa-solid fa-plane"></i>&nbsp Trip manager

							</button>
						</h2>
						<div id="collapse2" style="background: #F8F8F8;"
							class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; background: #EEEEEE;">
									<a class="dropdown-item" href="triplist"><i
										class="fa-solid fa-list"></i> Trip list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important;">
									<a class="dropdown-item" href="addTrip.jsp">
									<i class="fa-solid fa-plus"></i> Add Trip </a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button"
								style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">
								<i class="fa-solid fa-ticket" style="transform: rotate(-45deg);"></i>
								&nbsp Ticket manager
							</button>
						</h2>
						<div id="collapseOne" style="background: #F8F8F8;"
							class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important;">
									<a class="dropdown-item" href="ticketlist"><i
										class="fa-solid fa-list"></i> Ticket list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; background: #EEEEEE;">
									<a class="dropdown-item" href="addticket">
									<i class="fa-solid fa-plus"></i> Add Ticket</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh; background: #FFFFFF;">
				<div style="margin-top: 3%;">
					<h3>Add Trip</h3>
				</div>
				<hr>
				<div class="box" style="margin-top: 0; width: 100%; all: initial;">
					<form action="addticket" method="post">
						<table style="width: 50%;">
							<tr>
								<td><strong>Destination (*)</strong></td>
								<td><input class="box" type="text" name="destination"
									placeholder="Enter destination" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Departure time (*)</strong></td>
								<td><input class="box" name="time" type="time" style="align-items: inherit;">
							</tr>
							<tr>
								<td><strong>Driver (*)</strong></td>
								<td><input class="box" type="text" name="driver"
									placeholder="Enter driver" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Car Type (*)</strong></td>
								<td><input class="box" type="text" name="cartype"
									placeholder="Enter car type" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Maximum online ticket number (*)</strong></td>
								<td><input class="box" type="number" name="maxticket"
									value="0" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Departure Date (*)</strong></td>
								<td><input class="box" type="date" name="date"
									        maxlength="50"/></td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top: 3%; text-align: center;">
									<button
										style="font-size: 1.2em; padding: 1%; background: #F0AD4E"
										type="reset">
										<i class="fa-solid fa-rotate-left"></i> Reset
									</button>
									<button style="font-size: 1.2em; padding: 1%" type="submit">
										<i class="fa-solid fa-plus"></i> Add
									</button>
								</td>
							</tr>
						</table>

					</form>

				</div>
			</div>
		</div>
		<!-- </div> -->
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
</body>
</html>