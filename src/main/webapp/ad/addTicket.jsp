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
			<jsp:param name="icon" value="<a style='color: black;' href='/CarPark'><i class='fa-solid fa-ticket'
					style='transform: rotate(-45deg);'></i>&nbsp Trip</a>" />
		</jsp:include>
		
		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center"
			style="margin-top: 20px; display: flex; align-items: stretch !important;">
			<jsp:include page="../resources/jsp/sidebar3.jsp" >
				<jsp:param name="icon" value="ticketadd" />
			</jsp:include>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh; background: #FFFFFF;">
				<div style="margin-top: 3%;">
					<h3>Add Ticket</h3>
				</div>
				<hr>
				<div class="box" style="margin-top: 0; width: 100%; all: initial;">
					<form action="addticket" method="post">
						<table style="width: 50%;">
							<tr>
								<td><strong>Customer (*)</strong></td>
								<td><input class="box" type="text" name="customer" required
									placeholder="Enter customer name" maxlength="50"/></td>
							</tr>
							<tr>
								<td><strong>Booking time (*)</strong></td>
								<td><input class="box" name="time" required
								type="time" style="align-items: inherit;">
							</tr>
							<tr>
								<td><strong>Trip (*)</strong></td>
								<td><select class="box" name="trip" required>
										<c:forEach items="${list}" var="i">
											<option value="${i.tripId}">${i.destination}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td><strong>License plate (*)</strong></td>
								<td><select class="box" name="license" required>
										<c:forEach items="${list2}" var="i">
											<option value="${i.licensePlate}">${i.licensePlate}</option>
										</c:forEach>
								</select></td>
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