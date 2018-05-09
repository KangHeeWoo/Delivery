<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 800px; margin: auto;">
<h1>회원 정보</h1>
<form method="post" action="<c:url value='/graUp'/>">
<table class="table">
<tr>
<td>회원번호</td><td>${mgv.mem_num }<input type="hidden" name="mem_num" value="${mgv.mem_num }"></td>
</tr>
<tr>
<td>이름</td><td>${mgv.mem_name }</td>
</tr>
<tr>
<td>닉네임</td><td>${mgv.mem_nick }</td>
</tr>
<tr>
<td>이메일</td><td>${mgv.mem_email }</td>
</tr>
<tr>
<fmt:formatDate value="${mgv.mem_birth }" type="date" var="regd1" pattern="yyyy-MM-dd"/>
<td>생년월일</td><td>${regd1 }</td>
</tr>
<tr>
<td>성별</td><td>${mgv.mem_sex }</td>
</tr>
<tr>
<td>주소</td><td>${mgv.mem_addr }</td>
</tr>
<tr>
<td>전화번호</td><td>${mgv.mem_phone }</td>
</tr>
<tr>
<td>회원등급</td>
<td>
<select name="gra_num" size="1">
	<option value="1">꼬끼오</option>
	<option value="2">삐약</option>
	<option value="3">알</option>
	<option value="4">계란후라이</option>
</select>
</td>
</tr>
<tr>
<fmt:formatDate value="${mgv.mem_regd }" type="date" var="regd" pattern="yyyy-MM-dd"/>
<td>가입일</td><td>${regd }</td>
</tr>
</table>
<div align="center">
<input type="submit" value="확인">
</div>
</form>
<script type="text/javascript">
	var select=document.getElementsByName("gra_num")[0];
	for(var i=0; i<select.options.length;i++){
		if(select.options[i].value=='${mgv.gra_num }'){
			select.options[i].selected=true;
		}
	}
</script>
<%-- <h1>채팅 기록</h1>
<table class="table">
<tr>
<th>번호</th><th>파일명</th><th>저장시간</th>
</tr>
<c:forEach var="vo" items="${clv }">
<tr>
<td>${vo.chat_num }</td><td>${vo.chat_name }</td><td>${vo.chat_regd }</td>
</tr>
</c:forEach>
</table>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${chatPage.startPageNum }" end="${chatPage.endPageNum }">
			<c:choose>
				<c:when test="${i == chatPage.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/members/detail?chNum=${i }&cNum=${couponPage.pageNum }&pNum=${pointPage.pageNum }&oNum=${ordersPage.pageNum }&mem_num=${mgv.mem_num }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div> --%>
<h1>쿠폰 사용 내역</h1>
<table class="table">
<tr>
<th>번호</th><th>발급번호</th><th>주문번호</th>
</tr>
<c:forEach var="vo1" items="${cuv }">
<tr>
<td>${vo1.cou_use_num }</td><td>${vo1.cou_iss_num }</td><td>${vo1.ord_num }</td>
</tr>
</c:forEach>
</table>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${couponPage.startPageNum }" end="${couponPage.endPageNum }">
			<c:choose>
				<c:when test="${i == couponPage.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/members/detail?cNum=${i }&chNum=${chatPage.pageNum }&pNum=${pointPage.pageNum }&oNum=${ordersPage.pageNum }&mem_num=${mgv.mem_num }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
<h1>포인트 사용 내역</h1>
<table class="table">
<tr>
<th>번호</th><th>사용량</th><th>주문번호</th>
</tr>
<c:forEach var="vo2" items="${upv }">
<tr>
<td>${vo2.use_num }</td><td>${vo2.use_amount }</td><td>${vo2.ord_num }</td>
</tr>
</c:forEach>
</table>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pointPage.startPageNum }" end="${pointPage.endPageNum }">
			<c:choose>
				<c:when test="${i == pointPage.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/members/detail?pNum=${i }&cNum=${couponPage.pageNum }&chNum=${chatPage.pageNum }&oNum=${ordersPage.pageNum }&mem_num=${mgv.mem_num }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
<h1>주문 내역</h1>
<table class="table">
<tr>
<th>번호</th><th>주문시간</th><th>배달예정시간</th><th>상태</th><th>결제금액</th><th>배달지</th><th>매장번호</th>
</tr>
<c:forEach var="vo3" items="${ov }">
<fmt:formatDate value="${vo3.ord_time }" type="date" var="regd" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${vo3.ord_deli_time }" type="date" var="regd1" pattern="yyyy-MM-dd HH:mm"/>
<tr>
<td>${vo3.ord_num }</td><td>${regd }</td><td>${regd1 }</td><td>${vo3.ord_state }</td><td>${vo3.ord_price }</td><td>${vo3.ord_addr }</td><td>${vo3.sto_num }</td>
</tr>
</c:forEach>
</table>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${ordersPage.startPageNum }" end="${ordersPage.endPageNum }">
			<c:choose>
				<c:when test="${i == ordersPage.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/members/detail?oNum=${i }&cNum=${couponPage.pageNum }&pNum=${pointPage.pageNum }&chNum=${chatPage.pageNum }&mem_num=${mgv.mem_num }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>