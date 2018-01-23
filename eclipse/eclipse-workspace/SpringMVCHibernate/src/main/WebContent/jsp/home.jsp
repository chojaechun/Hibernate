
<!DOCTYPE html>
<html lang="en">
<link type="text/css" rel="stylesheet" href="../assets/plugins/css/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="../assets/plugins/slick/slick.css" />
<link type="text/css" rel="stylesheet" href="../assets/plugins/css/mycss.css" />
<link type="text/css" rel="stylesheet" href="../assets/plugins/slick/slick-theme.css" />

<script type="text/javascript" src="../assets/plugins/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../module_js/home.js"></script>
<!-- <script type="text/javascript" src="../js/home.js"></script> -->
<head>
<meta charset="utf-8">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<title>boardTest</title>
</head>
<style type="text/css">
body {
	font: 20px Montserrat, sans-serif;
	line-height: 1.8;
	color: #f5f6f7;
	padding-right: 0 !important;
}

p {
	font-size: 16px;
}

.margin {
	margin-bottom: 45px;
}

.bg-1 {
	background-color: #1abc9c; /* Green */
	color: #ffffff;
}

.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

.bg-3 {
	background-color: #ffffff; /* White */
	color: #555555;
}

.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
	color: #fff;
}

.container-fluid {
	padding-top: 70px;
	padding-bottom: 70px;
}

.navbar {
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 12px;
	letter-spacing: 5px;
}

.navbar-nav  li a:hover {
	color: #1abc9c !important;
}
/* Note: Try to remove the following lines to see the effect of CSS positioning */
.affix {
	top: 0;
	width: 100%;
}

.affix+.container-fluid {
	padding-top: 70px;
}

.glyphicon.glyphicon-picture {
	font-size: 20px;
}

.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.slider {
	width: 90%;
	margin: 100px auto;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}
</style>


</head>
<body>
 	<div class="overlay" id="loading">
		<div class="loader"></div>
	</div>
	<!-- Navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role=”navigation”>
		<div class=”container-fluid“>
			<div style="width: 50%; float: left;">
				<div class="navbar-header">
					<a class="navbar-brand" style="margin-left: 20px" href="#">JOJAE</a>
				</div>
			</div>
			<div style="margin: auto">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right" style="margin-right: 20px">
					<li><a href="#mainContainer">ME</a></li>
					<li><a href="#secondContainer">NOTE</a></li>
					<li><a href="#thirdContainer">BOARD</a></li>
					<li><a data-target="#loginModal" data-toggle="modal" href="#">LOGIN</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- First Container -->
	<div class="container-fluid text-center"
		style="background-color: #EAEAEA; padding-top: 10%;"
		id="mainContainer">
		<h3 class="margin">Main Title Page</h3>
		<img src="../assets/img/bird.jpg"
			class="img-responsive img-circle margin" style="display: inline"
			alt="Bird" width="350" height="350">

		<h3>
			Server : AWS<br>Front : JSP, JAVA SCRIPT<br>Back : Spring
			Framework MVC, Hibernate<br>DB : MY SQL
		</h3>
	</div>

	<!-- Second Container -->
	<div class="container-fluid bg-3 text-center" id="secondContainer"
		style="padding-top: 10%">
		<div id='default_layout_hidden' style="display: none;">
			<div style="margin-right: 30px; float: right;" id='%SubID_1%'>
				<a onclick="subPage('%ID_1%')" style="cursor: pointer;">%ID_2%</a>
			</div>
		</div>
		<div id='sub_layout_view'></div>

		<h3 class="margin" style="margin-top: 80px">Sub Title Page</h3>
		<section class="center slider">
	  <%for(int i=1; i<= 5; i++){ %>
			<div>
				<p>Lorem <%=i %></p>
				<img src="../assets/img/birds<%=i %>.jpg" onclick="imgClick(<%=i %>)" class="img-responsive margin" style="width: 100%" alt="Image">
			</div>
	  <%} %>
		</section>
	</div>

	<!-- Third Container (Grid) -->
	<div class="container-fluid bg-2 text-center" id="thirdContainer"
		style="padding-top: 10%">
		<div style="width: 80%; margin: auto">
			<jsp:include page="/jsp/board.jsp" flush="true" />
		</div>
	</div>
	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center" id="footerID">
		<p>
			Made By <a href="http://www.developerjo.net/">www.developerjo.net</a>
		</p>
	</footer>

	<%-- <jsp:include page="../jsp/modalList.jsp" flush="true" /> --%>


	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-content"
			style="width: 50%; margin: auto; margin-top: 10%">
			<div class="modal-header" style="padding: 35px 50px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4>
					<span class="glyphicon glyphicon-lock"></span> Login
				</h4>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form role="form">
					<div class="form-group">
						<label for="usrname"><span
							class="glyphicon glyphicon-user"></span> Username</label> <input
							type="text" class="form-control" id="usrname"
							placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="psw"><span
							class="glyphicon glyphicon-eye-open"></span> Password</label> <input
							type="text" class="form-control" id="psw"
							placeholder="Enter password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox" value="" checked>Remember
							me</label>
					</div>
					<button type="submit" class="btn btn-success btn-block">
						<span class="glyphicon glyphicon-off"></span> Login
					</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-danger btn-default pull-left"
					data-dismiss="modal">
					<span class="glyphicon glyphicon-remove"></span> Cancel
				</button>
				<p>
					Not a member? <a href="#">Sign Up</a>
				</p>
				<p>
					Forgot <a href="#">Password?</a>
				</p>
			</div>
		</div>
	</div>

<script type="text/javascript" src="../assets/plugins/slick/slick.js" charset="utf-8"></script>

</body>
</html>


