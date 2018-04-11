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
<h1>전체회원명단</h1>
<table border="1">
	<tr>
		<th>매장번호</th><th>매장이름</th><th>주소</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.sto_num }</td>
			<td>${vo.sto_name }</td>
			<td>${vo.sto_addr }</td>
		</tr>
	</c:forEach>
</table>
<br>
<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>