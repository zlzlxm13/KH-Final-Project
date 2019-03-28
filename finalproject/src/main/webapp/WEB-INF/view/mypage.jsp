<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />
<style type="text/css">
.section_home .column+.column {
	float: none;
	overflow: hidden;
	width: auto;
}
.section_home .column {
	float: left;
	width: 50%;
}
#content.section_home {
	line-height: 14px;
	zoom: 1;
	padding: 16px 12px 94px;
}
.sh_group {
	min-height: 185px;
}
.sh_group, .sh_group2, .sh_group3, .sh_group4 {
	margin: 16px 8px 0;
	padding: 32px 29px 32px;
	text-align: left;
	border: 1px solid #dadada;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background: #fff;
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
			id="login_process" style="float: right;"> <input name="pass"
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
			<li><a href="generic.do">Notice</a></li>
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
					<li><a href="#">마이페이지</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</li>
			<%
				}
			%>

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
						<h2>MY Page</h2>
						<p>愁Cut에서의 '나'를 표현하는 프로필 정보입니다.</p>
					</header>
					<hr />
					<div class="row 200%">
						<div class="6u 12u$(medium)">
							<div class="column">

								<!-- 프로필 설정 -->
								<div class="sh_group">
									<div class="sh_header">
										<h2>愁Cut profile</h2>
										<!-- 	<a href="javascript:toggle('profile');"
											onclick="clickcr(this,'imn.prfhelp','','',event);"
											class="link_help"><i id="i_profile"
											class="spico ico_arr3_up">도움말</i></a> -->
										<!-- [D] 감추기 보이기 dislay:none/block -->
										<p id="p_profile" class="contxt" style="display: block;">
											愁Cut에서의 <em>'나'를 표현하는 프로필</em> 정보입니다.
										</p>

									</div>
									<div class="sh_content">
										<dl class="sh_lst">
											<dt class="nic_tit">아이디</dt>
											<dd class="nic_desc">${sessionScope.id}</dd>
											<dt>연락처 이메일</dt>
											<dd>${sessionScope.email}</dd>
											<dt>이름</dt>
											<dd>${sessionScope.name }</dd>
											<dt>등급</dt>
											<dd>${sessionScope.grade }</dd>
											<dt>번호</dt>
											<dd>${sessionScope.phonenum }</dd>

										</dl>
									</div>
									<p class="btn_area_btm">
										<a href="membermodify.do"
											onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);"
											class="btn_model"><b class="btn2">회원정보 변경</b></a>
									</p>
									<p>더이상 수컷을 사용하지 않는다면</p>
									<a href="#">회원탈퇴</a>
								</div>
								<!-- 예약관리  -->
								<div class="sh_group ">
									<div class="sh_header">
										<h2>예약 관리</h2>
										<!-- 		<a href="javascript:toggle('userInfo');"
											onclick="clickcr(this,'imn.cnthelp','','',event);"
											class="link_help"><i id="i_userInfo"
											class="spico ico_arr3_dn">도움말</i></a> -->
										<p id="p_userInfo" class="contxt" style="display: none">
											수컷 서비스중 <em>병원 예약 서비스 내역</em>입니다.
										</p>
									</div>
									<div class="sh_content">
										<dl class="sh_lst2">
											<dt>예약 내용</dt>
											<dd>${requestScope.dto.email}</dd>
										</dl>
									</div>
									<p class="btn_area_btm">
										<a
											href="/user2/help/changeUserInfo.nhn?menu=nid&amp;lang=ko_KR"
											onclick="clickcr(this,'imn.cntmodify','','',event);"
											class="btn_model"><b class="btn2">수정</b></a>
									</p>
								</div>
							</div>
						</div>
						<div class="6u 12u$(medium)">
							<div class="column">

								<div class="sh_group">
									<div class="sh_header">
										<h2>나의 펫 관리</h2>
									</div>
									<div class="sh_content">
										<p class="contxt">
											나의 애완동물 정보를<br> 관리할 수 있습니다.
										</p>
									</div>
									<div class="sh_content">
										<dl class="sh_lst">
											<dt class="nic_tit">아이디</dt>
											<dd class="nic_desc">${sessionScope.id}</dd>
											<dt>애완동물 이름</dt>
											<dd></dd>
											<dt>이름</dt>
											<dd>${sessionScope.name }</dd>
											<dt>등급</dt>
											<dd>${sessionScope.grade }</dd>
											<dt>번호</dt>
											<dd>${sessionScope.phonenum }</dd>

										</dl>
									</div>
									<p class="btn_area_btm">
										<a href="petinsert.do" class="btn_model"><b class="btn2">등록하기</b></a>
									</p>
								</div>
								<!-- 상담 관리 -->
								<div class="sh_group">
									<div class="sh_header">
										<h2>상담 관리</h2>
										<!-- 	<a href="javascript:toggle('region');"
											onclick="clickcr(this,'imn.reghelp','','',event);"
											class="link_help"><i id="i_region"
											class="spico ico_arr3_dn">도움말</i></a> -->
										<p id="p_region" class="contxt" style="display: none">
											수컷 서비스에서 <em>문의 하신 상담 내역</em>입니다. <br> 123
										</p>
									</div>
									<div class="sh_content"></div>
									<p class="btn_area_btm">
										<a href="/user2/help/region.nhn?menu=nid&amp;lang=ko_KR"
											onclick="clickcr(this,'imn.regmodify','','',event);"
											class="btn_model"><b class="btn2">설정하기</b></a>
									</p>
								</div>
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