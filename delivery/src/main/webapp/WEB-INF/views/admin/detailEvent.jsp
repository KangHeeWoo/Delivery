<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#detail_event{
		width : 800px;
		margin : auto;
	}
</style>
<div id="detail_event">
	<fmt:formatDate value="${event.eve_start }" var="start" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate value="${event.eve_end }" var="end" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate value="${event.eve_regd }" var="regd" pattern="yyyy-MM-dd HH:mm"/>
	<table class="table">
		<thead>
			<tr><th colspan="2">${event.eve_title }</th></tr>
		</thead>
		<tbody>
			<tr>
				<td>기간 : ${start } &sim; ${end }</td><td>등록일 : ${regd }</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="<c:url value='/resources/images/event/${event.eve_img }' />">
					<p>${event.eve_cont }</p>
				</td>
			</tr>
		</tbody>
	</table>
	<br><br>
	<table class="table">
		<thead>
			<tr>
				<th>응모번호</th><th>당첨여부</th><th>응모 아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entry" items="${entry }">
				<tr>
					<th>${entry.eve_ent_num }</th><th>${entry.eve_win }</th><th>${event.mem_email }</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 당첨처리 추가 : 몇명, 어떤거 지급  -->
</div>