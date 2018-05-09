<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;자유 게시판&nbsp;&gt;</span></h2></div><br>
	<div class="wrap_subContent">
	
	<ul class="boardul">
		<li><a href="<c:url value='/board/list' />" style="font-family: baemin4; font-size: 25px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;1. 자유 게시판</a></li>
		<li><a href="<c:url value='/notice/noticeList' />" style="font-family: baemin4; font-size: 25px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		2. 공지사항 게시판</a></li>
	</ul>
	<br>
	<div id="insert" align="right" style="margin-botton:5px;">	
		<a href="<c:url value='/board/insert'/>" style="font-family: baemin3; font-size: 21px;">글쓰기</a>
	</div>
	<br>
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
				<th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<fmt:formatDate value="${vo.boa_regd }" type="date" var="date" pattern="YY/MM/dd"/>
				<tr onclick="getDetail(${vo.boa_num})">
					<td>${vo.boa_num}</td>
					<td>${vo.boa_title }</td>
					<td>${vo.boa_writer}</td>
					<td>${date }</td>
					<td>${vo.boa_hit}</td>
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
					<a href="<c:url value='/board/list?pageNum=${i }' />"><span style="color: black;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div><br><br><br><br><br>
<script>
	function getDetail(boa_num){
		location.href="<c:url value='/board/detail?boa_num="+boa_num+"'/>"
	}
</script>	
	
	