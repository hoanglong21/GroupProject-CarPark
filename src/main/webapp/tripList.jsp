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
table, tr, td, th {
	border: 1px solid #D6D6D6;
	padding: 0.5%;
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
</style>
</head>

<body>
	<div style="overflow-x: hidden;">
		<nav class="navbar navbar-expand-lg bg-light fixed-top border">
			<div class="container-fluid">
				<a style="color: black;" href="#"> <i class="fa-solid fa-plane"
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
							<button class="accordion-button"
								style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse2" aria-expanded="true"
								aria-controls="collapse2">
								<i class="fa-solid fa-plane" style="transform: rotate(-45deg);"></i>
								&nbsp Trip manager
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
									style="padding-left: 25px; border: none !important; background: #EEEEEE;">
									<a class="dropdown-item" href="ticketlist"><i
										class="fa-solid fa-list"></i> Ticket list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important;">
									<a class="dropdown-item" href="addticket">
									<i class="fa-solid fa-plus"></i> Add Ticket</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh;">
				<div style="margin-top: 3%;">
					<h3>Ticket List</h3>
				</div>
				<hr>
				<div class="box" style="margin-top: 0; width: 100%; all: initial">
					<form style="all: initial;" id="search-form" action="bookinglist"
						method="post">
						<div class="form-row align-items-center"
							style="display: flex; justify-content: flex-end;">

							<div class="col-auto" style="margin-right: 1%; width: 30%;">
								<label class="sr-only" for="search">search</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text" style="height: 100%;">
											<i class="fa-solid fa-magnifying-glass"></i>
										</div>
									</div>
									<input id="search" name="search" class="form-control"
										type="text" placeholder="Ticket Search" maxlength="50"
										value="${search}" >
								</div>
							</div>
						
							<div class="col-auto" style="text-align: right;">
								<button type="submit" class="btn btn-primary mb-2"
									style="background: #5BC0DE; margin-left: 0%; padding-top: 0px; padding-bottom: 0px;">Search</button>
							</div>
							<div class="col-auto" style="margin: 0 1% 0 2%;width: 5%;">
								<label class="sr-only" for="place">place</label>
								<div class="input-group mb-2">
									
									<select id="day" name="day" style="padding: 15%;margin: 0 7%;"
									class="box">
									<c:forEach var="i" begin="1" end="31">
										<option ${day==i?'selected':''} value="${i}">${i}</option>
									</c:forEach>
								</select>
								</div>
							</div>
							<div class="col-auto" style="width: 5%;margin-right: 1%;">
								<label class="sr-only" for="place">place</label>
								<div class="input-group mb-2">
									
									<select id="month" name="month" style="padding: 15%;margin: 0 7%;"
									class="box">
									<c:forEach var="i" begin="1" end="12">
										<option ${month==i?'selected':''} value="${i}">${i}</option>
									</c:forEach>
								</select>
								</div>
							</div>
							<div class="col-auto" style="margin-right: 1.5%;width: 5%;">
								<label class="sr-only" for="place">place</label>
								<div class="input-group mb-2">
									
									<select id="year" name="year" style="padding: 15%;margin: 0 7%;"
									class="box">
									<c:forEach var="i" begin="0" end="22">
									 	<c:set var = "currentYear" value = "${2022 - i}"/>
										<option ${year == currentYear?'selected':''} value="${2022 - i}">${2022 - i}</option>
									</c:forEach>
								</select>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div style="margin: 1% auto 2%; clear: both;">
					<table style="width: 100%;">
						<thead>
							<tr style="background: #EEEEEE">
								<th style="width: 5%;">No</th>
								<th style="width: 20%;">Destination</th>
								<th style="width: 20%;">Departure Time</th>
								<th style="width: 20%;">Driver</th>
								<th style="width: 15%;">Car Type</th>
								<th style="width: 15%;">Booked ticket number</th>
								<th style="width: 10%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listtrip}" var="i">
								<tr>
									<td>${i.tripId}</td>
									<td>${i.destination}</td>
									<td>${fn:substring(i.departureTime, 0, 5)}</td>
									<td>${i.driver}</td>
									<td>${i.carType}</td>
									<td>${i.bookedTicketNumber}</td>
									
									<td>
									<a href="#" class="edittrip"
									 id="edittrip-${i.tripId}"><i class="fa-solid fas fa-edit"></i> Edit</a>
									<a href="#" class="delete"
									 id="delete-${i.tripId}"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

				<input type="hidden" id="page" value="${page}"> <input
					type="hidden" id="totalPage" value="${totalPage}">
				<button class="btn-last" id="p">Previous</button>
				<c:forEach var="i" begin="1" end="${totalPage}">
					<button class="btn-last ${i==page?'my-active':''}" id="${i}">${i}</button>
				</c:forEach>

				<button class="btn-last" id="n">Next</button>
			</div>
		</div>
		<!-- </div> -->
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
		var day =  $('#day').val();
		var month =  $('#month').val();
		var year =  $('#year').val();
		var date = new Date("" + year + "/" + month + "/" + day);
		 if (date.getFullYear() != year || (date.getMonth()+1) != month && date.getDate() != day) {
			alert("Invalid Date, try again")
			return;
		 }
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/triplist',
				type: 'POST',
				data: {
					
					"search": $('#search').val(),
					"by": $('#by').val(),
					"page": page,
					"day": day,
					"month": month,
					"year": year
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
		var day =  $('#day').val();
		var month =  $('#month').val();
		var year =  $('#year').val();
		var date = new Date("" + year + "/" + month + "/" + day);
		 if (date.getFullYear() != year || (date.getMonth()+1) != month && date.getDate() != day) {
			alert("Invalid Date, try again")
			return;
		 }
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/triplist',
				type: 'POST',
				data: {
					"search": $('#search').val(),
					"by": $('#by').val(),
					"page": page,
					"day": day,
					"month": month,
					"year": year
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
	
	$(".delete").on("click", (e) => {
		//e.preventDefault();
		var target = e.target;
		var ticketId = target.id;
		if (confirm("Are you sure you want to delete this item?") == false) {
			return;
		}
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/deleteticket',
				type: 'Post',
				data: {
					"ticketId": ticketId
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