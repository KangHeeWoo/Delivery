<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 690px; padding-top: 5px; font-size: 40px;"><span >&lt;&nbsp;${stovo.sto_name }&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 350px; margin-left: 670px; margin-top: -60px;" ></div>


<form method="post" action="<c:url value='/order/pay'/>" onsubmit="return pay()" id="formA">


<div align="center" style="width: 1000px; margin: auto">
	<div align="center"><img width="500" height="auto"	src="<c:url value='/resources/images/stores/${stovo.sto_img}'/>"></div><br><br>
	
		<span class="font2" style="font-size: 18px;"> 주소&nbsp;&nbsp; </span>
		<input type="text" name="able_loc" value="${searchAddr }" readonly="readonly" style="width: 250px;"> &nbsp;&nbsp;&nbsp;
		<span class="font2" style="font-size: 18px;"> 상세 주소&nbsp;&nbsp;</span><input type="text" name="myDetail" value=" ${myDetail  }" style="width: 250px;">
		 <br><br>

	<c:forEach var="menu" items="${array}">
		<span class="font2" style="font-size: 18px;"> 메뉴:&nbsp;&nbsp; </span> ${menu.name }&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="font2" style="font-size: 18px;"> 수량:&nbsp;&nbsp; </span> &nbsp; ${menu.cnt }
		<br><br>
		<span class="font1" style="font-size: 25px;">"${menu.price }원" &nbsp;&nbsp; </span>
		<br><br><br><br>
		
		<input type="hidden" name="name" value="${menu.name }">
		<input type="hidden" name="cnt" value="${menu.cnt }">
		<input type="hidden" name="price" value="${menu.price }">
		<input type="hidden" name="num" value="${menu.num }">
	</c:forEach>
	
	<div align="center"><h2 class="font1" style="color:#34bdb9;" >------------- 할인받기 ------------- </h2></div><br><br>
	
	<span class="font2" style="font-size: 18px;"> 할인쿠폰 :&nbsp;&nbsp; </span>
	<select name="coupon" id="coupon" onchange="setPayPrice()">
		<option value="-1">-------- 쿠폰 --------</option>
		<c:forEach var="memcou" items="${memCoupon }">
			<option value="${memcou.cou_iss_num}">${memcou.cou_type} : ${memcou.dis_price }</option>
		</c:forEach>
	</select>
	<br><br>
	
	<input type="hidden" name="mem_point" value=" ${memPoint.mem_point }">
	
	
	<span class="font2" style="font-size: 18px;"> 내 뽀인트 :&nbsp;&nbsp;${memPoint.mem_point }&nbsp;POINT &nbsp;&nbsp;&nbsp;&nbsp; ->&nbsp;&nbsp;&nbsp;&nbsp;</span> 
	<input type="text" id="usePoint" name="usePoint" value="0" style="width: 150px;">
	<input type="button" value="적용" onclick="setPayPrice()">
	<br><br>
	
	<span class="font2" style="font-size: 18px;"> 예약 주문이 필요하신가요?&nbsp;&nbsp; </span><input type="checkbox" name="reseChk" id="reseChk" style="width: 30px">&nbsp;&nbsp;
	<span ><input type="time" name="ord_deli_time" id="ord_deli_time"> &nbsp;&nbsp;  </span>
	<input type="hidden" name="sto_num" value="${stovo.sto_num }">
</div>
<br><br>
<div align="center">
<span class="font2" style="font-size: 18px;"> 결제방법을 선택해 주세요 :)&nbsp;&nbsp; </span>
	<select name="payType" style="width: 200px;">
		<option value="1">카드</option>
		<option value="2">현장결제</option>
		<option value="3">휴대폰결제</option>
		<option value="4">페이코</option>
		<option value="5">kakao페이</option>
	</select>
</div>
	<br><br><br><br>

	<input type="hidden" name="total" id="total" value="${total}" >
<div align="center">
	<span class="font1" style="font-size: 50px; color:#34bdb9;"> 합계 :&nbsp;  "${total}원"</span> 
</div>
<br><br><br>


<div align="center"><a href="javascript:submitA();"><img src="<c:url value='/resources/images/결제하기.png'/>" style="width: 400px;"></a></div>
<br><br><br><br><br>
<!-- <input type="submit" value="결제"> -->
</form>
<fmt:formatDate value="${stovo.sto_open}" var="open" pattern="HH:mm"/>
<fmt:formatDate value="${stovo.sto_close}" var="close" pattern="HH:mm"/>




<script>
	var total='${total}';
	var mem_point='${memPoint.mem_point }';
	
	$(function(){
		var c = new Date();
		
		$("#ord_deli_time").val(c.getHours() + ":" + c.getMinutes());
	});
	
	function submitA(){
		$("#formA").submit();
	}
	
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
</script>

