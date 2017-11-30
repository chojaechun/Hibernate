
<!DOCTYPE html>
<html lang="en">
<link type="text/css" rel="stylesheet" href="../assets/plugins/css/bootstrap/css/bootstrap.min.css" >
<script	type="text/javascript"	src="../assets/plugins/jquery/1.11.0/jquery.min.js"></script>
<script	type="text/javascript"	src="../assets/plugins/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/home.js"></script>
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
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">JOJAE</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#mainContainer">ME</a></li>
        <li><a href="#secondContainer">NOTE</a></li>
        <li><a href="#thirdContainer">BOARD</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- First Container -->
<div class="container-fluid text-center" style="background-color: #EAEAEA;" id ="mainContainer">
  <h3 class="margin">Main Title Page</h3>
  <img src="" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="350" height="350">
  
  <h3>Server : AWS<br>Front : JSP, JAVA SCRIPT<br>Back : Spring Framework MVC, Hibernate<br>DB : MY SQL</h3>
</div>

<!-- Second Container -->
<div class="container-fluid bg-3 text-center" id ="secondContainer">
	<div>
		<div style="margin-right:30px;float: right;">Etc</div> 
		<div style="margin-right:30px;float: right;">SQL</div> 
		<div style="margin-right:30px;float: right;">JAVA Script</div>
		<div style="margin-right:30px;float: right;">JAVA</div>
	</div>
  <h3 class="margin" style="margin-top: 80px">Sub Title Page</h3><br>
  <div class="row"> 상단 CATEGORY ( JAVASCRIPT JAVA SQL 등등..)
    <div class="col-sm-4">
    	해당 카테고리 정보에 맞는 DIV 리스트 설정 ( 선택시 MODAL 로 VIEW )
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <img src="" class="img-responsive margin" style="width:100%" alt="Image">
    </div>
  </div>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-2 text-center" id="thirdContainer">
	<jsp:include page="/board/boardList.do" flush="true" />
</div>
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-content">
		<div class="modal-header" style="padding:35px 50px;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
		</div>
		<div class="modal-body" style="padding:40px 50px;">
			<form role="form">
				<div class="form-group">
					<label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
					<input type="text" class="form-control" id="usrname" placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
					<input type="text" class="form-control" id="psw" placeholder="Enter password">
				</div>
				<div class="checkbox">
					<label><input type="checkbox" value="" checked>Remember me</label>
				</div>
				<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
			</form>
        </div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
			<p>Not a member? <a href="#">Sign Up</a></p>
			<p>Forgot <a href="#">Password?</a></p>
		</div>
	</div>
</div>
<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Made By <a href="http://www.developerjo.net/">www.developerjo.net</a></p> 
</footer>

</body>
</html>


