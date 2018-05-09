<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;마이뽀인트 : ${mypoint }&nbsp;&gt;</span></h2></div>
<div align="center">
<table class="table" style="width:1000px;">
	<tr class="font2" style="font-size: 18px;"><th>주문번호</th><th>포인트</th><th>발급일</th></tr>
	
	<c:forEach var="point" items="${ pointlist}">
	<fmt:formatDate value="${point.ord_deli_time }" type="date" var="time" pattern="yyyy-MM-dd"/>
		<tr><td><a href="<c:url value='/orders/myorder?ord_num=${point.ord_num }'/>">${point.ord_num }</a></td><td>${point.ord_point } point</td><td>${time}</td></tr>
	</c:forEach>
	
</table>
</div>
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/members/pointlist?pageNum=${i }'/>"><span style='color:#34bdb9'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/pointlist?pageNum=${i }'/>"><span style='color:black'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
</div>
<br><br>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;포인트 사용내역&nbsp;&gt;</span></h2></div>
<div align="center">
<table class="table" style="width:1000px;">
	<tr class="font2" style="font-size: 18px;"><th>매장</th><th>매장주소</th><th>사용일</th><th>포인트 사용금액</th></tr>
	
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
				<span style="color: #34bdb9;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/pointlist?use_pageNum=${i }'/>"><span style='color:black'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<br><br><br><br><br>