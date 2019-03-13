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
<<<<<<< HEAD
<script type="text/javascript">
$(document).ready(function(){
    //login_process의 id를 가지는것을 클릭하게 된다면 함수 실행
    $("#login_process").click(function(){
    	
        //json 객체를 생성
        var json = {
            //m_id의 이름을 가지고 m_id의 id를 가지는 태그의 벨류값을 가져옴 아래도 동일
           id : $("#id").val(),
           pass : $("#pass").val()
        };
        alert(json.id);
        //json을 포이치문 돌림
      /*   for(var str in json){
            //json[m_id or m_pw]를 돌릴때 길이가 0이면 아래 출력
            if(json[str].length == 0){
                //str은 json에 변수명을 가지고 #은 아이디 찾는것 attr은 에트류뷰트의 
                //placeholder를 찾는것
                alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
                 //포커스를 올려줌
                $("#" + str).focus(); 
                return;
            } */
        }
        alert(str);
        //비동기 통신 선언 (아작스)
         $.ajax({
            type : "post", //post로 요청
            url : "login.do", //login url로 요청
            data : json, // json데이터를 전성
            success : function(data) { //성공 하면
                switch (Number(data)) { //위치문
                case 0: // 0 일때
                    alert("아이디 또는 비밀번호가 일치하지 않습니다."); //경고 출력
                    break;
                case 1: // 1 일떄
                    window.location.href = "index.do"; //로그인 성공시 index페이지 이동

                default:
                    break;
                }
            },
            error : function(error) { //404 500등 오류 발생시 
                alert("오류 발생"+ error);
            }
        });
    });
});



</script>
=======

>>>>>>> refs/heads/testbranch
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
<<<<<<< HEAD
								placeholder="id">
						</div>
						<c:if test="${requestScope.IdChk==0}">
							<span style="font-size: 20; color: red;">일치하는 회원 정보가 없습니다.
								회원가입을 해주세요.</span>
						</c:if>
=======
								placeholder="id" style="width: 50%">
						</div>						
>>>>>>> refs/heads/testbranch
						<div class="field">
							<label for="pass">Password</label> <input name="pass" id="pass"
<<<<<<< HEAD
								type="password" placeholder="Pass">
						</div>
						<c:if test="${requestScope.IdChk==-1}">
							<span style="font-size: 20; color: red;">비밀번호를 확인하세요</span>
						</c:if>
						<ul class="actions align-center">
=======
								type="password" placeholder="Pass" style="width: 50%">
						</div>							
					</form>
							
					<script src="js/login.js" type="text/javascript"></script>
						<ul class="actions align-center">		
						<li><a href="#" class="button special icon fa-search">아이디,비밀번호 찾기</a>	</li>				
>>>>>>> refs/heads/testbranch
							<li><input value="Login" class="button alt icon fa-check"
<<<<<<< HEAD
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