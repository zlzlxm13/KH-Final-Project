<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/board.css" />
<style type="text/css">
	body,select,div,form {
		font-size: 9pt;
		line-height: 160%;
		font-family: 굴림, verdana, tahoma;
	}
	
	textarea{
		border-left: 1px solid #999999;
		border-right: 1px solid #999999;
		border-top: 1px solid #999999;
		border-bottom: 1px solid #999999;
		font-size: 9pt;
		font-family: 굴림, verdana;
	}
	
	input[type="submit"],input[type="reset"],input[type="button"],button,.button {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		border-radius: 4px;
		border: 0;
		cursor: pointer;
		display: inline-block;
		font-weight: 400;
		height: 2.85rem;
		line-height: 2.95rem;
		padding: 0 1.5rem;
		text-align: center;
		text-decoration: none;
		white-space: nowrap;
		text-transform: uppercase;
	}
	
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnList').on('click',function(){
		$('#frm').attr('action','list.do?boardkind_canum=' + $('[name=boardkind_canum]').val()).submit();
	});

	$('#btnInsert').on('click',function(){
		
		$('[name=bcontent]').val($('[name=bcontent]').val().replace(/\n/gi, '<br/>'));
		$('#frm').attr('action','write.do').submit();
	});

	$('#filepath').on('change',function(){	//첨부파일 용량체크
		if(this.files && this.files[0]){				 
			if(this.files[0].size > 1000000000){
				alert("1GB바이트 이하만 첨부할 수 있습니다.");				
				$('#filepath').val('');
				return false;
			}				
		}
	});  
});
</script>
</head>
<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<div>
			<div>
				<select name="boardkind_canum">
					<option value="1">자유게시판</option>
					<option value="2">상담게시판</option>
					<option value="3">공지사항</option>
				</select>
				<input type="hidden" name="member_id" size="10" maxlength="10" value="${sessionScope.id}" />
			</div>
			<div>
				<p>
					제목<input type="text" name="btitle" size="40" />
				</p>
			</div>
			
			<div>
				<p>내용</p>
				<textarea name="bcontent" rows="13" cols="40"></textarea>
			</div>
			
			<div>
				<p>
					<input type="file" name="filename" id="filepath"/>
				</p>
			</div>
			<div>
				<input type="button" id="btnList" value="목록" /> 
				<input type="button" id="btnInsert" value="작성" />
			</div>
		</div>
	</form>
</body>
</html>