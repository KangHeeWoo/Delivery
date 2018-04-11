<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<img src="<c:url value='/resources/images/로고-pn.png'/>" id="mainlogo">
	</div>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top"></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          	메뉴
          <i class="fa fa-bars"></i>
        </button>
          <div align="right" style="display: inline-block; margin-left: 500px;">
			<a href="<c:url value='/join'/>">회원가입</a>
			<a href="<c:url value='/login'/>">로그인</a>
		  </div>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">주문하기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">단골매장</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">장바구니</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">My배맥</a>
            </li>
         
          </ul>
        </div>
      </div>
    </nav>