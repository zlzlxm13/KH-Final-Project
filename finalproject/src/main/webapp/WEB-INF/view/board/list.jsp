<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#back").on('click',function(){
		location.href="index.do"
	});
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
</head>
<body>
<!-- nav -->
<div id="bodywrap">
	<!-- 리스트 출력 -->
	<table>
		<tr>
			<td align="left">
				<input type="button" id="back" value="이전">
			</td>
			<td align="center" colspan="4">
				<button onclick="location.href='list.do?boardkind_canum=1'">자유게시판</button>
				<button onclick="location.href='list.do?boardkind_canum=2'">상담게시판</button>
				<button onclick="location.href='list.do?boardkind_canum=3'">공지사항</button>
			</td>
		</tr>
		<c:forEach var="bk" items="${cat}">
			<tr>
				<td colspan="5">
					<h1 align="center">${bk.catitle}</h1>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<th width="5%" align="center" style="text-align:center">번호</th>
			<th width="35%" align="center" style="text-align:center">제목</th>
			<th width="20%" align="center" style="text-align:center">등록일</th>
			<th width="15%" align="center" style="text-align:center">작성자</th>
			<th width="5%" align="center" style="text-align:center">조회수</th>
		</tr>
		<c:forEach var="bdto" items="${list}" varStatus="status">
			<tr>
				<td style="text-align:center">${bdto.bnum}</td>
				<td>
					<c:url var="bview" value="view.do">
						<c:param name="boardkind_canum" value="${bdto.boardkind_canum}"/>
						<c:param name="bnum" value="${bdto.bnum}"/>
					</c:url>
					<a href="${bview}" style="color: green; text-decoration: none;">${bdto.btitle}</a>
				</td>
				<td style="text-align:center"><fmt:formatDate value="${bdto.reg_date}" pattern="yyyy/MM/dd" /></td>
				<td style="text-align:center">${bdto.member_id}</td>
				<td style="text-align:center">${bdto.readcount}</td>
			</tr>
		</c:forEach>
		
		<tr align="center" height="20">
			<td colspan="5">
				<!-- 앞 페이지 번호 처리 출력 -->
				<c:if test="${currentPage <= 1}">
					←&nbsp;
				</c:if>
				<c:if test="${currentPage > 1}">
					<c:url var="blistST" value="list.do">
						<c:param name="boardkind_canum" value="${pdto.boardkind_canum}"/>
						<c:param name="page" value="${currentPage-1}"/>
					</c:url>
					<a href="${blistST}">←</a>
				</c:if>
					
				<!-- 끝 페이지 번호 처리 -->
				<c:set var="endPage" value="${maxPage}"/>
				<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="red" size="4">[${p}]</font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="list.do">
							<c:param name="boardkind_canum" value="${bdto.boardkind_canum}"/>
							<c:param name="page" value="${p}"/>
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage >= maxPage}">
					→
				</c:if>
				<c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="list.do">
						<c:param name="boardkind_canum" value="${bdto.boardkind_canum}"/>
						<c:param name="page" value="${currentPage+1}"/>
					</c:url>
					<a href="${blistEND}">→</a>
				</c:if>
				<%-- <!-- 앞 페이지 번호 처리 출력 -->
				<c:if test="${pv.startPage > 1}">
					<a href="list.do?currentPage=${pv.startPage - pv.blockPage}">←</a>
				</c:if> 
						
				<!-- 페이지 출력 -->
				<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i" step="1">
					<span>
						<c:url var="currPage" value="list.do">
							<c:param name="currentPage" value="${i}"/>
						</c:url>
						<c:choose>
							<c:when test="${i == pv.currentPage}">
								<a href="${currPage}" class="pagecolor">
									<c:out value="${i}" />
								</a>
							</c:when>
							<c:otherwise>
								<a href="${currPage}">
									<c:out value="${i}"/>
								</a>
							</c:otherwise>
						</c:choose>
					</span>	
				</c:forEach>
					
				<!-- 끝 페이지 번호 처리 -->
				<c:if test="${pv.endPage < pv.totalPage}">
					<a href="list.do?currentPage=${pv.endPage + pv.blockPage}">→</a>
				</c:if> --%>
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<%if(session.getAttribute("id") != null){ %>
					<form id="frm" name="frm" align="right" method="get" action="write.do">
						<input type="submit" id="btnWrite" class="button" value="글쓰기" />
					</form>
				<%} %>
			</td>
		</tr>
	</table>
</div>
</body>
</html>