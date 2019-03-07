<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="map/map.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script 
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31a91b3131d8ac0ef598e70018388b20"></script>
</head>
<body>
	<div class="map_wrap">
	<div id="map"
		style="width: 100%; height: 100%; 
		position: relative; overflow: hidden;"></div>
		
	
	<!-- 지도타입 컨트롤 div 입니다 -->
		<div class="custom_typecontrol radius_border">
		<span id="btnRoadmap" class="selected_btn"
			onclick="setMapType('roadmap')">지도</span> 
			<span id="btnSkyview"
			class="btn" onclick="setMapType('skyview')">
			 스카이뷰</span>
		</div>
		
		<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
		<div class="custom_zoomcontrol radius_border">
			<span onclick="zoomIn()"><img
				src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
				alt="확대"></span> <span onclick="zoomOut()"><img
				src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
				alt="축소"></span>
		</div>
		
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<form onsubmit="searchPlaces(); return false">
					<span>지역명:</span> <input type="text" value=" ex) 서울" id="keyword"
						size="15" />
					<button type="submit">검색하기</button>
				</form>
			</div>
			<hr />
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
		
	
	</div>
	<script src="map/map.js"></script>
</body>
</html>