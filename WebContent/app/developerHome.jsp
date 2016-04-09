<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Developer" %>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
     <a class="navbar-brand" href="#">Attendance Management System</a>
    </div>
	<ul class="nav navbar-nav">
        <li class="active"><a>About</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">University Details <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="AddUni.html">Add a University</a></li>
            <li><a href="UpdateUni.html">Update a University</a></li>
            <li><a href="#">Delete a University</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">College Details <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="AddColl.html">Add a College</a></li>
            <li><a href="UpdateColl.html">Update a College</a></li>
            <li><a href="DeleteColl.html">Delete a College</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Course Details <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Add a Course</a></li>
            <li><a href="#">Update a Course</a></li>
            <li><a href="#">Delete a Course</a></li>
          </ul>
        </li>
	</ul>
<form id = "logout" class="navbar-form navbar-right" role="logout" action="Logout">
   <button type="submit" class="btn btn-default" >logout</button>
</form>


</nav>
<%
Developer developer = (Developer)request.getSession(false).getAttribute("person");

%>
<div class="row">
 <div class="col-md-4">
 	<img src= <%="'" + developer.getImageURL()+ "'" %> alt ="image" class="img-circle"/>
 </div>
 <div class="col-md-8">
 
  </div>

<!--<img src="kl.jpg" style="float:left; height:600px; width:1280px" >-->
<script>
$(document).ready(function(){
	$('#logout').on('submit',function(){
		if(!confirm("Do you reallu want to leave ?")){
			return false;
		}
		else {
			return true;
		}
		
	});
});
</script>
</body>
</html>