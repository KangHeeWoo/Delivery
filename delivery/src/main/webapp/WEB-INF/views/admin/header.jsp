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
              <a class="admin-menu" href="<c:url value='/memberslist' />" style="color:#fed136;">회원관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;"> 
              <a class="admin-menu" href="<c:url value='/adstList' />" style="color:#fed136;">매장관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/chart' />" style="color:#fed136;">매출관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/coupon' />" style="color:#fed136;">쿠폰관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/topAdsList' />" style="color:#fed136;">광고관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/qnaAnswer' />" style="color:#fed136;">QnA관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/noticeList' />" style="color:#fed136;">공지관리&nbsp;</a>
            </li>
            <li class="nav-item" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/admin/event'/>" style="color:#fed136;">이벤트관리&nbsp;</a>
            </li>
             <li class="nav-item" style="margin-left: 250px;" style="list-style: none;">
              <a class="admin-menu" href="<c:url value='/logout'/>" style="color:#fed136;">로그아웃&nbsp;</a>
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