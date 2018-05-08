<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.wrap_subContent {
		align-content: center;
	}
</style>
<div class="wrap_subContent">
	<h2 class="subTitle">이벤트 관리</h2>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="event" items="${event }">
			<fmt:formatDate value="${event.eve_start }" var="start" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${event.eve_end }" var="end" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${event.eve_regd }" var="regd" pattern="yyyy-MM-dd HH:mm"/>
				<tr onclick="detailEvent(${event.eve_num })">
					<td>${event.eve_num }</td>
					<td>${event.eve_title }</td>
					<td>${start }</td>
					<td>${end }</td>
					<td>${regd }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:choose>
			<c:when test="${pu.startPageNum > pu.pageBlockCount }">
				<a href="<c:url value='/seller/orderlist?pageNum=${pu.startPageNum - 1 }&stoNum=${sto_num }' />"><span style="color: #555;">&lt; 이전 &gt;</span></a>
			</c:when>
			<c:otherwise>
				<span style="color: black;">&lt; 이전 &gt;</span>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/event?pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount }">
				<a href="<c:url value='/seller/orderlist?pageNum=${pu.endPageNum + 1 }&stoNum=${sto_num }' />"><span style="color: #555;">&lt; 다음 &gt;</span></a>
			</c:when>
			<c:otherwise>
				<span style="color: black;">&lt; 다음 &gt;</span>
			</c:otherwise>
		</c:choose>
	</div>
	<div align="right">
		<a href="<c:url value='/admin/addEvent' />">신규 이벤트 등록</a>
	</div>
</div>
<script>
	function detailEvent(num){
		location.href = "<c:url value='/admin/detailevent?num=" + num + "'/>";
	}
</script>