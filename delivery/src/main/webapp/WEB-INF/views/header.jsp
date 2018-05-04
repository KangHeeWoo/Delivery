<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/resources/css/chat-order.css'/>">
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
                   <%
               Cookie[] ck=request.getCookies();
                  String mem_email="";
                  String mem_pwd="";
                  String checked="";
                  if(ck!=null){
                     for(Cookie cook:ck){
                        if(cook.getName().equals("mem_email")){
                           mem_email=cook.getValue();
                        }else if(cook.getName().equals("mem_pwd")){
                           mem_pwd=cook.getValue();
                        }
                        if(cook.getName().equals("chk")){
                        checked="checked='checked'";
                        }
                     }
                  }
               %>
                   <!-- 아이디가 없을때 -->
                      <div align="right" style="display: inline-block; margin-left: 500px;">
                     <a href="<c:url value='/join'/>">회원가입</a>
               
                        <a href="<c:url value='/login'/>" class="dropdown-toggle" data-toggle="dropdown">로그인</a>
                        <span class="caret"></span>
                        <ul id="login-dp" class="dropdown-menu" >
                           <li>
                              <div class="row" style="width: 250px; padding: 10px; ">
                                 <div class="col-md-12">
                                    <h4 align="center">로그인</h4>
                                    
                                    <!-- 라디오 첵크값에 따른 아이디 검사 -->
                                    <form class="form" role="form" method="post" action="<c:url value='/login'/>" id="login-nav" onsubmit="return loginOk()">
                                    <div align="center">
                                     <input type="radio" name="joinradio" value="mem_email" checked="checked"> 우리민족  
                                    <input type="radio" name="joinradio" value="sel_email"> 사장님
                                    </div>
                                    <br>
                                       <div class="form-group">
                                          <label class="sr-only" for="exampleInputEmail2">이메일</label> 
                                          <!-- 이메일값 넘기기 -->
                                          <input type="email" class="form-control" id="exampleInputEmail2" placeholder="이메일" required name="email" value="<%=mem_email %>" onkeyup="emailCheck()">
                                          <p class="help-block" id="emailP"></p>
                                       </div>
                                       <div class="form-group">
                                          <label class="sr-only" for="exampleInputPassword2">비밀번호</label>
                                          <input type="password" class="form-control"   id="exampleInputPassword2" placeholder="비밀번호" required name="pwd" value="<%=mem_pwd %>">
                                          
                                          <div class="help-block text-right">
                                             <a href="<c:url value='/members/Find_pwd'/>">비밀번호 찾기</a>
                                          </div>
                                          
                                       </div>
                                       <div class="form-group">
                                          <button type="submit" class="btn btn-primary btn-block">로그인</button>
                                       </div>
                                       
                                       <div class="checkbox">
                                          <label> <input type="checkbox" id="idcheckBox" name="idcheckBox" <%=checked %>>자동로그인</label><br>
                                       </div>
                                    
                                    </form>
                              </div>
                                 <div class="social-buttons" align="right">
                                    <a href="<c:url value='/members/kakao_login'/>" class="btn btn-tw"><i class="fa fa-twitter"></i> SNS_LOGIN</a>
                                 </div>
                              </div>
                           </li>
                        </ul>
                       </div>
                   </c:when>
                   <c:otherwise>
                   <!--  로그인 했을때 -->
                      <a href="<c:url value='/logout'/>" >로그아웃</a>
                      <a href="javascript:toggleChatOrder()" >채팅주문</a>
                   </c:otherwise>
                </c:choose>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="<c:url value='/event/eventlist' />">이벤트팡팡</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="<c:url value='/members/bookmark' />">단골매장</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">장바구니</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="<c:url value='/mypage' />">My배맥</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="<c:url value='/board/list' />">게시판</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="chatOrder" style="display : none;">
       <div class="orderheader">
          <p>채팅으로 주문하기 <span class="orderclose" onclick="toggleChatOrder()">x</span></p>
       </div>
       <div class="ordercontent">
          <ul class="chatlist">
             <li class="msg_left">
                버튼을 눌러 주소를 등록해주세요.
                <span class="input-group-btn">                     
                  <input type="button" class="btn btn-success"
                  onclick="getDaumPostcode()" value="주소검색">
               </span>   
             </li>
          </ul>
          <div class="inputMsg">
             <input class="inputText" type="text" placeholder="메세지를 입력해주세요." onkeydown="inputText(event)">
             <button class="btn btn-primary" onclick="sendText(event)">보내기</button>
          </div>
       </div>
    </div>
  <script>
  function toggleChatOrder(){
     $(".chatOrder").toggle();
  }
  
  function emailCheck(){
     var emailcheck=$("#exampleInputEmail2").val();
     var emailP=$("#emailP");
     $.ajax({
        url : "<c:url value='/login/emailcheck'/>",
        data : {emailcheck:emailcheck},
        dataType: "json",
        success : function(data){
           if(data.result){
              emailP.html("");
           }else{
              emailP.html("존재하지 않는 이메일입니다.").css({color: "#AA1212"});
           }
        },
        error : function() {
            alert("로그인 오류");
         }
     });
     
  }
  
  $(function(){
	  if('${param.loginCheck}'=='loginCheck'){
		  alert("로그인해야 우리백성");
	  }
  })
  
   $("#mainlogo").click(function(){
      location.href = "<c:url value='/' />";
   });
   
   var chatOrderProcess = 1;
   
   var chatSearchAddr = "";
   var firstAddr = "";
   var lastAddr = "";
   
   var category = ['한식', '분식', '일식', '치킨', '피자', '중국집', '족발,보쌈', '야식', '카페,디저트', '도시락', '패스트푸드', '찜,탕'];
   
   function checkOrderProcess(text){
      switch(chatOrderProcess){
      case 1:
         if(text == '예'){
            chatOrderProcess++;
            inputChat('chatbot', '상세 주소를 입력해주세요');
         }else if(text == '아니오'){
            inputChat('chatbot', '다시 한 번 주소를 선택해 주세요.');
            var ttt = "버튼을 눌러 주소를 등록해주세요."
                  + "<span class='input-group-btn'>"
                  + "<input type='button' class='btn btn-success' onclick='getDaumPostcode()' value='주소검색'>"
                  + "</span>";
            inputChat('chatbot', ttt);
         }else{
            inputChat('chatbot', '잘못된 답변입니다.');
         }
         break;
      case 2:
         lastAddr = text;
         var checkAddr = '입력하신 주소가 ' + firstAddr + ' ' + lastAddr + ' 맞습니까? (예/아니오)';
         inputChat('chatbot', checkAddr);
         chatOrderProcess++;
         break;
      case 3:
         if(text == '예'){
            chatOrderProcess++;
            inputChat('chatbot', '카테고리를 선택해주세요<br> (한식/분식/일식/치킨/피자/중국집/족발,보쌈/야식/카페,디저트/도시락/패스트푸드/찜,탕)');
         }else if(text == '아니오'){
            inputChat('chatbot', '다시 한 번 주소를 선택해 주세요.');
            chatOrderProcess--;
         }else{
            inputChat('chatbot', '잘못된 답변입니다.');
         }
         break;
      case 4:
         var choiceCat = 0;
         for(var i=0;i<category.length;i++){
            if(text == category[i]){
               choiceCat = i + 1;
               break;
            }
         }
         
         if(choiceCat == 0){
            inputChat('chatbot', '다시 선택해주세요.');
         }else{
            console.log(firstAddr);
            console.log(lastAddr);
            console.log(choiceCat);
            console.log(chatSearchAddr);
            
            $.ajax({
               url : "<c:url value='/chatorder/list' />",
               data : {
                  cat_num : choiceCat,
                  able_loc : chatSearchAddr,
                  firstAddr : firstAddr,
                  lastAddr : lastAddr
               },
               dataType : 'json',
               success : function(data){
                  var store = data;
                  if(store.length != 0){
                     inputChat('chatbot', '매장 이름 선택시 메뉴 선택 페이지로 이동합니다.');
                     
                     var storeList = "";
                     for(var i=0;i<store.length;i++){
                        storeList += "<p onclick='gotoStore(" + store[i].sto_num + ")'>" + store[i].sto_name + "</p>";
                     }
                     inputChat('chatbot', storeList);
                  }else{
                     inputChat('chatbot', '죄송합니다 아직 등록된 매장이 없네요');
                  }
               },error : function(){
                  console.log('실패');
               }
            });
         }
         break;
      }
   }
   
   function gotoStore(num){
      location.href = "<c:url value='/menu/menu?sto_num=" + num + "' />";
   }
   
   function inputChat(who, text){
      var chatList = $(".chatlist");
      var inputMsg = "";
      
      if(who == 'me'){
         inputMsg += "<li class='msg_right'>" + text + "</li>";
      }else{
         inputMsg += "<li class='msg_left'>" + text + "</li>";
      }
      
      chatList.append(inputMsg);
      $(".inputText").focus();
      
      if(who == 'me'){
         checkOrderProcess(text);
      }
      
      $('.chatlist').scrollTop($('.chatlist').height());
   }
   
   function inputText(e) {
      var target = e.target;
      if (e.which == 13) {
         var text = $(target).val();
         if (text !== "") {
            inputChat('me', text);
            $(target).val("");
         }
      }
   }

   function sendText(e) {
      var target = $(e.target);
      var input = target.prev();

      var text = $(input).val();
      if (text !== "") {
         inputChat('me', text);
         $(input).val("");
      }
   }
   
   function getDaumPostcode(){
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  sido=data.sido;
                  sigungu=data.sigungu;
                  bname=data.bname;
                  /* console.log(data.sido);
                  console.log(data.sigungu);
                  console.log(data.bname); */
                  chatSearchAddr = data.sido + ' ' + data.sigungu + ' ' + data.bname;
                  var fullAddr = data.address; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수
                  //console.log(data.address);
                  // 기본 주소가 도로명 타입일때 조합한다.
                  if (data.addressType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' ('
                           + extraAddr + ')' : '');
                  }
                  
                  firstAddr = fullAddr;
                  fullAddr += "<p>입력하신 주소가 맞습니까? (예/아니오)</p>";
                  inputChat('chatbot', fullAddr);
               }
            }).open({
         popupName : 'findAddr',
         autoClose : true
      });
   }
  </script>