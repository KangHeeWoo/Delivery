<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#order_list{
		width : 800px;
		margin : auto;
	}
	
	#orderList{
	 	width : 400px;
	 	display: none;
	 	margin : auto;
	}
</style>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;주문내역&nbsp;&gt;</span></h2></div><br>
<div id="order_list">
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>주문번호</th>
				<th>주문매장</th>
				<th>접수시간</th>
				<th>배달예정시간</th>
				<th>주문가격</th>
				<th>결제방식</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${order }">
				<fmt:formatDate value="${order.ord_time }" var="ord_time" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate value="${order.ord_deli_time }" var="ord_deli_time" pattern="yyyy-MM-dd HH:mm"/>
				<tr>
					<td><a href="javascript:getOrderInfo(${order.ord_num })">${order.ord_num }</a></td>
					<td>${order.sto_name }</td>
					<td>${ord_time }</td>
					<td>${ord_deli_time }</td>
					<td>${order.ord_price }</td>
					<td>${order.pay_type_name }</td>
					<td>${order.ord_state }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	
	<div align="center" style="width: 100%">
		
		
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/members/orderlist?pageNum=${i }' />"><span style="color: blick;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		

	</div>
	<br><br>
	<div align="center" id="orderList">
		<table class="table">
			<thead>
				<tr class="font2" style="font-size: 18px;">
					<th>주문 메뉴</th>
					<th>주문 개수</th>
				</tr>
			</thead>
			<tbody id="orderInfo">
			</tbody>
		</table>
	</div>
</div><br><br><br><br><br>
<script>
	function getOrderInfo(n){		
		$.ajax({
			url : "<c:url value='/seller/orderInfo' />",
			data : {ordNum : n},
			dataType : "json",
			success : function(data){
				$("#orderList").css({display : "block"});
				
				var orderInfo = $("#orderInfo");
				orderInfo.html("");
				var list = data;
				
				for(var i=0;i<list.length;i++){
					var tr = $("<tr></tr>");
					var menu = $("<td></td>");
					var cnt = $("<td></td>");
					
					menu.html(list[i].men_name);
					cnt.html(list[i].ord_cnt);
					tr.append(menu);
					tr.append(cnt);					
					orderInfo.append(tr);
				}
			}, error : function(){
				alert('데이터 조회 실패');
			}
		});
	}
	
	$(function() {
		setWebsocket();
	});
	
	function setWebsocket() {
		var wsUri = 'ws://52.78.184.148:8090/delivery/socketRequest';

		websocket = new WebSocket(wsUri);
		websocket.onopen = function(e) {
			if('${requestPay}' == 'requestPay'){
	 			websocket.send("requestPay:" + '${seller_email}');
	 		}
		}
		websocket.onmessage = function(e) {

		}
		websocket.onerror = function(e) {

		}
	}
</script>