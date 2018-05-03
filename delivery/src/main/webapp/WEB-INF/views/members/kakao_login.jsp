<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
   
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout"></a>
    <script type='text/javascript'>
    
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init(' 9cbf163ebaf03720bd5bb2a9fc38885e');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
  
    </script>