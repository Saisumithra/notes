<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Price Updation</title>
</head>
<jsp:include page="includes.jsp"></jsp:include>

<body style="background-color: #f3f2ef;">

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
					<li class="nav-item "><a class="nav-link"
						href="getcheckOutForm">Check out</a></li>
				
						<li class="nav-item active"><a class="nav-link" href="priceUpdateForm"
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
		<c:if test="${saved}">
			<div class="alert alert-success alert-dismissible fade show">
				<strong>Success!</strong> Vehicle price has been changed successfully.
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>

		<div class="card ">
			<div class="card-body">
			
				<h5 class="card-header" style="text-align: center">Vehicle Price
					Updation</h5>
				<form  action="priceUpdation" method="post" class="needs-validation"
					>
				
					<div class="form-group">
						<label for="exampleFormControlSelect1">Vehicle Type <span
							style="color: red">*</span></label> <select class="form-control"
							name="vehicleName" id="exampleFormControlSelect1">
							<option>2 wheeler</option>
							<option>4 wheeler</option>
						</select>
					</div>
				
					<div class="form-group">
						<label for="exampleFormControlInput3">Price</label> 
						<input
							type="number" required class="form-control" name="price"
							id="exampleFormControlInput3">
					</div>
					<input type="hidden" name="mallId" value="${user.mall_id}"/>
					
					<button type="submit" class="btn btn-primary">Update</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	function onClick() {
		alert('hi')
		$.ajax({
			url : "/priceUpdation",
			type:"PUT",
			data:{vehicleName : "2 wheeler",price:"200",mallId:"1"},
			cache : false,
			success : function(html) {
			}
		});
	}
	</script>

</body>
</html>