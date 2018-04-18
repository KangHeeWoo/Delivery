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
		<tr><th>이전글</th><td onclick="detail(${prev.not_num})">${prev.not_title }</td></tr>
		<tr><th>다음글</th><td onclick="detail(${next.not_num})">${next.not_title }</td></tr>
		<tr><td colspan="2"><a href="<c:url value='/notice/noticeList' />">목록으로 가기</a></td></tr>
	</table>
</div>
<script>
	function detail(num){
		location.href = "<c:url value='/notice/noticeDetail?num=" + num + "' />";
	}
</script>