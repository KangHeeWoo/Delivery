<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>마이페이지</h1>
<ul>
	<li><a href="<c:url value='/qna/list'/>">Q&A</a></li>
	<li><a href="<c:url value='/members/orderlist'/>">주문내역</a></li>
	<li><a href="<c:url value='/members/pointlist'/>">My 포인트</a></li>
	<li><a href="<c:url value='/members/couponlist'/>">My 쿠폰</a></li>
</ul>