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
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;Q&amp;A&nbsp;&gt;</span></h2></div><br>
	<div id="insert" align="right" style="margin-right: 455px; margin-bottom: -10px;">	
		<a href="<c:url value='/qna/insert'/>" id="listA" style="font-family: baemin3; font-size: 21px; ">글쓰기</a>
	</div>
<div id="qna_list" class="wrap_subContent">
	<br>
	<table class="table">
		<thead>
			<tr class="font2" style="font-size: 18px;">
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
	<br>
	

	
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }"> 
					<a href="<c:url value='/qna/list?pageNum=${i }'/>"><span style='color: #34bdb9'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/qna/list?pageNum=${i }'/>"><span style='color: black'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<br><br><br><br><br>	
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