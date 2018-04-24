<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
	#top_list{
		width : 1000px;
		margin : auto;
	}
	#selectBox{
		width : 1000px;
		margin : auto;
	}
</style>
<br>
<div id="selectBox">
	<h4>상단광고</h4>
	<form action="<c:url value='/admin/topAdsList'/>" method="post">
		<select name="year" size="1">
			<option value="2018">2018년</option>
			<option value="2017">2017년</option>
		</select>
		<select name="month" size="1">
			<option value="01">01월</option>
			<option value="02">02월</option>
			<option value="03">03월</option>
			<option value="04">04월</option>
			<option value="05">05월</option>
			<option value="06">06월</option>
			<option value="07">07월</option>
			<option value="08">08월</option>
			<option value="09">09월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<input type="submit" value="조회">
	</form>
</div>
<br><br>
<div id="top_list">
	<table class="table">
		<thead>
			<tr>
				<td>신청번호</td><td>시작잘짜</td><td>종료날짜</td><td>가격</td><td>신청날짜</td><td>가게번호</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
		<fmt:formatDate value="${vo.top_ads_start }" type="date" var="start" pattern="YYYY-MM-DD"/>
		<fmt:formatDate value="${vo.top_ads_end }" type="date" var="end" pattern="YYYY-MM-DD"/>
		<fmt:formatDate value="${vo.top_ads_regd }" type="date" var="regd" pattern="YYYY-MM-DD hh:mm"/>
			<tr>
				<td>${vo.top_ads_num }</td>
				<td>${start }</td>
				<td>${end }</td>
				<td>${vo.top_ads_price }</td>
				<td>${regd }</td>
				<td>${vo.sto_num }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
