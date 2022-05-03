<%@page import="com.example.demo.model.VehiclePrice"%>
<%@page import="com.example.demo.model.Vehicle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Check out </title>
</head>
<jsp:include page="includes.jsp"></jsp:include>

<body style="background-color: #f3f2ef;">
	<%@ page import="java.util.*,java.text.*"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.util.*"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Calendar"%>

	<%
	int totalHours = 0;
	int price = 0;
	String checkedInDate = "";
	boolean checkoutForm;
	checkoutForm = (boolean) request.getSession().getAttribute("checkoutForm");
	if (!checkoutForm) {
		checkedInDate = (String) request.getSession().getAttribute("checkedin_dt");
		price = (int) request.getSession().getAttribute("price");

		if (checkedInDate != null) {
			SimpleDateFormat parser = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Date startTime = parser.parse(checkedInDate);
			Date endTime = new Date();
			final int MILLI_TO_HOUR = 1000 * 60 * 60;
			totalHours = (int) (endTime.getTime() - startTime.getTime()) / MILLI_TO_HOUR;
		}
	}
	%>

	<!-- nav bar code starts -->
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
					<li class="nav-item"><a class="nav-link" href="getcheckinForm">Check
							in</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="getcheckOutForm">Check out</a></li>

					<li class="nav-item"><a class="nav-link"
						href="priceUpdateForm" tabindex="-1" aria-disabled="true">Price
							Updation</a></li>
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
		<c:if test="${saved}">
			<div class="alert alert-success alert-dismissible fade show" id="success-alert">
				<strong>Success!</strong> Vehicle has been checked out successfully.
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
		<c:if test="${vehicle.status == '0' && !saved}">
			<div class="alert alert-warning alert-dismissible fade show" id="warning-alert">
				<strong>Warning!</strong> Vehicle has not been checked in!
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
		<c:if test="${vehicle.status == '2'}">
			<div class="alert alert-warning alert-dismissible fade show" id="warning-alert">
				<strong>Warning!</strong> Vehicle has already checked out!
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
						<input type="hidden" name="type" value="checkout" /> <input
							type="text" value="${vehicle.regId}" required
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

		<div class="card ">
			<div class="card-body">
				<h5 class="card-header" style="text-align: center">Vehicle
					Check out</h5>
				<form action="checkoutVehicle" method="post">
					<div class="form-group" style="padding-top: 10px">
						<label for="exampleFormControlInput1">Registration Number</label>
						<input type="text" name="regId" class="form-control"
							value="${vehicle.regId}" id="exampleFormControlInput1"
							placeholder="VECH123">
					</div>
					<div class="form-group">
						<label for="exampleFormControlSelect1">Vehicle Type</label> <select
							class="form-control" name="vehicle_type"
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
							value="${vehicle.model}" id="exampleFormControlTextarea1"
							rows="3"></textarea>
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


				<!--	<table class="table" style="margin-top: 30px">
						<tbody>
							<tr>
								<th scope="row">Price per hour :</th>
								<td><%= price %></td>
							</tr>
							<tr>
								<th scope="row">Time Spent :</th>
								<td><%=totalHours%> Hours</td>
							</tr>
							<tr>
								<th scope="row">check in date :</th>
								<td>${checkin.checkin_dt}</td>
							</tr>
							<tr>
								<th scope="row">Total Amount :</th>
								<td><%=price * totalHours%></td>
							</tr>
						</tbody>
					</table>-->
						<c:choose>
						<c:when test="${vehicle.status == '1'}">
							<button type="submit" class="btn btn-primary">Check out</button>
						</c:when>
						<c:otherwise>
							<button type="submit" disabled class="btn btn-primary">Check out</button>
						</c:otherwise>
					</c:choose>
					
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
	
	</script>
</body>
</html>