<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#board_list{
		width : 1000px;
		margin : auto;
	}
</style>
<div id="board_list">
	<ul>
		<li><a href="<c:url value='/board/list' />">게시판</a></li>
		<li><a href="<c:url value='/notice/noticeList' />">공지사항</a></li>
	</ul>
	<table class="table">
		<thead>
			<tr>
				<th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<fmt:formatDate value="${vo.boa_regd }" type="date" var="date" pattern="YY/MM/dd"/>
				<tr onclick="getDetail(${vo.boa_num})">
					<td>${vo.boa_num}</td>
					<td>${vo.boa_title }</td>
					<td>${vo.boa_writer}</td>
					<td>${date }</td>
					<td>${vo.boa_hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/board/list?pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
	<div id="insert" align="right" style="margin-right: 500px;">	
		<a href="<c:url value='/board/insert'/>">글쓰기</a>
	</div>
<script>
	function getDetail(boa_num){
		location.href="<c:url value='/board/detail?boa_num="+boa_num+"'/>"
	}
</script>	
	
	