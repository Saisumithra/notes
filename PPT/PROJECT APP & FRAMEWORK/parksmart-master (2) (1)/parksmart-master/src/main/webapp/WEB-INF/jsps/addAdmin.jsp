<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<li class="nav-item "><a class="nav-link"
					href="getSuperAdminHome">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="getMallList">
						Mall List</a></li>
				<li class="nav-item"><a class="nav-link" href="addmall">Add
						Mall</a></li>
				<li class="nav-item active"><a class="nav-link" href="addadmin">Add
						Admin<span class="sr-only">(current)</span>
				</a></li>
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
						<h5 class="card-header" style="text-align:center">Add Admin</h5>
						<form action="saveadmin" method="post" class="needs-validation">
							<div class="form-group" style="padding-top: 10px">
								<label for="exampleFormControlInput1">First Name</label> <input
									type="text" class="form-control" name="firstname"
									value="${User.firstname}" id="exampleFormControlInput1"
									required="required" placeholder="First Name">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Last Name</label> <input
									type="text" class="form-control" name="lastname"
									required="required" value="${User.lastname}"
									id="exampleFormControlTextarea1" placeholder="Last Name"
									rows="3">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Email Address</label> <input
									type="text" class="form-control"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email"
									required="required" value="${User.email}" title="characters@characters.domain (characters followed by an @ sign, followed by more characters, and then a '.'. After the '.' sign, add at least 2 letters from a to z:"
									id="exampleFormControlTextarea1" placeholder="abc@....."
									rows="3">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Password</label> <input
									type="password" class="form-control" name="password"
									required="required" value="${User.password}"
									id="exampleFormControlTextarea1" placeholder="password"
									rows="3">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput2">Contact Number</label> <input
									type="number" class="form-control" name="contactnumber"
									value="${User.contactnumber}" id="exampleFormControlInput2"
									placeholder="Phn No:">
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Select Mall ID</label> <select
									class="form-control" id="exampleFormControlSelect1"
									required="required" name="mall_id">
									<c:forEach var="mall" items="${malls}">
										<option>${mall.mall_registration_number}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput3"></label> <input
									type="hidden" class="form-control" name="role" value="admin">
							</div>
							<button type="submit" class="btn btn-primary">Add Admin</button>
							<!-- <button type="button" onclick="onNewRegisterClick()" class="btn btn-primary">New Register</button> -->
						</form>
					</div>
				</div>
			<c:if test="${result == 'User Already Exits'}">
			<div class="alert alert-danger alert-dismissible fade show">
					<strong>Add Admin !</strong>${result}
					<button type="button" class="close"  data-dismiss="alert">&times;</button>
				</div>
			</c:if>
			<c:if test="${malls != null && malls.size() <= 0 }">
				<div class="alert alert-danger alert-dismissible fade show">
					<strong>Add Mall !</strong>No Mall's Registerd Yet.
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>
			</c:if>
	</div>
</body>
</html>