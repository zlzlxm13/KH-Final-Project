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
	<header id="header">
		<div class="logo">
			<a href="index.do">Transitive <span>by TEMPLATED</span></a>
		</div>
		<a href="#menu" class="toggle"><span>Menu</span></a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.do">Home</a></li>
			<li><a href="generic.do">Generic</a></li>
			<li><a href="elements.do">Elements</a></li>
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
					<p><span class="image right"><img src="images/pay1.jpg" alt="" /></span>
					<form action="#" method="post">				
						<div class="field">
							<label for="id">ID</label> <input name="id" id="id" type="text"

								placeholder="id">
						</div>
						<c:if test="${requestScope.IdChk==0}">
							<span style="font-size: 20; color: red;">일치하는 회원 정보가 없습니다.
								회원가입을 해주세요.</span>
						</c:if>

								placeholder="id" style="width: 50%">
						</div>						

						<div class="field">
							<label for="pass">Password</label> <input name="pass" id="pass"

								type="password" placeholder="Pass">
						</div>
						<c:if test="${requestScope.IdChk==-1}">
							<span style="font-size: 20; color: red;">비밀번호를 확인하세요</span>
						</c:if>
						<ul class="actions align-center">

								type="password" placeholder="Pass" style="width: 50%">
						</div>							
					</form>
							
					<script src="js/login.js" type="text/javascript"></script>
						<ul class="actions align-center">		
						<li><a href="#" class="button special icon fa-search">아이디,비밀번호 찾기</a>	</li>				

							<li><input value="Login" class="button alt icon fa-check"

								type="submit" id = "login_process"></li>							
=======
							 type="submit" id = "login_process" style="color: black;">
							</li>							
>>>>>>> refs/heads/testbranch
							<li><a href="signup.do" class="button">회원가입</a></li>
						</ul>
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