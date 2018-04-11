<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#coupon_manage{
		width : 800px;
		margin : auto;
		align-content: center;
	}
	#addcoupon{
		width : 500px;
		margin : auto;
		margin-top : 50px;
		margin-bottom : 50px;
		align-content: center;
		display: none;
	}
	#issuecoupon{
		width : 500px;
		margin : auto;
		margin-top : 50px;
		margin-bottom : 50px;
		align-content: center;
		display: none;
	}
</style>
<div id="coupon_manage">
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰 번호</th><th>쿠폰 종류</th><th>할인가격</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_list }">
				<tr><td>${cou.cou_num }</td><td>${cou.cou_type }</td><td>${cou.dis_price }</td></tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width : 100%">
	<c:forEach var="i" begin="${couPage.startPageNum }" end="${couPage.endPageNum }">
		<c:choose>
			<c:when test="${i == couPage.pageNum }">
				<span style="color : black;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/admin/coupon?cNum=${i }&iNum=${isuPage.pageNum }&uNum=${usePage.pageNum }' />"><span style="color : #555;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</div>
	<div align="right" style="width: 100%">
		<a href="javascript:addCoupon()">신규 쿠폰 등록</a>
	</div>
	
	<div id="addcoupon">
		<table class="table">
			<tr><th>쿠폰종류</th><td><input type="text" id="cou_type"></td></tr>
			<tr><th>할인가격</th><td><input type="number" id="dis_price"></td></tr>
			<tr><th colspan="2" style="text-align: center"><input type="button" id="btnadd" value="등록"></th></tr>
		</table>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰 발급 번호</th><th>쿠폰 종류</th><th>사용자</th>
				<th>시작일</th><th>종료일</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_ise_list }">
				<tr>
					<td>${cou.cou_iss_num }</td>
					<td>${cou.cou_type }</td>
					<td>${cou.mem_email }</td>
					<td>${cou.cou_start }</td>
					<td>${cou.cou_end }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width : 100%">
	<c:forEach var="i" begin="${isuPage.startPageNum }" end="${isuPage.endPageNum }">
		<c:choose>
			<c:when test="${i == isuPage.pageNum }">
				<span style="color : black;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/admin/coupon?cNum=${couPage.pageNum }&iNum=${i }&uNum=${usePage.pageNum }' />"><span style="color : #555;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</div>
	<div align="right" style="width: 100%">
		<a href="javascript:issueCoupon()">신규 쿠폰 발급</a>
	</div>
	
	<div id="issuecoupon">
		<table class="table">
			<tr>
				<th>쿠폰종류</th>
				<td>
					<select id="cou_type">
						<c:forEach var="cou" items="${cou_list }">
							<option value="${cou.cou_num }">${cou.cou_type }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>사용자</th>
				<td><input type="text" id="mem_email">&nbsp;&nbsp;<input type="button" value="검색"></td>
			</tr>
			<tr><th>시작일</th><td><input type="date" id="cou_start"></td></tr>
			<tr><th>종료일</th><td><input type="date" id="cou_end"></td></tr>
			<tr><th colspan="2" style="text-align: center"><input type="button" id="btniss" value="발급"></th></tr>
		</table>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰 사용 번호</th><th>쿠폰 발급 번호</th><th>주문 번호</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_use_list }">
				<tr>
					<td>${cou.cou_use_num }</td>
					<td>${cou.cou_iss_num }</td>
					<td>${cou.ord_num }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width : 100%">
	<c:forEach var="i" begin="${usePage.startPageNum }" end="${usePage.endPageNum }">
		<c:choose>
			<c:when test="${i == usePage.pageNum }">
				<span style="color : black;">[${i }]</span>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/admin/coupon?cNum=${couPage.pageNum }&iNum=${isuPage.pageNum }&uNum=${i }' />"><span style="color : #555;">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</div>
	
	<script type="text/javascript">
		$("#btnadd").click(function(){
			var cou_type = $("#cou_type").val();
			var dis_price = $("#dis_price").val();
			
			location.href = "<c:url value='/admin/addcoupon?cou_type=" + cou_type + "&dis_price=" + dis_price + "' />";
		});
		
		$("#btniss").clici(function(){
			
		});
	
		function addCoupon(){
			var state = $("#addcoupon").css("display");
			
			if(state == 'none'){
				$("#addcoupon").css("display", "block");
			}else{
				$("#addcoupon").css("display", "none");
			}
		}
		
		function issueCoupon(){
			var state = $("#issuecoupon").css("display");
			
			if(state == 'none'){
				$("#issuecoupon").css("display", "block");
			}else{
				$("#issuecoupon").css("display", "none");
			}
		}
	</script>
</div>