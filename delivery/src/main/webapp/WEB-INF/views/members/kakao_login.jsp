<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   

    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<div align="center" style="width: 1000px; margin: auto;">

<h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;SNS로그인&nbsp;&gt;</span></h2><br>


<div align="left"><h2 class="font4" style=" color:black; width:1100px; height: 60px; margin-left: 260px; font-size: 40px;"><span>"&nbsp;이메일 약관에 동의해야 이용가능합니다.&nbsp;"</span></h2>
		<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 600px; margin-left: 250px; margin-top: -50px;" ></div>

<br><br>
    <div align="center" style="margin-left: 100px;"><a id="kakao-login-btn"></a>
	<a id="kakao-login-btn" style="float: left; margin-left: 50px;"></a></div><br><br>
    <div style="margin-left: 750px;"><label class="col-sm-3 control-label" for="inputNumber" style="font-size:20px; font-family: baemin3; width: 300px;"  onsubmit="return emailOK()">다른 SNS도 만들고 있어요....</label></div>
   <!--  <a href="http://developers.kakao.com/logout">로그아웃</a> -->

    <!-- 카톡 페이스북 네이버 로그인 -->

</div>
<br><br><br><br><br>

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
               //alert( JSON.stringify(res));
               
               var emailM = JSON.stringify(res.kaccount_email);
               var emailLength = emailM.length;
               var newEmail = emailM.substr(1,(emailLength-2));
               
              // alert(newEmail);
              	
               kakaoEmail(newEmail);
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
   
   function kakaoEmail(newEmail){
	   $.ajax({
		   url : "<c:url value='/members/kakao'/>",
		   data : {kakaoEmail:newEmail},
		   dataType: "json",
		   success : function(data){
			   if(data.result=='회원가입'){
				   alert("가입해 주셔서 감사합니다.(임시비밀번호: 아이디)");
				   location.href="<c:url value='/members/information'/>";
			   }else if(data.result == 'alert'){
				   alert("이미 우리 백성입니다.");
			   }else if(data.result == '회원정보수정'){
				   alert("회원정보를 수정해주세요 ㅜㅜ");
				   location.href="<c:url value='/members/information'/>";
			   }else if(data.result == 'main'){
				   location.href="<c:url value='/'/>";
			   }
			   		
		   }
	   });
   }
</script>