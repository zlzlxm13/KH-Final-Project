<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a328a3aa73a3d31430a2aa26a4ea5fe5"></script>    
<link rel="stylesheet" href="css/hosmap.css" />
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

#search {
  width: 1000px;
  height: 800px;
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
</style>

<script type="text/javascript">

$(document)
		.ready(
			function() {
				
				$('#btnsearch').click(function(){
					$.ajax({
						type : 'GET',
						dataType : 'json',
						url : 'searchpro.do?member_id=' + $('#member_id').val(),
						success : viewMessage
					});
					
				});
				
			});////////////////////////////////////////


			function viewMessage(res){
				
				$('#wrap').empty();
				$('#wrap').append('<table><tr><td> 예약 번호  </td><td> 예약 날짜   </td><td> 병원 번호  </td><td> 예약 아이디 </td><td> 예약 취소 </td></tr></table>');
				
				
				
				$.each(res,function(index,value){
					var sdata=new Date(value.res_date);
					var sm=sdata.getFullYear()+"-";
					sm+=(sdata.getMonth()+1)+"-";
					sm+=sdata.getDate();
					
					var tr = '<tr><td>'+value.res_num+'</td><td>'+sm+'</td><td>'+value.hospital_hosnum+'</td><td>'+value.member_id+'</td>';
					tr += '<td><button id='+value.res_num+'>delete</button>';
					$('#wrap table').append(tr);
				});
				
				$(document).on('click', 'button', r_delete);
				
				function r_delete(){
					confirm("취소하시겠습니까?")
					if($(this).text() == 'delete'){
						var drno=$(this).prop("id")
						alert(drno);
						$.ajax({
							type : 'POST',
							dataType : 'json',
							url : 'delete.do',
							data : 'res_num=' + drno,
							success : viewMessage
						
						});
						alert("취소 완료")
					}	
				
			}
			
			
				
			}
				

</script>


</head>
<body>
<!-- Header -->
			<script src="js/login.js" type="text/javascript"></script>
	<header id="header">
			<div class="logo"><a href="index.do">SooCut animal hospital <span>by KHfamily</span></a></div>
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

					<li><a href="admin.do">admin</a></li>
					<li><a href="main.do">Reservation</a></li>

					
				</ul>
			</nav>
	<div id = "search" class="box">
	
	
 	<header class="align-center">
 	<p> 검색 ID 명 : 
	<input type="text" name="member_id" id="member_id" value="${sessionScope.id }" readonly/>
	<input type="submit" value="찾기" id="btnsearch" /> </p>
	</header>
	<hr/>
	<div id="wrap">
	
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
