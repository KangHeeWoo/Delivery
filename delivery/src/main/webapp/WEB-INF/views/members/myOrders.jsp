<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>포인트사용주문정보</h1>
<c:choose var="list" items="${listvo }" >
	메뉴<p>${list.men_name }</p>주문개수<p>${list.ord_cnt }</p>
</c:choose>
<span>${ordVo.ord_time }</span><span>${ordVo.ord_state }</span><span>${ordVo.ord_price }</span><span>${ordVo.ord_point }</span><span>${ordVo.sto_name }</span>