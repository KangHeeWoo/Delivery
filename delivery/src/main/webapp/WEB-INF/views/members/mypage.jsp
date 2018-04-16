<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>마이페이지</h1>
<ul>
	<li><a href="<c:url value='/qna/list'/>">Q&A</a></li>
	<li><a href="<c:url value='/members/bookmark' />">즐겨찾기</a></li>
</ul>