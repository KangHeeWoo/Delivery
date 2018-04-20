<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width: 800px; margin: auto;">
<h1>공지사항 수정</h1>
<form method="post" action="<c:url value='/admin/noticeUpdateOk'/>">
<table class="table">
<tr>
<td><input type="hidden" name="not_num" value=${notice.not_num }></td>
</tr>
<tr>
<td>제목</td>
<td><input type="text" name="not_title" value=${notice.not_title }></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="20" cols="80" name="not_cont">${notice.not_cont }</textarea></td>
</tr>
<tr>
</table>
<input type="submit" value="수정">
</form>
</div>
</body>
</html>