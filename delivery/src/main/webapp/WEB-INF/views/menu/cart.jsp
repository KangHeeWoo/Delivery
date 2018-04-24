<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>${stovo.sto_name }</h2>
<form method="post" action="<c:url value='/order/pay'/>" onsubmit="return pay()">
<table class="table">
	<tr><td><img width="300" height="auto"	src="<c:url value='/resources/images/stores/${stovo.sto_img}'/>"></td></tr>
	<tr>
		<td> 주소 : <input type="text" name="able_loc" value="${able_loc }" readonly="readonly"> &nbsp;&nbsp;&nbsp; 상세주소 : <input type="text" name="myDetail" value=" ${myDetail  }"><td>
	</tr>
	<c:forEach var="menu" items="${array}">
		<tr><td>메뉴: ${menu.name }, &nbsp;     수량 : ${menu.cnt },   &nbsp;   가격  : ${menu.price }원</td></tr>
		<input type="hidden" name="name" value="${menu.name }">
		<input type="hidden" name="cnt" value="${menu.cnt }">
		<input type="hidden" name="price" value="${menu.price }">
		<input type="hidden" name="num" value="${menu.num }">
	</c:forEach>
	<tr><td>
	<select name="coupon" id="coupon" onchange="setPayPrice()">
		<option value="-1">-------- 쿠폰 --------</option>
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
<div>
<span><input type="time" name="ord_deli_time" id="ord_deli_time"> &nbsp;&nbsp; 예약 주문 적용 <input type="checkbox" name="reseChk" id="reseChk"></span>
<input type="hidden" name="sto_num" value="${stovo.sto_num }">
</div>
<br><br>
<select name="payType">
	<option value="1">카드</option>
	<option value="2">만나서결제</option>
	<option value="3">휴대폰결제</option>
	<option value="4">페이코</option>
	<option value="5">kakao페이</option>
</select>
<input type="submit" value="결제">
</form>
<fmt:formatDate value="${stovo.sto_open}" var="open" pattern="HH:mm"/>
<fmt:formatDate value="${stovo.sto_close}" var="close" pattern="HH:mm"/>
<script>
	var total='${total}';
	var mem_point='${memPoint.mem_point }';
	
	var c = new Date();
	
	$("#ord_deli_time").val(c.getHours() + ":" + c.getMinutes());

	function pay(){
		var open = '${open}'.split(":");
		var close = '${close}'.split(":");
		
		var reseTime = $("#ord_deli_time").val();

		var currTime = new Date();
		if($("#reseChk").prop("checked")){
			var rese = reseTime.split(":");
			currTime = new Date(currTime.getFullYear(), currTime.getMonth(), currTime.getDate(), rese[0].trim(), rese[1].trim(), 0,0);
		}
		var openTime = new Date(currTime.getFullYear(), currTime.getMonth(), currTime.getDate(), open[0].trim(), open[1].trim(), 0,0);
		var closeTime = new Date(currTime.getFullYear(), currTime.getMonth(), currTime.getDate(), close[0].trim(), close[1].trim(), 0,0);
		
		console.log(currTime);
		
		if(currTime < openTime){
			alert("아직 오픈시간 전입니다");
			return false;
		}else if(closeTime < currTime ){
			alert("마감되었습니다");
			return false;
		}
		
		websocket.send("소켓 테스트 진행중");
	}

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
	
	$(function() {
		setWebsocket();
	});
	
	function setWebsocket(){
		var wsUri = 'ws:/localhost:8090/delivery/socketRequest';
		
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(e){
			onOpen(e);
		}
		websocket.onmessage = function(e){
			onMessage(e);
		}
		websocket.onerror = function(e){
			onError(e);
		}
	}

</script>

