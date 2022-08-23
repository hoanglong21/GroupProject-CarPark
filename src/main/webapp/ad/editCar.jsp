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
					<form class="add" action="EditCar" method="post">
						<table border="0">
							<tr>
								<td style="width: 45%;">License plate <span style="color: red">(*)</span>:
								</td>
								<td><input class="box" class="required" type="text"
									value="${r.getLicensePlate()}" name="licensePlate" id=""
									placeholder="Enter License plate"></td>
							</tr>
							<tr>
								<td>Car type</td>
								<td><input class="box" class="required" type="text"
									value="${r.getCarType()}" name="carType" id=""
									placeholder="Enter car type"></td>
							</tr>
							<tr>
								<td>Car color</td>
								<td><input class="box" class="required" type="text"
									value="${r.getCarColor()}" name="carColor" id=""
									placeholder="Enter car color"></td>
							</tr>
							<tr>
								<td>Company <span style="color: red">(*)</span>:
								</td>
								<td><select class="box" name="company" id="">
										<option ${r.getCompany()=="Mercury"?"selected":""}
											value="Mercury">Mercury</option>
										<option ${r.getCompany()=="Volvo"?"selected":""} value="Volvo">Volvo</option>
										<option ${r.getCompany()=="Mazda"?"selected":""} value="Mazda">Mazda</option>
										<option ${r.getCompany()=="Infiniti"?"selected":""}
											value="Infiniti">Infiniti</option>
										<option ${r.getCompany()=="Dodge"?"selected":""} value="Dodge">Dodge</option>
										<option ${r.getCompany()=="pro"?"selected":""} value="pro">pro</option>
										<option ${r.getCompany()=="Cadillac"?"selected":""}
											value="Cadillac">Cadillac</option>
										<option ${r.getCompany()=="Pontiac"?"selected":""}
											value="Pontiac">Pontiac</option>
										<option ${r.getCompany()=="Nissan"?"selected":""}
											value="Nissan">Nissan</option>
										<option ${r.getCompany()=="Chevrolet"?"selected":""}
											value="Chevrolet">Chevrolet</option>
										<option ${r.getCompany()=="Saab"?"selected":""} value="Saab">Saab</option>
										<option ${r.getCompany()=="Saab"?"selected":""} value="Saab">Saab</option>
										<option ${r.getCompany()=="Ford"?"selected":""} value="Ford">Ford</option>
										<option ${r.getCompany()=="Mercedes-Benz"?"selected":""}
											value="Mercedes-Benz">Mercedes-Benz</option>
										<option ${r.getCompany()=="Plymouth"?"selected":""}
											value="Plymouth">Plymouth</option>
										<option ${r.getCompany()=="Toyota"?"selected":""}
											value="Toyota">Toyota</option>
										<option ${r.getCompany()=="Lincoln"?"selected":""}
											value="Lincoln">Lincoln</option>
										<option ${r.getCompany()=="Audi"?"selected":""} value="Audi">Audi</option>
										<option ${r.getCompany()=="Nissan"?"selected":""}
											value="Nissan">Nissan</option>
										<option ${r.getCompany()=="Mitsubishi"?"selected":""}
											value="Mitsubishi">Mitsubishi</option>
										<option ${r.getCompany()=="Acura"?"selected":""} value="Acura">Acura</option>
										<option ${r.getCompany()=="Buick"?"selected":""} value="Buick">Buick</option>
										<option ${r.getCompany()=="Hyundai"?"selected":""}
											value="Hyundai">Hyundai</option>
										<option ${r.getCompany()=="Mazda"?"selected":""} value="Mazda">Mazda</option>
										<option ${r.getCompany()=="Lexus"?"selected":""} value="Lexus">Lexus</option>
										<option ${r.getCompany()=="Austin"?"selected":""}
											value="Austin">Austin</option>
										<option ${r.getCompany()=="Land Rover"?"selected":""}
											value="Land Rover">Land Rover</option>
										<option ${r.getCompany()=="Lamborghini"?"selected":""}
											value="Lamborghini">Lamborghini</option>
										<option ${r.getCompany()=="Honda"?"selected":""} value="Honda">Honda</option>





								</select></td>
							</tr>
							<tr>
								<td>Parking lot <span style="color: red">(*)</span>:
								</td>
								<td><select class="box" name="parkId" id="">

										<option ${r.getParkId()=="87"?"selected":""} value="87">87</option>
										<option ${r.getParkId()=="72"?"selected":""} value="72">72</option>
										<option ${r.getParkId()=="48"?"selected":""} value="48">48</option>
										<option ${r.getParkId()=="82"?"selected":""} value="82">82</option>
										<option ${r.getParkId()=="88"?"selected":""} value="88">88</option>
										<option ${r.getParkId()=="77"?"selected":""} value="77">77</option>
										<option ${r.getParkId()=="7"?"selected":""} value="7">7</option>
										<option ${r.getParkId()=="8"?"selected":""} value="8">8</option>
										<option ${r.getParkId()=="33"?"selected":""} value="33">33</option>
										<option ${r.getParkId()=="29"?"selected":""} value="29">29</option>
										<option ${r.getParkId()=="27"?"selected":""} value="27">27</option>
										<option ${r.getParkId()=="47"?"selected":""} value="47">47</option>
										<option ${r.getParkId()=="26"?"selected":""} value="26">26</option>
										<option ${r.getParkId()=="51"?"selected":""} value="51">51</option>
										<option ${r.getParkId()=="32"?"selected":""} value="32">32</option>
										<option ${r.getParkId()=="4"?"selected":""} value="4">4</option>
										<option ${r.getParkId()=="70"?"selected":""} value="70">70</option>
										<option ${r.getParkId()=="79"?"selected":""} value="79">79</option>
										<option ${r.getParkId()=="36"?"selected":""} value="36">36</option>
										<option ${r.getParkId()=="92"?"selected":""} value="92">92</option>
										<option ${r.getParkId()=="18"?"selected":""} value="18">18</option>
										<option ${r.getParkId()=="86"?"selected":""} value="86">86</option>
										<option ${r.getParkId()=="10"?"selected":""} value="10">10</option>
										<option ${r.getParkId()=="21"?"selected":""} value="21">21</option>
										<option ${r.getParkId()=="100"?"selected":""} value="100">100</option>
										<option ${r.getParkId()=="75"?"selected":""} value="75">75</option>
										<option ${r.getParkId()=="3"?"selected":""} value="3">3</option>
										<option ${r.getParkId()=="69"?"selected":""} value="69">69</option>
										<option ${r.getParkId()=="6"?"selected":""} value="6">6</option>
										<option ${r.getParkId()=="35"?"selected":""} value="35">35</option>
										<option ${r.getParkId()=="72"?"selected":""} value="72">72</option>
										<option ${r.getParkId()=="5"?"selected":""} value="5">5</option>
										<option ${r.getParkId()=="32"?"selected":""} value="32">32</option>
										<option ${r.getParkId()=="42"?"selected":""} value="42">42</option>
										<option ${r.getParkId()=="94"?"selected":""} value="94">94</option>
										<option ${r.getParkId()=="56"?"selected":""} value="56">56</option>
										<option ${r.getParkId()=="19"?"selected":""} value="19">19</option>
										<option ${r.getParkId()=="53"?"selected":""} value="53">53</option>
										<option ${r.getParkId()=="63"?"selected":""} value="63">53</option>
										<option ${r.getParkId()=="96"?"selected":""} value="96">96</option>
										<option ${r.getParkId()=="37"?"selected":""} value="37">37</option>

								</select></td>
							</tr>
							<tr>
								<td colspan="2">

									<button type="submit"
										style="background-color: #5CB85C; padding: 0.5rem; font-size: 1em; margin-right: 0.5rem; border-radius: 10%; color: #fff; border: #5CB85C;">
										<i class="fa fa-update"></i>Update
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