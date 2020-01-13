<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.wrap_subContent {
		align-content: center;
	}
</style>
	<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;이벤트 팡팡&gt;</span></h2></div>
<div class="wrap_subContent">
	<br>
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>번호</th>
				<th >제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="event" items="${event }">
			<fmt:formatDate value="${event.eve_start }" var="start" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${event.eve_end }" var="end" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${event.eve_regd }" var="regd" pattern="yyyy-MM-dd HH:mm"/>
				<tr onclick="eventDetail(${event.eve_num})"   >
					<td>${event.eve_num }</td>
					<td>${event.eve_title }</td>
					<td>${start }</td>
					<td>${end }</td>
					<td>${regd }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/event?pageNum=${i }' />"><span style="color: black;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<br><br><br><br><br>
<script>
	function eventDetail(num){
		location.href = "<c:url value='/event/eventdetail?eve_num=" + num + "'/>";
	}
</script>
