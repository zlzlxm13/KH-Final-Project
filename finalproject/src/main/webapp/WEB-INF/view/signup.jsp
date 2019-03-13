<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<<<<<<< HEAD
<meta charset="utf-8" />
=======
<meta charset="UTF-8" />
>>>>>>> refs/heads/testbranch
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />
</head>
<body class="subpage">

	<script type="text/javascript">
<<<<<<< HEAD
		$(document).ready(
						function() {
							var idck = 0;
							var duchk = 0;
							var formValidation = false;
							var nullchk = true;

							$('#sign').click(function() {
												if (idck == 1
														&& formValidation == true) {
													alert("회원가입 완료되었습니다. 다시 로그인해 주세요.");
													$('#joinform').submit();
												} else if (idck == 1
														&& formValidation == false) {
													alert("입력값이 올바르지 않습니다. 입력값을 확인하세요");
													return false;
												} else if (idck != 1
														&& formValidation == true) {
													alert("아이디 중복검사를 실행해주세요.");
													return false;
												} else if (nullchk) {
													alert("입력값을 모두 입력해주세요.");
													return false;
												}
											});//end btn ================

							$('#chkid').on('click',function() {			
								if (duchk == 1) {
													//userid 를 param.       
													$.ajax({
																
																async : true,
																type : 'POST',		
																contentType: "application/x-www-form-urlencoded; charset=utf-8",
																data : 'id='+ $("#id").val(),		
																url : "idChk",
																dataType : "json",
																success : idChkMethod
															});//ajax
															
													function idChkMethod(res) {
														if (res.chk > 0) {
															alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
															$("#id").focus();
														} else {
															alert("사용가능한 아이디입니다.");
															$("#pass").focus();
															idck = 1;
														}
														alert("l;kkl;kfeqljkfqejlfqekjlfeqjklfeqkjlfeqjklfeqkjlfeqlkjfeqjlkfeqjlk");
													}
												} else {
													return false;
												}
											});//end chkid()============================ 

							function nullChk() {
								var namechk = (document.getElementById("name")
										.val());
								var passchk = (document.getElementById("pass")
										.val());
								var idchk = (document.getElementById("id")
										.val());
								var phonechk = (document
										.getElementById("phonenum").val());
								var emailchk = (document
										.getElementById("email").val());
								if (namechk == null || idchk == null
										|| passchk == null || phonechk == null
										|| emailchk == null) {
									nullchk = true;
								}
							}//end nullChk()

							$('#name')
									.keyup(
											function() {
												var name = $(this).val();
												var re3 = new RegExp(
														/^[가-힣a-zA-Z]+$/); //이름 정규식 한글,영문만
												var result = re3.test(name);
												if (result) {
													$(this).css("color",
															"green");
													formValidation = true;
													document
															.getElementById("namep").innerHTML = "";
												} else {
													$(this).css("color", "red");
													document
															.getElementById("namep").innerHTML = "한글과 영문만 입력 가능합니다.";
													formValidation = false;
												}
											});//end nameKeyUp()

											$('#id').keyup(function(){
									    		  var fid = $(this).val();
									    		  var re  = /^[a-zA-Z0-9]{4,12}$/; // 아이디가 적합한지 검사할 정규식
									    		  var result = re.test(fid);
									    		  var result2 = fid.search(/[0-9]/ig);
									    		  var result3 = fid.search(/[a-z]/ig);
									    		  if(result==true && result2 >= 0 && result3 >= 0){
									    			  document.getElementById("idp").innerHTML="";
									    			  $(this).css("color","green");
									    			  formValidation=true;
									    			  duchk=1;
									    		  }else{
									    			  $(this).css("color","red");
									    			  document.getElementById("idp").innerHTML="영문, 숫자포함 4-12자리로 입력해주세요.";
									    			  formValidation=false;
									    			  duchk=-1;
									    		  }    		  
											});
							$('#pass')
									.keyup(
											function() {
												var pass = $(this).val();
												var re1 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //패스워드 정규식
												var result = re1.test(fpass);
												if (result) {
													document
															.getElementById("passp").innerHTML = "";
													$(this).css("color",
															"green");
													formValidation = true;
												} else {
													$(this).css("color", "red");
													document
															.getElementById("passp").innerHTML = "영문, 숫자, 특수문자 포함 8-15자리로 입력해주세요.";
													formValidation = false;
												}
											});//end fpassKeyUp()    	  

							$('#ffpass')
									.keyup(
											function() {
												var ffpass = $(this).val();
												var fpass = $('#pass').val();
												if (ffpass == fpass) {
													document
															.getElementById("ffpassp").innerHTML = "";
													$(this).css("color",
															"green");
													formValidation = true;
												} else {
													$(this).css("color", "red");
													document
															.getElementById("ffpassp").innerHTML = "비밀번호가 일치하지 않습니다.";
													formValidation = false;
												}
											});//end ffpassKeyUp()   

							$('#phone')
									.keyup(
											function() {
												var phone = $(this).val();
												var re4 = /^[0-9]+$/; //번호만
												var result = re4.test(phone);
												if (result == true
														&& phone.length == 11) {
													document
															.getElementById("phonep").innerHTML = "";
													$(this).css("color",
															"green");
													formValidation = true;
												} else {
													$(this).css("color", "red");
													document
															.getElementById("phonep").innerHTML = "번호를 올바르게 입력해주세요.";
													formValidation = false;
												}
											});//end phoneKeyUp()    	  
						
						});
	</script>

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
					<h2 class="align-center">Sign up</h2>
					<hr />
					<form action="#" id="joinform" name="joinform" method="post">
						<div class="field half">
							<label for="id">ID</label> <input name="id" id="id" type="text"
								placeholder="id" style="width: 70%;"> <input
								type="hidden" name="idDuplication" value="idUncheck"> <input
								type="button" id="chkid" value="중복확인">
							<p id="idp" style="color: red"></p>
						</div>
						<div class="field">
							<label for="pass">Password</label> <input name="pass" id="pass"
								type="password" placeholder="Pass" style="width: 33%;">
							<p id="passp" style="color: red"></p>
						</div>
						<div class="field">
							<label for="pass">Password Check</label> <input name="passchk"
								id="passchk" type="password" placeholder="Pass"
								style="width: 33%;">
							<p id="ffpassp" style="color: red"></p>
						</div>
						<div class="field half">
							<label for="name">Name</label> <input name="name" id="name"
								type="text" placeholder="Name" style="width: 70%;">
							<p id="namep" style="color: red"></p>
						</div>

						<div class="field">
							<label for="email">PhoneNumber</label> <select id="hp1"
								name="hp1" class="hp1"
								style="width: 10%; float: left; margin-right: 5px;">

								<option value="010" selected>010</option>

								<option value="011">011</option>

								<option value="016">016</option>

								<option value="017">017</option>

								<option value="018">018</option>

								<option value="019">019</option>

							</select><input type="text" class="hp2" id="hp2" name="hp2" size="4"
								maxlength="4"
								style="width: 15%; float: left; margin-right: 5px;"><input
								type="text" id="hp3" class="hp3" name="hp3" size="4"
								maxlength="4" style="width: 15%;"> <input type="hidden"
								id="phonenum" name="phonenum">
							<p id="phonep" style="color: red"></p>
