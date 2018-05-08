<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<ul style="width: 800px; margin: auto;">
<li><a href="<c:url value='/adstAdd'/>">매장 신청대기 리스트</a></li>
<li><a href="<c:url value='/adstDel'/>">매장 탈퇴신청 리스트</a></li>
<li><a href="<c:url value='/adstList'/>">매장 리스트</a></li>
</ul>
<div class="wrap_subContent">
<h2 class="subTitle">매장 리스트</h2><br>
 <table class="table">
 <tr>
 <th>매장 번호</th><th>매장명</th><th>매장등록일</th><th>매장 상태</th>
 </tr>
 <c:forEach var="vo" items="${list }">
 <fmt:formatDate value="${vo.sto_regd }" var="regd" pattern="yyyy-MM-dd"/>
 <tr>
 <td>${vo.sto_num }</td><td><a href="<c:url value='/adstDetail?sto_num=${vo.sto_num }'/>">${vo.sto_name }</a></td><td>${regd}</td><td>${vo.sto_state }</td>
 </tr>
 </c:forEach>
 </table>
<br>
<!-- 페이징 -->
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> <!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/adstList?pageNum=${i }'/>">${i }</a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/adstList?pageNum=${i }'/>">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br>
<form method="post" action="<c:url value='/adList/search'/>">
   <select name="search" id="search" size="1">
   <option value="num">매장 번호</option>
   <option value="name">매장명</option>
   </select>
<input type="text" name="word">
<input type="submit" value="검색">
</form>
</div>
</div>