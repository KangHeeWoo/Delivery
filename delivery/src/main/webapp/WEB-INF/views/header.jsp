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
		          
		          <!-- 로그인 여부 -->
		          <c:choose>
		          	<c:when test="${empty sessionScope.email }">
		          	<!-- 아이디가 없을때 -->
				          <div align="right" style="display: inline-block; margin-left: 500px;">
							<a href="<c:url value='/join'/>">회원가입</a>
							<a href="<c:url value='/addrsearch'/>">주소검색</a>
								<a href="<c:url value='/login'/>" class="dropdown-toggle" data-toggle="dropdown">로그인</a>
								<span class="caret"></span>
								<ul id="login-dp" class="dropdown-menu">
									<li>
										<div class="row">
											<div class="col-md-12">
												<h4 align="center">로그인</h4>
												
												<!-- 라디오 첵크값에 따른 아이디 검사 -->
												<form class="form" role="form" method="post" action="<c:url value='/login'/>" id="login-nav">
												<input type="radio" name="joinradio" value="mem_email"> 우리민족  
												<input type="radio" name="joinradio" value="sel_email"> 사장님 <br><br>
													<div class="form-group">
														<label class="sr-only" for="exampleInputEmail2">이메일</label> 
														<!-- 이메일값 넘기기 -->
														<input type="email" class="form-control" id="exampleInputEmail2" placeholder="이메일" required name="email">
													</div>
													<div class="form-group">
														<label class="sr-only" for="exampleInputPassword2">비밀번호</label>
														<input type="password" class="form-control"	id="exampleInputPassword2" placeholder="비밀번호" required name="pwd">
														
														<div class="help-block text-right">
															<a href="#">비밀번호 찾기</a>
														</div>
														
													</div>
													<div class="form-group">
														<button type="submit" class="btn btn-primary btn-block">로그인</button>
													</div>
													
													<div class="checkbox">
														<label> <input type="checkbox">아이디 저장</label>
													</div>
												
												</form>
										</div>
											<div class="social-buttons">
												<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i>Facebook</a> 
												<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
											</div>
										</div>
									</li>
								</ul>
				 		 	</div>
		          	</c:when>
		          	<c:otherwise>
		          	<!--  로그인 했을때 -->
		          		<a href="<c:url value='/logout'/>" class="dropdown-toggle" data-toggle="dropdown">로그아웃</a>
		          	</c:otherwise>
		          </c:choose>
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