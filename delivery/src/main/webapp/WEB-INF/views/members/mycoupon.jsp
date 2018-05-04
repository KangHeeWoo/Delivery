<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>My 쿠폰</h1>
<div align="center">
<table class="table" style="width:800px;">
	<tr><th>쿠폰종류</th><th>할인금액</th><th>사용가능기간</th></tr>
	
	<c:forEach var="coupon" items="${mycoupon}">
	<fmt:formatDate value="${coupon.cou_start }" type="date" var="start" pattern="yyyy-MM-dd"/>
	<fmt:formatDate value="${coupon.cou_end }" type="date" var="end" pattern="yyyy-MM-dd"/>
		<tr><td>${coupon.cou_type}</td><td>${coupon.dis_price }</td><td>${start}~${end }</td></tr>
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
<br><br><br><br><br><br><br><br><br><br><br>