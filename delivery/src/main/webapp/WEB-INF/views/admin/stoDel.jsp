<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 800px; margin: auto;">
<h1>매장삭제 대기</h1>
 <table class="table">
 <tr>
 <th>매장 번호</th><th>매장명</th><th>매장등록일</th><th>매장 상태</th><th>처리</th>
 </tr>
 <c:forEach var="vo" items="${list }">
 <fmt:formatDate value="${vo.sto_regd }" var="regd" pattern="yyyy-MM-dd"/>
 <tr>
 <td>${vo.sto_num }</td><td><a href="<c:url value='/adstDetail?sto_num=${vo.sto_num }'/>">${vo.sto_name }</a></td><td>${regd}</td><td>${vo.sto_state }</td>
 <td><a href="<c:url value='/adstDelOk?sto_num=${vo.sto_num }'/>">삭제</a></td>
 </tr>
 </c:forEach>
 </table>
 </div>