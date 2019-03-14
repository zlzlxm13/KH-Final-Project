<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="ajaxsrc/jquesy01.js"></script>
</head>
<body>



 <c:forEach var="dto" items="${aList}">
 <td>${dto.res_num}</td>
 <td>${dto.member_id}</td>
 
 </c:forEach>


</body>
</html>