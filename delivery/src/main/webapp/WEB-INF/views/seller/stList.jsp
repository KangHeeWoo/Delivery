<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <table class="table" style="width: 800px; margin: auto;">
 <tr>
 <th>매장 번호</th><th>매장명</th><th>매장등록일</th><th>매장 상태</th>
 </tr>
 <c:forEach var="vo" items="${list }">
 <fmt:formatDate value="${vo.sto_regd }" var="regd" pattern="yyyy-MM-dd"/>
 <tr>
 <td>${vo.sto_num }</td><td><a href="<c:url value='/stDetail?sto_num=${vo.sto_num }'/>">${vo.sto_name }</a></td><td>${regd}</td><td>${vo.sto_state }</td>
 </tr>
 </c:forEach>
 </table>