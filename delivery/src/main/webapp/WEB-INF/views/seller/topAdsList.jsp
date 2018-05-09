<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="wrap_subContent">
<h2 class="subTitle">상단광고 신청 리스트</h2>
<a href="<c:url value='/topAdsInsert'/>">상단광고 신청</a>
<table class="table">
<tr>
<td>신청번호</td><td>시작일</td><td>종료일</td><td>신청일</td><td>상태</td>
</tr>
<c:forEach var="vo" items="${list }">
			<fmt:formatDate value="${vo.top_ads_start }" var="regd1" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${vo.top_ads_end }" var="regd2" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${vo.top_ads_regd }" var="regd3" pattern="yyyy-MM-dd"/>
				<tr>
					<td>${vo.top_ads_num}</td>
					<td>${regd1 }</td>
					<td>${regd2 }</td>
					<td>${regd3 }</td>
					<td>${vo.top_ads_state }</td>
				</tr>
			</c:forEach>
</table>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/topAds?pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>