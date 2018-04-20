<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>배달확인하기</h2>
<h5>${stovo.sto_name }</h5>
<table class="table">
	<tr><td><img width="300" height="auto"	src="<c:url value='/resources/images/stores/${stovo.sto_img}'/>"></td></tr>
	<c:forEach var="menu" items="${array}">
		<tr><td>메뉴: ${menu.name },     수량 : ${menu.cnt },      가격  : ${menu.price }원</td></tr>
	</c:forEach>
	<tr><td>
	<select name="coupon">
	<option value="0">-- 쿠폰 --</option>
		<c:forEach var="memcou" items="${memCoupon }">
			쿠폰 <option value="${memcou.dis_price }">${memcou.cou_type}</option>
		</c:forEach>
	</select>
	</td></tr>
	<tr><td>사용가능 포인트 : ${memPoint.mem_point }</td></tr>
	<tr><td><input type="text" name="usePoint"></td></tr>
	
<tr><td>>합계 : ${total}원</td></tr>

</table>

<p>매장num : ${stovo.sto_num }</p>

