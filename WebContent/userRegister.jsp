<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Register</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<a class="navbar-brand" href="index.jsp">Course Evaluation</a>
      	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
    	    <span class="navbar-toggler-icon"></span>
	    </button>
		<div class="collapse navbar-collapse" id="navbar">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item active">
	            <a class="nav-link" href="index.jsp">메인</a>
	          </li>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
	              회원 관리
	            </a>
	            <div class="dropdown-menu" aria-labelledby="dropdown">
	              <a class="dropdown-item" href="userLogin.jsp">로그인</a>
	              <a class="dropdown-item" href="userRegister.jsp">회원가입</a>
	              <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
	            </div>
	          </li>
	        </ul>

	        <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
	        	<input type="text" name="search" class="form-control mr-sm-2" placeholder="내용을 입력하세요.">
	        	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	        </form>
      	</div>
    </nav>

    <div class="container mt-3" style="max-width: 560px;">
	    <form method="post" action="./userRegisterAction.jsp">
    	    <div class="form-group">
    	      <label>User ID</label>
        	  <input type="text" name="userID" class="form-control">
       		</div>
	        <div class="form-group">
 			    <label>Password</label>
        		<input type="password" name="userPassword" class="form-control">
        	</div>
        	<div class="form-group">
          		<label>Email</label>
          		<input type="email" name="userEmail" class="form-control">
        	</div>
        	<button type="submit" class="btn btn-primary">Register</button>
      	</form>
    </div>

    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
      Copyright ⓒ 2021 Mia Song All Rights Reserved.
    </footer>
    <!-- add jquery -->
    <script src="./js/jquery.min.js"></script>
    <!-- add Popper-->
    <script src="./js/popper.min.js"></script>
    <!-- add bootstrap -->
    <script src="./js/bootstrap.min.js"></script>



</body>
</html>