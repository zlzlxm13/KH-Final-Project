<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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



 	<p> 검색 </p>
	 <input type="text" name="member_id" id="member_id" value="3141" readonly/>
	<input type="submit" value="찾기" id="btnsearch" />
	
	<div id="wrap">
	
	</div>

</body>
</html>