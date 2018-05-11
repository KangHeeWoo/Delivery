<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#notice_list{
		width : 1000px;
		margin : auto;
	}
</style>

<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;공지사항&nbsp;&gt;</span></h2></div><br>
<div id="notice_list">
	<ul class="boardul">
		<li><a href="<c:url value='/board/list' />" style="font-family: baemin4; font-size: 25px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;1. 자유 게시판</a></li>
		<li><a href="<c:url value='/notice/noticeList' />" style="font-family: baemin4; font-size: 25px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		2. 공지사항 게시판</a></li>
	</ul>
	<br><br><br>
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>공지번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${notice }">
			<fmt:formatDate value="${notice.not_regd }" var="regd" pattern="yyyy-MM-dd"/>
				<tr onclick="noticeDetail(${notice.not_num})">
					<td>${notice.not_num}</td>
					<td>${notice.not_title}</td>
					<td>관리자</td>
					<td>${notice.not_hit}</td>
					<td>${regd}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/notice/noticeList?pageNum=${i }' />"><span style="color: black;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div><br><br><br><br><br>
<script>
	function noticeDetail(num){
		location.href = "<c:url value='/notice/noticeDetail?num=" + num + "' />";
	}
</script>