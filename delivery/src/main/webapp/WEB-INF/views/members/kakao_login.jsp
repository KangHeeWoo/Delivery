<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
   

    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 	<h1>이메일 약관에 동의해야 이용가능합니다.</h1>
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">로그아웃</a>

    <!-- 카톡 페이스북 네이버 로그인 -->
<a id="kakao-login-btn" style="float: left; margin-left: 50px;"></a>


<script type='text/javascript'>
   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('2233cec8886d267c657ec83ed182be8a');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
      container : '#kakao-login-btn',
      success : function(authObj) {
         // 로그인 성공시, API를 호출합니다.
         Kakao.API.request({
            url : '/v1/user/me',
            success : function(res) {
               alert( JSON.stringify(res));
               
               var emailM = JSON.stringify(res.kaccount_email);
               var emailLength = emailM.length;
               var newEmail = emailM.substr(1,(emailLength-2));
               alert(newEmail);
              // location.href="<c:url value='/sociallogin?type1=2&email="+newEmail+"' />";
            },
            fail : function(error) {
               alert(JSON.stringify(error));
            }
         });
      },
      fail : function(err) {
         alert(JSON.stringify(err));
      }
   });
   //]]>
</script>