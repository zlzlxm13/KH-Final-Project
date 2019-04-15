
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<title>Generic - Transitive by TEMPLATED</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/login.js" type="text/javascript"></script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<head>
<title>SooCut animal hospital</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />
</head>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.scrollex.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0a984e7e6b73a9984c04ff2a0f0da1c&libraries=services,clusterer,drawing"></script>

<script type="text/javascript">
$(document).ready(function(){
	if(${menu} != "") {
		$("li[value="+${menu}+"]").addClass('active');
	}
	if(${menu} == 4) {
		document.getElementById('rdate').valueAsDate = new Date();
	} 
	
	
	$("#kind").on('change',function(){
		if ($('#kind option:selected').val() != ""){
			if ($('#petkind_kind').attr("value") == ""){
				$('#petkind_kind').attr("value", $('#kind option:selected').val());
				$('#kind option:selected').remove();
				return;
			}
			$('#petkind_kind').attr("value", $('#petkind_kind').attr("value")+" "+$('#kind option:selected').val());
			$('#kind option:selected').remove();
		}
	});
	$("#del").on('click',function(){
		var str = $('#petkind_kind').attr("value");
		if(str.length == 0)	{
			alert("입력값이 없습니다.");
			return;
		}
		
		var kind = str.substring(str.lastIndexOf(" ")+1, str.length);
		str = str.substring(0, str.lastIndexOf(" "));
		$('#kind').append('<option value='+kind+'>'+kind+'</option>');
		
		$('#petkind_kind').attr("value", str);

	});
	
	$.fn.inputdata = function() {
		var empty = "";
		$('form').find("input").each(function(){
			
			if($(this).val() == "") {
				empty = empty + $(this).attr("id") + ", ";
			}
		});
		return empty;
	}	
		
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

.map_wrap {
	position: absolute;
	width: 500px;
	height: 615px;
	top: 0;
	left: 750px;
}

#map {
	position: static;
	width: 500px;
	height: 415px;
	top: 0;
	left: 0;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

.title {
	font-weight: bold;
	display: block;
	font-size: 10px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
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
		${sessionScope.id }"님 환영합니다 <a href="logout.do">로그아웃</a>
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
		${sessionScope.id }"님 환영합니다 <a href="logout.do">로그아웃</a>
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
			<li>${sessionScope.id }"님환영합니다
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
			<li value="3"><a href="adminHospital.do"> <i
					class="fa fa-hospital-o"></i> <span>Hospital</span>
			</a></li>
			<li value="4"><a href="adminReservation.do"> <i
					class="fa fa-paper-plane"></i> <span>Reservation</span>
			</a></li>

			<li value="6"><a href="adminPetKind.do"> <i
					class="fa fa-gift"></i> <span>PetKind</span>
			</a></li>
		</ul>
	</nav>

	<main> <c:if test="${menu == 1}">
		<form id="frm" method="post">
			<table>
				<thead>
					<tr>
						<th>UPDATE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>id</td>
						<td><input type="text" id="id" name="id" value="${dto.id }"
							readonly></input></td>
					</tr>
					<tr>
						<td>password</td>
						<td><input type="text" name="password" id="password"
							value="${dto.password }" placeholder="password"></td>
					</tr>
					<tr>
						<td>name</td>
						<td><input type="text" name="name" id="name"
							value="${dto.name }" placeholder="name"></td>
					</tr>
					<tr>
						<td>grade</td>
						<td><input type="text" name="grade" id="grade"
							value="${dto.grade }" placeholder="grade"></td>
					</tr>
					<tr>
						<td>phonenum</td>
						<td><input type="text" name="phonenum" id="phonenum"
							value="${dto.phonenum }" placeholder="phonenum"></td>
					</tr>
					<tr>
						<td>email</td>
						<td><input type="text" name="email" id="email"
							value="${dto.email }" placeholder="email"></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="menu" value="1"></input>
		</form>
		<a href="#" class="button"
			onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminMemberUpdate.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Update</a>

	</c:if> <c:if test="${menu == 2}">
		<form id="frm" method="post">

			<table>
				<thead>
					<tr>
						<th>UPDATE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>PETNUM</td>
						<td><input type="text" id="petnum" name="petnum"
							value="${dto.petnum }" readonly></input></td>
					</tr>
					<tr>
						<td>PETNAME</td>
						<td><input type="text" name="petname" id="petname"
							value="${dto.petname }" placeholder="PETNAME"></td>
					</tr>
					<tr>
						<td>PETAGE</td>
						<td><input type="text" name="petage" id="petage"
							value="${dto.petage }" placeholder="PETAGE"></td>
					</tr>
					<tr>
						<td>PETSEX</td>
						<td><input type="text" name="petsex" id="petsex"
							value="${dto.petsex }" placeholder="petsex"></td>
					</tr>
					<tr>
						<td>MEMBER_ID</td>
						<td><input type="text" name="member_id" id="member_id"
							value="${dto.member_id }" placeholder="member_id"></td>
					</tr>
					<tr>
						<td>PETKIND_KIND</td>
						<td><select name="petkind_kind" id="kind">
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<c:choose>
										<c:when test="${petkind.kind == dto.petkind_kind}">
											<option value="${petkind.kind}" selected>${petkind.kind}
											</option>
										</c:when>
										<c:when test="${petkind.kind != dto.petkind_kind }">
											<option value="${petkind.kind}">${petkind.kind}</option>
										</c:when>
									</c:choose>
								</c:forEach>

						</select></td>
					</tr>
					<tr>
						<td>PETINFO</td>
						<td><textarea name="petinfo" id="petinfo"
								placeholder=" petinfo" rows="4">${dto.petinfo }</textarea></td>
					</tr>

				</tbody>
			</table>
			<input type="hidden" name="menu" value="2"></input>
		</form>
		<a href="#" class="button"
			onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminPetUpdate.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Update</a>
	</c:if> <c:if test="${menu == 3}">
		<c:set var="ptmp" value="${dto.petkind_kind}" />
		<c:set var="petkind_kind" value="${fn:replace(ptmp, ',', ' ')}" />
		<c:set var="arraypetkind" value="${fn:split(ptmp, ',')}" />
		<form id="frm" method="post">

			<table>
				<thead>
					<tr>
						<th>UPDATE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>HOSNUM</td>
						<td><input type="text" id="hosnum" name="hosnum"
							value="${dto.hosnum}" readonly></input></td>
					</tr>
					<tr>
						<td>HOSNAME</td>
						<td><input type="text" name="hosname" id="hosname"
							value="${dto.hosname }" placeholder="hosname"></td>
					</tr>
					<tr>
						<td>HOSADDRESS</td>
						<td><input type="text" name="hosaddress" id="hosaddress"
							value="${dto.hosaddress}" placeholder="hosaddress"></td>
					</tr>
					<tr>
						<td>HOSAREA</td>
						<td><input type="text" name="hosarea" id="hosarea"
							value="${dto.hosarea }" placeholder="hosarea"></td>
					</tr>
					<tr>
						<td>LATITUDE</td>
						<td><input type="text" name="latitude" id="latitude"
							value="${dto.latitude }" placeholder="latitude"></td>
					</tr>
					<tr>
						<td>LONGITUDE</td>
						<td><input type="text" name="longitude" id="longitude"
							value="${dto.longitude }" placeholder="longitude"></td>
						<td><input type="button" class="reset" id="reset"
							name="reset" value="RESET"></input></td>
					</tr>

					<tr>
						<td>PETKIND</td>
						<td><input type="text" class="petkind_kind" id="petkind_kind"
							value="${petkind_kind }" name="petkind_kind" readonly></input></td>
						<td><select name="kind" id="kind">
								<option value="">- PetKind -</option>
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<c:set var="doneLoop" value="true" />
									<c:forEach var="apetkind" items="${arraypetkind }">
										<c:if test="${apetkind == petkind.kind}">
											<c:set var="doneLoop" value="false" />
										</c:if>
									</c:forEach>
									<c:if test="${doneLoop == true}">
										<option value="${petkind.kind}">${petkind.kind}</option>
									</c:if>
								</c:forEach>
						</select></td>

						<td><input type="button" class="del" id="del" name="del"
							value="del"></input></td>

					</tr>

				</tbody>
			</table>
			<input type="hidden" name="menu" value="3"></input>

		</form>
		<div class="map_wrap">
			<div id="map"></div>

			<table>
				<thead>
					<tr>
						<td><span class="title"></span> <span id="centerAddr"></span>
						</td>
					</tr>

				</thead>
			</table>



		</div>


		<a href="#" class="button"
			onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminHospitalUpdate.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Update</a>
	</c:if> <c:if test="${menu == 4}">
		<form id="frm" method="post">

			<table>
				<thead>
					<tr>
						<th>UPDATE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<TD>RES_NUM</TD>
						<td><input type="text" id="res_num" name="res_num"
							value="${dto.res_num }" readonly></input></td>
					</tr>
					<tr>
						<TD>RES_DATE</TD>
						<fmt:formatDate var="rdate" value="${dto.res_date}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate var="rtime" value="${dto.res_date}"
							pattern="HH:mm" />
						<td><input type="date" name="rdate" id="rdate"
							value="${rdate }" placeholder="res_date"></input>
						<input type="time" name="rtime" id="rtime"
							value="${rtime }" placeholder="res_date"></input></td>
					</tr>
					<tr>
						<TD>HOSPITAL_HOSNUM</TD>
						<td><input type="text" name="hospital_hosnum"
							id="hospital_hosnum" value="${dto.hospital_hosnum }"
							placeholder="hospital_hosnum"></td>
					</tr>
					<tr>
						<TD>HOSPITAL_HOSNAME</TD>
						<td><input type="text" name="hospital_hosname"
							id="hospital_hosname" value="${dto.hospital_hosname }"
							placeholder="hospital_hosname"></td>
					</tr>
					<tr>
						<TD>MEMBER_ID</TD>
						<td><input type="text" name="member_id" id="member_id"
							value="${dto.member_id }" placeholder="member_id"></td>
					</tr>
					<tr>
						<TD>PETKIND</TD>
						<td><select name="petpet" id="petpet">
								<option value="">- PetKind -</option>
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<c:choose>
										<c:when test="${dto.petpet == petkind.kind}">
											<option selected="selected" value="${petkind.kind}">${petkind.kind}</option>
										</c:when>
										<c:otherwise>
											<option value="${petkind.kind}">${petkind.kind}</option>
										</c:otherwise>


									</c:choose>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<TD>PETINFO</TD>
						<td><input type="text" name="petinfo" id="petinfo"
							value="${dto.petinfo }" placeholder="petinfo"></td>
					</tr>

				</tbody>
			</table>
			<input type="hidden" name="menu" value="4"></input>
		</form>
		<a href="#" class="button"
			onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminReservationUpdate.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Update</a>
	</c:if></main>
</body>
</html>
