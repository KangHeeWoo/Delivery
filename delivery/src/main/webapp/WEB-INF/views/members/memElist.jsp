<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>My 이벤트 내역</h1>
<div align="center">
<table class="table" style="width:800px;">
	<tr><th>이벤트 번호</th><th>제목</th><th>이벤트기간</th><th>당첨여부</th></tr>
	
	<c:forEach var="list" items="${list}">
	<fmt:formatDate value="${list.eve_start }" type="date" var="start" pattern="yyyy-MM-dd"/>
	<fmt:formatDate value="${list.eve_end }" type="date" var="end" pattern="yyyy-MM-dd"/>
		<tr><td>${list.eve_num}</td><td>${list.eve_title }</td><td>${start}~${end }</td><td>${list.eve_win}</td></tr>
	</c:forEach>
	
</table>
</div>
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/members/mycoupon?CpageNum=${i }'/>"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/mycoupon?CpageNum=${i }'/>"><span style='color:#555'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
</div>