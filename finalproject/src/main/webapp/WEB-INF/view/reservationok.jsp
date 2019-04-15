<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/hosmap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">+
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png"> 

<style>
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
 .ui-datepicker-week-end {color:red;}
.ui-datepicker-week-end .ui-state-default {color:red;} 

	body {
		height : 1000px;
	}
 
 	/* 예약 화면 창  */
	#reservationwrap{ 	 

           	width : 900px;
  			height : 850px;
            margin : 550px; 
            margin-top : 40px;
            text-align: center;
            white-space: pre;
            border: 1px solid #bcbedc;
  			border-top-width: 2px;
        }
        
  	/* 예약 완료 창 */
  	.ok-center {
  	text-align: center;
    margin-top: 80px;
    height: 80;
    width: 300;
    margin-left: 850;
	}
	
	/* 예약 완료 글자 */
	header p {
    color: #212020;
    }
 
	/* Button */
	  input[type=button]{
	  background:#1AAB8A;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:60px;
	  font-size:1.6em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
		}
		
		 input[type=button]:hover{
		  background:#fff;
		  color:#1AAB8A;
		}
		 input[type=button]:before,  input[type=button]:after{
		  content:'';
		  position:absolute;
		  top:0;
		  right:0;
		  height:2px;
		  width:0;
		  background: #1AAB8A;
		  transition:400ms ease all;
		}
		  input[type=button]:after{
		  right:inherit;
		  top:inherit;
		  left:0;
		  bottom:0;
		}
		  input[type=button]:hover:before,  input[type=button]:hover:after{
		  width:100%;
		  transition:800ms ease all;
		}
		  
  
  
        
</style>

<script type="text/javascript">
 $(document).ready(function () {
		
 });
</script>

</head>
<body>

<!-- Header -->
			<script src="js/login.js" type="text/javascript"></script>
	<header id="header">
			<div class="logo"><a href="index.do">SooCut animal hospital <span>by KHfamily</span>  Reservation Page</a></div>
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
			<%
				if (session.getAttribute("id") == null) {
			%>
			<li><a href="login.do">Login</a></li>
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
	
    <form method="post" action="reservationok.do">
    
    <header class="ok-center">
    <p> 예약 완료 
    <hr/>
    </header>
   	
	<div id=reservationwrap>
		<td><font size="10" word>
예약이 완료되었습니다.
이용해주셔서 감사합니다.
		</font>

<table>
<tr>
<td width="20%" align="center"> 품종  :</td>
<td>${dto.petpet} </td>
</tr>

<tr>
<td width="30%" align="center"> 예약 날짜  :</td>	
<fmt:formatDate var="res" value="${dto.getRes_date()}" pattern="yyyy 년  MM 월 dd 일 HH 시 mm 분"/>
<td> ${res} </td>
</tr>

<tr>
<td width="20%" align="center"> 병원 이름  :</td>
<td> ${dto.hospital_hosname}</td>
</tr>

<tr>
<td width="20%" align="center"> 성함  :</td>
<td>${sessionScope.name}</td>
</tr>

<tr>
<td width="20%" align="center"> 수신 Email  :</td>
<td>${sessionScope.email}</td>
</tr>



<tr>
<td width="20%" align="center"> 증상  :</td>
<td>${dto.petinfo}</td>
</tr>	

</table>

	  <td> <input type="button" id="hbtn" value="메인 페이지" onclick="location.href='index.do';" /></td>
</div>
</form>





	<!-- Scripts -->
	<script src="js/jquery.scrolly.min.js"></script>
	<script src="js/jquery.scrollex.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script> 
 </body>
</html>
