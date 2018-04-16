<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="qna_list">
<table class="table">
	<thead>
		<tr>
			<th>제목</th><th>작성자</th><th>작성날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }">
		<fmt:formatDate value="${vo.qna_date }" type="date" var=date pattern="hh:mm"/>
			<tr onclick="storedetail(${vo.sto_num })">
				<td><img src="<c:url value='/resources/images/stores/${vo.sto_img }'/>"></td>
				<td>${vo.sto_name }</td>
				<td>${vo.sto_addr }</td>
				<td>${vo.sto_phone }</td>
				<td>${date }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>