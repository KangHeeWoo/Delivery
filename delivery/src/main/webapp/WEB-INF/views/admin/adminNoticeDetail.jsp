<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#notice_detail{
		width : 900px;
		margin : auto;
	}
	
	#notice_detail .table th{
		width : 150px;
	}
</style>
<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 520px; padding-top: 5px;"><span>&lt;&nbsp;공지사항&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 495px; margin-top: -80px;" ></div>
<span style="font-family: baemin3; margin-left:1100px; margin-bottom:10px; font-size: 21px;" id="detailspan"><a href="<c:url value='/admin/noticeList' />">목록으로 가기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
<a href="<c:url value='/admin/noticeDelete?not_num=${notice.not_num }' />">삭제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
<a href="<c:url value='/admin/noticeUpdate?not_num=${notice.not_num }' />">수정</a>	</span>
<div id="notice_detail">
	<div style="width: 100%" align="right"></div>
	<table class="table">
		<tr><th class="font1" style="font-size:20px;">제목</th><td>${notice.not_title }</td></tr>
		<tr><th class="font1" style="font-size:20px;">내용</th><td>${notice.not_cont }</td></tr>
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
		location.href = "<c:url value='/admin/noticeDetail?num=" + num + "' />";
	}
</script>