<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#qna_ans_detail{
		width : 1000px;
		margin : auto;
	}
</style>
<div id="qna_ans_detail">
<table class="table">
		<tr>
			<td>제목</td>
			<td>${vo.qna_ans_title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${vo.qna_ans_cont }</td>
		</tr>
</table>
</div>