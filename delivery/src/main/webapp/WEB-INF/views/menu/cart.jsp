<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>${stovo.sto_name }</h2>
<form>
<table class="table">
	<tr><td><img width="300" height="auto"	src="<c:url value='/resources/images/stores/${stovo.sto_img}'/>"></td></tr>
	<c:forEach var="menu" items="${array}">
		<tr><td>메뉴: ${menu.name }, &nbsp;     수량 : ${menu.cnt },   &nbsp;   가격  : ${menu.price }원</td></tr>
		<input type="hidden" name="name" value="${menu.name }">
		<input type="hidden" name="cnt" value="${menu.cnt }">
		<input type="hidden" name="price" value="${menu.price }">
		<input type="hidden" name="num" value="${menu.num }">
	</c:forEach>
	<tr><td>
	<select name="coupon" id="coupon" onchange="setPayPrice()">
		<option value="-1">-- 쿠폰 --</option>
		<c:forEach var="memcou" items="${memCoupon }">
			<option value="${memcou.cou_iss_num}">${memcou.cou_type} : ${memcou.dis_price }</option>
		</c:forEach>
	</select>
	</td></tr>
	<input type="hidden" name="mem_point" value=" ${memPoint.mem_point }" >
	<tr><td>사용가능 포인트 : ${memPoint.mem_point }</td></tr>
	<tr><td>사용할 포인트 : <input type="text" id="usePoint" name="usePoint" value="0">
	<input type="button" value="적용" onclick="setPayPrice()">
	</td></tr>
	

<input type="hidden" name="total" id="total" value="${total}" >
<tr><td id="payPrice">합계 : ${total}원</td></tr>
</table>
<input type="button" value="예약주문"><input type="time" name="ord_deli_time">
<input type="hidden" name="num" value="${stovo.sto_num }">
<input type="submit" value="결제">
</form>

<script>
var total='${total}';
var mem_point='${memPoint.mem_point }';

	function setPayPrice(){
		var usepoint = $("#usePoint").val();
		if(usepoint > parseInt(mem_point)){
			alert("포인트 한도를 초과하였습니다.");
			return ;
		}
		
		var disprice = 	checkCouponValue();	
		
		var payPrice = total - usepoint - disprice;
		
		$("#payPrice").html("합계 : " + payPrice + "원");
		$("#total").val(payPrice);
	}
	
	function checkCouponValue(){
		var coupon = $("#coupon");
		
		if($(coupon).val() == -1){
			return 0;
		}else{
			var disprice = $(coupon).find("option[value=" + $(coupon).val() + "]").html().split(":")[1].trim();
			return disprice;
		}
	}

</script>
