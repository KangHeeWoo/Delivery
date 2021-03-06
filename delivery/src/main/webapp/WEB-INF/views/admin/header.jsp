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
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/memberslist' />" style="font-family: baemin1; font-size: 15px;">회원관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;"> 
              <a class="admin-menu" href="<c:url value='/adstList' />" style="font-family: baemin1; font-size: 15px;">매장관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/chart' />" style="font-family: baemin1; font-size: 15px;">매출관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/coupon' />" style="font-family: baemin1; font-size: 15px;">쿠폰관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/topAdsList' />" style="font-family: baemin1; font-size: 15px;">광고관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/qnaAnswer' />" style="font-family: baemin1; font-size: 15px;">QnA관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/noticeList' />" style="font-family: baemin1; font-size: 15px;">공지관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/event'/>" style="font-family: baemin1; font-size: 15px;">이벤트관리&nbsp;</a>
            </li>
             <li class="nav-item" style="margin-left: 250px;" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/logout'/>" style="color:#fed136; font-family: baemin1; font-size: 15px;">로그아웃&nbsp;</a>
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