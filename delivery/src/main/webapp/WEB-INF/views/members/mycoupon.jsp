<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;마이쿠폰&nbsp;&gt;</span></h2></div><br>
<div align="center">
<table class="table" style="width:1000px;">
	<tr class="font2" style="font-size: 18px;"><th>쿠폰종류</th><th>할인금액</th><th>이날부터 가능해요</th><th>이때까지 꼭!사용</th></tr>
	
	<c:forEach var="coupon" items="${mycoupon}">
	<fmt:formatDate value="${coupon.cou_start }" type="date" var="start" pattern="yyyy-MM-dd"/>
	<fmt:formatDate value="${coupon.cou_end }" type="date" var="end" pattern="yyyy-MM-dd"/>
		<tr><td>${coupon.cou_type}</td><td>${coupon.dis_price }</td><td>${start}</td><td>${end }</td></tr>
	</c:forEach>
	
</table>
</div>
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<span style="color: #34bdb9;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/mycoupon?CpageNum=${i }'/>"><span style='color:black'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
</div>
<br><br><br><br><br>