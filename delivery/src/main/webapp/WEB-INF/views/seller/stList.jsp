<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div align="center" style="width: 1100px; margin: auto;"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;사장님 매장관리&nbsp;&gt;</span></h2></div><br>
<div style="width: 1000px; margin: auto;" align="center">
	<br>
	<div id="insert" align="right" style="margin-botton:5px;">	
		<a href="<c:url value='/stAdd'/>" style="font-family: baemin3; font-size: 21px;">매장 신청</a>
	</div>
	<br>


 <table class="table">
 <tr class="font2" style="font-size: 18px;">
 <th>매장 번호</th><th>매장명</th><th>매장등록일</th><th>매장 상태</th>
 </tr>
 <c:forEach var="vo" items="${list }">
 <fmt:formatDate value="${vo.sto_regd }" var="regd" pattern="yyyy-MM-dd"/>
 <tr>
 <td>${vo.sto_num }</td><td><a href="<c:url value='/stDetail?sto_num=${vo.sto_num }'/>">${vo.sto_name }</a></td><td>${regd}</td><td>${vo.sto_state }</td>
 </tr>
 </c:forEach>
 </table>
 </div><br><br><br><br><br>