=======
		$(document)
				.ready(
						function() {
							var idck = 0;
							var duchk = 0;
							var formValidation = false;
							var nullchk = true;
							var passchkValidation = false;
							var hp1 = document.getElementById('hp1'); 

							var hp2 = document.getElementById('hp2'); 

							var hp3 = document.getElementById('hp3'); 

							var phonenum = hp1.value + hp2.value + hp3.value;
							
							
							
							
							
							
							
							
							$('#sign')
									.click(
											function() {
												if (idck == 1
														&& formValidation == true && phoneValidation == true
														&& passchkValidation == true && passValidation == true ) {
													alert("회원가입 완료되었습니다. 다시 로그인해 주세요.");
													$('#phonenum').val(phonenum);												
													$('#joinform').submit();
												} else if (idck == 1
														&& formValidation == false) {
													alert("입력값이 올바르지 않습니다. 입력값을 확인하세요");
													return false;
												} else if (idck != 1
														&& formValidation == true) {
													alert("아이디 중복검사를 실행해주세요.");
													return false;
												}else if (idck == 1
														&& 	passchkValidation == false) {
													alert("비밀번호가 일치하지 않습니다.");
													return false;
												}else if (nullchk) {
													alert("입력값을 모두 입력해주세요.");
													return false;
												}else if (idck == 1
														&& phoneValidation == false) {
													alert("올바른 번호를 입력해주세요.");
													return false;
												}
											});//end btn ================
											
							$('#chkid').on('click',function() {
						
												if (duchk == 1) {
												
													//userid 를 param.       
													$
															.ajax({
																url : "idChk.do",																
																type : 'POST',																
																data : 'id='
																		+ $("#id").val(),																
																dataType : "json",
																success : idChkMethod
															});//ajax

													function idChkMethod(chk) {
																
														if (chk > 0) {												
															alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
															$("#id").focus();
														} else {
															alert("사용가능한 아이디입니다.");
															$("#pass").focus();
															idck = 1;
														}
													}
												} else {
													return false;
												}
											});//end chkid()============================ 

							function nullChk() {
								var namechk = (document.getElementById("name")
										.val());
								var passchk = (document.getElementById("pass")
										.val());
								var idchk = (document.getElementById("id")
										.val());
								var phonechk = (document
										.getElementById("phonenum").val());
								var emailchk = (document
										.getElementById("email").val());
								if (namechk == null || idchk == null
										|| passchk == null || phonechk == null
										|| emailchk == null) {
									nullchk = true;
								}
							}//end nullChk()

							$('#name')
									.keyup(
											function() {
												var name = $(this).val();
												var re3 = new RegExp(
														/^[가-힣a-zA-Z]+$/); //이름 정규식 한글,영문만
												var result = re3.test(name);
												if (result) {
													$(this).css("color",
															"green");
													formValidation = true;
													document
															.getElementById("namep").innerHTML = "";
												} else {
													$(this).css("color", "red");
													document
															.getElementById("namep").innerHTML = "한글과 영문만 입력 가능합니다.";
													formValidation = false;
												}
											});//end nameKeyUp()

											$('#id').keyup(function(){
									    		  var fid = $(this).val();
									    		  var re  = /^[a-zA-Z0-9]{4,12}$/; // 아이디가 적합한지 검사할 정규식
									    		  var result = re.test(fid);
									    		  var result2 = fid.search(/[0-9]/ig);
									    		  var result3 = fid.search(/[a-z]/ig);
									    		  if(result==true && result2 >= 0 && result3 >= 0){
									    			  document.getElementById("idp").innerHTML="";
									    			  $(this).css("color","green");
									    			  formValidation=true;
									    			  duchk=1;
									    		  }else{
									    			  $(this).css("color","red");
									    			  document.getElementById("idp").innerHTML="영문, 숫자포함 4-12자리로 입력해주세요.";
									    			  formValidation=false;
									    			  duchk=-1;
									    		  }    	
											});

							$('#pass')
									.keyup(
											function() {
												var pass = $(this).val();
												var re1 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //패스워드 정규식
												var result = re1.test(fpass);
												if (result) {
													document
															.getElementById("passp").innerHTML = "";
													$(this).css("color",
															"green");
													passValidation = true;
												
												} else {
													$(this).css("color", "red");
													document
															.getElementById("passp").innerHTML = "영문, 숫자, 특수문자 포함 8-15자리로 입력해주세요.";
													passValidation = false;
												}
											});//end fpassKeyUp()    	  

							$('#passchk')
									.keyup(
											function() {
												var ffpass = $('#passchk').val();
												var fpass = $('#pass').val();
												if (ffpass == fpass) {
													document
															.getElementById("ffpassp").innerHTML = "";
													$(this).css("color",
															"green");
													passchkValidation = true;
													
												} else {
													$(this).css("color", "red");
													document
															.getElementById("ffpassp").innerHTML = "비밀번호가 일치하지 않습니다.";
													passchkValidation = false;
													
												}
											});//end ffpassKeyUp()   

							$('#phone')
									.keyup(
											function() {
												phonenum=$("#hp1").val()+$("#hp2").val()+$("#hp3").val();
											
												var re4 = /^[0-9]+$/; //번호만
												var result = re4.test(phonenum);
												if (result == true
														&& phonenum.length == 11) {
													document
															.getElementById("phonep").innerHTML = "";
													$(this).css("color",
															"green");
													phoneValidation = true;
												} else {
													$(this).css("color", "red");
													document
															.getElementById("phonep").innerHTML = "번호를 올바르게 입력해주세요.";
													phoneValidation = false;
												}
											});//end phoneKeyUp()    
											
						});
	</script>

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
					<h2 class="align-center">Sign up</h2>
					<hr />
					<form action="#" id="joinform" name ="joinform"  method="post">
						<div class="field half">
							<label for="id">ID</label> <input name="id" id="id" type="text"
								placeholder="id" style="width: 70%;"> <input
								type="hidden" name="idDuplication" value="idUncheck">
								 <input	type="button" id="chkid" value="중복확인">
								  <p id="idp" style="color: red" ></p>
						</div>
						<div class="field">
							<label for="pass">Password</label> <input name="pass" id="pass"
								type="password" placeholder="Pass" style="width: 33%;">
								<p id="passp" style="color: red" ></p>
						</div>
						<div class="field">
							<label for="pass">Password Check</label> <input name="passchk"
								id="passchk" type="password" placeholder="Pass"
								style="width: 33%;">
								   <p id="ffpassp" style="color: red" ></p>
						</div>
						<div class="field half">
							<label for="name">Name</label> <input name="name" id="name"
								type="text" placeholder="Name" style="width: 70%;">
								 <p id="namep" style="color: red" ></p>
						</div>

						<div class="field" id="phone">
							<label for="email">PhoneNumber</label> <select id="hp1"
								name="hp1" class="hp1"
								style="width: 10%; float: left; margin-right: 5px;">

								<option value="010" selected>010</option>

								<option value="011">011</option>

								<option value="016">016</option>

								<option value="017">017</option>

								<option value="018">018</option>

								<option value="019">019</option>

							</select>
							<input type="text" class="hp2" id="hp2" name="hp2" size="4"
								maxlength="4"
								style="width: 15%; float: left; margin-right: 5px;">
								<input
								type="text" id="hp3" class="hp3" name="hp3" size="4"
								maxlength="4" style="width: 15%;">
								 <input type="hidden" id="phonenum" name="phonenum">
								  <p id="phonep" style="color: red" ></p>
								
>>>>>>> refs/heads/testbranch
						</div>

						<div class="field half">
							<label for="email">Email</label> <input name="email" id="email"
								type="email" placeholder="Email">
						</div>
						<div class="6u$ 12u$(small)">
							<input type="checkbox" id="demo-human" name="demo-human" checked>
							<label for="demo-human">I am a human and not a robot</label>
						</div>
						<ul class="actions align-center">

							<li><input value="Signup" id="sign" class="button fit"
								type="submit"></li>
						</ul>
					</form>
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