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
   <body style="background-color:brown;">
        <div>
            <div class="container d-flex justify-content-center">
                <div class="row" style="width:100%;justify-content:center;">
                    <div class="card " style="width:50%;border-radius: 1.25rem!important;">
                      <!--   <div class="card-header">
                            <strong class="text-capitalize" >Super Admin Login</strong>
                        </div> -->
                        <div class="card-body">
                            <form name="login" method="post" action ="superadminlogin" id="login">
                                <div class="row">
                                    <div class="col">
                                  
                                        <div class="form-group">
                                            <div class="input-group mb-3 mt-3">
                                                <input class="form-control" placeholder="Email" id="loginEmail" name="loginEmail"  autofocus>
                                            </div>
                                        </div>
                                       

                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                <input class="form-control" placeholder="Password" id="loginPassword" name="loginPassword" type="password">
                                            </div>
                                        </div>
                                         <p class="text-danger">${error}</p>
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                <input class="form-control" placeholder="Password" id="role" value="superadmin" name="role" type="hidden">
                                            </div>
                                        </div>
                                        <div>
                                            <input type="submit" class="btn btn-lg bg-dark btn-block submit text-white" id="login_m"  value="Sign in" >
                                        </div>
                                        
                                    </div>
                                </div>
                                <div style="text-align:center;">
                                      <a href="/admin">Login in as Admin</a>
                                </div>
                            </form>
                        </div>
                    </div>
                 
                </div>
                
            </div>
        </div>
    </body>
     <style>
        body { 
            background-color: #F9F9F9;
        }

        .container{
            margin-top: 15%;
        }

        .card-header {
            padding: 5px 15px;
        }


    </style>
    
</html>