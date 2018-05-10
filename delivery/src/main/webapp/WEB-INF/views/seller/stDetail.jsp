<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div align="center" style="width: 1100px; margin: auto"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;MY 매장관리&nbsp;&gt;</span></h2></div><br>


<div class="mypageul" align="center" style="width: 1000px; margin: auto;">
<ul>
<li><a href="<c:url value='/stMenuList'/>" style="font-family: baemin4; font-size: 20px; margin-left: 50px;">메뉴관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
<li><a href="<c:url value='/stLocation'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;배달가능지역 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
<li><a href="<c:url value='/topAds'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;상단광고 신청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
<li><a href="<c:url value='/mainAds'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;메인광고 신청 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
<li><a href="<c:url value='/stSal'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;수익정산 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
<li><a href="<c:url value='/stUpdate?sto_num=${vo.sto_num }'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;수정 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
<li><a href="<c:url value='/stDelete?sto_num=${vo.sto_num }'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;삭제요청</a></li>
</ul>
</div>
<br><br><br>
<table class="table" style="width: 800px;margin: auto;">
	<tr>
	<th>매장명</th><td>${vo.sto_name }</td>
	</tr>
	<tr>
	<th>사업자 등록번호</th><td>${vo.sto_regnum }</td>
	</tr>
	<tr>
	<th>주소</th><td>${vo.sto_addr }</td>
	</tr>
	<tr>
	<th>전화번호</th><td>${vo.sto_phone }</td>
	</tr>
	<fmt:formatDate value="${vo.sto_regd }" var="regd1" pattern="yyyy-MM-dd"/>
	<tr>
	<th>등록일</th><td>${regd1 }</td>
	</tr>
	<tr>
	<fmt:formatDate value="${vo.sto_open }" var="regd2" pattern="kk:mm"/>
	<th>오픈시간</th><td>${regd2 }</td>
	</tr>
	<fmt:formatDate value="${vo.sto_close }" var="regd3" pattern="kk:mm"/>
	<tr>
	<th>마감시간</th><td>${regd3 }</td>
	</tr>
	<tr>
	<th>휴무일</th><td>${vo.sto_holiday }</td>
	</tr>
	<tr>
	<th>소개</th><td><textarea cols="60" rows="10" name="sto_intro" readonly="readonly">${vo.sto_intro }</textarea></td>
	</tr>
	<tr>
	<th>상태</th><td>${vo.sto_state }</td>
	</tr>
</table>


