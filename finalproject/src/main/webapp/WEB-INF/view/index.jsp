<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SooCut animal hospital</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/main.css" />
		<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
	</head>
	<body>
	

		<!-- Header -->
		<script src="js/login.js" type="text/javascript"></script>
			<header id="header" class="alt">
				<div class="logo"><a href="index.do">SooCut animal hospital <span>by KHfamily</span></a></div>


						<a href="#menu" class="toggle" style="float:right"><span>Menu</span></a>
		<%if(session.getAttribute("id") == null){ %>
						<a href="signup.do" class="button alt icon" style="width: 5%;float: right;color:white !important;">Sign up</a>						
						<input value="Login" class="button alt icon fa-check" type="submit" id = "login_process" style="float:right;margin-right: 10px;color:white !important;">		
						<input name="password" id="pass" type="password" placeholder="Pass" style="width: 10%;float: right;margin-right: 10px;">				
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
			<%
				if (session.getAttribute("id") == null) {
			%>
			<%} else {%>
			<li><p style="color:white !important;">${sessionScope.id }님 환영합니다</p>
			<li><a href="mypage.do">My Page</a></li>
								<%if(((String)session.getAttribute("id")).equals("admin")){ %>		
									<li><a href="admin.do">Admin</a></li>
								<%} %>
							<%} %>		
			<li><a href="hosmap.do">Hospital</a></li>
			<li><a href="login.do">Login</a></li>
		</ul>
	</nav>
				<!-- Banner -->
		<!--
			To use a video as your background, set data-video to the name of your video without
			its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
			formats to work correctly.
		-->
			<section id="banner" data-video="images/banner">	
				<div class="inner">
					<h1>愁Cut</h1>
					<p>당신의 가족, 아프지 않게.<br /></p>

					<a href="#one" class="button scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="images/pic01.jpg" alt="" />
							</div>
							<div class="content">	
								<header class="align-center">
									<h2>SooCut animal hospital</h2>
									<p>	<%System.out.print(session.getAttribute("id"));%></p>
									<p> 더 이상 당신의 가족이 아프지 않도록, 아파하지 않도록 </p>
									<a href="generic.do" class="button scrolly">Get Started</a>
								</header>
							</div>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<div id="flexgrid">
						<div>
							<header>
								<h3>자유게시판</h3>
							</header>
							<p>boardkind_canum=1</p>
							<ul class="actions">
								<li><a href="board/list.do?boardkind_canum=1" class="button alt">더보기</a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3>상담게시판</h3>
							</header>
							<p>boardkind_canum=2 </p>
							<ul class="actions">
								<li><a href="board/list.do?boardkind_canum=2" class="button alt">더보기</a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3>공지사항</h3>
							</header>
							<p>boardkind_canum=3</p>
							<ul class="actions">
								<li><a href="board/list.do?boardkind_canum=3" class="button alt">더보기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">

						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic02.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2>미안해요, 그래도 같이 살아요!</h2>
										<p>길냥이 죽이지마세요, 살려주세요.</p>
									</header>
									<hr />
									<p>길냥이들이 시끄러워 죄송합니다. 길냥이들이 차를 긁어 죄송합니다. 길냥이들이 쓰레기를 뜯는 것 죄송합니다. 길냥이들이 무섭다구요? 그것도 죄송합니다.</p>
									<p>태어난 이유로 열심히 살아남고 있습니다.모든 생명에 이유가 있습니다. 그러니 제발 죽이지는 마세요. 숨 붙어 있는 생명, 용서해 주세요.</p>
								</div>
							</div>
						</div>

						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic03.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2> 사랑스러운 반려동물의 건강! </h2>
										<p> 반려동물에게 꼭 필요한 비타민 </p>
									</header>
									<hr />
									<p> 비타민은 매우 적은 양으로 신체의 물질 대사나 기능에 필수적인 영양소입니다. </p>
									<p> 하지만 체내에서 합성이 되지 않거나, 합성이 되어도 충분하지 못한 경우가 많습니다. 부족한 경우 생명의 유지에 필요한 체내 영양소의 대사에 장애가 유발하게 되어 꼭 필요한 영양소입니다.
									오늘은 보호자분들과 반려동물에게 꼭 필요한 비타민을 소개해드리려고 합니다.</p>
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
						<h2> 愁Cut aniaml hospital </h2>
						<p></p>
					</header>

				</div>
			</section>

		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">					
					<div class="copyright">
						&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>. Images <a href="https://unsplash.com/">Unsplash</a>. Video <a href="http://coverr.co/">Coverr</a>.
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