<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>

	<!-- Side Navigation -->
	<nav class="w3-sidebar w3-bar-block w3-card w3-animate-left w3-center"
		style="display: none" id="mySidebar">
		<h1 class="w3-xxxlarge w3-text-theme">Side Navigation</h1>
		<button class="w3-bar-item w3-button" onclick="w3_close()">
			Close <i class="fa fa-remove"></i>
		</button>
		<a href="/CarPark/hr/ListEmployeeServlet" class="w3-bar-item w3-button">Employee List</a> 
		<a href="/CarPark/ad/bookinglist" class="w3-bar-item w3-button">Booking Office List</a> 
		<a href="/CarPark/ad/ParkingLotList" class="w3-bar-item w3-button">Parkinglot List</a> 
		<a href="/CarPark/ad/listcar" class="w3-bar-item w3-button">Car List</a>
		<a href="/CarPark/ad/triplist" class="w3-bar-item w3-button">Trip List</a>
		<a href="/CarPark/ad/ticketlist" class="w3-bar-item w3-button">Ticket List</a>
	</nav>

	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">
		<i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"
			style="float: left;"></i>
		<div class="w3-right">
			<a id="logout-link" href="/CarPark/hr/ViewEmployeeServlet?employeeId=${account.employeeId }"> ${account==null?'Login':'Welcome' } ${account.employeeFullName }</a> &nbsp &nbsp <a
						id="logout-link" href="/CarPark/LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i>
						Logout</a>

		</div>
		<div class="w3-center" style="clear: both;">
			<h4>Car Park Management System</h4>
			<h1 class="w3-xxxlarge w3-animate-bottom">CAR PARK</h1>

		</div>

	</header>


	<div class="w3-row-padding w3-center w3-margin-top">
		<div class="w3-third">
			<div class="w3-card w3-container"
				style="display: flex; min-height: 460px; justify-content: center; align-items: center;">
				<div>
					<h3>Employee management</h3>
					<br> <i class="fa-solid fa-people-group"
						style="font-size: 120px"></i>
					<p>Add employee</p>
					<p>Employee list</p>
				</div>
			</div>
		</div>

		<div class="w3-third">
			<div class="w3-card w3-container"
				style="display: flex; min-height: 460px; justify-content: center; align-items: center;">
				<div>
					<h3>Booking office management</h3>
					<br> <i class="fa-solid fa-cart-plus" style="font-size: 120px"></i>
					<p>Booking office list</p>
					<p>Add booking office</p>
					<p>View booking office</p>
				</div>
			</div>
		</div>

		<div class="w3-third">
			<div class="w3-card w3-container"
				style="display: flex; min-height: 460px; justify-content: center; align-items: center;">
				<div>
					<h3>Parking lot management</h3>
					<br> <i class="fa-solid fa-location-dot"
						style="font-size: 120px"></i>
					<p>Parking lot list</p>
					<p>Add parking lot</p>
				</div>
			</div>
		</div>
	</div>

	<div class="w3-row-padding w3-center w3-margin-top">
		<div class="w3-third">
			<div class="w3-card w3-container"
				style="display: flex; min-height: 460px; justify-content: center; align-items: center;">
				<div>
					<h3>Car management</h3>
					<br> <i class="fa-solid fa-car" style="font-size: 120px"></i>
					<p>Car list</p>
					<p>Add car</p>
				</div>
			</div>
		</div>

		<div class="w3-third">
			<div class="w3-card w3-container"
				style="display: flex; min-height: 460px; justify-content: center; align-items: center;">
				<div>
					<h3>Trip management</h3>
					<br> <i class="fa-solid fa-plane"
						style="rotate: -45deg; font-size: 120px"></i>
					<p>Trip list</p>
					<p>Add trip</p>
				</div>
			</div>
		</div>

		<div class="w3-third">
			<div class="w3-card w3-container"
				style="display: flex; min-height: 460px; justify-content: center; align-items: center;">
				<div>
					<h3>Ticket management</h3>
					<br> <i class="fa-solid fa-ticket"
						style="rotate: -45deg; font-size: 120px"></i>
					<p>Ticket list</p>
					<p>Add ticket</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-theme-dark w3-padding-16"
		style="margin-top: 1%;">
		<h3 style="text-align: center;">CARPARK</h3>
	</footer>

	<!-- Script for Sidebar, Tabs, Accordions, Progress bars and slideshows -->
	<script>
		// Side navigation
		function w3_open() {
			var x = document.getElementById("mySidebar");
			x.style.width = "100%";
			x.style.fontSize = "40px";
			x.style.paddingTop = "10%";
			x.style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}
	</script>

</body>
</html>
