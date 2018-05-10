<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${param.DD=='pwdNo' }">
		<c:set var="pwdNo" value="비밀번호가 일치하지 않습니다."/>
	</c:when>
	<c:otherwise>
		<c:set var="pwdNo" value="비밀번호를 입력해주세요."/>
	</c:otherwise>
</c:choose>

<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;탈퇴하기&nbsp;&gt;</span></h2></div><br><br>
<div style="width: 1000px; margin: auto;" align="center">
		
		<form class="form-horizontal" action="<c:url value='/members/Mdelete'/>"
			method="post" onsubmit="return updateOk()">
		<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="PasswordCheck" type="password" placeholder="Password Check" name="mem_pwd">
					<p class="help-block" id="pwd">${pwdNo} </p>
				</div>
			</div>
	<input type="reset" value="탈퇴할래요" class="btn btn-danger font1" style="font-size:18px;">
</form></div>
<br><br><br><br><br>