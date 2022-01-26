<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<!doctype html>

<html>
<head>
    <title>Course Evaluation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- add bootstrap css -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- add custom css -->
    <link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
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

	<div class="container">
	    <div class="alert alert-warning mt-4" role="alert">
		  이메일 주소 인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?
		</div>
		<a href="emailSendAction.jsp" class="btn btn-primary">인증 메일 다시 받기</a>
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

