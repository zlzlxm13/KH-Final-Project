<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 예약 상세 </title>
<link rel="shortcut icon" href="/cat_Qwv_icon.ico">
<link rel="icon" href="/cat_Qwv_icon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/datedropper.css"> 
</head>
<style type="text/css">


		body{
		 margin-top: 60px;
		}

 		#printArea{
            width: 610px;
            margin-top :auto;
            margin-left:auto; 
            margin-right:auto;
            margin-bottom : auto;
            border : 5px solid white;
            text-align:center; 
 		}
 		
 		
 		#field {
			  border: 1px solid #eee;
			  border-top-width: 2px;
			  }
			 	
 		
 		input[type=text] {
		   width: 250px;
		   height: 30px;
		   border: 1px solid gray;
           text-align:center; 
           line-height:40px; 
           margin: auto;
		}
		
		div.noprint{
		
            text-align:center; 
			margin-right : 550px;
		}
		
		div.noprint2{
            text-align:center; 
		}
		
		#btndelete{
			margin-left : 520px;
		}
		
		@media print {
			div.noprint {display: none;}
			div.noprint2 {display: none;}
		}
		
		
		
</style>
<script type="text/javascript">

$(document).ready(function(){
	$('#btndelete').click(function(){
		alert($('#res_num').val());
		
		if(confirm(" 예약을 취소하시겠습니까? ")){
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'delete.do',
			data : 'res_num=' + $('#res_num').val()
		});
		alert("취소가 완료되었습니다.")
		self.close();
		opener.location.reload();
		}else{
			alert(" 예약 취소가 취소되었습니다. ")
			return false;
		}
	}); 

	
 
 function print(printArea)
 {
 		win = window.open(); 
 		self.focus(); 
 		win.document.open();

 		win.document.write(document.getElementById('printArea').innerHTML);
 		win.document.close();
 		win.print();
 		win.close();
 }
		})  

</script>

<body>
<form>
<h2 class="align-center"> 예약 상세 </h2>
</hr>

	<form>
	<div class="noprint">
	<input type="button" value="프린트" onclick="print()" />
	</div>
	
	<div id="printArea">
	
	<!-- <td for="fsearch" width="50%" align="center"> 예약 번호  </label> -->
	<input type="hidden" name="res_num" id="res_num" value="${dto.getRes_num()}" readonly/>	
	<%-- 	<label for="fsearch" width="50%" align="center"> 예약 아이디  </label>
	<input type="text" name="member_id" id="member_id" value="${dto.getMember_id()}" readonly/>
 	<hr/> --%>
 	
 	<hr/>
	<tr> 예약자 성함 </tr>
	<td> <input type="text" name="name" id="name" value="아무개" readonly/> </td>
	<hr/>
	
 	<tr> 예약 날짜 
	<fmt:formatDate var="res" value="${dto.getRes_date()}" pattern="yyyy 년  MM 월 dd 일 HH 시 mm 분"/>
	<%-- <input type="hidden" name="red" id="red" value="${dto.getRes_date()}"/> --%>
	<input type="text" name="red" id="red" value="${res}" readonly/></tr>
	<hr/>
		
	<%-- <label for="fsearch"> 예약 번호  </label>
	<input type="text" name="hospital_hosnum" id="hospital_hosnum" value="${dto.getHospital_hosnum()}" readonly/> --%>
	
	<tr> 병원 이름
	<input type="text" name="hospital_hosname" id="hospital_hosname" value="${dto.getHospital_hosname()}" readonly/></tr>
	<hr/>
	
	<tr> 예약 동물
	<input type="text" name="petpet" id="petpet" value="${dto.getPetpet()}" readonly/></tr>
	<hr/>
	
	<tr> 비고 
	<input type="text" name="petinfo" id="petinfo" value="${dto.getPetinfo()}" readonly/></tr>
	<hr/>
	
	</div>
	
	<div class="noprint2">
	<!-- <input type="button" id="btnupdate" value = " 간편 수정 " /> -->
	<input type="button" id='btndelete' value = " 삭제 " />
	</div>
	</form>
</form>
</body>
</html>