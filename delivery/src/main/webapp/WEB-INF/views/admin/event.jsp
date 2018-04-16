<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#event_manage {
		width: 800px;
		margin: auto;
		align-content: center;
	}
</style>
<div id="event_manage">
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
				<tr onclick="detailEvent(${event.eve_num })">
					<th>${event.eve_num }</th>
					<th>${event.eve_title }</th>
					<th>${event.eve_start }</th>
					<th>${event.eve_end }</th>
					<th>${event.eve_regd }</th>
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
					<a href="<c:url value='/admin/event?pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div align="right" style="width: 100%">
		<a href="<c:url value='/admin/addEvent' />">신규 이벤트 등록</a>
	</div>
</div>
<script>
	function detailEvent(n){
		console.log(n);
	}
</script>