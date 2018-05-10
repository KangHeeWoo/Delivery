<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;회원 리스트&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
<table class="table">
	<tr class="font2" style="font-size: 18px;">
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
			<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/memberslist?pageNum=${i }' />"><span style="color: black;">[${i }]</span></a>
				</c:otherwise>
		</c:choose>
	</c:forEach>
	<br><br>
<form method="post" action="<c:url value='/members/search'/>">
   <select name="search" id="search" size="1">
   <option value="name">이름</option>
   <option value="nick">닉네임</option>
   <option value="email">이메일</option>
   </select>
<input type="text" name="word">
<input type="submit" value="검색">
<br><br><br><br><br>
</form>
</div>
</div>