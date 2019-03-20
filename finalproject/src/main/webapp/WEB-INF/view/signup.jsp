<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#loading').hide();
	});
</script>
<style type="text/css">
#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}

#loading-image {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}
</style>

</head>
<body class="subpage">
	<!-- Header -->
	<script src="js/login.js" type="text/javascript"></script>
	<header id="header">
			<div class="logo"><a href="index.do">SooCut animal hospital <span>by KHfamily</span></a></div>
						<a href="#menu" class="toggle" style="float:right"><span>Menu</span></a>
		<%if(session.getAttribute("id") == null){ %>	
						<input value="Login" class="button alt icon fa-check" type="submit" id = "login_process"style="float:right;">		
						<input name="pass" id="pass" type="password" placeholder="Pass" style="width: 10%;float: right;margin-right: 10px;">				
				<input name="id" id="id" type="text" placeholder="id" style="width: 10%;float: right;margin-right: 10px;">
				<%} else {%>
				${sessionScope.id }님 환영합니다
			<a href="logout.do">로그아웃</a><%} %>
		
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.do">Home</a></li>
					<li><a href="generic.do">Notice</a></li>
		   <!--  --><li><a href="elements.do">element</a></li>	
					<li><a href="hosmap.do">Hospital</a></li>					
					<%if(session.getAttribute("id") == null){ %>	
							<li><a href="login.do">Login</a></li>
							<%} else {%>
							<li>${sessionScope.id }님 환영합니다
								<ul class="links">
									<li><a href="#">마이페이지</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</ul>
							</li>			
							<%} %>

					<li><a href="admin.do">admin</a></li>
					<li><a href="main.do">Reservation</a></li>

					
				</ul>
			</nav>


	<!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="image fit">
					<img src="images/pic01.jpg" alt="" />
				</div>
				<div class="content">
					<h2 class="align-center">Sign up</h2>
					<hr />
					<div class="row 200%">
						<div class="6u 12u$(medium)">
							<script src="js/signup.js" type="text/javascript"></script>
							<form action="#" id="joinform" name="joinform" method="post">
								<div id="loading">
									<img id="loading-image" src="images/ajax-loader.gif"
										alt="Loading..." />
								</div>
								<div class="field">
									<label for="id">ID</label> <input name="id" id="id" type="text"
										placeholder="id"
										style="width: 47%; float: left; margin-right: 10px;">
									<input type="hidden" name="idDuplication" value="idUncheck">
									<input type="button" id="chkid" value="중복확인">
									<p id="idp" style="color: red"></p>
								</div>
								<div class="field">
									<label for="pass">Password</label> <input name="pass" id="pass"
										type="password" placeholder="Pass" style="width: 68%;">
									<p id="passp" style="color: red"></p>
								</div>
								<div class="field">
									<label for="pass">Password Check</label> <input name="passchk"
										id="passchk" type="password" placeholder="Pass"
										style="width: 68%;">
									<p id="ffpassp" style="color: red"></p>
								</div>
								<div class="field">
									<label for="name">Name</label> <input name="name" id="name"
										type="text" placeholder="Name" style="width: 68%;">
									<p id="namep" style="color: red"></p>
								</div>

								<div class="field" id="phone">
									<label for="email">PhoneNumber</label> <select id="hp1"
										name="hp1" class="hp1"
										style="width: 19%; float: left; margin-right: 5px;">

										<option value="010" selected>010</option>

										<option value="011">011</option>

										<option value="016">016</option>

										<option value="017">017</option>

										<option value="018">018</option>

										<option value="019">019</option>

									</select> <input type="text" class="hp2" id="hp2" name="hp2" size="4"
										maxlength="4"
										style="width: 24%; float: left; margin-right: 5px;"> <input
										type="text" id="hp3" class="hp3" name="hp3" size="4"
										maxlength="4" style="width: 24%;"> <input
										type="hidden" id="phonenum" name="phonenum">
									<p id="phonep" style="color: red"></p>

								</div>

								<div class="field">
									<label for="email">Email</label> <input name="email" id="email"
										type="email" placeholder="Email"
										style="width: 45%; float: left; margin-right: 10px;">
									<input type="hidden" id="codechk" value="code"> <input
										type="button" id="emailchk" value="이메일인증">
								</div>
								<div id="codechkdiv" class="field" style="display: none;">
									<label for="email">EmailChk</label> <input name="text"
										id="codeinsert" type="text" placeholder="Code"
										style="width: 45%; float: left; margin-right: 10px;">
									<input type="hidden" id="codechk" value="code"> <input
										type="button" id="codebtn" value="인증확인">
								</div>
								<div class="6u$ 12u$(small)">
									<input type="checkbox" id="demo-human" name="demo-human"
										checked> <label for="demo-human">I am a human
										and not a robot</label>
								</div>
								<ul class="actions align-center">

									<li><input value="Signup" id="sign" class="button fit"
										type="submit"></li>
								</ul>
							</form>
						</div>
						<div class="6u 12u$(medium)">
							<div class="image fit">
								<img src="images/signupimage.png" alt=""
									style="width: 85%; position: absolute;" />
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- Four -->
	<section id="four" class="wrapper style3">
		<div class="inner">

			<header class="align-center">
				<h2>Morbi interdum mollis sapien</h2>
				<p>Cras aliquet urna ut sapien tincidunt, quis malesuada elit
					facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a
					libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat
					lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien
					pretium tellus venenatis, at egestas urna ornare.</p>
			</header>

		</div>
	</section>

	<!-- Footer -->
	<footer id="footer" class="wrapper">
		<div class="inner">
			<div class="copyright">
				&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>.
				Images <a href="https://unsplash.com/">Unsplash</a> Video <a
					href="http://coverr.co/">Coverr</a>.
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.scrolly.min.js"></script>
	<script src="js/jquery.scrollex.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>

</body>
</html>