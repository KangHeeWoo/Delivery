<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css"></style>
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
				<fmt:formatDate value="${ord_list.ord_time }" var="ord_time" pattern="yyyy-mm-dd hh:mi"/>
				<fmt:formatDate value="${ord_list.ord_deli_time }" var="ord_deli_time" pattern="yyyy-mm-dd hh:mi"/>
				<tr>
					<td><a href="javascript:getOrderInfo(${ord_list.ord_num })">${ord_list.ord_num }</a></td>
					<td>${ord_time }</td>
					<td>${ord_deli_time }</td>
					<td>${ord_list.ord_price }</td>
					<td>${ord_list.ord_addr }</td>
					<td>${ord_list.pay_type_name }</td>
					<td>
						<select class="order_state">
							<option value="주문접수" ${ord_list.ord_state == '주문접수'? "selected='selected'" : ''}>주문접수</option>
							<option value="조리중" ${ord_list.ord_state == '조리중'? "selected='selected'" : ''}>조리중</option>
							<option value="배달중" ${ord_list.ord_state == '배달중'? "selected='selected'" : ''}>배달중</option>
							<option value="배달완료" ${ord_list.ord_state == '배달완료'? "selected='selected'" : ''}>배달완료</option>
						</select>
						<input type="button" value="적용" id="btn_state">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>