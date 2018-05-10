<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#qna_detail{
		width : 1000px;
		margin : auto;
	}
</style>
<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 490px;"><span>&lt;&nbsp;Q&A 자세히보기&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 260px; margin-left: 470px; margin-top: -80px;" ></div>
<div id="qna_detail" style="width: 1000px;">
<table class="table">
		<tr>
			<td class="font1" style="font-size:18px; padding-left: 50px; width: 150px;">제목</td>
			<td>${vo.qna_title }</td>
		</tr>
		<tr>
			<td class="font1" style="font-size:18px; padding-left: 50px; width: 150px;">내용</td>
			<td>${vo.qna_cont }</td>
		</tr>
</table>
</div>
<br><br><br><br><br>	