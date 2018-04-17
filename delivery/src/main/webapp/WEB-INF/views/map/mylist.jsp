<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#store_list{
		width : 1000px;
		margin : auto;
	}
	#sto_img{
		width: 150px;
		height: 150px;
	}
</style>
<div id="store_list">
<table class="table">
	<thead>
		<tr>
			<th>로고</th><th>매장이름</th><th>매장주소</th><th>매장전화번호</th><th>오픈시간</th><th>마감시간</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }">
		<fmt:formatDate value="${vo.sto_open }" type="date" var="open" pattern="hh:mm"/>
		<fmt:formatDate value="${vo.sto_close }" type="date" var="close" pattern="hh:mm"/>
			<tr onclick="storedetail(${vo.sto_num })">
				<td><img id="sto_img" src="<c:url value='/resources/images/stores/${vo.sto_img }'/>"></td>
				<td>${vo.sto_name }</td>
				<td>${vo.sto_addr }</td>
				<td>${vo.sto_phone }</td>
				<td>${open }</td>
				<td>${close }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> 
				<a href="<c:url value='/myposition?pageNum=${i }&cat_num=${cat_num }&able_loc=${able_loc }'/>"><span style='color:blue'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/myposition?pageNum=${i }&cat_num=${cat_num }&able_loc=${able_loc }'/>"><span style='color:#555'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
</div>
<script>
	function storedetail(num){
		location.href="<c:url value='/menu/menu?sto_num="+num+"'/>";
	}
</script>
