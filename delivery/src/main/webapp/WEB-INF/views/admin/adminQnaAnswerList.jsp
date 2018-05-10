<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;문의답변 대기 리스트&nbsp;&gt;</span></h2></div><br>
<div class="wrap_subContent">
<table class="table">
<tr class="font2" style="font-size: 18px;">
<td>번호</td><td>제목</td><td>작성일</td>
</tr>
<c:forEach var="vo" items="${list }">
			<fmt:formatDate value="${vo.qna_date }" var="regd" pattern="yyyy-MM-dd"/>
				<tr>
					<td>${vo.qna_num}</td>
					<td><a href="<c:url value='/admin/qnaAnswerDetail?qna_num=${vo.qna_num }'/>">${vo.qna_title}</a></td>
					<td>${regd}</td>
				</tr>
			</c:forEach>
</table>
<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: #34bdb9;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/qnaAnswer?pageNum=${i }' />"><span style="color: black">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<br><br><br><br><br>