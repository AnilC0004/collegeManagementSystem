<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME PAGE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--  
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
-->
<link rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
<script src="jquery.js"></script>
<script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

<style>
div.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
}

body1 {
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
	background-color: #e6eeff;
	padding: 10px;
}

body {
	background: url('MIT-dome-at-night_light.jpg') no-repeat center center
		fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.jumbotron {
	background-color: #f4511e;
	color: #fff;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: #f6f6f6;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}

.carousel-indicators li {
	border-color: #f4511e;
}

.carousel-indicators li.active {
	background-color: #f4511e;
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

.panel {
	border: 1px solid #f4511e;
	border-radius: 0 !important;
	transition: box-shadow 0.5s;
}

.panel:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-footer .btn:hover {
	border: 1px solid #f4511e;
	background-color: #fff !important;
	color: #f4511e;
}

.panel-heading {
	color: #fff !important;
	background-color: #f4511e !important;
	padding: 25px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}

.panel-footer {
	background-color: white !important;
}

.panel-footer h3 {
	font-size: 32px;
}

.panel-footer h4 {
	color: #aaa;
	font-size: 14px;
}

.panel-footer .btn {
	margin: 15px 0;
	background-color: #f4511e;
	color: #fff;
}

.navbar {
	margin-bottom: 0;
	background-color: #f4511e;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}

footer .glyphicon {
	font-size: 20px;
	margin-bottom: 20px;
	color: #f4511e;
}

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	visibility: visible;
}

@
keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}

100%
{
opacity




:


 


1;
-webkit-transform




:


 


translateY




(0%);
}
}
@
-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}

100%
{
opacity




:


 


1;
-webkit-transform




:


 


translateY




(0%);
}
}
@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}
</style>

</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 align="center">College Management System</h1>
		</div>
	</div>

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
				<li><a href="Home.jsp" selected>HOME</a></li>
				<li><a href="#a">ABOUT US</a></li>
				<li><a href="Contact.jsp">CONTACT</a></li>
				<li><a href="LoginPage.jsp">LOGIN</a></li>
			</ul>
		</div>
	</div>
	</nav>

<br><br><br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="panel panel-default">
				<div class="panel-heading"><span style="font-size: 2em;">Events</span>
				<form class="form-inline">
				<select id="state" class="form-control"  >
				</select>
				<select id="university" class="form-control"  placeholder="select university">
				</select>
				<button id = "refresh" type="button" class="btn btn-default" align="right"style="float: right;">Refresh</button>
				
				</form>
				</div>
				</form>
				
				<div class="panel-body" id="news"></div>
				<div class="panel-footer"><button type="button" class="btn btn-default" align="right"style="float: right;">Next</button></div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>




<script src="jquery.js"></script>
<script type="text/javascript">
 //var tot_events=0,curr_no = 0;
 //implement back next button
 //global & university wise events
 //global(public) & university(private) wise events
	$(document).ready(function() {
	
		initStates();
		$('#news').html('<div class="jumbotron"><h3 align="center">No Current Events in this university</h3></div>');
		$('#state').on('change',function(){
			$('#news').html('<div class="jumbotron"><h3 align="center">No Current Events in this university</h3></div>');
			//alert($(this).val());
			$.getJSON('publicJSON/StateToUniversity/'+$(this).val(),function(data){
				//if(data !=''){
				$('#university').html(setOption(data));
					
			});
		});
		
		$('#university').on('change',function(){
			$('#news').html('<div class="jumbotron"><h3 align="center">No Current Events in this university</h3></div>');

			//alert($(this).val());
			$.getJSON('publicJSON/Events/'+$(this).val(),function(data){
				if(data !=''){
					getNews(data)
				}
			});
		});
		
		$('#refresh').on('click',function(){
			$.getJSON('publicJSON/Events/'+$('#university').val(),function(data){
				if(data !=''){
					getNews(data)
				}
				else{
					$('#news').html('<div class="jumbotron"><h3 align="center">No Current Events in this university</h3></div>');			
					}
			});
		});
			
	});
	        
	 function initStates(){
        	var states = [ "Andaman and Nicobar Island(UT)", "Andhra Pradesh", "Arunachal Pradesh",
   						"Assam", "Bihar", "Chandigarh (UT)", "Chhattisgarh", "Dadra and Nagar Haveli(UT)", "Daman and Diu(UT)",
   						"Delhi(NCT)", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand",
   						"Karnataka", "Kerala", "Lakshadweep(UT)", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya",
   						"Mizoram", "Nagaland", "Odisha", "Puducherry(UT)", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu",
   						"Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal" ];
   			$('#university').html('<option disabled selected hidden>Please select university</option>');
   			
   			var txt='<option disabled selected hidden>Please select State</option>';
   			for(var i in states){
   				txt+='<option value="'+states[i]+'.json">'+states[i]+'</option>';
   			}
   			$('#state').html(txt);
   			
        }
	function getNews(newslist) {
		var output = '';
		for (i = 0; (i < newslist.length); i++) {
			output += printNews(newslist[i]);
		}
		$('#news').html(output);
	}
	

	function setOption(data){
		var txt = '<option disabled selected hidden>Please select university</option>';
		for(var i in data){
			txt+='<option value="'+data[i][0]+'.json">'+data[i][1]+'</option>';
		}
		return txt;
	}
		
	function printNews(news) {
		var out ='';
		out += '<div class="col-sm-12">'
				+ '<div class="thumbnail">'
				+ '<div class="row text-center">'
				+ '<div class="col-sm-4">'
				+ '<img src =' + news.thumbnailUrl +' alt="image">'
				+ '</div>' +

				'<div class="col-sm-8 text-left">' + '<p><strong><h2>'
				+ news.title + '</h2></strong></p>' + '<p><strong>'
				+ news.hostClg + '</strong></p>'
				+ '<p><strong style="color:blue">' + news.eventDate
				+ '</strong></p>' + '<p>' + news.description + '</p>'
				+ '</div>' + '</div>' + '</div>' + '</div>'
				+ "<br><br><br><br>";
		return out;
	}
	
	</script>
</body>
</html>