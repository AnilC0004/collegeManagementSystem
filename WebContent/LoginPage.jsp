<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="model.Person"%>
<%
		HttpSession sess = request.getSession(false);
	    String forwardTo = (sess != null) ? (String) session.getAttribute("forwardTo") : null;
	    if(forwardTo != null){
	    	request.getRequestDispatcher((String)sess.getAttribute("forwardTo")).forward(request, response);
	    }  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-control"
	content="no-cache, no-store, must-revalidate">
<title>LOGIN PAGE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
-->
<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
<script src="jquery.js"></script>
<script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

</head>

<style>
body {
	background-color: #e6eeff;
}
</style>

</head>s
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">
<%-- 	<% --%>
// 		String msg = null;
// 		System.out.println((String)request.getParameter("msg"));
// 		if((msg = (String)request.getParameter("msg"))!=null){
<%--     %> --%>
<%-- 	<div class="alert alert-danger" role="alert">${msg}</div> --%>
<%-- 	<% --%>
// 		}
<%-- 	%> --%>

	<div class="jumbotron text-center">
	<c:if test='${param.msg != null}'>
<div class="alert alert-danger" id="alrt">${param.msg}</div>

</c:if>
		<h3>Sign in to continue to Our Panel</h3>
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="Home.jsp">HOME</a></li>
					<li><a href="#about">ABOUT US</a></li>
					<li><a href="Contact.jsp">CONTACT</a></li>
					<li><a href="LoginPage.jsp">LOGIN</a></li>
				</ul>
			</div>
		</div>
		</nav>

		<form class="form-inline" action="Login" method="post">
			<input type="email" class="form-control" size="50"
				placeholder="Email Address" id="emailID"> <br> <br>
			<input type="password" class="form-control" size="50"
				placeholder="password" id="password" required> <br> <br>
			<br> <input type="submit" class="btn btn-success" id='loginBtn'
				value="login">
		</form>
		<div id="alertplace">
		</div>
	</div>

	<!--<script src = "jquery.js" ></script>-->

	<script type="text/javascript">
$(document).ready(function(){
	//$("#alrt").fadeTo(1000,0);
	$('#loginBtn').on('click',function(){
		var islogin='';
		$.post(
			'LoginValidate',
			{
				'emailID':$('#emailID').val(),
				'password':$('#password').val()
			},
			function(data){
				islogin = data;
				//alert(islogin);
				if(islogin != 'false' ) {
					window.location.replace("/CollegeManagementSystem/Login");
				}
				else {
					alert("wrong username/password");
				}	
			});
			return false;
			});
	});
</script>
</body>
</html>