<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Check in</title>
</head>
<jsp:include page="includes.jsp"></jsp:include>
<body style="background-color: #f3f2ef;">
 

	<!-- navbar code starts here -->
	<div class="navbar">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<a class="navbar-brand" href="#">ParkSmart</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="getAdminHome">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="vehicleRegistration">Vehicle Registration</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="getcheckinForm">Check in</a></li>
					<li class="nav-item"><a class="nav-link"
						href="getcheckOutForm">Check out</a></li>
					
						<li class="nav-item"><a class="nav-link" href="#"
						tabindex="-1" aria-disabled="true">Price Updation</a></li>
							<li class="nav-item"><a class="nav-link"
						href="getReports" tabindex="-1" aria-disabled="true">Reports</a></li>
						<li class="nav-item"><a class="nav-link" href="adminLogout">Logout</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<!-- navbar code ends here -->


	<div class="contianer-fluid" style="padding: 80px 300px 50px 300px;">
		<c:if test="${vehicle.status == '1'}">
			<div class="alert alert-warning alert-dismissible fade show" id="warning-alert">
				<strong>Warning!</strong> Vehicle has already checked in!
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
		<c:if test="${booked}">
			<div class="alert alert-warning alert-dismissible fade show" id="warning-alert">
				<strong>Warning!</strong> This slot is already booked!
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
			
		<c:if test="${userNotFound}">
			<div class="alert alert-warning alert-dismissible fade show" id="warning-alert">
				<strong>Warning!</strong> Vehicle not Found!
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
		<div class="card ">
			<div class="card-body">
				<form action="getVehicleByRegId" style="width: 100%;"
					class="form-inline">
					<div class="form-group " style="padding-top: 10px; width: 100%;">
						<input type="hidden" name="type" value="checkin" /> <input
							required type="text" value="${vehicle.regId}"
							class="form-control"
							style="width: 70%; margin-left: 50px; margin-right: 20px"
							name="regId" id="exampleFormControlInput1"
							placeholder="Enter Registration Number to Fetch Details EX:TSAB12345">
						<button type="submit" class="btn btn-outline-success">Fetch
							Details</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="contianer-fluid" style="padding: 0px 300px 50px 300px;">
		<c:if test="${saved}">
			<div class="alert alert-success alert-dismissible fade show" id="success-alert">
				<strong>Success!</strong> Vehicle has been checked in successfully.
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>

		<div class="card ">
			<div class="card-body">
				<h5 class="card-header" style="text-align: center">Vehicle
					Check in</h5>
				<form action="checkinVehicle" method="post">
					<div class="form-group" style="padding-top: 10px">
						<label for="exampleFormControlInput1">Registration Number</label>
						<input type="text" name="regId" class="form-control"
							value="${vehicle.regId}" id="exampleFormControlInput1"
							placeholder="VECH123">
					</div>
					<div class="form-group">
						<label for="exampleFormControlSelect1">Vehicle Type</label> <select
							name="vehicle_type" class="form-control"
							id="exampleFormControlSelect1">
							<option value="2 wheeler"
								<c:if test="${vehicle.vehicle_type == '2 wheeler'}"> selected </c:if>>2
								wheeler</option>
							<option value="4 wheeler"
								<c:if test="${vehicle.vehicle_type == '4 wheeler'}"> selected </c:if>>4
								wheeler</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">Model</label>
						<textarea class="form-control" name="model"
							id="exampleFormControlTextarea1" rows="3">${vehicle.model}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput2">Owner Name</label> <input
							type="text" class="form-control" name="owner_name"
							value="${vehicle.owner_name}" id="exampleFormControlInput2"
							placeholder="Name">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput3">Age</label> <input
							type="number" class="form-control" name="age"
							value="${vehicle.age}" id="exampleFormControlInput3"
							placeholder="34">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput4">Contact</label> <input
							type="number" class="form-control" name="contact"
							value="${vehicle.contact}" id="exampleFormControlInput4"
							placeholder="9000******">
					</div>
					<div class="form-group">
								<label for="exampleFormControlSelect5">Parking Levels</label>
								 <select class="form-control" id="exampleFormControlSelect5"
									required="required" name="parkingLevel" onChange="getSlots(this)">
									
										<c:forEach var="i" begin="1" end="${malls.parking_level}">
										<option>${i}</option>
									</c:forEach>
									
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect6">Slots</label> <select
									class="form-control" id="exampleFormControlSelect6"
									required="required" name="slot">
									<c:forEach var="i" begin="1" end="${malls.slot}">
										<option>${i}</option>
									</c:forEach>
									
								</select>
							</div>
					<c:choose>
						<c:when test="${vehicle.status == '0' || vehicle.status == '2'}">
							<button type="submit" class="btn btn-primary">Check in</button>
						</c:when>
						<c:otherwise>
							<button type="submit" disabled class="btn btn-primary">Check
								in</button>
						</c:otherwise>
					</c:choose>
				</form>
				<form style="float: right;" action="vehicleRegistration">
					<button type="submit" style="position: relative; bottom: 37px;"
						class="btn btn-primary">New Register</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	
	$("#warning-alert").fadeTo(2000, 300).slideUp(300, function(){
	    $("#warning-alert").slideUp(300);
	});
	$("#success-alert").fadeTo(2000, 300).slideUp(300, function(){
	    $("#success-alert").slideUp(300);
	});
	
		function onNewRegisterClick() {
			$.ajax({
				url : "/vehicleRegistration",
				cache : false,
				success : function(html) {
				}
			});
		}
		function getSlots(park){
			$.ajax({
				url : "/getSlots",
				 type: 'GET',
				data: { parkingLevel: park.value} ,
				cache : false,
				success : function(html) {
					console.log("success");
				}
			});
			
		}
		
	</script>
</body>
</html>