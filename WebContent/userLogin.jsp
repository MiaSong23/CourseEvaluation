<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom/css">
</head>
<body>
<%

	String userID = null;

	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if(userID != null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('You've already logged in');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");

		script.close();	
	}

%>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Course Evaluation</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbar">
	   		<ul class="navbar-nav mr-auto">
    	  		<li class="nav-item active">
        			<a class="nav-link" href="index.jsp">Main</a>
      			</li>
      			<li class="nav-item dropdown">
        			<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
          			Member
	        		</a>
        			<div class="dropdown-menu" aria-labelledby="dropdown">
<%
	if(userID == null) {
%>
          				<a class="dropdown-item" href="userLogin.jsp">Login</a>
          				<a class="dropdown-item" href="userRegister.jsp">Register</a>
<%
	} else {
%>
          				<a class="dropdown-item" href="userLogout.jsp">Logout</a>
<%
	}
%>       				
       				</div>
      			</li>
			</ul>
    		<form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
      			<input type="text" name="search" class="form-control mr-sm-2" placeholder="Search">
     			 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    		</form>
  		</div>
	</nav>

	<div class="container mt-3" style="max-width: 560px;">
  		<form method="post" action="./userLoginAction.jsp">
	    	<div class="form-group">
		      	<label>User ID</label>
		      	<input type="text" name="userID" class="form-control">
	    	</div>
	    	<div class="form-group">
	      		<label>Password</label>
	      		<input type="password" name="userPassword" class="form-control">
	    	</div>
	    	<button type="submit" class="btn btn-primary">Login</button>
  		</form>
	</div>
	<script src="./js/jquery.min.js"></script>	
	<script src="./js/popper.min.js"></script>	
	<script src="./js/bootstrap.min.js"></script>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
  		Copyright &copy 2021 Mia Song All Rights Reserved.
	</footer>
	


</body>
</html>