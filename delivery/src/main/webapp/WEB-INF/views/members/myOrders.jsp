<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>포인트사용주문정보</h1>
<a href="<c:url value='/members/pointlist'/>">My 포인트 목록</a>
<div align="center">
<table class="table" style="width:800px;">
	<tr><th>매장명</th><th>결제총액</th><th>주문일</th><th>적립금</th><th>주문상태</th></tr>
	<fmt:formatDate value="${ordVo.ord_time }" var="time" pattern="yyy-MM-dd"/>
	<tr><td>${ordVo.sto_name }</td><td>${ordVo.ord_price }</td><td>${time }</td><td>${ordVo.ord_point }</td><td>${ordVo.ord_state }</td></tr>
	<c:forEach var="list" items="${listvo }" >
	<tr><td></td><td>메뉴 :</td><td>${list.men_name }</td><td>주문개수 : </td><td>${list.ord_cnt } 개</td></tr>
	</c:forEach> 
</table>

</div>