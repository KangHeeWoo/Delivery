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
    
    <h1>판매자 메뉴 수정</h1>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">		
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="admin-menu" href="#">매장관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="#">메뉴관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="#">리뷰관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="<c:url value='/seller/orderlist' />">주문관리&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="#">광고신청&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="#">1:1문의&nbsp;</a>
            </li>
            <li class="nav-item">
              <a class="admin-menu" href="#">자유게시판&nbsp;</a>
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
		location.href = "<c:url value='/seller/main' />";
	});
</script>