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
<link href="../resources/css/styles.css" rel="stylesheet">
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
		<jsp:include page="../resources/jsp/header.jsp">
			<jsp:param name="icon" value="<a style='color: black;' href='/CarPark'><i class='fa-solid fa-plane'
					style='transform: rotate(-45deg);'></i>&nbsp Trip</a>" />
		</jsp:include>
		
		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center"
			style="margin-top: 20px; display: flex; align-items: stretch !important;">
			<jsp:include page="../resources/jsp/sidebar3.jsp" >
				<jsp:param name="icon" value="tripadd" />
			</jsp:include>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh; background: #FFFFFF;">
				<div style="margin-top: 3%;">
					<h3>Add Trip</h3>
				</div>
				<hr>
				<div class="box" style="margin-top: 0; width: 100%; all: initial;">
					<form action="edittrip" method="post">
						<table style="width: 50%;">
						<tr>
								<td><strong>ID</strong></td>
								<td><input class="box" type="text" name="tripId"
									value="${trip.tripId}" readonly  maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Destination</strong></td>
								<td><input class="box" type="text" name="destination"
									value="${trip.destination}" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Departure time </strong></td>
								<td><input class="box" name="time" value="${trip.departureTime}"  type="time" style="align-items: inherit;">
							</tr>
							<tr>
								<td><strong>Driver </strong></td>
								<td><input class="box" type="text" name="driver"
									value="${trip.driver}" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Car Type </strong></td>
								<td><input class="box" type="text" name="cartype"
									value="${trip.carType}" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Maximum online ticket number </strong></td>
								<td><input class="box" type="number" name="maxticket"
									value="${trip.maxiumOnlineTicketNumber}" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Departure Date </strong></td>
								<td><input class="box" type="date" name="date"
									       value="${trip.departureDate}" maxlength="50"/></td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top: 3%; text-align: center;">
									<button
										style="font-size: 1.2em; padding: 1%; background: #F0AD4E"
										type="reset">
										<i class="fa-solid fa-rotate-left"></i> Reset
									</button>
									<button style="font-size: 1.2em; padding: 1%" type="submit">
										<i class="fa-solid fa-edit"></i> Edit
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