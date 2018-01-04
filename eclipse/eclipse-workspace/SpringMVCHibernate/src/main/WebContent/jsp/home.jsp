
<!DOCTYPE html>
<html lang="en">
<link type="text/css" rel="stylesheet" href="../assets/plugins/css/bootstrap/css/bootstrap.min.css" >
<script	type="text/javascript" src="../assets/plugins/jquery/1.11.0/jquery.min.js"></script>
<script	type="text/javascript" src="../assets/plugins/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../module_js/home.js"></script>
<head>
<meta charset="utf-8">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<title>boardTest</title>
</head>
  <style>
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #f5f6f7;
      padding-right: 0 !important;
  }
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
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
  </style>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-default">
  <div style="width: 90%;float: left;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" style="margin-left: 20px" href="#">JOJAE</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#mainContainer">ME</a></li>
        <li><a href="#secondContainer">NOTE</a></li>
        <li><a href="#thirdContainer">BOARD</a></li>
      </ul>
    </div>
  </div>
	<div style="float: right;margin-right: 20px">
		<ul class="nav navbar-nav navbar-right">
			<li><a style="cursor: pointer;">Login</a></li>
		</ul>
  </div>
</nav>

<!-- First Container -->
<div class="container-fluid text-center" style="background-color: #EAEAEA;" id ="mainContainer">
  <h3 class="margin">Main Title Page</h3>
  <img src="../assets/img/bird.jpg" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="350" height="350">
  
  <h3>Server : AWS<br>Front : JSP, JAVA SCRIPT<br>Back : Spring Framework MVC, Hibernate<br>DB : MY SQL</h3>
</div>

<!-- Second Container -->
<div class="container-fluid bg-3 text-center" id ="secondContainer">
	<div id ='default_layout_hidden' style="display: none;">
		<div style="margin-right:30px;float: right;" id ='%SubID_1%'>
			<a onclick="subPage('%ID_1%')" style="cursor: pointer;">%ID_2%</a>
		</div>
	</div>
	<div id ='sub_layout_view'></div>
	
  <h3 class="margin" style="margin-top: 80px">Sub Title Page</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="../assets/img/birds1.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="../assets/img/birds2.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="../assets/img/birds3.jpg" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
  </div>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-2 text-center"  id="thirdContainer">
	<div style="width: 80%;margin:auto">
		<jsp:include page="/jsp/board.jsp" flush="true" />
	</div>	
</div>

<%-- <jsp:include page="../jsp/modalList.jsp" flush="true" /> --%>
	
<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Made By <a href="http://www.developerjo.net/">www.developerjo.net</a></p> 
</footer>

</body>
</html>


