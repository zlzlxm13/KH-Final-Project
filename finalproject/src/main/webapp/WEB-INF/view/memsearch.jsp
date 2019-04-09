<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>ID,PW SEARCH</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />
</head>
<body class="subpage">
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var idsear = null;

							$('#idsearch')
									.on(
											'click',
											function() {

												var idsearch = {

													name : $("#name").val(),
													email : $("#email").val()
												};
												$.ajax({
													url : "idsearch.do",
													type : 'POST',
													data : idsearch,
													dataType : "text",
													success : idsearchMethod
												});// ajax

												function idsearchMethod(chk) {

													idsear = chk;
													alert(idsear);
													if (idsear == "") {

														$('#idsearchdiv1').css(
																"display",
																"none");
														$('#idsearchdiv2').css(
																"display",
																"inherit");
														document
																.getElementById("idsear1").innerHTML = "입력하신 정보가 잘못되었습니다.";

													} else {

														$('#idsearchdiv1').css(
																"display",
																"none");
														$('#idsearchdiv2').css(
																"display",
																"inherit");
														document
																.getElementById("idsear1").innerHTML = $(
																'#name').val()
																+ "님의 아이디";
														document
																.getElementById("realid").innerHTML = idsear;
													}

												}
											});////////////idsearch

							$('#passsearch')
									.on(
											'click',
											function() {

												var passsearch = {

													id : $("#id").val(),
													email : $("#email").val()
												};
												$.ajax({
													url : "passsearch.do",
													type : 'POST',
													data : passsearch,
													dataType : "text",
													success : passsearchMethod
												});// ajax

												function passsearchMethod(chk) {
													if (chk != "") {

														$('#passsearchdiv1')
																.css("display",
																		"none");
														$('#passsearchdiv2')
																.css("display",
																		"inherit");

														document
																.getElementById("sendyourpass").innerHTML = "비밀번호를 이메일로 발송하였습니다.";
													} else {
														$('#passsearchdiv1')
														.css("display",
																"none");
												$('#passsearchdiv2')
														.css("display",
																"inherit");

												document
														.getElementById("sendyourpass").innerHTML = "정보가 잘못되었습니다.";
													}

												}
											});///////////passsearch

						});
	</script>
	<!-- Header -->
	<script src="js/login.js" type="text/javascript"></script>
	<header id="header">
			<div class="logo"><a href="index.do">SooCut animal hospital <span>by KHfamily</span></a></div>
						<a href="#menu" class="toggle" style="float:right"><span>Menu</span></a>
		<%if(session.getAttribute("id") == null){ %>	
						<input value="Login" class="button alt icon fa-check" type="submit" id = "login_process"style="float:right;">		
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


		</ul>
	</nav>


	<!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">

					<!-- Elements -->
					<h2 id="elements" style="text-align: center;">아이디,비밀번호 찾기</h2>
					<div class="row 200%">

						<div class="6u 12u$(medium)" id="idsearchdiv1">
							<form action="#" id="idsearchform" name="idsearchform"
								method="post">


								<div class="field half">
									<label for="name">Name</label> <input name="name" id="name"
										type="text" placeholder="Name" style="width: 70%;">

								</div>

								<div class="field half">
									<label for="email">Email</label> <input name="email" id="email"
										type="email" placeholder="Email">
								</div>
							</form>
							<ul class="actions align-center">

								<li><input value="아이디 찾기" id="idsearch"
									class="button special icon fa-search" type="button"></li>
							</ul>
						</div>
						<div class="6u 12u$(medium)" id="idsearchdiv2"
							style="display: none;">
							<form action="#" id="idsearchform" name="idsearchform"
								method="post">


								<div class="field half">
									<label for="id">Your ID</label>
									<p id="idsear1" style="float: left;"></p>
									<p id="realid"
										style="float: left; font-size: 30pt; color: black;"></p>

								</div>

							</form>
							<ul class="actions align-center">
								<li><a href="login.do" class="button">Login</a></li>
								<li><a href="memsearch.do" class="button">다시하기</a></li>
							</ul>

						</div>
						<div class="6u 12u$(medium)" id="passsearchdiv1">
							<blockquote style="float: left; position:inherit;">
								<br> <br> <br> <br> <br> <br> <br>
								<br>
							</blockquote>
							<form action="#" id="passsearchform" name="passsearchform"
								method="post" style="margin-left: 45px;">
								<div class="field half">
									<label for="id">ID</label> <input name="id" id="id" type="text"
										placeholder="id" style="width: 70%;">
								</div>
								<div class="field half">
									<label for="email">Email</label> <input name="email" id="email"
										type="email" placeholder="Email">
								</div>
							</form>
							<ul class="actions align-center">

								<li><input value="비밀번호 찾기" id="passsearch"
									class="button special icon fa-search" type="button"></li>
							</ul>

						</div>


						<div class="6u 12u$(medium)" id="passsearchdiv2"
							style="display: none;">
							<blockquote style="float: left; position: fixed;">
								<br> <br> <br> <br> <br> <br> <br>
								<br>
							</blockquote>
							<form action="#" id="passsearchform" name="passsearchform"
								method="post" style="margin-left: 45px;">
								<div class="field">
									<label for="id">Send Your password</label>
									<p id="sendyourpass"
										style="float: left; font-size: 20pt; color: black;"></p>
								</div>
							</form>
							<ul class="actions align-center">
								<li><a href="login.do" class="button">Login</a></li>
							</ul>

						</div>
						<div class="6u 12u$(medium)" id="passsearchdiv3"
							style="display: none;">
							<blockquote style="float: left; position: fixed;">
								<br> <br> <br> <br> <br> <br> <br>
								<br>
							</blockquote>
							<form action="#" id="passsearchform" name="passsearchform"
								method="post" style="margin-left: 45px;">
								<div class="field">
									<label for="id">Please Check Your Information</label>
									<p id="sendyourpass"
										style="float: left; font-size: 20pt; color: black;"></p>
								</div>
							</form>
							<ul class="actions align-center">
								<li><a href="login.do" class="button">Login</a></li>
							</ul>

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