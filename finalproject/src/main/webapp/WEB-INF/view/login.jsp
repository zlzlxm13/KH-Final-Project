<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />

</head>
<body class="subpage">

	<!-- Header -->
	<script src="js/login.js" type="text/javascript"></script>
	<header id="header">
		<div class="logo">
			<a href="index.do">SooCut animal hospital <span>by
					KHfamily</span></a>
		</div>
		<a href="#menu" class="toggle" style="float: right"><span>Menu</span></a>
		

	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.do">Home</a></li>
			<li><a href="generic.do">Notice</a></li>
<<<<<<< HEAD
			<!--  -->
			<li><a href="elements.do">element</a></li>
			<li><a href="hosmap.do">Hospital</a></li>
			<%
				if (session.getAttribute("id") == null) {
			%>
			<li><a href="login.do">Login</a></li>
			<%
				} else {
			%>
			<li>${sessionScope.id }님환영합니다
				<ul class="links">
					<li><a href="mypage.do">마이페이지</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</li>
			<%
				}
			%>

			<li><a href="admin.do">admin</a></li>
			<li><a href="main.do">Reservation</a></li>


=======
			<li><a href="elements.do">Element</a></li>
			<%
				if (session.getAttribute("id") == null) {
			%>
			<%} else {%>
			<li><a href="mypage.do">My Page</a></li>
								<%if(((String)session.getAttribute("id")).equals("admin")){ %>		
									<li><a href="admin.do">Admin</a></li>
								<%} %>
							<%} %>		
			<li><a href="hosmap.do">Hospital</a></li>
>>>>>>> refs/remotes/origin/young
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
					<h2 class="align-center">Get in Touch</h2>
					<hr />


					<div class="row 200%">
						<div class="6u 12u$(medium)">
							<form action="#" method="post">

								<div class="field">
									<label for="id">ID</label> <input name="id" id="id" type="text"
										placeholder="id" style="width: 100%; margin-bottom: 100px;">

								</div>
								<div class="field">
									<label for="pass">Password</label> <input name="password" id="pass"
										type="password" placeholder="Pass"
										style="width: 100%; margin-bottom: 100px;">
								</div>
							</form>
<<<<<<< HEAD
						
=======

							
>>>>>>> refs/remotes/origin/young
							<ul class="actions align-center">
								<li><a href="memsearch.do"
									class="button special icon fa-search">아이디,비밀번호 찾기</a></li>	
								<li><input value="Login" class="button alt icon fa-check"
									type="submit" id="login_process" style="color: black;">
								</li>
								<li><a href="signup.do" class="button">회원가입</a></li>
							</ul>
							<!-- 네아로 카로 -->
						</div>
						<!-- <span class="image right"></span> -->
						<div class="6u 12u$(medium)">
							<img src="images/pay1.jpeg" alt=""
								style="width: 80%; position: relative;" />
						</div>

					</div>
				</div>
			</div>
<<<<<<< HEAD
			<!--  -->
=======
	
>>>>>>> refs/remotes/origin/young
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