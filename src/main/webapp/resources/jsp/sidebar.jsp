<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-2 border" style="padding-right: 0; min-height: 100vh;">
				<div class="border long abit" style="background: #EEEEEE;">
					<a id="view-link"><i class="fa-solid fa-gauge-high"></i> Car
						park manager</a>
				</div>				
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button ${param.icon=='carlist' || param.icon=='caradd'?'':'collapsed'}"
								style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseZero" aria-expanded="${param.icon=='carlist' || param.icon=='caradd'?true:false}"
								aria-controls="collapseZero">
								<i class="fa-solid fa-car"></i>&nbspCar manager
							</button>
						</h2>
						<div id="collapseZero" style="background: #F8F8F8;"
							class="accordion-collapse ${param.icon=='carlist' || param.icon=='caradd'?'collapse show':'collapsed collapse'}"
							aria-labelledby="headingZero" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='carlist'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="listcar"><i
										class="fa-solid fa-list"></i> Car list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='caradd'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="AddCar"><i
										class="fa-solid fa-plus"></i> Add Car</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button ${param.icon=='bookinglist' || param.icon=='bookingadd'?'':'collapsed'}"
								style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseOne" aria-expanded="${param.icon=='bookinglist' || param.icon=='bookingadd'?true:false}"
								aria-controls="collapseOne">
								<i class="fa-solid fa-cart-plus"></i>&nbspBooking office manager
							</button>
						</h2>
						<div id="collapseOne" style="background: #F8F8F8;"
							class="accordion-collapse ${param.icon=='bookinglist' || param.icon=='bookingadd'?'collapse show':'collapsed collapse'}"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='bookinglist'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="bookinglist"><i
										class="fa-solid fa-list"></i> Booking office list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='bookingadd'?'background: #EEEEEE;':''}">
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
							<button class="accordion-button ${param.icon=='parkinglist' || param.icon=='parkingadd'?'':'collapsed'}"
								style="background: #F8F8F8; padding-left: 7px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseTwo" aria-expanded="${param.icon=='bookinglist' || param.icon=='bookingadd'?true:false}"
								aria-controls="collapseOne">
								<i class="fa-solid fa-location-dot"></i>&nbspParking lot manager
							</button>
						</h2>
						<div id="collapseTwo" style="background: #F8F8F8;"
							class="accordion-collapse ${param.icon=='parkinglist' || param.icon=='parkingadd'?'collapse show':'collapsed collapse'}"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='parkinglist'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="ParkingLotList"><i
										class="fa-solid fa-list"></i> Parking lot list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='parkingadd'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="AddParkingLot"><i
										class="fa-solid fa-plus"></i> Add parking lot</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>