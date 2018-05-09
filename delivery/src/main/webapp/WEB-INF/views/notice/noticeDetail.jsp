<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#notice_detail{
		width : 800px;
		margin : auto;
	}
	
	#notice_detail .table th{
		width : 150px;
	}
</style>
<div align="left"><h2 class="subTitle" style=" color:#212529; width:1100px; height: 60px; margin-left: 520px; padding-top: 5px; padding-bottom: -20px;"><span>&lt;&nbsp;공지사항 내용&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 500px; margin-top: -80px;" ></div>

<span style="font-family: baemin3; margin-left:1250px; padding-bottom:10ps; font-size: 21px; padding-top: -10px;" id="detailspan"><a href="<c:url value='/notice/noticeList' />">목록으로 가기</a></span>

<div id="notice_detail">
	<table class="table">
		<tr><td class="font1" style="font-size:18px; margin-left: 12px; margin-left: 10px; width: 150px;">제목</td><td>${notice.not_title }</td></tr>
		<tr><td class="font1" style="font-size:18px; margin-left: 12px; margin-left: 10px; width: 150px;">내용</td><td>${notice.not_cont }</td></tr>
	</table>
	<br><br>
	<table class="table">
		<c:choose>
			<c:when test="${prev == null }">
				<tr><th>이전글</th><td>이전글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>이전글</th><td onclick="detail(${prev.not_num})">${prev.not_title }</td></tr>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${next == null }">
				<tr><th>다음글</th><td>다음글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr><th>다음글</th><td onclick="detail(${next.not_num})">${next.not_title }</td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<br><br><br><br><br>
<script>
	function detail(num){
		location.href = "<c:url value='/notice/noticeDetail?num=" + num + "' />";
	}
</script>