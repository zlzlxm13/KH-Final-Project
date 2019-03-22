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
	</head>
	<body>

		<!-- Header -->
		<script src="js/login.js" type="text/javascript"></script>
			<header id="header" class="alt">
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
								<img src="images/geko.png" alt="" height="500px;" />
							</div>
							<div class="content">
								<header class="align-center">
									<h2>SooCut animal hospital</h2>
									<p> 소중한 반려동물을 위해</p>
								<hr/>
								<p> 희귀하지만 소중한 여러분의 반려동물들을 위해, 여러분의 위치에서 가장 가까운 병원을 찾아드리겠습니다.</p>
								<p> For your rare but important companion animals, we will find the nearest hospital in your location.</p>
								<p> 对于您罕见但重要的伴侣动物，我们会在您所在地找到最近的医院。</p>
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
								<h3> 길 고양이 보호센터</h3>
							</header>
							<p> 더 이상 불쌍한 길 고양이들을 위해, 불편함에 시달리는 주민분들을 위해 길 고양이 보호센터가 설립되었습니다.  </p>
							<ul class="actions">
								<li><a href="#" class="button alt">더보기</a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3> 고슴도치를 키울때 해서는 안 되는 행동 다섯가지 </h3>
							</header>
							<p> 요즘 고슴도치를 애완동물로 키우는 사람들의 수요가 점차 늘고 있습니다. 이 페이지는 그런 사람들을 위해 고슴도치를 애완동물로 사육할 때 해서는 안 되는 행동을 소개하는 페이지입니다. </p>
							<ul class="actions">
								<li><a href="#" class="button alt">더보기</a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3> 버려지는 '반려동물', 반려견 등록률 20% 그쳐…'과태료 처분도 유명무실' </h3>
							</header>
							<p> 올해도 어김없이 본격적인 휴가철을 맞아 버려지는 반려동물이 급증하고 있다는 소식이 속속 들려오고 있다.</p>
							<ul class="actions">
								<li><a href="#" class="button alt">더보기</a></li>
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
									<img src="images/geko.png" alt="" height="181px" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2>Vestibulum sit amet</h2>
										<p>mattis sapien pretium tellus venenatis</p>
									</header>
									<hr />
									<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
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
						<p>Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
					</header>

				</div>
			</section>

		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">
					<section>
						<div class="box">
							<div class="content">
								<h2 class="align-center">Get in Touch</h2>
								<hr />
								<form action="#" method="post">
									<div class="field half first">
										<label for="name">Name</label>
										<input name="name" id="name" type="text" placeholder="Name">
									</div>
									<div class="field half">
										<label for="email">Email</label>
										<input name="email" id="email" type="email" placeholder="Email">
									</div>
									<div class="field">
										<label for="dept">Department</label>
										<div class="select-wrapper">
											<select name="dept" id="dept">
												<option value="">- Category -</option>
												<option value="1">Manufacturing</option>
												<option value="1">Shipping</option>
												<option value="1">Administration</option>
												<option value="1">Human Resources</option>
											</select>
										</div>
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
									</div>
									<ul class="actions align-center">
										<li><input value="Send Message" class="button special" type="submit"></li>
									</ul>
								</form>
							</div>
						</div>
					</section>
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