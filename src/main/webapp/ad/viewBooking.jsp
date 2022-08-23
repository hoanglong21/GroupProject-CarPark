<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<jsp:param name="icon" value="<a style='color: black;' href='/CarPark'><i
					class='fa-solid fa-cart-plus'></i>&nbsp Booking Office</a>" />
		</jsp:include>
		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center" style="margin-top: 20px;">
			<jsp:include page="../resources/jsp/sidebar.jsp" >
				<jsp:param name="icon" value="bookingadd" />
			</jsp:include>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh; background: #FFFFFF;">
				<div style="margin-top: 3%;">
					<h3>View Booking Office</h3>
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