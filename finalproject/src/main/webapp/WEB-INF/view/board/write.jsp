<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnList').bind('click',function(){
		var bk = $('[name=boardkind_canum]').val();
		$('#frm').attr('action','list.do?boardkind_canum=' + bk).submit();
	});
	  
	$('#btnInsert').bind('click',function(){
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
<link rel="stylesheet" href="css/main.css"/>
</head>
<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<!-- <td width="20%" align="center">ID</td> -->
				<td>
					<select name="boardkind_canum">
						<option value="1">자유게시판</option>
						<option value="2">상담게시판</option>
						<option value="3">공지사항</option>
					</select>
					<input type="hidden" name="member_id" size="10" maxlength="10" value="${sessionScope.id}" />
				</td>
			</tr>
			<tr>
				<td width="20%" align="center">제목</td>
				<td>				
					<input type="text" name="btitle" size="40" />
				</td>
			</tr>
			<tr>
				<td width="20%" align="center">내용</td>
				<td><textarea name="bcontent" rows="13" cols="40"></textarea></td>
			</tr>
			<tr>
				<td width="20%" align="center">첨부파일</td>
				<td><input type="file" name="filename" id="filepath"/>
			</tr>
		</table>
		
		<input type="button" id="btnList" value="목록" /> 
		<input type="button" id="btnInsert" value="작성" />
	</form>
</body>
</html>