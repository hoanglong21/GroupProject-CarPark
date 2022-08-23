<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="../resources/jsp/header.jsp">
			<jsp:param name="icon"
				value="<a style='color: black;' href='/CarPark'><i
					class='fa-solid fa-users'></i>&nbsp Employee</a>" />
		</jsp:include>

		<!-- <div class="container justify-content-center " style="margin-top: 50px;"> -->
		<div class="row align-items-center"
			style="margin-top: 20px; display: flex; align-items: stretch !important;">

			<jsp:include page="../resources/jsp/sidebar2.jsp">
				<jsp:param name="icon" value="list" />
			</jsp:include>

			<div class="col-10"
				style="padding-left: 2%; padding-right: 3%; min-height: 100vh;">
				<div style="margin-top: 3%;">
					<h3>Employee List</h3>
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
										type="text" placeholder="User Search" maxlength="50"
										value="${search}">
								</div>
							</div>
							<div class="col-auto" style="margin-right: 1%; width: 20%;">
								<label class="sr-only" for="place">place</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa-solid fa-filter"></i> &nbsp; Filter By
										</div>
									</div>
									<select id="by" name="by" style="width: 55%; margin: 0;"
										class="box">
										<option value="name" ${by=='name'?'selected':''}>Name</option>
										<option value="date" ${by=='date'?'selected':''}>Date</option>
										<option value="address" ${by=='address'?'selected':''}>Address</option>
										<option value="phone" ${by=='phone'?'selected':''}>Phone</option>
										<option value="department" ${by=='department'?'selected':''}>Department</option>
									</select>
								</div>
							</div>
							<div class="col-auto" style="text-align: right;">
								<button type="submit" class="btn btn-primary mb-2"
									style="background: #5BC0DE; margin-left: 0%; padding-top: 0px; padding-bottom: 0px;">Search</button>
							</div>
						</div>
					</form>
				</div>
				<div style="margin: 1% auto 2%; clear: both;">
					<table style="width: 100%;">
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Date of Birth</th>
							<th>Address</th>
							<th>Phone number</th>
							<th>Department</th>
							<th>Action</th>
						</tr>
						<c:forEach items="${requestScope.data}" var="p">
							<tr>
								<td>${p.getEmployeeId()}</td>
								<td>${p.getEmployeeFullName()}</td>
								<td>${p.getDate()}</td>
								<td>${p.getEmployeeAddress()}</td>
								<td>${p.getEmployeePhone()}</td>
								<td>${p.getDepartment()}</td>
								<td><a
									href="ViewEmployeeServlet?employeeId=${p.getEmployeeId()}"><i
										class="fa-solid fa-eye"></i> View</a></td>
							</tr>
						</c:forEach>
					</table>
					<c:set var="page" value="${requestScope.page}" />
					<c:set var="num" value="${requestScope.num}" />
					<ul class="pagination">
						<li
							class="paginate_button page-item previous ${page==1?'disabled':''}"
							id="zero-conf_previous"><a
							href="ListEmployeeServlet?page=${page-1}"
							aria-controls="zero-conf" data-dt-idx="${i}"
							aria-controls="zero-conf" data-dt-idx="0" tabindex="0"
							class="page-link btn-last">Previous</a></li>
						<c:forEach begin="${1}" end="${requestScope.num}" var="i">
							<li class="paginate_button page-item ${page==i?'active':''}">
								<a href="ListEmployeeServlet?page=${i}"
								aria-controls="zero-conf" data-dt-idx="${i}" tabindex="0"
								class="page-link btn-last">${i}</a>
							</li>
						</c:forEach>
						<li
							class="paginate_button page-item next ${page==num?'disabled':''}"
							id="zero-conf_next"><a
							href="ListEmployeeServlet?page=${page+1}"
							aria-controls="zero-conf" data-dt-idx="4" tabindex="0"
							class="page-link btn-last">Next</a></li>
					</ul>
				</div>

				
			</div>
		</div>
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
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/ad/bookinglist',
				type: 'POST',
				data: {
					
					"search": $('#search').val(),
					"by": $('#by').val(),
					"page": page
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
		$.ajax(
			{
				url: 'http://localhost:8080/CarPark/ad/bookinglist',
				type: 'POST',
				data: {
					"search": $('#search').val(),
					"by": $('#by').val(),
					"page": page
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