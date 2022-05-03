<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body style="background-color: #f3f2ef;">
	<jsp:include page="includes.jsp"></jsp:include>
	 <c:set var="count" value="${count + 1}" scope="page" />
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
					<li class="nav-item active"><a class="nav-link"
						href="getAdminHome">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="vehicleRegistration">Vehicle Registration</a></li>
					<li class="nav-item"><a class="nav-link" href="getcheckinForm">Check
							in</a></li>
					<li class="nav-item"><a class="nav-link"
						href="getcheckOutForm">Check out</a></li>
					
						<li class="nav-item"><a class="nav-link" href="priceUpdateForm"
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
	<div class="card " style="margin-top: 5%">
		<div class="card-body">
			<h5 class="card-title" style="text-align: center;">List of
				Vehicles</h5>

			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Registration Number</th>
						<th scope="col">Vehicle Type</th>
						<th scope="col">Model</th>
						<th scope="col">Owner Name</th>
						<th scope="col">Age</th>
						<th scope="col">Contact</th>
						<th scope="col">Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vehiclesList}" var="vehicle">

						<tr>
							<td><c:out value="${count}" /></td>
							<td><c:out value="${vehicle.regId}" /></td>
							<td><c:out value="${vehicle.vehicle_type}" /></td>
							<td><c:out value="${vehicle.model}" /></td>
							<td><c:out value="${vehicle.owner_name}" /></td>
							<td><c:out value="${vehicle.age}" /></td>
							<td><c:out value="${vehicle.contact}" /></td>
							<td><c:if test="${vehicle.status == '0'}">
									<c:out value="${'Registered'}" />
								</c:if> <c:if test="${vehicle.status == '1'}">
									<c:out value="${'Checked in'}" />
								</c:if> <c:if test="${vehicle.status == '2'}">
									<c:out value="${'Checked out'}" />
								</c:if></td>
						</tr>
						 <c:set var="count" value="${count + 1}" scope="page" />
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<script>
		function showAllVehicles() {
			$.ajax({
				url : "/getAllVehicles",
				cache : false,
				success : function(html) {
				}
			});

		}
	</script>

</body>
</html>