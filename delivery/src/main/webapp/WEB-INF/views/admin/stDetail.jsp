<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div style="width: 800px; margin: auto;">
</div>

