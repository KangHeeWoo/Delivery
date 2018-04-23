<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 align="center">${vo.qna_title }</h1>
<table class="table" style="width: 800px; margin: auto;">
	<tr>
	<th>글번호</th><td>${vo.qna_num }</td>
	</tr>
	<tr>
	<th>문의 내용</th><td>${vo.qna_cont }</td>
	</tr>
</table><br>
<form method="post" action="<c:url value='/admin/qnaAnswerInsert'/>">
<table class="table" style="width: 800px; margin: auto;">
<tr>
<th></th><td><input type="hidden" value=${vo.qna_num } name="qna_num"></td>
</tr>
<tr>
<th>답변 제목</th>
<td><input type="text" name="qna_ans_title"></td>
</tr>
<tr>
<th>답변 내용</th>
<td><textarea rows="20" cols="80" name="qna_ans_cont"></textarea></td>
</tr>
</table>
<input type="submit" value="답변 등록" style="margin-left: 900px;">
</form>