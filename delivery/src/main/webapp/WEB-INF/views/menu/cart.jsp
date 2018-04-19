<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>테스트</h1>
<p>${stovo.sto_name }</p>
<p>${stovo.sto_num }</p>
 <img width="600" height="800"	src="<c:url value='/resources/images/stores/${stovo.sto_img}'/>">
<c:forEach var="menu" items="${array}">
	<p>${menu.num }</p>
	<p>${menu.name }</p>
	<p>${menu.price }</p>
	<p>${menu.cnt }</p>

</c:forEach>
<p>${total}</p>