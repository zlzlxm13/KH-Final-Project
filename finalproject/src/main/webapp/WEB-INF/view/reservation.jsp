<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/datedropper.js"></script>
<link rel="stylesheet" type="text/css" href="css/datedropper.css"> 
<style>
#res {
  width: 610px;
  height: 600px;
  padding: 40px;
  margin: 0 auto;	
  border: 1px solid #eee;
  border-top-width: 2px;
  }
  
  
#res_num {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px; }
#date {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px;}
#hospital_hosnum {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px;}
#mem_id {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px;}

</style>

<script type="text/javascript">
  $(document).ready(function(){

	  

  });
</script>

</head>
<body>


<form method="post" action="reservation.do">



<div id="res">
<table>
<tr>
<!-- <td width="20%" align="center"> 예약 번호  :</td>
<td> <input type="text" id = "res_num" name="res_num"/> </td>
</tr> -->

<tr>
<td width="20%" align="center"> 예약 날짜  :</td>
<td> <input type="text" id = "date" name="res_date" readonly="readonly" /></td>
 <script>$("#date").dateDropper();</script> </td> 
</tr>

<tr>
<td width="20%" align="center"> 병원 번호  :</td>
<td> <input type="text" id = "hospital_hosnum" name="hospital_hosnum"/> </td>
</tr>

<tr>
<td width="20%" align="center"> 고객 ID :</td>
<td><input type="text" id = "mem_id" name="member_id" /></td>
</tr>
</table>
<input type="submit" id="btnSave" value="저장" />
</div>
</form>

 </body>
</html>
