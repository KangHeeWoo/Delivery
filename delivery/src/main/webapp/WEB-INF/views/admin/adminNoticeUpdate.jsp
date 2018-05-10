<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 520px; padding-top: 5px;"><span>&lt;&nbsp;공지사항 수정&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 495px; margin-top: -80px;" ></div>
<div style="width: 900px; margin: auto;">
<form method="post" action="<c:url value='/admin/noticeUpdateOk'/>">
<input type="hidden" name="not_num" value=${notice.not_num }>
<table class="table">
<tr>
<td>제목</td>
<td><input type="text" name="not_title" value=${notice.not_title }></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="20" cols="80" name="not_cont">${notice.not_cont }</textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="수정할래요" class="btn btn-primary font1" style="font-size:18px;">
	</td>
</tr>
</table>
</form>
</div>
<br><br><br><br><br>