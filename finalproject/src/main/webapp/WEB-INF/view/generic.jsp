<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Generic - Transitive by TEMPLATED</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/main.css" />
		<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
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
							<header class="align-center">
								<h2>愁Cut aniaml hospital</h2>
								<p>수컷 반려동물 연계 메디컬 센터는 믿을 수 있는 실력과 진심을 가진 동물병원들과 함께하고 있습니다.</p>
							</header>
							<hr />
							<p> 말하지 못하는 반려동물이 얼마나, 어떻게, 왜 아픈지, 어떻게 해야 오래토록 행복하게 살 수 있는지... 그것들을 보호자분들께 정확히 알려드리고 반려동물을 위한 최선의 길을 찾아주는 것이 저희 수컷 반려동물 연계 메디컬 센터의 사명이라고 생각합니다.  </p>
							<p> 그 누구보다 기쁠 때 같이 기뻐해주고, 아플 때 같이 아파하며, 따뜻한  눈과 망므으로 최선을 다해 돌보겠습니다.</p>
							<p> 쉼 없는 노력과 최첨단 의료시스템이 도입된 수준 높은 메디컬 센터들과 연계하여 누구도 믿고 맡길 수 있는 愁Cut이 되겠습니다.</p>
							</div>
					</div>
				</div>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper style3">
				<div class="inner">

					<header class="align-center">
						<h2>愁Cut aniaml hospital</h2>
						</header>

				</div>
			</section>

					<div class="copyright">
						&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>. Images <a href="https://unsplash.com/">Unsplash</a> Video <a href="http://coverr.co/">Coverr</a>.
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