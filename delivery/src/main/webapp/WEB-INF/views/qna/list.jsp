<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	#qna_list{
		width : 1000px;
		margin : auto;
	}
</style>

<div id="qna_list">
<table class="table">
	<thead>
		<tr>
			<th>제목</th><th>작성자</th><th>작성날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }">
		<fmt:formatDate value="${vo.qna_date }" type="date" var="date" pattern="hh:mm"/>
			<tr>
				<td>${vo.qna_title }</td>
				<td>${vo.qna_date }</td>
				<td>${vo.mem_num }</td>
				<td>${date }</td>
			</tr>
		</c:forEach>
	</tbody>
		<a href="<c:url value='/qna/insert'/>">글쓰기</a>
</table>
</div>