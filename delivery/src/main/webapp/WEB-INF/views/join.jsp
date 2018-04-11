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
<ul>
	<li><a href="<c:url value='/members'/>">일반회원</a></li>
	<li><a href="<c:url value='/seller'/>">사장님</a></li>
</ul>
</body>
</html>