<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#order_list{
		width : 1000px;
		margin : auto;
	}
	
	#orderList{
	 	width : 400px;
	 	display: none;
	 	margin : auto;
	}
</style>
<div id="order_list">
	<!-- 판매자 매장 리스트중 선택 기능 필요 -->
	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>접수시간</th>
				<th>배달예정시간</th>
				<th>주문가격</th>
				<th>배달주소</th>
				<th>결제방식</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${ord_list }">
				<fmt:formatDate value="${order.ord_time }" var="ord_time" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate value="${order.ord_deli_time }" var="ord_deli_time" pattern="yyyy-MM-dd HH:mm"/>
				<tr>
					<td><a href="javascript:getOrderInfo(${order.ord_num })">${order.ord_num }</a></td>
					<td>${ord_time }</td>
					<td>${ord_deli_time }</td>
					<td>${order.ord_price }</td>
					<td>${order.ord_addr }</td>
					<td>${order.pay_type_name }</td>
					<td>
						<select class="order_state">
							<option value="주문접수" ${order.ord_state == '주문접수'? "selected='selected'" : ''}>주문접수</option>
							<option value="조리중" ${order.ord_state == '조리중'? "selected='selected'" : ''}>조리중</option>
							<option value="배달중" ${order.ord_state == '배달중'? "selected='selected'" : ''}>배달중</option>
							<option value="배달완료" ${order.ord_state == '배달완료'? "selected='selected'" : ''}>배달완료</option>
						</select>
						<input type="button" value="적용" id="btn_state">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/seller/orderlist?pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<br><br>
	<div align="center" id="orderList">
		<table class="table">
			<thead>
				<tr>
					<th>주문 메뉴</th>
					<th>주문 개수</th>
				</tr>
			</thead>
			<tbody id="orderInfo">
				<!-- 데이터 추가 후 리스트 뿌려지는거 확인 -->
			</tbody>
		</table>
	</div>
</div>
<script>
	function getOrderInfo(n){
		$("#orderList").css({display : "block"});
		
		$.ajax({
			url : "<c:url value='/seller/orderInfo' />",
			data : {ordNum : n},
			dataType : "json",
			success : function(data){
				console.log(data);
			}, error : function(){
				alert('데이터 조회 실패');
			}
		});
	}
</script>