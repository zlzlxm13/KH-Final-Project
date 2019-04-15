<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Pet Insert</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">

<script type="text/javascript">
	$(document).ready(function() {					
					var formValidation = false;
					var nullchk = true;
					var petagechk = false;				
					$('#petinsert')
							.click(
									function() {
										if (formValidation == true												
												&& petagechk == true) {
											alert("Pet 등록이 완료되었습니다.");								
											$('#petform').submit();											
										} else if (formValidation == false) {
											alert("입력값이 올바르지 않습니다. 입력값을 확인하세요");
											return false;
										} else if (petagechk == false) {
											alert("Pet Age의 입력값을 확인하세요");
											return false;
										} else if (nullchk) {
											alert("입력값을 모두 입력해주세요.");
											return false;
										}
									});// end btn ================

					// //////////////
					function nullChk() {
						var namechk = (document.getElementById("petname").val());
						var passchk = (document.getElementById("petage").val());		
						
						if (namechk == null || passchk == null) {
							nullchk = true;
						}
					}// end nullChk()

					$('#petname')
							.keyup(
									function() {
										var petname = $(this).val();
										var re3 = new RegExp(/^[가-힣a-zA-Z]+$/); // 이름
										// 정규식
										// 한글,영문만
										var result = re3.test(petname);
										if (result) {
											$(this).css("color", "green");
											formValidation = true;
											document.getElementById("petnamep").innerHTML = "";
										} else {
											$(this).css("color", "red");
											document.getElementById("petnamep").innerHTML = "한글과 영문만 입력 가능합니다.";
											formValidation = false;
										}
									});// end nameKeyUp()
								
					$('#petage')
							.keyup(
									function() {		
										var petage = $(this).val();
										var re4 = /^[0-9]+$/; // 번호만
										var result = re4.test(petage);
										if (result == true) {
											document.getElementById("petagep").innerHTML = "";
											$(this).css("color", "green");
											petagechk = true;
										} else {
											$(this).css("color", "red");
											document.getElementById("petagep").innerHTML = "숫자만 입력 해주세요.";
											petagechk = false;
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
		<div class="logo">
			<a href="index.do">SooCut animal hospital <span>by
					KHfamily</span></a>
		</div>
		<a href="#menu" class="toggle" style="float: right"><span>Menu</span></a>
		<%
			if (session.getAttribute("id") == null) {
		%>
		<input value="Login" class="button alt icon fa-check" type="submit"
			id="login_process" style="float: right;"> <input name="password"
			id="pass" type="password" placeholder="Pass"
			style="width: 10%; float: right; margin-right: 10px;"> <input
			name="id" id="id" type="text" placeholder="id"
			style="width: 10%; float: right; margin-right: 10px;">
		<%
			} else {
		%>
		${sessionScope.id }님 환영합니다 <a href="logout.do">로그아웃</a>
		<%
			}
		%>

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
				<div class="image fit">
					<img src="images/pic01.jpg" alt="" />
				</div>
				<div class="content">
					<h2 class="align-center">애완동물 등록</h2>
					<hr />
					<div class="row 200%">
						<div class="6u 12u$(medium)">
							<!--js 변경-->
							<!-- <script src="js/signup.js" type="text/javascript"></script> -->
							<!--joinform도 변경.--><form action="#" id="petform" name="petform" method="post">
								<input type="hidden" name="member_id" id="member_id" value="${sessionScope.id}">
								<input type="hidden" name="id" id="id" value="${sessionScope.id}">
								<div class="field">
									<label for="petname">Pet Name</label> <input name="petname"
										id="petname" type="text" placeholder="Pet Name"
										style="width: 47%;margin-right: 10px;">								
									<p id="petnamep" style="color: red"></p>
								</div>
								<div class="field">
									<label for="petage">Pet Age</label> <input name="petage"
										id="petage" type="text" placeholder="개월 수로 써주세요 ex)10"
										style="width: 40%;float: left;"><label for="개월" style="font-size: large;">개월</label>
									<p id="petagep" style="color: red"></p>
								</div>
								<div class="field">
									<label for="petsex">Pet Sex</label> <select id="petsex"
										name="petsex" class="petsex"
										style="width: 19%;margin-right: 5px;">

										<option value="수컷" selected>수컷</option>

										<option value="암컷">암컷</option>
									</select>
								</div>
								<div class="field">
									<label for="petkind">Pet Kind</label><!--  <input name="petkind_kind"
										id="petkind" type="text" placeholder="Pet Kind"
										style="width: 68%;"> -->						
						<select name="petkind_kind" id="petkind" style="width: 68%;">
								<option value="">- PetKind -</option>
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<option value="${petkind.kind}">${petkind.kind}</option>
								</c:forEach>
						</select>
					
									<p id="petkindp" style="color: red;"></p>
								</div>
								<div class="field">
										<label for="petinfo">특이사항</label>
										<textarea name="petinfo" id="petinfo" rows="6" placeholder="특이사항을 적어주세요."></textarea>
									</div>
								<div class="6u$ 12u$(small)">
									<input type="checkbox" id="demo-human" name="demo-human"
										checked> <label for="demo-human">I am a human
										and not a robot</label>
								</div>
								<ul class="actions align-center">

									<li><input value="등록완료" id="petinsert" class="button fit"
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
						<h2> 愁Cut aniaml hospital </h2>
						<p></p>
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