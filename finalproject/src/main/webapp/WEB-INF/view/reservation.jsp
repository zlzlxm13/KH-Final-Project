<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#departure {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px;}
#hos_num {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px;}
#mem_id {font-size:20px;height:40px;line-height:40px; margin: 0 0 20px;}

</style>

<script type="text/javascript">
  $(document).ready(function(){

	  
	  $('#btnSave').bind('click',function(){
		  
		  $('#frm').attr('action','reservation.do').submit();
	  });
	  

  });
</script>

</head>
<body>


<form name="frm" id="frm" method="post">

<div id="res">
<table>
<tr>
<td width="20%" align="center"> 예약 번호  :</td>
<td> <input type="text" id = "res_num"/> </td>
</tr>

<tr>
<td width="20%" align="center"> 예약 날짜  :</td>
<td> <input type="date" id = "departure" />
<!-- <script>$("#departure").dateDropper();</script> </td> -->
</tr>

<tr>
<td width="20%" align="center"> 병원 번호  :</td>
<td> <input type="text" id = "hos_num"/> </td>
</tr>

<tr>
<td width="20%" align="center"> 고객 ID  :</td>
<td><input type="text" id = "mem_id"/></td>
</tr>
</table>
<input type="button" id="btnSave" value="저장" />
</div>
</form>

 </body>
</html>
