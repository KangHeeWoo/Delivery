<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.admin-menu{
		margin : 20px 10px 0 10px;
	}
</style>
	<div align="center">
		<img src="<c:url value='/resources/images/로고-pn.png'/>" id="mainlogo">
	</div>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">		
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/memberslist' />">회원관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/stoManage' />">매장관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/chart' />">매출관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/admin/coupon' />">쿠폰관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/admin/topAdsList' />">광고관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/admin/qnaAnswer' />">QnA관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/admin/noticeList' />">공지관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/admin/event'/>">이벤트관리&nbsp;</a>
            </li>
             <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/logout'/>">로그아웃&nbsp;</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
<script>
	$("#mainlogo").click(function(){
		location.href = "<c:url value='/admin' />";
	});
</script>