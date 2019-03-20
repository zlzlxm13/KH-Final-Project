<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<title>Generic - Transitive by TEMPLATED</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/login.js" type="text/javascript"></script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.scrollex.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("li[value="+${menu}+"]").addClass('active');

	$('input.dbbox').on('click', function(){
		if ($(this).is(":checked")){
			$(this).attr('name', 'chk');
		} else {
			
			$(this).removeAttr('name');
		}
	});
	
	$('#checkall').on('click', function(){
		if($('#checkall').is(":checked")){

			$('input.dbbox').each(function(){
				this.checked = true;
				$(this).attr('name', 'chk');
			});
			
		} else {
			$('input.dbbox').each(function(){
				this.checked = false;
				$(this).removeAttr('name', 'chk');
			});
		}
	});
});
</script>

<style type="text/css">
input[type="checkbox"]#menu_state {
	display: none;
}

input[type="checkbox"]:checked ~ nav.admin {
	width: 250px;
}

input[type="checkbox"]:checked ~ nav.admin label[for="menu_state"] i::before
	{
	content: "\f053";
}

input[type="checkbox"]:checked ~ nav.admin ul {
	width: 100%;
}

input[type="checkbox"]:checked ~ nav.admin ul li a i {
	border-right: 1px solid #2f343e;
}

input[type="checkbox"]:checked ~ nav.admin ul li a span {
	opacity: 1;
	transition: opacity 0.25s ease-in-out;
}

input[type="checkbox"]:checked ~ main {
	left: 250px;
}

nav.admin {
	position: absolute;
	z-index: 9;
	top: 82px;
	left: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.75);
	color: #9aa3a8;
	width: 50px;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
	transition: all 0.15s ease-in-out;
}

nav.admin label[for="menu_state"] i {
	cursor: pointer;
	position: absolute;
	top: 50%;
	right: -8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	background: #fff;
	font-size: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 15px;
	width: 15px;
	border-radius: 50%;
	border: 1px solid #ddd;
	transition: width 0.15s ease-in-out;
	z-index: 1;
}

nav.admin  label[for="menu_state"] i::before {
	margin-top: 2px;
	content: "\f054";
}

nav.admin label[for="menu_state"] i:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

nav.admin  ul {
	overflow: hidden;
	display: block;
	width: 50px;
	list-style-type: none;
	padding: 0;
	margin: 0;
}

nav.admin ul li {
	border: 1px solid #2f343e;
	position: relative;
}

nav.admin ul li.active a {
	background: #4c515d;
	color: #fff;
}

nav.admin ul li a {
	position: relative;
	display: block;
	white-space: nowrap;
	text-decoration: none;
	color: #9aa3a8;
	height: 50px;
	width: 100%;
	transition: all 0.15s ease-in-out;
}

nav.admin ul li a:hover {
	background: #4c515d;
	color: #fff;
}

nav.admin ul li a * {
	height: 100%;
	display: inline-block;
}

nav.admin ul li a i {
	text-align: center;
	width: 50px;
	z-index: 999999;
}

nav.admin ul li a i.fa {
	line-height: 50px;
}

nav.admin  ul li a span {
	padding-left: 25px;
	opacity: 0;
	line-height: 50px;
	transition: opacity 0.1s ease-in-out;
}

main {
	position: absolute;
	transition: all 0.15s ease-in-out;
	top: 100px;
	left: 50px;
	margin-top: 30px;
	margin-left: 30px;
}
</style>
</head>

<script src="js/login.js" type="text/javascript"></script>

