<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/jquery-ui-timepicker-addon.js"></script>
<link rel="stylesheet" type="text/css" href="css/datedropper.css"> 

<style>

#frm{
  margin-top:100px;
}
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

body{
 margin-top: 60px;
}

#res {
  width: 450px;
  height: 400px;
  padding: 100px 40px;
  margin: 0 20px 0 400px;	
  border: 1px solid #eee;
  border-top-width: 2px;
  }
  
  table{
   margin-top:-60px;
   margin-bottom: 20px;
  }
 
 #btnSave{margin-top : 10px; margin-left : 120px;}
 
#pet_pet {font-size : 13px; height:40px;line-height:40px; margin: 0 0 20px;}
#datepi {font-size : 13px; height:40px;line-height:40px; margin: 0 0 20px;}
#hos_num {font-size : 13px; height:40px;line-height:40px; margin: 0 0 20px;}
#mem_id {font-size : 13px; height:40px;line-height:40px; margin: 0 0 20px;}
textarea {font-size : 13px;}
 .ui-datepicker-week-end {color:red;}
.ui-datepicker-week-end .ui-state-default {color:red;} 
</style>

<script type="text/javascript">
 $(document).ready(function () {

	 		
	 jQuery.browser = {};
	 (function () {
	     jQuery.browser.msie = false;
	     jQuery.browser.version = 0;
	     if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	         jQuery.browser.msie = true;
	         jQuery.browser.version = RegExp.$1;
	     }
	 })();
	 
  	$(function(){

		    $("#datepi").datetimepicker({  
		    	dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)    
		    	,beforeShowDay: noSundays
		        ,timeFormat:'HH:mm'
		        ,controlType:'select'
		        ,oneLine:true
		    });
		    
		    
		    $('#datepicker').datetimepicker('setDate', 'today');
		    function noSundays(date) {
		      return [date.getDay() != 0, ''];
		    }
  		});
  	
 });
 
 
</script>
</head>
<body>
<!-- Header -->
			<script src="js/login.js" type="text/javascript"></script>
	<header id="header">
			<div class="logo"><a href="index.do">SooCut animal hospital <span>by KHfamily</span>  Reservation</a></div>
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
							<li>${sessionScope.id }님 환영합니다
								<ul class="links">
									<li><a href="#">마이페이지</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</ul>
							</li>			
							<%} %>
					
				</ul>
			</nav>

<h2 class="align-center">Reservation</h2>
 <hr />


<form method="post" action="reservationok.do">


<div id="res" style="float:left;">
<table>
<tr>
<td width="20%" align="center"> 품종  :</td>
<td> <input type="text" id = "pet_pet" name="petpet" placeholder="품종을 입력하세요." required/> </td>
</tr>

<tr>
<td width="30%" align="center"> 예약 날짜  :</td>
<td> <input type="text" id = "datepi" name="red" placeholder="진료 날짜를 선택하세요." readonly ></td>
</tr>

<tr>
<td width="20%" align="center"> 병원 이름  :</td>
<td> <input type="text" id = "hos_num"  name="hospital_hosname" value=<%=request.getParameter("hosname")%> readonly/></td>
</tr>

<input type="hidden" id = "hos_num"  name="hospital_hosnum" value=<%=request.getParameter("hos_num")%> readonly />


<tr>
<td width="20%" align="center">  ID  :</td>
<td><input type="text" id = "mem_id" name="member_id" readonly value="${sessionScope.id }"/></td>
</tr>
<!-- 추가 -->
<tr>
<td width="50%" align="center"> email  :</td>
<td><input type="text" id="email" name="email" readonly value="${sessionScope.email}"/></td>
</tr>

<tr>
<td width="20%" align="center"> 증상  :</td>
<td><TEXTAREA name="petinfo" cols=30 rows=4 style="resize: none;" placeholder="ex)건강 검진, 심장사상충 접종..." ></TEXTAREA></td>
</tr>
</table>

<input value="예약하기" class="button alt icon fa-check"
	   type="submit" id="btnSave" style="color: black;" />	 
	      
<input value="취소하기" class="button alt icon fa-check"
	   type="button" id="btnReturn" onclick="location.href='hosmap.do'" style="color: black;" />	   
	  
</div>
</form>

<div class="6u 12u$(medium)" style="float:left;">
	<img src="images/monkey.jpg" />
</div>


	<!-- Scripts -->
	<script src="js/jquery.scrolly.min.js"></script>
	<script src="js/jquery.scrollex.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>

 </body>
</html>
