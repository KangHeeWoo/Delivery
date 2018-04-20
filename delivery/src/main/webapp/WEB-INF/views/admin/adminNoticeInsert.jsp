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
<h1>공지사항 등록</h1>
<form method="post" action="<c:url value='/admin/noticeInsertOk'/>">
<table class="table">
<tr>
<td>제목</td>
<td><input type="text" name="not_title"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="20" cols="80" name="not_cont"></textarea></td>
</tr>
<tr>
</table>
<input type="submit" value="등록">
</form>
</div>
</body>
</html>