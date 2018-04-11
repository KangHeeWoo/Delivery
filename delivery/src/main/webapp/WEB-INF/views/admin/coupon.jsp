<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰 번호</th><th>쿠폰 종류</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_list }">
				<tr><td>${cou.num }</td><td>${cou.type }</td></tr>
			</c:forEach>
			<tr><td colspan="2"><a href="#">신규 쿠폰 등록</a></td></tr>
		</tbody>
	</table>
	<c:forEach var="i" begin="${couPage.startPageNum }" end="${couPage.endPageNum }">
		<c:choose>
			<c:when test="${i == couPage.pageNum }">
				<span style="color : black;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/admin/coupon?cNum=${i }&iNum=${isuPage.pageNum }&uNum=${usePage.pageNum }' />"><span style="color : #555;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰 발급 번호</th><th>쿠폰 종류</th><th>사용자</th>
				<th>시작일</th><th>종료일</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_ise_list }">
				<tr>
					<td>${cou.cou_iss_num }</td>
					<td>${cou.cou_type }</td>
					<td>${cou.mem_email }</td>
					<td>${cou.cou_start }</td>
					<td>${cou.cou_end }</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5"><a href="#">신규 쿠폰 발급</a></td></tr>
		</tbody>
	</table>
	<c:forEach var="i" begin="${isuPage.startPageNum }" end="${isuPage.endPageNum }">
		<c:choose>
			<c:when test="${i == isuPage.pageNum }">
				<span style="color : black;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/admin/coupon?cNum=${couPage.pageNum }&iNum=${i }&uNum=${usePage.pageNum }' />"><span style="color : #555;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰 사용 번호</th><th>쿠폰 발급 번호</th><th>주문 번호</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_use_list }">
				<tr>
					<td>${cou.cou_use_num }</td>
					<td>${cou.cou_iss_num }</td>
					<td>${cou.ord_num }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:forEach var="i" begin="${usePage.startPageNum }" end="${usePage.endPageNum }">
		<c:choose>
			<c:when test="${i == usePage.pageNum }">
				<span style="color : black;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/admin/coupon?cNum=${couPage.pageNum }&iNum=${isuPage.pageNum }&uNum=${i }' />"><span style="color : #555;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>