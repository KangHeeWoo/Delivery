<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;상단 광고&nbsp;&gt;</span></h2></div><br>
<div align="center" style="width:1000px; margin: auto">

	<div id="insert" align="right" style="margin-botton:5px;">	
		<a href="<c:url value='/topAdsInsert'/>" style="font-family: baemin3; font-size: 21px;">상단광고 신청</a>
	</div>
<br>
<table class="table" >
<tr  class="font2" style="font-size: 18px;">
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
<br><br>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/topAds?pageNum=${i }' />"><span style="color: black;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>

</div>
<br><br><br><br><br>