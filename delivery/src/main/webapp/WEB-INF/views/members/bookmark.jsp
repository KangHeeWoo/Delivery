<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>즐겨찾기</h1>
<table class="table">
	<thead>
		<tr>
			<th>매장명</th><th>주소</th><th>전화번호</th><th>영업시간</th>
		</tr>
		<c:forEach var="book" items="${booklist }">
		<fmt:formatDate value="${book.sto_open}" var="open" pattern="HH:mm"/>
		<fmt:formatDate value="${book.sto_close}" var="close" pattern="HH:mm"/>
		<tr>
			<td>${book.sto_name}</td>
			<td>${book.sto_addr}</td>
			<td>${book.sto_phone}</td>
			<td>${open} &sim; ${close }
			</td>
		</tr>
		</c:forEach>
	</thead>
</table>