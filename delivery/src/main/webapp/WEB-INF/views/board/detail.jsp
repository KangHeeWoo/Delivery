<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#board_detail{
		width : 800px;
		margin : auto;
	}
	
	#notice_board .table th{
		width : 150px;
	}
</style>
<div id="board_detail">
	<fmt:formatDate value="${vo.boa_regd }" var="date" pattern="yyyy-MM-dd HH:mm"/>
	<table class="table">
	<thead>
		<tr><th colspan="2">제목 : ${vo.boa_title }</th></tr>
	</thead>
	<tbody>
		<tr>
			<td>작성일 : ${date }</td>
		</tr>
		<tr>
			<td>
				<img src="<c:url value='/resources/images/board/${vo1.boa_img }' />">
				<p>${vo.boa_cont }</p>
			</td>
		</tr>
	</tbody>
	</table>
	<br><br>
	<table class="table">
		<c:choose>
			<c:when test="${prev == null }">
				<tr><th>이전글</th><td>이전글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>이전글</th><td onclick="detail(${prev.boa_num})">${prev.boa_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${next == null }">
				<tr><th>다음글</th><td>다음글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>다음글</th><td onclick="detail(${next.boa_num})">${next.boa_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="2"><a href="<c:url value='/board/list' />">목록으로 가기</a></td>
			<td><a href="<c:url value='/board/delete?boa_num=${vo.boa_num }' />">삭제</a></td>
			<td><a href="<c:url value='/board/update?boa_num=${vo.boa_num }' />">수정</a></td>			
		</tr>
	</table>
</div>
<script>
	function detail(boa_num){
		location.href = "<c:url value='/board/detail?boa_num=" + boa_num + "' />";
	}
</script>