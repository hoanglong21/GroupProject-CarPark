<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>View Booking Office</title>
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
				<a style="color: black;" href="#"><i
					class="fa-solid fa-cart-plus"></i>&nbsp Booking Office</a>

				<div style="text-align: right;">
					<a id="logout-link"> Welcome Long</a> &nbsp &nbsp <a
						id="logout-link"><i class="fa-solid fa-right-from-bracket"></i>
						Logout</a>

				</div>
			</div>
		</nav>
		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center" style="margin-top: 20px;">
			<div class="col-2 border" style="height: 100vh; padding-right: 0;">
				<div class="border long abit" style="background: #EEEEEE;">
					<a id="view-link"><i class="fa-solid fa-gauge-high"></i> Car
						park manager</a>
				</div>
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed"
								style="background: #F8F8F8; padding-left: 7px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseZero" aria-expanded="false"
								aria-controls="collapseOne">
								<i class="fa-solid fa-car"></i>&nbspCar manager
							</button>
						</h2>
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
								<i class="fa-solid fa-cart-plus"></i>&nbspBooking office manager
							</button>
						</h2>
						<div id="collapseOne" style="background: #F8F8F8;"
							class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important;">
									<a class="dropdown-item" href="bookinglist"><i
										class="fa-solid fa-list"></i> Booking office list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important;">
									<a class="dropdown-item" href="addbooking"><i
										class="fa-solid fa-plus"></i> Add booking office</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed"
								style="background: #F8F8F8; padding-left: 7px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseOne">
								<i class="fa-solid fa-location-dot"></i>&nbspParking lot manager
							</button>
						</h2>
					</div>
				</div>
			</div>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh; background: #FFFFFF;">
				<div style="margin-top: 3%;">
					<h3>Vie Booking Office</h3>
				</div>
				<hr>
				<div class="box" style="margin-top: 0; width: 100%; all: initial;">
					<table style="width: 50%;">
						<tr>
							<td><strong>ID</strong></td>
							<td><input class="box" type="text" name="officeId" readonly
								value="${element.officeId}" /></td>
						</tr>
						<tr>
							<td><strong>Booking office name</strong></td>
							<td><input class="box" type="text" name="officeName" readonly
								value="${element.officeName}" /></td>
						</tr>
						<tr>
							<td><strong>Trip</strong></td>
							<td><input class="box" type="text" name="tripDestination" readonly
								value="${element.tripId} - ${element.tripDestination}" /></td>
						</tr>
						<tr>
							<td><strong>Phone number</strong></td>
							<td><input class="box" type="number" name="officePhone" readonly
								value="${element.officePhone }" /></td>
						</tr>
						<tr>
							<td><strong>Place</strong></td>
							<td><input class="box" type="text" name="officePlace" readonly
								value="${element.officePlace }" /></td>
						</tr>
						<tr>
							<td><strong>Price</strong></td>
							<td><input class="box" type="number" name="officePrice" readonly
								value="${element.officePrice }" />
							<td><strong>&nbsp&nbsp&nbsp(VND)</strong>
						</tr>
						<tr>
							<td><strong>Contract deadline</strong></td>
							<td>
								<table style="width: 100%;">
									<tr>
										<td><label class="box long"
											style="font-weight: 100; margin: 0; background: #EEEEEE; padding: 6%;">From
												date</label></td>
										<td><input class="box" id="from" type="date" name="from" readonly
											value="${element.startContractDeadline }" /></td>
									</tr>
									<tr>
										<td><label class="box long"
											style="font-weight: 100; margin: 0; background: #EEEEEE; padding: 6%;"
											" for="to">To date</label></td>
										<td><input class="box" id="to" type="date" name="to" readonly
											value="${element.endContractDeadline }" /></td>
									</tr>
								</table>
							</td>

						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- </div> -->
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</body>
</html>