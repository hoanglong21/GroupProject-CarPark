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
			<a id="view-link"><i class="fa-solid fa-gauge-high"></i>Dashboard </a>
		</div>
		<div class="accordion">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button"
						style="background: #F8F8F8; padding-left: 5px; color: #897AB7;"
						type="button" data-bs-toggle="collapse"
						data-bs-target="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">
						<i class="fa-solid fa-chart-column"></i>&nbspEmployee manager
					</button>
				</h2>
				<div id="collapseOne" style="background: #F8F8F8;"
					class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body" style="padding: 0px;">
						<div class="border long abit"
							style="padding-left: 25px; border: none !important; ${param.icon=='list'?'background: #EEEEEE;':''} ">
							<a class="dropdown-item" href="ListEmployeeServlet"><i
								class="fa-solid fa-list"></i> Employee list</a>
						</div>
						<div class="border long abit"
							style="padding-left: 25px; border: none !important;  ${param.icon=='add'?'background: #EEEEEE;':''}">
							<a class="dropdown-item" href="AddEmployeeServlet"><i
								class="fa-solid fa-plus"></i> Add Employee</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>