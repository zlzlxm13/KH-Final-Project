<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<title>게시글</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {		//form의 id(!!!!)는 무조건 1개!
	$('#update').on('click',function(){
		$('#frm').attr('action','update.do').submit();
	});
	
	$('#delete').on('click',function(){
		$('#frm').attr('action','delete.do').submit();
	});
	
	$('#replyInsert').on('click', function(){
		$('[name=rcontent]').val($('[name=rcontent]').val().replace(/\n/gi, '<br/>'));
		$('#frmud').attr('action','view.do').submit();
	});
	
	$('.replyUpdate').on('click',function(){
		$('.frm2').attr('action','updateReply.do').submit();
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
<style type="text/css">
	a {
		font-weight: normal;
		color: gray;
		text-decoration: none;
	}

	body,select,div,form {
		font-size: 9pt;
		line-height: 160%;
		font-family: 굴림, verdana, tahoma;
	}
	
	table {
		border-left: none;
		border-right: none;
		border-top: none;
		border-bottom: none;
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
</head>
<body>
<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.scrollex.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>
	<table border="1" width="35%">
		<tr>
			<th width="10%">글쓴이</th>
			<td>${bdto.member_id}</td>
			<th width="10%">조회수</th>
			<td width="10%">${bdto.readcount}</td>
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
					<c:url var="bdown" value="bcontentdownload.do">
						<c:param name="boardkind_canum" value="${bdto.boardkind_canum}" />
						<c:param name="bnum" value="${bdto.bnum}" />
					</c:url>
					<c:choose>
						<c:when test="${fn:substringAfter(bdto.bpath,'.') eq 'jpg'}">
							<img src="${bdown}" width="150" height="250">
						</c:when>
						<c:otherwise>
							<a href="${bdown}">
								${fn:substringAfter(bdto.bpath,"_")}
							</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${empty bdto.bpath}">
					<c:out value="첨부파일 없음" />
				</c:if>
			</td>
		</tr>
		<button onclick="location.href='list.do?boardkind_canum=${bdto.boardkind_canum}'">게시판</button>
		<br>
		<br>
		<c:if test="${bdto.member_id eq sessionScope.id}">
			<form name="frm" id="frm" method="get">
				<input type="hidden" name="boardkind_canum" value="${bdto.boardkind_canum}">
				<input type="hidden" name="bnum" value="${bdto.bnum}">
				<input type="button" id="update" value="수정" />
				<input type="button" id="delete" value="삭제" />
			</form>
			<br>
			<br>
		</c:if>
	</table>
	<br>
	<br>
	<table border="1" width="60%">
		<tr>
			<td style="text-align:right" colspan="4" >총 ${bdto.col} 댓글</td>
		</tr>
		<c:forEach var="rdto" items="${ReplyDTO}">
			<form name="frmReply" id="frmReply" method="get">
				<tr>
					<th width="10%" style="text-align:center">${rdto.member_id}</th>
					<td>
						<c:if test="${!empty rdto.rpath}">
							<c:url var="rdown" value="rcontentdownload.do">
								<c:param name="boardkind_canum" value="${rdto.boardkind_canum}" />
								<c:param name="bnum" value="${rdto.bnum}" />
								<c:param name="rnum" value="${rdto.rnum}" />
							</c:url>
							<c:choose>
								<c:when test="${fn:substringAfter(rdto.rpath,'.') eq 'jpg'}">
									<img src="${rdown}" width="150" height="250">
								</c:when>
								<c:otherwise>
									<a href="${rdown}">
										${fn:substringAfter(rdto.rpath,"_")}
									</a>
								</c:otherwise>
							</c:choose>
							<br>
						</c:if>
						<span>${rdto.rcontent}</span>
					</td>
					<th width="10%" style="text-align:center">
						<fmt:formatDate value="${rdto.reg_date}" pattern="yyyy/MM/dd" />
					</th>
				</tr>
			</form>
		</c:forEach>
	</table>
	<br>
	<br>
	<%if(session.getAttribute("id") != null){ %>
		<form name="frmud" id="frmud" method="post" enctype="multipart/form-data">
			<div>
				<div>
					<input type="hidden" name="boardkind_canum" value="${bdto.boardkind_canum}" />
					<input type="hidden" name="bnum" value="${bdto.bnum}" />
					<input type="hidden" name="rnum" value="${bdto.col}" />
					<input type="hidden" name="member_id" value="${sessionScope.id}" />
					<textarea name="rcontent" rows="6" cols="90"></textarea>
				</div>
				<div>
					<input type="file" name="filename" id="filepath"/>
				</div>
				<div>
					<input type="button" id="replyInsert" value="댓작성" />
				</div>
			</div>
		</form>
	<%} %>
</body>
</html>