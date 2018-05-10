<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 520px; padding-top: 5px;"><span>&lt;&nbsp;QnA 답변&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 495px; margin-top: -80px;" ></div>
<div>
<table class="table" style="width: 800px; margin: auto;">
	<tr>
		<th class="font2" style="font-size: 18px;">제목</th><td>${vo.qna_title }</td>
	</tr>
	<tr>
		<th class="font2" style="font-size: 18px;">문의 내용</th><td>${vo.qna_cont }</td>
	</tr>
</table>
</div>
<br><br><br>
<div>
<form method="post" action="<c:url value='/admin/qnaAnswerInsert'/>">
<table class="table" style="width: 800px; margin: auto;">
<tr>
<th></th><td><input type="hidden" value=${vo.qna_num } name="qna_num"></td>
</tr>
<tr>
<th class="font2" style="font-size: 18px;">답변 제목</th>
<td><input type="text" name="qna_ans_title"></td>
</tr>
<tr>
<th class="font2" style="font-size: 18px;">답변 내용</th>
<td><textarea rows="20" cols="80" name="qna_ans_cont"></textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="등록할래요" class="btn btn-primary font1" style="font-size:18px;">
	</td>
</tr>
</table>
</form>
<br><br><br><br><br>
</div>