<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3>My 포인트 ${mypoint }</h3>
<div align="center">
<table class="table" style="width:800px;">
	<tr><th>포인트</th><th>주문번호</th><th>발급일</th></tr>
	
	<c:forEach var="point" items="${ pointlist}">
	<fmt:formatDate value="${point.ord_deli_time }" type="date" var="time" pattern="yyyy-MM-dd"/>
		<tr><td>${point.ord_point } point</td><td><a href="<c:url value='/orders/myorder?ord_num=${point.ord_num }'/>">${point.ord_num }</a></td><td>${time}</td></tr>
	</c:forEach>
	
</table>
</div>
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/members/pointlist?pageNum=${i }'/>"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/pointlist?pageNum=${i }'/>"><span style='color:#555'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
</div>

<h3>포인트 사용내역</h3>
<div align="center">
<table class="table" style="width:800px;">
	<tr><th>매장</th><th>매장주소</th><th>사용일</th><th>포인트 사용금액</th></tr>
	
	<c:forEach var="use" items="${usepointlist}">
	<fmt:formatDate value="${use.ord_time }" type="date" var="time" pattern="yyyy-MM-dd"/>
		<tr><td>${use.sto_name }</td><td>${use.sto_addr }</td><td>${time }</td><td>${use.use_amount } point</td></tr>
	</c:forEach>
		
</table>
</div> 
<div align="center">
	<c:forEach var="i" begin="${usepu.startPageNum }" end="${usepu.endPageNum }">
		<c:choose>
			<c:when test="${i==usepu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/members/pointlist?use_pageNum=${i }'/>"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/pointlist?use_pageNum=${i }'/>"><span style='color:#555'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>