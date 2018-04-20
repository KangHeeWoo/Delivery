<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	#qna_list{
		width : 1000px;
		margin : auto;
	}
	
</style>

<div id="qna_list">
	<table class="table">
		<thead>
			<tr>
				<th>제목</th><th>작성날짜</th><th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<fmt:formatDate value="${vo.qna_date }" type="date" var="date" pattern="YY/MM/dd hh:mm"/>
			<fmt:formatDate value="${vo.answers.qna_ans_regd }" type="date" var="regd" pattern="YY/MM/dd hh:mm"/>
				<tr>
					<td onclick="getDetail(${vo.qna_num})">${vo.qna_title }</td>
					<td onclick="getDetail(${vo.qna_num})">${date }</td>
					<td><input type="button" onclick="qnaDel(${vo.qna_num})" value="삭제"></td>
				</tr>
				<c:if test="${vo.answers.qna_ans_title != null}">
					<tr onclick="getAnswer(${vo.answers.qna_ans_num})">
						<td>ㄴ[답변] ${vo.answers.qna_ans_title }</td>
						<td>${regd }</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }"> 
					<a href="<c:url value='/qna/list?pageNum=${i }'/>"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/qna/list?pageNum=${i }'/>"><span style='color:#555'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
	<div id="insert" align="right" style="margin-right: 500px;">	
		<a href="<c:url value='/qna/insert'/>">글쓰기</a>
	</div>
<script>
function getDetail(qna_num){
	  console.log(qna_num);
	  location.href="<c:url value='/qna/detail?qna_num="+qna_num+"'/>";
}
function getAnswer(qna_ans_num){
	  console.log(qna_ans_num);
	  location.href="<c:url value='/qna/adetail?qna_ans_num="+qna_ans_num+"'/>";
}
function qnaDel(qna_num){
	alert("삭제되었습니다.");
	location.href="<c:url value='/qna/delete?qna_num="+ qna_num +"'/>";
}
</script>