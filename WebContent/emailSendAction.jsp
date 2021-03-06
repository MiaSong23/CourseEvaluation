<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="util.SHA256"%>
<%@page import="util.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// I process membership registration. After registering user information in the database, 
// it automatically sends an email to the user's email and waits for authentication.
	UserDAO userDAO = new UserDAO();
	String userID = null;

	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please login');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();

		return;
	}

	boolean emailChecked = userDAO.getUserEmailChecked(userID);

	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('You are a member');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		

		return;

	}

	

	// 사용자에게 보낼 메시지를 기입합니다.
	String host = "http://localhost:8080/Lecture_Evaluation/";
	String from = "이메일 아이디";
	String to = userDAO.getUserEmail(userID);
	String subject = "Confirm Email for the evaluation";
	String content = "Please access the following link to check your email." +
		"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>Email confirm</a>";
	

	// SMTP에 접속하기 위한 정보를 기입합니다.
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
 

	try{
	    Authenticator auth = new Gmail();
	    
	    Session ses = Session.getInstance(p, auth);
	    ses.setDebug(true);
	    
	    MimeMessage msg = new MimeMessage(ses); 
	    msg.setSubject(subject);

	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr);

	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr);
	    msg.setContent(content, "text/html;charset=UTF-8");
	    Transport.send(msg);

	} catch(Exception e){
	    e.printStackTrace();

	    PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Error occurs');");
		script.println("history.back();");
		script.println("</script>");
		script.close();		

	    return;

	}

%>

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
              <a class="dropdown-item" href="userLogin.jsp">Login</a>
            </div>
          </li>
        </ul>

        <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
          <input type="text" name="search" class="form-control mr-sm-2" placeholder="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>

	<div class="container">
	    <div class="alert alert-success mt-4" role="alert">
		An email address authentication email has been sent. 
		Please go into the email and verify it.
		</div>
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



