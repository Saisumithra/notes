<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
<link href="/css/font-awesome.css" rel="stylesheet" id="bootstrap-css">
<!------ Include the above in your HEAD tag ---------->

<title>Insert title here</title>
</head>

<body style="background-color: #f3f2ef;">
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
				<li class="nav-item"><a class="nav-link"
					href="getSuperAdminHome">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="getMallList">
						Mall List<span class="sr-only"></span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="getMallList">Add
						Mall<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item">
				<li class="nav-item"><a class="nav-link" href="addadmin">Add
						Admin</a></li>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="superAdminLogout">Logout</a></li>
			
				<!--  <li class="nav-item">
        <a class="nav-link" href="getcheckinForm">Check in</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="getcheckOutForm">Check out</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li> -->
			</ul>
		</div>
	</nav>
	<div class="contianer-fluid" style="padding: 100px 300px 50px 300px;">
		<div class="card ">
			<div class="card-body">
				<h5 class="card-header" style="text-align:center">Mall Registration</h5>
				<form action="saveMallRegistration" method="post"
					class="needs-validation">
					<div class="form-group" style="padding-top: 10px">
						<label for="exampleFormControlInput1">Mall Registration
							Number</label> <input type="text" class="form-control"
							required="required" name="mall_registration_number"
							value="${mall.mall_registration_number}"
							id="exampleFormControlInput1">
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">Mall Name</label> <input
							type="text" class="form-control" name="mall_name"
							required="required" value="${mall.mall_name}"
							id="exampleFormControlTextarea1">
					</div>
					<div class="form-group">
						<label for="exampleFormControlSelect1">Parking Level</label> <select
							class="form-control" name="parking_level"
							id="exampleFormControlSelect1" required="required">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleFormControlSelect1">Slot</label> <select
							class="form-control" name="slot"
							id="exampleFormControlSelect1" required="required">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">Address</label>
						<textarea class="form-control" name="Address" required="required"
							id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput2">Contact Number</label> <input
							type="number" class="form-control" name="contact"
							value="${mall.contact}" id="exampleFormControlInput2">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
					<!-- <button type="button" onclick="onNewRegisterClick()" class="btn btn-primary">New Register</button> -->
				</form>
			</div>
		</div>
	</div>


</body>
</html>