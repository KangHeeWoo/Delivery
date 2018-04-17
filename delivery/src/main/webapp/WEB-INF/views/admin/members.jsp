<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">회원 리스트</h1><br>
<table class="table" style="align-content: center; width: 800px; margin: auto;">
	<tr>
		<th>번호</th><th>이름</th><th>닉네임</th><th>이메일</th><th>가입일</th>
	</tr>
	<c:forEach var="vo" items="${list }">
	<fmt:formatDate value="${vo.mem_regd }" type="date" var="regd" pattern="yyyy-MM-dd"/>
		<tr>
			<td>${vo.mem_num }</td>
			<td>${vo.mem_name }</td>
			<td>${vo.mem_nick }</td>
			<td><a href="<c:url value='/members/detail?mem_num=${vo.mem_num }'/>">${vo.mem_email }</a></td>
			<td>${regd }</td>
		</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징 -->
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> <!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/memberslist?pageNum=${i }'/>">${i }</a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/memberslist?pageNum=${i }'/>">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br>
<form method="post" action="<c:url value='/members/search'/>">
   <select name="search" id="search" size="1">
   <option value="name">이름</option>
   <option value="nick">닉네임</option>
   <option value="email">이메일</option>
   </select>
<input type="text" name="word">
<input type="submit" value="검색">
</form>
</div>
</body>
</html>