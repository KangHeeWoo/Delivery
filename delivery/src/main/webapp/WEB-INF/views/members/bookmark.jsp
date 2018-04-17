<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h4>즐겨찾기</h4>
<table class="table" style="width:1000px; margin: auto; ">
	<thead>
		<tr>
			<th>매장명</th><th>주소</th><th>전화번호</th><th>영업시간</th><th>해제</th>
		</tr>
		<c:forEach var="book" items="${booklist }">
		<fmt:formatDate value="${book.sto_open}" var="open" pattern="HH:mm"/>
		<fmt:formatDate value="${book.sto_close}" var="close" pattern="HH:mm"/>
		<tr >
			<td onclick="bookpage(${book.sto_num})">${book.sto_name}</td>
			<td onclick="bookpage(${book.sto_num})">${book.sto_addr}</td>
			<td onclick="bookpage(${book.sto_num})">${book.sto_phone}</td>
			<td onclick="bookpage(${book.sto_num})">${open} &sim; ${close }
			</td>
			<td><input type="button" value="즐겨찾기 해제" onclick="bookDel(${book.sto_num})"></td>
		</tr>
		</c:forEach>
	</thead>
</table>
<div align="center">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/members/bookmark?pageNum=${i }&field=${field }&search=${search }'/>"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/members/bookmark?pageNum=${i }&field=${field }&search=${search }'/>"><span style='color:#555'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<script>
	function bookpage(num){
		location.href="<c:url value='/menu/menu?sto_num="+num+"'/>";
	}
	function bookDel(sto_num){
		location.href="<c:url value='/members/bookDel?sto_num="+sto_num+"'/>";
		
	}
</script>