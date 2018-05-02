<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
	#main_list{
		width : 1000px;
		margin : auto;
	}
	#selectBox{
		width : 1000px;
		margin : auto;
	}
	#mainAds_img{
		width : 200px;
		margin : auto;
	}
</style>
<br>
<div id="selectBox">
	<ul>
		<li><a href="<c:url value='/admin/topAdsList' />">상단광고</a></li>
		<li><a href="<c:url value='/admin/mainAdsList' />">메인광고</a></li>
	</ul>
	<br>
	<h4>메인광고</h4>
	<form action="<c:url value='/admin/mainAdsList'/>" method="post">
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
<div id="main_list">
	<table class="table">
		<thead>
			<tr>
				<td>신청번호</td><td>시작잘짜</td><td>종료날짜</td><td>가격</td><td>상태</td><td>이미지</td><td>신청날짜</td><td>가게번호</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
		<fmt:formatDate value="${vo.main_ads_start }" type="date" var="start" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${vo.main_ads_end }" type="date" var="end" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${vo.main_ads_regd }" type="date" var="regd" pattern="yyyy-MM-dd HH:mm"/>
			<tr>
				<td>${vo.main_ads_num }</td>
				<td>${start }</td>
				<td>${end }</td>
				<td>${vo.main_ads_price }</td>
				<td>${vo.main_ads_state }</td>
				<td><img id="mainAds_img" src="<c:url value='/resources/images/main_ads/${vo.main_ads_img }'/>"></td>
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
					<a href="<c:url value='/admin/mainAdsList?pageNum=${i }'/>"><span style='color:blue'>[${i }]</span></a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/mainAdsList?pageNum=${i }'/>"><span style='color:#555'>[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
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