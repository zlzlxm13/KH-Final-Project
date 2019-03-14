$(document).ready(function(){
	$('#btnsearch').click(function(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'process.do?data=' + $('#data').val(),
			success : viewMessage
		});
	});
	
});////////////////////////////////////////


function viewMessage(res){

	//alert(res);

	$('#wrap').append('<table><tr><td>res_num</td><td>res_date</td><td>hos_num</td><td>member_id</td></tr></table>');

	//자식 요소 삭제

	//$('#wrap').children().remove();

	// $('#wrap').empty();

	$.each(res,function(index,value){
		var sdata=new Date(value.res_date);
		var sm=sdata.getFullYear()+"-";
		sm+=(sdata.getMonth()+1)+"-";
		sm+=sdata.getDate();
		
		var tr = '<tr><td>'+value.res_num+'</td><td>'+sm+'</td><td>'+value.hos_num+'</td><td>'+value.member_id+'</td></tr>';
		$('#wrap table').append(tr);

	});

	/*$('#data').val('');
	  $('#data').focus();*/

	

}
