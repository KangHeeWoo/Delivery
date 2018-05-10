<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;매장 삭제 대기&nbsp;&gt;</span></h2></div><br>
<div style="width: 800px; margin: auto;">
 <table class="table">
 <tr class="font2" style="font-size: 18px;">
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
 <br><br><br><br><br>