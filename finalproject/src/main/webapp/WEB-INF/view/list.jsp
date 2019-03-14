<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>


	<div id="wrap">
	 <table>
	  <tr>
	   <th> 예약 번호 </th>
	   <th> 예약 날짜 </th>
	   <th> 병원 번호 </th>
	   <th> 예약  ID </th>
	  </tr>
	  
	  <c:forEach items="${list}" var="ReservationDTO">
			 <tr>
			 <td>${ReservationDTO.res_num}</td>
			 <td><fmt:formatDate pattern="yyyy/MM/dd" 
			       dateStyle="short" value="${ReservationDTO.res_date}" />
			 </td>
			 <td>${ReservationDTO.hospital_hosnum}</td>
			 <td>${ReservationDTO.member_id}</td>
			 </tr>
			</c:forEach>
	 </table>
	</div>


</body>
</html>