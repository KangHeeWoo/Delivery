<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.wrap_subContent {
		align-content: center;
	}
	
	#addcoupon {
		width: 500px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 50px;
		align-content: center;
		display: none;
	}
	
	#issuecoupon {
		width: 500px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 50px;
		align-content: center;
		display: none;
	}
</style>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;쿠폰 관리&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>쿠폰 번호</th>
				<th>쿠폰 종류</th>
				<th>할인가격</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_list }">
				<tr>
					<td>${cou.cou_num }</td>
					<td>${cou.cou_type }</td>
					<td>${cou.dis_price }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${couPage.startPageNum }" end="${couPage.endPageNum }">
			<c:choose>
				<c:when test="${i == couPage.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/coupon?cNum=${i }&iNum=${isuPage.pageNum }&uNum=${usePage.pageNum }' />"><span style="color: black">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div align="right" style="width: 100%">
		<a href="javascript:addCoupon()">신규 쿠폰 등록</a>
	</div>

	<div id="addcoupon">
		<table class="table">
			<tr>
				<th class="font1" style="font-size:15px;">쿠폰종류</th>
				<td><input type="text" id="cou_type"></td>
			</tr>
			<tr>
				<th class="font1" style="font-size:15px;">할인가격</th>
				<td><input type="number" id="dis_price"></td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: center"><input type="button" id="btnadd" value="등록"></th>
			</tr>
		</table>
	</div>	
</div>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;쿠폰 발급 내역&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>쿠폰 발급 번호</th>
				<th>쿠폰 종류</th>
				<th>사용자</th>
				<th>시작일</th>
				<th>종료일</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="cou" items="${cou_ise_list }">
				<fmt:formatDate value="${cou.cou_start }" type="date" var="start" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${cou.cou_end }" type="date" var="end" pattern="yyyy-MM-dd"/>
				<tr>
					<td>${cou.cou_iss_num }</td>
					<td>${cou.cou_type }</td>
					<td>${cou.mem_email }</td>
					<td>${start }</td>
					<td>${end }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${isuPage.startPageNum }"
			end="${isuPage.endPageNum }">
			<c:choose>
				<c:when test="${i == isuPage.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/coupon?cNum=${couPage.pageNum }&iNum=${i }&uNum=${usePage.pageNum }' />"><span style="color: black;">[${i }]</span></a>
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
				<th class="font1" style="font-size:15px;">쿠폰종류</th>
				<td><select id="iss_cou_type">
						<c:forEach var="cou" items="${allCouList }">
							<option value="${cou.cou_num }">${cou.cou_type }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th class="font1" style="font-size:15px;">사용자</th>
				<td><input type="text" id="mem_email">&nbsp;&nbsp;<input type="button" value="검색" id="mem_search">
					<p id="searchMsg"></p>
				</td>
			</tr>
			<tr>
				<th class="font1" style="font-size:15px;">시작일</th>
				<td><input type="date" id="cou_start"></td>
			</tr>
			<tr>
				<th class="font1" style="font-size:15px;">종료일</th>
				<td><input type="date" id="cou_end"></td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: center"><input type="button" id="btniss" value="발급"></th>
			</tr>
		</table>
	</div>
</div>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;쿠폰 사용 내역&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>쿠폰 사용 번호</th>
				<th>쿠폰 발급 번호</th>
				<th>주문 번호</th>
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
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${usePage.startPageNum }"
			end="${usePage.endPageNum }">
			<c:choose>
				<c:when test="${i == usePage.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/coupon?cNum=${couPage.pageNum }&iNum=${isuPage.pageNum }&uNum=${i }' />"><span style="color: black;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<br><br><br><br><br>
<script type="text/javascript">
	var mem = null;

	$("#btnadd").click(function() {
		var cou_type = $("#cou_type").val();
		var dis_price = $("#dis_price").val();
		
		if(cou_type == '' || dis_price == ''){
			alert('모든 항목을 입력해주세요.');
			return;
		}

		location.href = "<c:url value='/admin/addcoupon?cou_type=" + cou_type + "&dis_price=" + dis_price + "' />";
	});

	$("#btniss").click(function() {
		var cou_num = $("#iss_cou_type").val();
		var mem_num = mem.mem_num;
		var cou_start = $("#cou_start").val();
		var cou_end = $("#cou_end").val();
		
		if(cou_num == '' || mem_num == null || cou_start == '' || cou_end == ''){
			alert('모든 항목을 입력해주세요.');
			return;
		}
		
		if(new Date(cou_start) <= new Date()){
			alert('시작일은 현재 날짜보다 빠를 수 없습니다.');
			return;
		}
		
		if(new Date(cou_start) >= new Date(cou_end)){
			alert('종료일은 시작일보다 빠를 수 없습니다.');
			return;
		}
		
		location.href = "<c:url value='/admin/issuecoupon?cou_num=" + cou_num + 
				"&mem_num=" + mem_num + "&cou_start=" + cou_start + "&cou_end=" + cou_end + "' />"
	});

	$("#mem_search").click(function() {
		var email = $("#mem_email").val();
		
		$.ajax({
			url : "<c:url value='/admin/searchMem' />",
			data : {email : email},
			dataType : "json",
			success : function(data){
				mem = data;

				if(mem != null){
					$("#searchMsg").html('적용된 회원 : ' + mem.mem_email);
				}else{
					alert('일치하는 회원이 없습니다.');
				}
			}, error : function(){
				alert('검색실패');
			}
		});
	});

	function addCoupon() {
		var state = $("#addcoupon").css("display");

		if (state == 'none') {
			$("#addcoupon").css("display", "block");
		} else {
			$("#addcoupon").css("display", "none");
		}
	}

	function issueCoupon() {
		var state = $("#issuecoupon").css("display");

		if (state == 'none') {
			$("#issuecoupon").css("display", "block");
		} else {
			$("#issuecoupon").css("display", "none");
		}
	}
</script>