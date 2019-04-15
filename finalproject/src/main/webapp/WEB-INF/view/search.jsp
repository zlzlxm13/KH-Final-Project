<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a328a3aa73a3d31430a2aa26a4ea5fe5"></script>   
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/hosmap.css" />
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
<style>


#search {
  width: 1300px;
  height: 1400px;
  padding: 40px;
  margin: 0 auto;	
  border: 1px solid #eee;
  border-top-width: 2px;
  }

#member_id{

  text-align : center;
  margin-top : 30px;
}

#wrap {
  margin: 0 auto;	
  border-top-width: 2px;
  text-align : center;
  }
  
 #wrap2 {
  border-top-width: 2px;
  text-align : center;
 }
 
</style>

<script type="text/javascript">


$(document)
		.ready(
			function() {
				
				$('#btnsearch').bind("click",function(){
					$.ajax({
						type : 'GET',
						dataType : 'json',
						url : 'searchpro.do?member_id=' + $('#member_id').val(),
						success : viewMessage
					});	
				});
				
				$("#btnsearch").trigger("click");
			});

			function viewMessage(res){
				
				// 예약 기록
				$('#wrap2').empty();
				$('#wrap2').append('<table><tr><td> 상세 확인  </td><td> 예약 날짜   </td><td> 예약 병원  </td><td> 진찰 동물 </td><td> 예약 상황  </td><td> 삭제 </tr></table>');
				
				// 예약 확인
				$('#wrap').empty();
				$('#wrap').append('<table><tr><td> 상세 확인  </td><td> 예약 날짜   </td><td> 예약 병원  </td><td> 진찰 동물 </td><td> 예약 상황  </td><td> 수정 </td><td> 취소 </tr></table>');
				
				$.each(res,function(index,value){	
					
					var sdata=new Date(value.res_date);
					var sm=sdata.getFullYear()+"년 ";
					sm+=(sdata.getMonth()+1)+"월 ";
					sm+=sdata.getDate()+"일  ";
					sm+=sdata.getHours()+" : ";
					if(sdata.getMinutes() != 30){
						sm+=sdata.getMinutes() + "0";	
					} else if (sdata.getMinutes() == 30 ){
						sm+=sdata.getMinutes();
					}
					
					var hdata = new Date();
					
					for(var i = 0 ; i <= index ; i++){
						if(hdata > sdata){

 							var tr = '<tr><td><button class="btn btn-secondary" id='+value.res_num+' style="color: #FFFFFF;" selected> 상세 확인 </button></td><td>'+sm+'</td><td>'+value.hospital_hosname+'</td>';
							tr += '<td>'+value.petpet+'</td><td> 기간 만료 </td><td><button class="btn btn-success" id='+value.res_num+' style="color: #FFFFFF;" selected> 기록 삭제 </button>';
							$('#wrap2 table').append(tr); 
							return;
						}else if(hdata < sdata){

							var tr = '<tr><td><button class="btn btn-secondary" id='+value.res_num+' style="color: #FFFFFF;" selected> 상세 확인 </button></td><td>'+sm+'</td><td>'+value.hospital_hosname+'</td><td>'+value.petpet+'</td>';
							tr += '<td> 예약 중 </td><td><button class="btn btn-secondary" id='+value.res_num+' name="update" style="color: #FFFFFF;" selected> 예약 수정 </button></td><td><button class="btn btn-secondary" id='+value.res_num+' name="delete" style="color: #FFFFFF;" selected> 예약 취소 </button>';
							$('#wrap table').append(tr); 
							return; 
						}
					}
						
				});
				
				
				
				$(document).on('click', 'button', r_delete);
				
				function r_delete(){

					if($(this).text() == ' 예약 취소 '){

						if(confirm(" 예약을 취소하시겠습니까? ")){
							
						var drno=$(this).prop("id")
						$.ajax({
							type : 'POST',
							dataType : 'json',
							url : 'delete.do',
							data : 'res_num=' + drno,
							success : viewMessage
						});
						alert("취소 완료")
						location.reload();
						}
					}else if($(this).text() == ' 기록 삭제 '){
						if(confirm(" 기록을 삭제하시겠습니까? ")){
						var drno=$(this).prop("id")
						$.ajax({
							type : 'POST',
							dataType : 'json',
							url : 'delete.do',
							data : 'res_num=' + drno,
							success : viewMessage
						});
						alert("기록 삭제 완료")
						location.reload();
						}
					}else if($(this).text() == ' 상세 확인 '){
						
							var drno=$(this).prop("id")
	 							$.ajax({
								type : 'POST',
								dataType : 'json',
								url : 'rfsearch.do',
								data : 'res_num=' + drno,
								success : viewMessage
							}); 
								  var screenW = screen.availWidth; 
								  var screenH = screen.availHeight; 
								  var popW = 637; 
								  var popH = 842; 
								  var posL=( screenW-popW ) / 2;   
								  var posT=( screenH-popH ) / 2;   
								
								window.open("rfsearch.do?res_num=" + drno,"상세 확인",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL);
							
						 }else if($(this).text() == ' 예약 수정 '){
							var drno = $(this).prop("id");
							if(confirm(" 예약을 수정하시겠습니까? ")){
							 $.ajax({
								type : 'POST',
								dataType : 'json',
								url : 'rupdate.do',
								data : 'resnum=' + drno,
								success : function(dto){
			
									location.href = "updatemap.do?res_num="+dto.res_num;
									
								}
							}); 
							
						   }else{
							   return false;
						   } 
						}else{
							return false;
						}
						
			}		
		}
		
				
			
			
				

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
	<div id = "search" class="box">
	
	
 	<header class="align-center">
 	<p> 회원 ID 명 : 
	<input type="text" name="member_id" id="member_id" value="${sessionScope.id }" readonly/>
	<input type="hidden" value="찾기" id="btnsearch" /> </p>
	</header>
	<hr/>
	<form id="search_update" method="POST">
	<input type="hidden" name="res_num" value="${dto.res_num}"/>
	<h2 class="align-center"> 예약 확인 </h2>
	<div id="wrap">
	</form>
	</div>
	
	<h2 class="align-center"> 예약 기록 </h2>
	<div id="wrap2">
	</div>
	</div>
	
	
	
	
	
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
