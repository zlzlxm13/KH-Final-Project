<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 예약 페이지 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/jquery-ui-timepicker-addon.js"></script>
<link rel="stylesheet" type="text/css" href="css/datedropper.css"> 
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">

<style>

#frm{
  margin-top:100px;
}

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
	 
	 
	$("#btnSave").click(function(){
		if($("#kind option:selected").val() == ""){
			 alert(" 동물을 선택해 주십시오. ");
			 return false;
		 }else if( $("#datepi").val() == ""){
			 alert(" 날짜를 선택해 주십시오. ");
			 return false;
		 }else{
			 $("#reservation").submit();
		 }
	});
	 
	 		
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
                ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
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

<h2 class="align-center">Reservation</h2>
 <hr />


<form method="post" action="reservationok.do" id="reservation">


<div id="res" style="float:left;">
<table>
<tr>
<td width="20%" align="center"> 품종  :</td>
<td> <select name="petpet" id="kind">
		<option value="">- PetKind -</option>
			<c:forEach var="petkind" items="${petkind}" varStatus="status">
					<option value="${petkind.kind}">${petkind.kind}</option>
						</c:forEach>
		</select> 
</td>
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
	   type="button" id="btnSave" style="color: black;" />	 
	      
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
