<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Malls</title>
<link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
<link href="/css/font-awesome.css" rel="stylesheet" id="bootstrap-css">
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
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
					href="getSuperAdminHome">Home <span class="sr-only">(current)</span></a>
				</li>
					<li class="nav-item active"><a class="nav-link" href="addmall">Mall List
						</a></li>
				<li class="nav-item"><a class="nav-link" href="addmall">Add
						Mall</a></li>
				<li class="nav-item "><a class="nav-link" href="addadmin">Add
						Admin</a></li>
				<li class="nav-item"><a class="nav-link"
					href="superAdminLogout">Logout</a></li>
			</ul>
		</div>
	</nav>
<div class="card " style="margin-top: 5%">
		<div class="card-body">
			<h5 class="card-title" style="text-align: center;">List of
				Malls</h5>

			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Mall Name</th>
						<th scope="col">Mall Registration Number</th>
						<th scope="col">Parking levels</th>
						<th scope="col">Slot</th>
						<th scope="col">Address</th>
						<th scope="col">Contact</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${malls}" var="mall">
						<tr>
							<td><c:out value="${mall.mall_id}" /></td>
							<td><c:out value="${mall.mall_name}" /></td>
							<td><c:out value="${mall.mall_registration_number}" /></td>
							<td><c:out value="${mall.parking_level}" /></td>
							<td><c:out value="${mall.slot}" /></td>
							<td><c:out value="${mall.address}" /></td>
							<td><c:out value="${mall.contact}" /></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>

</body>
</html>