<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="wrap_subContent">
	<h2 class="subTitle">이벤트 관리</h2>
	<ul>
		<li><a href="<c:url value='/admin/noticeInsert' />">공지 등록</a></li>
	</ul>
	<table class="table">
		<thead>
			<tr>
				<th>공지번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${notice }">
			<fmt:formatDate value="${notice.not_regd }" var="regd" pattern="yyyy-MM-dd"/>
				<tr onclick="noticeDetail(${notice.not_num})">
					<td>${notice.not_num}</td>
					<td>${notice.not_title}</td>
					<td>관리자</td>
					<td>${notice.not_hit}</td>
					<td>${regd}</td>
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
					<a href="<c:url value='/notice/noticeList?pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<script>
	function noticeDetail(num){
		location.href = "<c:url value='/admin/noticeDetail?num=" + num + "' />";
	}
</script>