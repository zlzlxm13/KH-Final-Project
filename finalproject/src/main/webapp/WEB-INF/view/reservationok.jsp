<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
 .ui-datepicker-week-end {color:red;}
.ui-datepicker-week-end .ui-state-default {color:red;} 
 
#reservationwrap{ 	 
           	width: 800px;
 			height: 200px;
            margin-left:500px; 
            text-align:center;
            white-space: pre;
        }
        
#res {
  width: 450px;
  height: 400px;
  padding: 100px 40px;
  margin: 0 20px 0 400px;	
  border: 1px solid #eee;
  border-top-width: 2px;
  }
  #hwak{margin:50px 740px;}
  #hbtn{margin-left: 135px;}
       
</style>

<script type="text/javascript">
 $(document).ready(function () {
		

  	
 });
</script>

</head>
<body>
		
	<div id=reservationwrap>
		<td><font size="10" word>예약이 완료되었습니다.
	이용해주셔서 감사합니다. </font></td>
	
    </div>
    
    <form method="post" action="reservationok.do">
   
    <div id="hwak" style="float:left;">
    <td><font size="3" word>
	
    
<table>
<fmt:formatDate var="rdate" value="${dto.res_date}"
							pattern="yyyy년 MM월 dd일 HH시 mm분" />
<tr>
<td width="20%" align="center"> 품종  </td>
<td>${dto.petpet} </td>
</tr>

<tr>
<td width="30%" align="center"> 예약 날짜  </td>

<td>${rdate}</td>
</tr>

<tr>
<td width="20%" align="center"> 병원 이름  </td>
<td> ${dto.hospital_hosname}</td>
</tr>

<tr>
<td width="20%" align="center"> 고객 ID  </td>
<td>${dto.member_id}</td>
</tr>

<tr>
<td width="20%" align="center"> 증상  </td>
<td>${dto.petinfo}</td>
</tr>

</table>
	  <td> <input type="button" id="hbtn" value="홈으로" style="color: black;" onclick="location.href='index.do';" /></td>
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
