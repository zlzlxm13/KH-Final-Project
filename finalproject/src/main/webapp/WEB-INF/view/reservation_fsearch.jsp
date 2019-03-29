<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>

 		#wrap{
            width: 410px;
            margin-top : auto;
            margin-left:auto; 
            margin-right:auto;
            margin-bottom : auto;
            border : 5px solid white;
            text-align:center; 
 		}
 		
 		table{
 			margin-left:auto; 
            margin-right:auto;
            text-align:center;
 		}
 		
 		input[type=text] {
		   width: 300px;
		   height: 50px;
		   border: 1px solid white;
		   border-radius: 10px;
           text-align:center; 
           background-color: skyblue;
		}
</style>

<body>



<form>

	<header class="align-center">
	</header>
	<h2 class="align-center"> 예약 상세 확인표</h2>
	</hr>
	<div id="wrap">
	
	<input type="text" name="res_num" id="res_num" value="${dto.getRes_num()}" readonly/>
	<input type="text" name="member_id" id="member_id" value="${dto.getMember_id()}" readonly/>
 	<input type="text" name="hospital_hosnum" id="hospital_hosnum" value="${dto.getHospital_hosnum()}" readonly/>
	<input type="text" name="hospital_hosname" id="hospital_hosname" value="${dto.getHospital_hosname()}" readonly/>
	<input type="text" name="petpet" id="petpet" value="${dto.getPetpet()}" readonly/>
	<input type="text" name="res_date" id="res_date" value="${dto.getRes_date()}" readonly/>
	<input type="text" name="petinfo" id="petinfo" value="${dto.getPetinfo()}" readonly/>
	</div>

</form>


</body>
</html>