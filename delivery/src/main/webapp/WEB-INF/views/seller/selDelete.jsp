<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-theme.min.css'/>"
	media="screen" title="no title" ><!-- charset="utf-8" -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<c:choose>
	<c:when test="${param.DD=='pwdNo' }">
		<c:set var="pwdNo" value="비밀번호가 일치하지 않습니다."/>
	</c:when>
	<c:otherwise>
		<c:set var="pwdNo" value="비밀번호를 입력해주세요."/>
	</c:otherwise>
</c:choose>
<div class="col-md-12">
		<div class="page-header">
			<h1>
				회원 탈퇴
			</h1>
		</div>
		<form class="form-horizontal" action="<c:url value='/seller/Sdelete'/>"
				method="post" onsubmit="return updateOk()">
			<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="PasswordCheck" type="password" placeholder="Password Check" name="sel_pwd">
						<p class="help-block" id="pwd">${pwdNo}</p>
					</div>
				</div>
			<div align="center"><button class="btn btn-danger" type="submit">탈퇴하기</button></div>
		</form>
</div>
