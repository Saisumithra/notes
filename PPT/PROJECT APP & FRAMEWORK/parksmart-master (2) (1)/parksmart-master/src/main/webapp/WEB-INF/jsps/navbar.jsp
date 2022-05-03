<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
         <script type="text/javascript" src="/js/jquery.min.js"></script>
        <script type="text/javascript"  src="/js/bootstrap.min.js" ></script>
         <script type="text/javascript"  src="/js/bootstrap.bundle.js" ></script>
          <link href="/css/font-awesome.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->

      
    </head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="#">ParkSmart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vehicleRegistration">Vehicle Registration</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="getcheckinForm">Check in</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="getcheckOutForm">Check out</a>
      </li>
             <li class="nav-item">
        <li class="nav-item">
        <a class="nav-link" href="adminLogout">Logout</a>
      </li>
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
      </li>
    </ul>
  </div>
</nav>

</body>
</html>