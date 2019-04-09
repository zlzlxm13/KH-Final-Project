<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
<!-- nav -->
<!-- logOK -->
<%if(session.getAttribute("id") != null){ %>	
<form id="frm" name="frm" method="get" action="write.do">
	<input type="submit" id="btnWrite" value="글쓰기" />
</form>
<%} %>
<div id="bodywrap">
	<!-- 리스트 출력 -->
	<table>
		<%-- <tr>
			<th>
				<c:out value="${cat}"/>
			</th>
		</tr> --%>
		<tr>
			<th width="5%" align="center" style="text-align:center">번호</th>
			<th width="35%" align="center" style="text-align:center">제목</th>
			<th width="20%" align="center" style="text-align:center">등록일</th>
			<th width="15%" align="center" style="text-align:center">작성자</th>
			<th width="5%" align="center" style="text-align:center">조회수</th>
		</tr>
		<c:forEach var="bdto" items="${boardDTO}">
			<tr>
				<td style="text-align:center">${bdto.bnum}</td>
				<td>
					<%-- <c:url var="path" value="view.do">
						<c:param name="boardkind_canum" value="${bdto.boardkind_canum}" />
						<c:param name="bnum" value="${bdto.bnum}" />
						<c:param name="currentPage" value="${pv.currentPage}" />
					</c:url>
					<a href="${path}">${bdto.btitle} &nbsp ${path}</a> --%>
					<a href="view.do?boardkind_canum=${bdto.boardkind_canum}&bnum=${bdto.bnum}">${bdto.btitle}</a>
				</td>
				<td style="text-align:center"><fmt:formatDate value="${bdto.reg_date}" pattern="yyyy/MM/dd" /></td>
				<td style="text-align:center">${bdto.member_id}</td>
				<td style="text-align:center">${bdto.readcount}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="pagelist">
		<!-- 이전 출력 -->
		 <c:if test="${pv.startPage > 1}">
			<a href="list.do?currentPage=${pv.startPage - pv.blockPage}">이전</a>
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
							<c:out value="${i}" />
						</a>
					</c:otherwise>
				</c:choose>
			</span>	
		</c:forEach>
		
		<!-- 다음 출력 -->
		<c:if test="${pv.endPage < pv.totalPage}">
			<a href="list.do?currentPage=${pv.endPage + pv.blockPage}">다음</a>
		</c:if>
	</div>
</div>
</body>
</html>