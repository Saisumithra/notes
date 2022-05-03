<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Registration</title>
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
					<li class="nav-item active"><a class="nav-link"
						href="vehicleRegistration">Vehicle Registration</a></li>
					<li class="nav-item"><a class="nav-link" href="getcheckinForm">Check
							in</a></li>
					<li class="nav-item"><a class="nav-link"
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
			<div class="alert alert-success alert-dismissible fade show"
				id="success-alert">
				<strong>Success!</strong> Your data has been saved successfully.
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
		<c:if test="${exist}">
			<div class="alert alert-danger alert-dismissible fade show"
				id="warning-alert">
				<strong>Error!</strong> This Registration Id already exist!.
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>
		<div class="card ">
			<div class="card-body">
				<h5 class="card-header" style="text-align: center">Vehicle
					Registration</h5>
				<form action="registerVehicle" class="needs-validation"
					method="post">
					<div class="form-group" style="padding-top: 10px">
						<label for="exampleFormControlInput1">Registration Number
							<span style="color: red">*</span>
						</label> <input type="text"
							pattern="^[A-Za-z]{2}[0-9]{2}[A-Za-z]{2}[0-9]{4}$"
							class="form-control" required name="regId"
							id="exampleFormControlInput1" title="Ex:TS 05 AB 1234"
							placeholder="Ex:TS 05 AB 1234">
					</div>
					<div class="form-group">
						<label for="exampleFormControlSelect1">Vehicle Type <span
							style="color: red">*</span></label> <select class="form-control"
							name="vehicle_type" id="exampleFormControlSelect1">
							<option>2 wheeler</option>
							<option>4 wheeler</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">Model</label>
						<textarea class="form-control" name="model"
							id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput2">Owner Name</label> <input
							type="text" class="form-control" name="owner_name"
							id="exampleFormControlInput2" placeholder="Enter owner name">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput3">Age</label> <input
							type="number" class="form-control" name="age"
							id="exampleFormControlInput3" placeholder="Enter age">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput4">Contact</label> <input
							type="text" class="form-control" name="contact"
							id="exampleFormControlInput4" pattern="^[0-9]{10}$"
							title="Mobile Number should be 10 characters"
							placeholder="Enter contact Number"> <input type="hidden"
							value="0" />
					</div>
					<button type="submit" class="btn btn-primary">Register</button>
				</form>
			</div>
		</div>
	</div>
	<style>
#topheader .navbar-nav li>a {
	text-transform: capitalize;
	color: #333;
	transition: background-color .2s, color .2s; &: hover , & : focus { 
		 background-color : #333;
	color: #fff;
}
}
</style>
	<script>
		$("#warning-alert").fadeTo(2000, 300).slideUp(300, function() {
			$("#warning-alert").slideUp(300);
		});
		$("#success-alert").fadeTo(2000, 300).slideUp(300, function() {
			$("#success-alert").slideUp(300);
		});
	</script>

</body>
</html>