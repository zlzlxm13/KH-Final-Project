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


<script src="http://code.jquery.com/jquery.min.js"></script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/main.css" />

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<head>
<title>SooCut animal hospital</title>

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
	} else if(${menu} == '4') {
		document.getElementById('rdate').valueAsDate = new Date();
	} else if(${menu} == '3') {
var locPosition = new daum.maps.LatLng(33.450701, 126.570667);
	
	var geocoder = new daum.maps.services.Geocoder();
	if (navigator.geolocation) {
	    
	navigator.geolocation.getCurrentPosition(function(position) {
		locPosition = new daum.maps.LatLng(position.coords.latitude, position.coords.longitude);
         // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		map.panTo(locPosition);
		 marker.setPosition(locPosition);
      });
	} else {
	}
	
	
  	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   	mapOption = { 
        center: locPosition, // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
 	var map = new daum.maps.Map(mapContainer, mapOption);
 	
 	
 	var marker = new daum.maps.Marker({
 		position : locPosition
 	}), // 클릭한 위치를 표시할 마커입니다
 	    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
 	    marker.setMap(map);
 	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
 	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);
            $('#latitude').attr("value", mouseEvent.latLng.getLat());
        	$('#longitude').attr("value", mouseEvent.latLng.getLng());
            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});
// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});
function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
             
        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
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
			<li value="3"><a href="adminHospital.do"> <i
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
	<c:if test="${menu == 1}">
		<main>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>INSERT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" id="id" value=""
							placeholder="ID"></input></td>
					</tr>
					<tr>
						<td>password</td>
						<td><input type="text" name="password" id="password" value=""
							placeholder="password"></input></td>
					</tr>



					<tr>
						<td>name</td>
						<td><input type="text" name="name" id="name" value=""
							placeholder="name"></input></td>
					</tr>
					<tr>
						<td>grade</td>
						<td><input type="text" name="grade" id="grade" value=""
							placeholder="grade"></input></td>
					</tr>
					<tr>
						<td>phonenum</td>
						<td><input type="text" name="phonenum" id="phonenum" value=""
							placeholder="phonenum"></input></td>
					</tr>

					<tr>
						<td>email</td>
						<td><input type="text" name="email" id="email" value=""
							placeholder="email"></input></td>
					</tr>
				</tbody>
			</table>
			<!--  -->

			<a href="#" class="button"
				onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminMemberInsert.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Insert</a>
		</form>
		</main>
	</c:if>

	<c:if test="${menu == 2}">
		<main>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>INSERT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>petname</td>
						<td><input type="text" name="petname" id="petname" value=""
							placeholder="petname"></input></td>
					</tr>
					<tr>
						<td>petage</td>
						<td><input type="text" name="petage" id="petage" value=""
							placeholder="petage"></input></td>
					</tr>
					<tr>
						<td>petsex</td>
						<td><input type="text" name="petsex" id="petsex" value=""
							placeholder="petsex"></input></td>
					</tr>
					<tr>
						<td>member_id</td>
						<td><input type="text" name="member_id" id="member_id"
							value="" placeholder="member_id"></input></td>
					</tr>
					<tr>
						<td>petkind_kind</td>

						<td><select name="petkind_kind" id="petkind_kind">
								<option value="">- PetKind -</option>
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<option value="${petkind.kind}">${petkind.kind}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>petinfo</td>
						<td><input type="text" name="petinfo" id="petinfo" value=""
							placeholder="petinfo"></input></td>
					</tr>


				</tbody>
			</table>

			<a href="#" class="button"
				onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminPetInsert.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Insert</a>
		</form>
		</main>
	</c:if>
	<c:if test="${menu == 3}">
		<main>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>INSERT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>HOSNAME</td>
						<td><input type="text" name="hosname" id="hosname" value=""
							placeholder="HOSNAME"></input></td>
					</tr>
					<tr>
						<td>HOSADDRESS</td>
						<td><input type="text" name="hosaddress" id="hosaddress"
							value="" placeholder="HOSADDRESS"></input></td>
					</tr>
					<tr>
						<td>HOSAREA</td>
						<td><input type="text" name="hosarea" id="hosarea" value=""
							placeholder="HOSAREA"></input></td>
					</tr>
					<tr>
						<td>LATITUDE</td>
						<td><input type="text" name="latitude" id="latitude" value=""
							placeholder="LATITUDE"></input></td>
					</tr>
					<tr>
						<td>LONGITUDE</td>
						<td><input type="text" name="longitude" id="longitude"
							value="" placeholder="LONGITUDE"></input></td>
					</tr>

					<tr>
						<td>PETKIND</td>
						<td><input type="text" class="petkind_kind" id="petkind_kind"
							value="" name="petkind_kind" readonly></input></td>
						<td><select name="kind" id="kind">
								<option value="">- PetKind -</option>
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<option value="${petkind.kind}">${petkind.kind}</option>
								</c:forEach>
						</select></td>

						<td><input type="button" class="del" id="del" name="del"
							value="del"></input></td>

					</tr>
				</tbody>
			</table>


			<a href="#" class="button"
				onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminHospitalInsert.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Insert</a>

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
		</main>
	</c:if>
	<c:if test="${menu == 4}">
		<main>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>INSERT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<TD>HOSPITAL_HOSNUM</TD>
						<td><input type="text" name="hospital_hosnum"
							id="hospital_hosnum" value="" placeholder="hospital_hosnum"></input></td>
					</tr>
					<tr>
						<TD>HOSPITAL_HOSNAME</TD>
						<td><input type="text" name="hospital_hosname"
							id="hospital_hosname" value="" placeholder="hospital_hosname"></input></td>
					</tr>
					<tr>
						<TD>MEMBER_ID</TD>
						<td><input type="text" name="member_id" id="member_id"
							value="" placeholder="member_id"></input></td>
					</tr>
					<tr>
						<TD>RES_DATE</TD>
						<td><input type="date" name="rdate" id="rdate" value=""
							placeholder="res_date"></input></td>
					</tr>
					<tr>
						<TD>PETKIND</TD>
						<td><select name="petpet" id="kind">
								<option value="">- PetKind -</option>
								<c:forEach var="petkind" items="${petkind}" varStatus="status">
									<option value="${petkind.kind}">${petkind.kind}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<TD>PETINFO</TD>
						<td><input type="text" name="petinfo" id="petinfo" value=""
							placeholder="PET"></input></td>
					</tr>
				</tbody>
			</table>

			<a href="#" class="button"
			onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminReservationInsert.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Insert</a>
				
		</form>
		</main>
	</c:if>
	<c:if test="${menu == 6}">
		<main>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>INSERT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>kind</td>
						<td><input type="text" name="kind" id="kind" value=""
							placeholder="kind"></input></td>
					</tr>
				</tbody>
			</table>
			<a href="#" class="button"
			onclick="if($.fn.inputdata() == '') {$('form').attr('action', 'adminPetKindInsert.do').submit();} else{alert($.fn.inputdata().substr(0, $.fn.inputdata().length - 2)+'가 비었습니다.');}">Insert</a>
			
		</form>
		</main>
	</c:if>

</body>
</html>