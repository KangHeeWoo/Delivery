<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action="<c:url value='/join'/>" method="post">
이메일<input type="text" name="mem_email"><input type="button" value="이메일 인증"><br>
인증번호<input type="text" id="comfirmNum"><span id="email_comfirm"></span><br>
이름<input type="text" name="mem_name"><br>
비밀번호<input type="password" name="mem_pwd"><br>
비밀번호확인<input type="password" name="mem_pwd"><br>
생년월일<input type="date" name="mem_birth"><br>
<input type="button" value="주소"><br>
주소<input type="text" name="mem_regd" value="">
전화번호<input type="text" name="mem_phone"><br>
닉네임<input type="text" name="mem_nick"><span id="nick_comfirm"></span><br>
<input type="submit" value="가입">
</form>
</body>
</html>