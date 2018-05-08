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

<div class="wrap_subContent">
<div id="selectBox">
	<h2 class="subTitle">상단광고</h2>
	<ul>
		<li><a href="<c:url value='/admin/topAdsList' />">상단광고</a></li>
		<li><a href="<c:url value='/admin/mainAdsList' />">메인광고</a></li>
	</ul>
	<form action="<c:url value='/admin/topAdsList'/>" method="post">
		<select name="year" size="1">
			<option value="2018">2018년</option>
			<option value="2017">2017년</option>
		</select>
		<select name="month" size="1">
			<option value="1">01월</option>
			<option value="2">02월</option>
			<option value="3">03월</option>
			<option value="4">04월</option>
			<option value="5">05월</option>
			<option value="6">06월</option>
			<option value="7">07월</option>
			<option value="8">08월</option>
			<option value="9">09월</option>
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
		<fmt:formatDate value="${vo.top_ads_start }" type="date" var="start" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${vo.top_ads_end }" type="date" var="end" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${vo.top_ads_regd }" type="date" var="regd" pattern="yyyy-MM-dd HH:mm"/>
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
	<div>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href="<c:url value='/admin/topAdsList?pageNum=${i }'/>"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/topAdsList?pageNum=${i }'/>"><span style='color:#555'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
</div>
<script>

	

	var year = document.getElementsByName("year")[0];
	for(var i=0;i<year.options.length;i++){
		if(year.options[i].value=='${year}'){
			year.options[i].selected=true;			
		}
	}
	
	var month = document.getElementsByName("month")[0];
	for(var i=0;i<month.options.length;i++){
		if(month.options[i].value=='${month}'){
			month.options[i].selected=true;			
		}
	}
	
	
</script>