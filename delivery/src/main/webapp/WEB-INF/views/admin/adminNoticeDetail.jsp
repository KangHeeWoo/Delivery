<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#notice_detail{
		width : 800px;
		margin : auto;
	}
	
	#notice_detail .table th{
		width : 150px;
	}
</style>
<div id="notice_detail">
	<table class="table">
		<tr><th>제목</th><td>${notice.not_title }</td></tr>
		<tr><th>내용</th><td>${notice.not_cont }</td></tr>
	</table>
	<br><br>
	<table class="table">
		<c:choose>
			<c:when test="${prev == null }">
				<tr><th>이전글</th><td>이전글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>이전글</th><td onclick="detail(${prev.not_num})">${prev.not_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${next == null }">
				<tr><th>다음글</th><td>다음글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>다음글</th><td onclick="detail(${next.not_num})">${next.not_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<tr><td colspan="2"><a href="<c:url value='/admin/noticeList' />">목록으로 가기</a></td></tr>
	</table>
	<ul>
		<li><a href="<c:url value='/admin/noticeDelete?not_num=${notice.not_num }' />">삭제</a></li>
		<li><a href="<c:url value='/admin/noticeUpdate?not_num=${notice.not_num }' />">수정</a></li>
	</ul>
</div>
<script>
	function detail(num){
		location.href = "<c:url value='/admin/noticeDetail?num=" + num + "' />";
	}
</script>