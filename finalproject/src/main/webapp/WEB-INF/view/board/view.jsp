<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#list').on('click', function(){
			$('#frm').attr('action','list.do').submit();
		});
		$('#replay').on('click', function(){
			alert($('#reply').val());
		});
	});
</script>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
	<table border="1" width="80%">
		<tr>
			<th width="20%">글쓴이</th>
			<td>${bdto.member_id}</td>
			<th width="20%">조회수</th>
			<td>${bdto.readcount}</td>
		</tr>

		<tr>
			<th>제목</th>
			<td colspan="3">${bdto.btitle}</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="3">${bdto.bcontent}</td>
		</tr>

		<tr>
			<th>파일</th>
			<td colspan="3">
				<c:if test="${!empty bdto.bpath}">
					<a href="contentdownload.do?boardkind_canum=${bdto.boardkind_canum}&bnum=${bdto.bnum}">${fn:substringAfter(bdto.bpath,"_")}</a>
				</c:if>
				<c:if test="${empty bdto.bpath}">
					<c:out value="첨부파일 없음" />
				</c:if>
			</td>
		</tr>
		<%if(session.getAttribute("id") != null){ %>	
		<tr>
			<th>댓글</th>
			<td colspan="3">
				<textarea name="reply" id="reply" rows="6" cols="80">
				</textarea>
			</td>
		</tr>
		<%} %>
	</table>

	<form name="frm" id="frm" method="get">
		<input type="hidden" name="boardkind_canum" value="${bdto.boardkind_canum}" />
		<input type="hidden" name="bnum" value="${bdto.bnum}" />
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
		<input type="hidden" name="col" value="${bdto.col}" />
		<input type="button" id="list" value="리스트" />
		
		<%if(session.getAttribute("id") != null){ %>	
			<input type="button" id="replay" value="답변" />
		<%} %>
	</form>
	
</body>
</html>