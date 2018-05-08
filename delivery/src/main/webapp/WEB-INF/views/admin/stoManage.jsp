<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul style="width: 800px; margin: auto;">
<li><a href="<c:url value='/adstAdd'/>">매장 신청대기 리스트</a></li>
<li><a href="<c:url value='/adstDel'/>">매장 탈퇴신청 리스트</a></li>
<li><a href="<c:url value='/adstList'/>">매장 리스트</a></li>
</ul>