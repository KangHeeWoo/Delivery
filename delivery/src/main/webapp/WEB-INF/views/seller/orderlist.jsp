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
	<h4>매장 선택</h4>
	<select onchange="selStore(event)">
		<c:forEach var="store" items="${sto_list }">
			<option value="${store.sto_num }" ${store.sto_num == sto_num?"selected='selected'":"" }>${store.sto_name }</option>
		</c:forEach>
	</select>
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
						<select class="order_state" onclick="getCurrentValue(event, ${order.ord_num })" onchange="getChangeValue(event, ${order.ord_num })">
							<option value="주문접수" ${order.ord_state == '주문접수'? "selected='selected'" : ''}>주문접수</option>
							<option value="조리중" ${order.ord_state == '조리중'? "selected='selected'" : ''}>조리중</option>
							<option value="배달중" ${order.ord_state == '배달중'? "selected='selected'" : ''}>배달중</option>
							<option value="배달완료" ${order.ord_state == '배달완료'? "selected='selected'" : ''}>배달완료</option>
						</select>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:choose>
			<c:when test="${pu.startPageNum > pu.pageBlockCount }">
				<a href="<c:url value='/seller/orderlist?pageNum=${pu.startPageNum - 1 }&stoNum=${sto_num }' />"><span style="color: #555;">&lt; 이전 &gt;</span></a>
			</c:when>
			<c:otherwise>
				<span style="color: black;">&lt; 이전 &gt;</span>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/seller/orderlist?pageNum=${i }&stoNum=${sto_num }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount }">
				<a href="<c:url value='/seller/orderlist?pageNum=${pu.endPageNum + 1 }&stoNum=${sto_num }' />"><span style="color: #555;">&lt; 다음 &gt;</span></a>
			</c:when>
			<c:otherwise>
				<span style="color: black;">&lt; 다음 &gt;</span>
			</c:otherwise>
		</c:choose>
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
			</tbody>
		</table>
	</div>
</div>
<script>
	function selStore(e){
		var stoNum = $(e.target).val(); 

		location.href = "<c:url value='/seller/orderlist?stoNum=" + stoNum + "' />";
	}

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
	
	var currentValue;
	var changeValue;
	
	function getCurrentValue(e, n){
		currentValue = $(e.target).val();
	}
	
	function getChangeValue(e, n){
		var state = e.target;
		changeValue = $(state).val();
		
		if(currentValue == '배달완료'){
			alert('이미 배달완료된 항목은 변경할 수 없습니다.');
			setSelect(state);
			return;
		}else if(currentValue == '배달중'){
			if(changeValue != '배달완료'){
				alert('배달중인 항목은 배달완료 외의 상태로 변경할 수 없습니다.');
				setSelect(state);
				return;	
			}
		}else if(currentValue == '조리중'){
			if(changeValue != '배달중'){
				alert('조리중인 항목은 배달중 외의 상태로 변경할 수 없습니다.');
				setSelect(state);
				return;	
			}
		}else{
			if(changeValue != '조리중'){
				alert('주문접수인 항목은 조리중 외의 상태로 변경할 수 없습니다.');
				setSelect(state);
				return;	
			}
		}
		
		var setState = confirm(currentValue + " 상태를 " + changeValue + " 상태로 변경하시겠습니까?");
		
		if(setState){
			$.ajax({
				url : "<c:url value='/seller/setOrderState' />",
				data : {ord_state : changeValue, ord_num : n},
				dataType : "text",
				success : function(data){
					console.log(data);
				}, error : function(){
					alert("상태 변경 실패");
				}
			});
		}else{
			setSelect(state);
		}
	}
	
	function setSelect(state){
		for(var i=0; i<state.length;i++){
			if(state[i].value == currentValue){
				state[i].selected = 'selected';
			}
		}
	}
</script>