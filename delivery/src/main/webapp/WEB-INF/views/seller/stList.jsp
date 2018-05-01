<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <table class="table" style="width: 800px; margin: auto;">
 <tr>
 <th>매장 번호</th><th>매장명</th><th>매장등록일</th><th>매장 상태</th>
 </tr>
 <c:forEach var="vo" items="list">
 <tr>
 <td>${vo.sto_num }</td><td><a href="<c:url value=''/>">${vo.sto_name }</a></td><td>${vo.sto_regd }</td><td>${vo.sto_state }</td>
 </tr>
 </c:forEach>
 </table>