<body>

	<header id="header" class="alt"
		style="background-color: rgba(0, 0, 0, 0.75);">
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
	<script src="js/login.js" type="text/javascript"></script>
	<header id="header" class="alt">
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

			<li><a href="elements.do">Hospital</a></li>
			<%
				if (session.getAttribute("id") == null) {
			%>
			<li><a href="login.do">Login</a></li>
			<%
				} else {
			%>
			<li>${sessionScope.id }님환영합니다
				<ul>
					<li><a href="#">마이페이지</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</li>
			<%
				}
			%>

			<li><a href="hosmap.do">Hospital</a></li>
			<li><a href="login.do">Login</a></li>

			<li><a href="admin.do">admin</a></li>


		</ul>
	</nav>

	<input type="checkbox" id="menu_state" checked>
	<nav class="admin">
		<label for="menu_state"><i class="fa"></i></label>
		<ul>
			<li value="1"><a href="adminMember.do"> <i
					class="fa fa-smile-o"></i> <span>Member</span>
			</a></li>
			<li value="2"><a href="adminPet.do"> <i class="fa fa-heart"></i>
					<span>Pet</span>
			</a></li>
			<li>
			<li value="3"><a href="adminHosmap.do"> <i
					class="fa fa-hospital-o"></i> <span>Hospital</span>
			</a></li>
			<li value="4"><a href="adminReservation.do"> <i
					class="fa fa-paper-plane"></i> <span>Reservation</span>
			</a></li>
			<li value="5"><a href="adminBoard.do"> <i
					class="fa fa-pencil"></i> <span>Board</span>
			</a></li>
			<li value="6"><a href="adminPetKind.do"> <i
					class="fa fa-gift"></i> <span>PetKind</span>
			</a></li>
		</ul>
	</nav>
	<main> <c:if test="${menu == 2}">
		<a href="#"
			onclick="$('#frm').attr('action', 'adminInsert.do').submit();"
			class="button">Insert</a>
		<a href="#"
			onclick="$('#frm').attr('action', 'adminPetDelete.do').submit();"
			class="button">delete</a>
		<p></p>
		<form id="frm" method="post">
			<table>
				<tr>
					<td>No.</td>
					<td>PETNAME</td>
					<td>PETAGE</td>
					<td>PETSEX</td>
					<td>MEMBER_ID</td>
					<td>PETINFO</td>
					<td>PETKIND_KIND</td>
					<td><input type="checkbox" id="checkall" value="checkall"></input>
						<label for="checkall"></label></td>
				</tr>

				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td><a href="#"
							onclick='location.href="adminPetUpdate.do?menu=${menu}&petname=${dto.petname}&member_id=${member_id} }";'>${status.count}</a></td>
						<td>${dto.petname}</td>
						<td>${dto.petage}</td>
						<td>${dto.petsex}</td>
						<td>${dto.member_id}</td>
						<td>${dto.petinfo}</td>
						<td>${dto.petkind_kind}</td>
						<td><input type="checkbox" class="dbbox" id=${dto.petname }
							value=${dto.petname} ></input> <label for=${dto.petname}  }></label></td>
						<input type="hidden" name="petname" value=${dto.petname }></input>
						<input type="hidden" name="member_id" value=${dto.member_id }></input>
					</tr>
				</c:forEach>
				<input type="hidden" name="menu" value=${menu } />



			</table>
		</form>
	</c:if> <c:if test="${menu == 6}">
		<a href="#"
			onclick="$('#frm').attr('action', 'adminInsert.do').submit();"
			class="button">Insert</a>
		<a href="#"
			onclick="$('#frm').attr('action', 'adminPetKindDelete.do').submit();"
			class="button">delete</a>
		<p></p>
		<form id="frm" method="post">
			<table>
				<tr>
					<td>No.</td>
					<td>KIND</td>
					<td><input type="checkbox" id="checkall" value="checkall"></input>
						<label for="checkall"></label></td>
				</tr>



				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${dto.kind}</td>
						<td><input type="checkbox" class="dbbox" id=${dto.kind }
							value=${dto.kind} ></input> <label for=${dto.kind} ></label></td>

						<input type="hidden" name="kind" value=${dto.kind }></input>
					</tr>
				</c:forEach>
				<input type="hidden" name="menu" value=${menu } />



			</table>
		</form>
	</c:if> <c:if test="${menu == 3}">
		<a href="#"
			onclick="$('#frm').attr('action', 'adminInsert.do').submit();"
			class="button">Insert</a>
		<a href="#"
			onclick="$('#frm').attr('action', 'adminHosmapDelete.do').submit();"
			class="button">delete</a>
		<p></p>
		<form id="frm" method="post">
			<table>
				<tr>
					<td>hosnum</td>
					<td>hosname</td>
					<td>petkind_kind</td>
					<td>hosaddress</td>
					<td>hosarea</td>
					<td>latitude</td>
					<td>longitude</td>
					<td><input type="checkbox" id="checkall" value="checkall"></input>
						<label for="checkall"></label></td>
				</tr>

				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td><a href="#"
							onclick='location.href="adminPetUpdate.do?menu=${menu}&hosnum=${dto.hosnum}&hosaddress=${hosaddress} }";'>${dto.hosnum}</a></td>

						<td>${dto.hosname}</td>
						<td>${dto.petkind_kind}</td>
						<td>${dto.hosaddress}</td>
						<td>${dto.hosarea}</td>
						<td>${dto.latitude}</td>
						<td>${dto.longitude}</td>
						<td><input type="checkbox" class="dbbox" id=${dto.hosnum }
							value=${dto.hosnum} ></input> <label for=${dto.hosnum}  }></label></td>
						<input type="hidden" name="hosnum" value=${dto.hosnum }></input>
					</tr>
				</c:forEach>
				<input type="hidden" name="menu" value=${menu } />



			</table>
		</form>
	</c:if> </main>
</body>
</html>
