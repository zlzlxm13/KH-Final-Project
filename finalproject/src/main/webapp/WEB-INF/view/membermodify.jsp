<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 변경</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#loading').hide();
		
					var code = null;
					var emailck = 0;
					var nullchk = true;
					var passchkValidation = false;
					var emailcodechk = false;
					var phoneValidation = false;
					var hp1 = document.getElementById('hp1');

					var hp2 = document.getElementById('hp2');

					var hp3 = document.getElementById('hp3');

					var phonenum = hp1.value + hp2.value + hp3.value;
					var modiemailq = "<%=session.getAttribute("email")%>"
					var modipassq="<%=session.getAttribute("pass")%>"
					$('#modifybtn').click(
							function() {

								if (phoneValidation == true
										&& passchkValidation == true
										&& passValidation == true
										&& emailcodechk == true) {
									alert("정보변경이 완료되었습니다.");
									$('#phonenum').val(phonenum);
									$('#modiform').submit();
								} else if (passchkValidation == false) {
									alert("비밀번호가 일치하지 않습니다.");
									return false;
								} else if (nullchk) {
									alert("입력값을 모두 입력해주세요.");
									return false;
								} else if (phoneValidation == false) {
									alert("올바른 번호를 입력해주세요.");
									return false;
								} else if (emailcodechk == false) {
									alert("올바른 코드 6자리를 인증해주세요.");
									return false;
								}else if (modipassq != $("#defalutpass").val()) {
									alert("현재 비밀번호가 일치 하지 않습니다.");
									return false;
								}
							});// end btn ================

					$('#modiemailchk').on('click',function() {									
									alert(modiemailq);
										$.ajax({
											url : "emailChk.do",
											type : 'POST',
											data : 'email='
													+ $("#modiemail").val(),
											dataType : "json",
											success : emailChkMethod
										});// ajax

										function emailChkMethod(echk) {

											if (echk > 0
													&& $("#modiemail").val() != modiemailq) {
												alert("Email로 가입한 아이디가 이미 존재합니다.");
												$("#email").focus();
												return false;
											} else if ((echk > 0 && $("#modiemail").val() == modiemailq)||echk==0) {
												$.ajax({
															url : "sendMail.do",
															type : 'POST',
															data : 'email='
																	+ $(
																			"#modiemail")
																			.val(),
															dataType : "text",
															success : emailMethod,
															beforeSend : function() {
																$('#loading')
																		.show();
															},
															complete : function() {
																$('#loading')
																		.hide();
															}

														});// ajax

												function emailMethod(res) {
													alert($("#modiemail").val());
													if ($("#modiemail").val() != "") {
														code = res;
														alert("인증코드가 발송되었습니다.");
														$('#codechkdiv').css(
																"display",
																"inherit");
													} else {
														alert("email을 입력해주세요");
														return false;
													}
												}

											}
										}

									});

					// 코드 확인

					$('#modicodebtn').on('click', function() {

						alert($('#modicodeinsert').val());
						if ($('#modicodeinsert').val() == code) {
							alert("이메일인증이 완료되었습니다.");
							emailcodechk = true;
						} else {
							alert("올바른 코드를 입력해주세요.");
							return false;
						}
					});

					// //////////////
					function nullChk() {
						var passchk = (document.getElementById("modipass")
								.val());
						var phonechk = (document.getElementById("phonenum")
								.val());
						var emailchk = (document.getElementById("modiemail")
								.val());
						if (passchk == null || phonechk == null
								|| emailchk == null) {
							nullchk = true;
						}
					}// end nullChk()
					$('#modipass')
							.keyup(
									function() {
										var pass = $(this).val();
										var re1 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 패스워드
										// 정규식
										var result = re1.test(fpass);
										if (result) {
											document.getElementById("passp").innerHTML = "";
											$(this).css("color", "green");
											passValidation = true;

										} else {
											$(this).css("color", "red");
											document.getElementById("passp").innerHTML = "영문, 숫자, 특수문자 포함 8-15자리로 입력해주세요.";
											passValidation = false;
										}
									});// end fpassKeyUp()

					$('#modipasschk')
							.keyup(
									function() {
										var ffpass = $('#modipasschk').val();
										var fpass = $('#modipass').val();
										if (ffpass == fpass) {
											document.getElementById("ffpassp").innerHTML = "";
											$(this).css("color", "green");
											passchkValidation = true;

										} else {
											$(this).css("color", "red");
											document.getElementById("ffpassp").innerHTML = "비밀번호가 일치하지 않습니다.";
											passchkValidation = false;

										}
									});// end ffpassKeyUp()

					$('#modiphone')
							.keyup(
									function() {
										phonenum = $("#modihp1").val()
												+ $("#modihp2").val()
												+ $("#modihp3").val();

										var re4 = /^[0-9]+$/; // 번호만
										var result = re4.test(phonenum);
										if (result == true
												&& phonenum.length == 11) {
											document.getElementById("phonep").innerHTML = "";
											$(this).css("color", "green");
											phoneValidation = true;
										} else {
											$(this).css("color", "red");
											document.getElementById("phonep").innerHTML = "번호를 올바르게 입력해주세요.";
											phoneValidation = false;
										}
									});// end phoneKeyUp()

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
							<li><p>${sessionScope.id }님 환영합니다</p>
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
					<h2 class="align-center">회원정보 변경</h2>
					<hr />
					<div class="row 200%">
						<div class="6u 12u$(medium)">			
					<!-- 123--><form action="#" id="modiform" name="modiform" method="post">
								<div id="loading">
									<img id="loading-image" src="images/ajax-loader.gif"
										alt="Loading..." />
								</div>
								<div class="field">
									<label for="id">ID</label> 
									<p id="id" style="width: 68%;">${sessionScope.id}</p>
									
								</div>
								<div class="field">
									<label for="pass">Defalut Password</label> <input name="defalutpass" id="defalutpass"
										type="password" placeholder="Pass" style="width: 68%;">									
								</div>
								<div class="field">
									<label for="pass">Change Password</label> <input name="modipass" id="modipass"
										type="password" placeholder="Pass" style="width: 68%;">
									<p id="passp" style="color: red"></p>
								</div>
								<div class="field">
									<label for="pass">Change Password Check</label> <input name="modipasschk"
										id="modipasschk" type="password" placeholder="Pass"
										style="width: 68%;">
									<p id="ffpassp" style="color: red"></p>
								</div>
								<div class="field">
									<label for="name">Name</label> 
									<p id="name" style="width: 68%;">${sessionScope.name}</p>
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
									<label for="email">Email</label> <input name="modiemail" id="modiemail"
										type="email" placeholder="Email"
										style="width: 45%; float: left; margin-right: 10px;">
									<input type="hidden" id="codechk" value="code"> <input
										type="button" id="modiemailchk" value="이메일인증">
								</div>
								<div id="codechkdiv" class="field" style="display: none;">
									<label for="email">EmailChk</label> <input name="text"
										id="modicodeinsert" type="text" placeholder="Code"
										style="width: 48%; float: left; margin-right: 10px;">
									<input type="hidden" id="codechk" value="code"> <input
										type="button" id="modicodebtn" value="인증확인">
								</div>
								<div class="6u$ 12u$(small)">
									<input type="checkbox" id="demo-human" name="demo-human"
										checked> <label for="demo-human">I am a human
										and not a robot</label>
								</div>
								<ul class="actions align-center">

						<!--123 --><li><input value="회원정보 변경" id="modifybtn" class="button fit"
										type="submit"></li>
								</ul>
							</form>
						</div>
						<div class="6u 12u$(medium)">
							<div class="image fit">
								<img src="images/signupimage.png" alt=""
									style="width: 90%; position: absolute;" />
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