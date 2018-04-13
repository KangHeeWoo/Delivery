<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="store_list">
<table class="table">
	<thead>
		<tr>
			<th>매장이름</th><th>매장주소</th><th>매장전화번호</th><th>오픈시간</th><th>마감시간</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.sto_name }</td>
				<td>${vo.sto_addr }</td>
				<td>${vo.sto_phone }</td>
				<td>${vo.sto_open }</td>
				<td>${vo.sto_close }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<br>
<a href="<c:url value='/'/>">홈으로</a>
