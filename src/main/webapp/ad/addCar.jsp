<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Booking Office List</title>
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
					class='fa-solid fa-car'></i>&nbsp Car</a>" />
		</jsp:include>

		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center" style="margin-top: 20px;">
			<jsp:include page="../resources/jsp/sidebar.jsp">
				<jsp:param name="icon" value="caradd" />
			</jsp:include>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh; background: #FFFFFF;">
				<div style="margin-top: 3%;">
					<h3>Add Booking Office</h3>
				</div>
				<hr>
				<div class="box" style="margin-top: 0; width: 100%; all: initial;">
					<form class="add" action="AddCar" method="post">
						<table>
							<tr>
								<td style=" width: 45%; ">License plate <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" class="required" type="text" name="licensePlate"
									id="" placeholder="Enter License plate"></td>
							</tr>
							<tr>
								<td>Car type</td>
								<td><input class="box" class="required" type="text" name="carType"
									id="" placeholder="Enter car type"></td>
							</tr>
							<tr>
								<td>Car color</td>
								<td><input class="box" class="required" type="text" name="carColor"
									id="" placeholder="Enter car color"></td>
							</tr>
							<tr>
								<td>Company <span style="color: red">(*)</span>:
								</td>
								<td><select class="box" name="Conpany" id="">
										<option value="ABC">ABC</option>
										<option value="XYZ">XYZ</option>
								</select></td>
							</tr>
							<tr>
								<td>Parking lot <span style="color: red">(*)</span>:
								</td>
								<td><select class="box" name="Parkinglot" id="">
										<c:forEach items="${list }" var="i">
											<option value="${i.parkId}">${i.parkName }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="reset"
										style="background-color: #F0B25D; padding: 0.5rem; font-size: 1em; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #F0B25D;">
										<i class="fa-solid fa-arrow-rotate-left"></i>Reset
									</button>
									<button class="box" type="submit"
										style="background-color: #5CB85C; padding: 0.5rem; font-size: 1em; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5CB85C;">
										<i class="fa fa-plus"></i> Add
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
	<script type="text/javascript">
		var check = function() {
			if (document.forms["addbooking"]["from"].value < document.forms["addbooking"]["to"].value) {
				document.forms["addbooking"]["to"].setCustomValidity('');
			} else {
				document.forms["addbooking"]["to"]
						.setCustomValidity('Invalid contract deadline');
			}
			document.forms["addbooking"]["to"].reportValidity();
		}
	</script>
</body>
</html>