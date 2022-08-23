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
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button ${param.icon=='triplist' || param.icon=='tripadd'?'':'collapsed'}"
								style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseZero" aria-expanded="${param.icon=='triplist' || param.icon=='tripadd'?true:false}"
								aria-controls="collapseZero">
								<i class="fa-solid fa-plane" style="transform: rotate(-45deg);"></i>
								&nbsp Trip manager
							</button>
						</h2>
						<div id="collapseZero" style="background: #F8F8F8;"
							class="accordion-collapse ${param.icon=='triplist' || param.icon=='tripadd'?'collapse show':'collapsed collapse'}"
							aria-labelledby="headingZero" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='triplist'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="triplist"><i
										class="fa-solid fa-list"></i> Trip list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='tripadd'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="addtrip"><i
										class="fa-solid fa-plus"></i> Add Trip</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button ${param.icon=='ticketlist' || param.icon=='ticketadd'?'':'collapsed'}"
								style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseOne" aria-expanded="${param.icon=='ticketlist' || param.icon=='ticketadd'?true:false}"
								aria-controls="collapseOne">
								<i class="fa-solid fa-ticket" style="transform: rotate(-45deg);"></i>
								&nbsp Ticket manager
							</button>
						</h2>
						<div id="collapseOne" style="background: #F8F8F8;"
							class="accordion-collapse ${param.icon=='ticketlist' || param.icon=='ticketadd'?'collapse show':'collapsed collapse'}"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body" style="padding: 0px;">
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='ticketlist'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="ticketlist"><i
										class="fa-solid fa-list"></i> Ticket list</a>
								</div>
								<div class="border long abit"
									style="padding-left: 25px; border: none !important; ${param.icon=='ticketadd'?'background: #EEEEEE;':''}">
									<a class="dropdown-item" href="addticket">
									<i class="fa-solid fa-plus"></i> Add Ticket</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
</body>
</html>