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
 <body style="background-color: #f3f2ef;">
        <div>
            <div class="container d-flex justify-content-center">
                <div class="row" style="width:100%;justify-content:center;">
                    <div class="card" style="width:35%;">
                        <div class="card-header">
                            <strong>Login</strong>
                        </div>
                        <div class="card-body">
                            <form name="login" method="post" action ="login" id="login">
                                <div class="row">
                                    <div class="col">
                                       <div style="text-align:center;">
                                     <p class="text-danger">${result}</p>
                                     </div>
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                
                                                <input class="form-control" placeholder="Email" id="loginEmail" name="loginEmail"  autofocus>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                
                                                <input class="form-control" placeholder="Password" id="loginPassword" name="loginPassword" type="password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                <input class="form-control" placeholder="Password" id="role" value="admin" name="role" type="hidden">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-lg btn-success btn-block submit" id="login_m"  value="Sign in" >
                                        </div>
                                       
                                    </div>
                                </div>
                                <div style="text-align:center;">
                                 <a href="/" style="font-size:13px">Login in as super Admin</a>
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