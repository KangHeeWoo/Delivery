<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;공지 관리&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
	<div id="insert" align="right" style="margin-botton:5px;">	
		<a href="<c:url value='/admin/noticeInsert'/>" style="font-family: baemin3; font-size: 21px;">공지 등록</a>
	</div>
	<table class="table">
		<thead>
			<tr class="font1" style="font-size: 18px;">
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
	</table>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/notice/noticeList?pageNum=${i }' />"><span style="color: black">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<br><br><br><br><br>
<script>
	function noticeDetail(num){
		location.href = "<c:url value='/admin/noticeDetail?num=" + num + "' />";
	}
</script>