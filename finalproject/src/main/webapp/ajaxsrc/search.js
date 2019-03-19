$(document).ready(function(){
	$('#btnsearch').click(function(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'searchpro.do?member_id=' + $('#member_id').val(),
			success : viewMessage
		});
		alert($("#member_id").val());
	});
	
});////////////////////////////////////////


function viewMessage(res){

	//alert(res);

	$('#wrap').append('<table><tr><td> 예약 번호  </td><td> 예약 날짜   </td><td> 병원 번호  </td><td> 예약 아이디 </td><td> 예약 취소 </td></tr></table>');

	//자식 요소 삭제

	//$('#wrap').children().remove();

	// $('#wrap').empty();

	$.each(res,function(index,value){
		var sdata=new Date(value.res_date);
		var sm=sdata.getFullYear()+"-";
		sm+=(sdata.getMonth()+1)+"-";
		sm+=sdata.getDate();
		
		var tr = '<tr><td>'+value.res_num+'</td><td>'+sm+'</td><td>'+value.hospital_hosnum+'</td><td>'+value.member_id+'</td>';
		tr += '<td><button type="button" id="del"> 예약 취소</button>';
		$('#wrap table').append(tr);

	});
	  
	$("#del").on("click" ,function() { 

	    $(this).parent().parent().remove(); 
	});  
	

}
