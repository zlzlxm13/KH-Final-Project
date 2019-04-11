<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#update').on('click', function(){
			$('[name=bcontent]').val($('[name=bcontent]').val().replace(/\n/gi, '<br/>'));
			$('#frm').attr('action', 'update.do').submit();
		});
		$('#cancel').on('click', function(){
			$('#btitle').val('${bdto.btitle}');
			$('#bcontent').val('${bdto.bcontent}');
			$('[name=bcontent]').val($('[name=bcontent]').val().trim());
			$('[name=bcontent]').val($('[name=bcontent]').val().replace(/<br\s?\/?>/g, "\n"));
		});
		$("#back").on('click', function(){
			history.go(-1);	//history.back();
		});
		$('[name=bcontent]').val($('[name=bcontent]').val().trim());
		$('[name=bcontent]').val($('[name=bcontent]').val().replace(/<br\s?\/?>/g, "\n"));
	});
</script>
<style type="text/css">
	body,select,div,form {
		font-size: 9pt;
		line-height: 160%;
		font-family: 굴림, verdana, tahoma;
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
	
	table {
	    width: 100%;
	    border-collapse: collapse;
	}
	th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	}
</style>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th width="20%">ID</th>
				<td>${bdto.member_id}</td>
				<th width="20%">등록일</th>
				<td>
					<fmt:formatDate value="${bdto.reg_date}" pattern="yyyy/MM/dd" />
				</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="btitle" id="btitle" value="${bdto.btitle}" />
				</td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea name="bcontent" id="bcontent" rows="13" cols="40">
						${bdto.bcontent}
					</textarea>
				</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<input type="file" name="filename" />
					<c:if test="bdto.bpath != null">
						<span>${fn:substringAfter(bdto.bpath, "_") }</span>
					</c:if>
				</td>
			</tr>
		</table>
		<input type="hidden" name="boardkind_canum" value="${bdto.boardkind_canum}" />
		<input type="hidden" name="bnum" value="${bdto.bnum}" />
		<input type="button" id="update" value="수정" />
		<input type="button" id="cancel" value="초기화" />
		<input type="button" id="back" value="이전" />	
	</form>
</body>
</html>