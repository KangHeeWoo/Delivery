<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.admin-menu{
		margin : 20px 10px 0 10px;
	}
	
	#chatList{
		/*리스트 오른쪽 정렬하기*/
		position: fixed;
		width : 100%;
		top : 200px;
	}
	
	.chat{
		position: relative;
		left : 40%;
	}
	
	.chatheader{
		background-color: #aaaaaa;
	}
	
	.mytext{
	    border:0;padding:10px;background:whitesmoke;
	}
	.text{
	    width:75%;display:flex;flex-direction:column;
	}
	.text > p:first-of-type{
	    width:100%;margin-top:0;margin-bottom:auto;line-height: 13px;font-size: 12px;
	}
	.text > p:last-of-type{
	    width:100%;text-align:right;color:silver;margin-bottom:-7px;margin-top:auto;
	}
	.text-l{
	    float:left;padding-right:10px;
	}        
	.text-r{
	    float:right;padding-left:10px;
	}
	.macro{
	    margin-top:5px;width:85%;border-radius:5px;padding:5px;display:flex;
	}
	.msj-rta{
	    float:right;background:whitesmoke;
	}
	.msj{
	    float:left;background:white;
	}
	.frame{
	    background:#e0e0de;
	    height:450px;
	    overflow:hidden;
	    padding:0;
	}
	.frame > div:last-of-type{
	    position:absolute;bottom:0;width:100%;display:flex;
	}
	body > div > div > div:nth-child(2) > span{
	    background: whitesmoke;padding: 10px;font-size: 21px;border-radius: 50%;
	}
	body > div > div > div.msj-rta.macro{
	    margin:auto;margin-left:1%;
	}
	.chat_ul {
	    width:100%;
	    list-style-type: none;
	    padding:18px;
	    position:absolute;
	    bottom:47px;
	    display:flex;
	    flex-direction: column;
	    top:0;
	    overflow-y:scroll;
	}
	.msj:before{
	    width: 0;
	    height: 0;
	    content:"";
	    top:-5px;
	    left:-14px;
	    position:relative;
	    border-style: solid;
	    border-width: 0 13px 13px 0;
	    border-color: transparent #ffffff transparent transparent;            
	}
	.msj-rta:after{
	    width: 0;
	    height: 0;
	    content:"";
	    top:-5px;
	    left:14px;
	    position:relative;
	    border-style: solid;
	    border-width: 13px 13px 0 0;
	    border-color: whitesmoke transparent transparent transparent;           
	}  
	input:focus{
	    outline: none;
	}        
	::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	    color: #d4d4d4;
	}
	::-moz-placeholder { /* Firefox 19+ */
	    color: #d4d4d4;
	}
	:-ms-input-placeholder { /* IE 10+ */
	    color: #d4d4d4;
	}
	:-moz-placeholder { /* Firefox 18- */
	    color: #d4d4d4;
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
    <div id="requestOrder" style="display: none;">
    	<p>새로운 주문이 들어왔습니다. 주문정보를 확인하시겠습니까?
    		<a href="<c:url value='/seller/orderlist' />">예</a>
    	</p>
    </div>
    <div id="chatList"></div>
<script>
	var websocket = null;

	$("#mainlogo").click(function(){
		location.href = "<c:url value='/seller/main' />";
	});
	
	function socketController(msg){
		if(msg.startsWith("requestPay:")){
			var getEmail = msg.split(":");
			if('${sessionScope.email}' == getEmail[1]){
				$("#requestOrder").css({"display" : "block"});
			}
		}else if(msg.startsWith("membersMsg:")){
			var getMsg = msg.split(":");
			if('${sessionScope.email}' == getMsg[1]){
				var sendMember = getMsg[2];
				var sendMsg = getMsg[3];
				
				chatManage(sendMember, sendMsg);
			}
		}
	}
	
	function chatManage(sendMember, sendMsg){
		var chatList = $("#chatList");
		var checkSendMember = true;
		var ul = null;
		var addMsg = null;
		
		$(chatList).find(".chatroom").each(function(){
			//같은 사용자가 보낸 내역이 존재할 경우 메세지 내용만 추가
			if($(this).prop("id") == sendMember){
				ul = $(this).find("ul");
				addMsg = insertChat(sendMember, sendMsg);
				ul.append(addMsg);
				checkSendMember = false;
			}
		});	
		
		if(checkSendMember){
			var chat = $("<div class='chat'></div>");
			var chatHeader = $("<div class='chatheader'><p onclick='toggleChagroom(event)' >&lt;&lt;&lt;&lt;" + sendMember + "&gt;&gt;&gt;&gt;</p></div>")
			var chatRoom = $("<div class='chatroom frame' id='" + sendMember + "'></div>");
			ul = $("<ul class='chat_ul'></ul>");
			addMsg = insertChat(sendMember, sendMsg);
			var inputMsg = "<div><div class='msj-rta macro'><div class='text text-r' style='background:whitesmoke !important'>"
						+ "<input class='mytext' placeholder='Type a message' onkeydown='inputText(event)'/></div>" 
						+ "</div><div style='padding:10px;'><span class='glyphicon glyphicon-share-alt' onclick='sendText(event)'></span></div></div>";
						
			ul.append(addMsg);
			chatRoom.append(ul).append(inputMsg);
			chat.append(chatHeader);
			chat.append(chatRoom);
			chatList.append(chat);
		}
		
		//ul.closest(".frame").scrollTop(ul.css("height"));
		//스크롤 하단이동 확인
	}
	
	function formatAMPM(date) {
	    var hours = date.getHours();
	    var minutes = date.getMinutes();
	    var ampm = hours >= 12 ? 'PM' : 'AM';
	    hours = hours % 12;
	    hours = hours ? hours : 12; // the hour '0' should be '12'
	    minutes = minutes < 10 ? '0'+minutes : minutes;
	    var strTime = hours + ':' + minutes + ' ' + ampm;
	    return strTime;
	}            

	//-- No use time. It is a javaScript effect.
	function insertChat(who, text){
	    var control = "";
	    var date = formatAMPM(new Date());
	    
	    if (who == "me"){
	        control = '<li style="width:100%">' +
	                        '<div class="msj macro">' +
	                            '<div class="text text-l">' +
	                                '<p>'+ text +'</p>' +
	                                '<p><small>'+date+'</small></p>' +
	                            '</div>' +
	                        '</div>' +
	                    '</li>';                    
	    }else{
	        control = '<li style="width:100%;">' +
	                        '<div class="msj-rta macro">' +
	                            '<div class="text text-r">' +
	                                '<p>'+ who + ' : ' + text+'</p>' +
	                                '<p><small>'+date+'</small></p>' +
	                            '</div>' +                               
	                  '</li>';
	    }
	    
	    return control;
	}
	
	$(function() {
		setWebsocket();
	});
	
	function inputText(e){
		var target = e.target;
		if (e.which == 13){
	        var text = $(target).val();
	        if (text !== ""){
	            var addMsg = insertChat("me", text);
	            var chatroom = $(target).closest(".chatroom");
	            var receiveNick =  $(chatroom).prop("id");
	            var ul = chatroom.find("ul");
	            ul.append(addMsg);
	            $(target).val('');
	            websocket.send("membersMsg:" + receiveNick + ":사장님:" + text);
	        }
	    }
	}
	
	function sendText(e){
		var target = $(e.target);
		var input = target.closest("div").prev().find("input");
		
		var text = $(input).val();
        if (text !== ""){
            var addMsg = insertChat("me", text);
            var chatroom = $(target).closest(".chatroom");
            var receiveNick =  $(chatroom).prop("id");
            var ul = chatroom.find("ul");
            ul.append(addMsg);
            $(input).val('');
            websocket.send("membersMsg:" + receiveNick + ":${sessionScope.email}:" + text);
        }
	}
	
	function toggleChagroom(e){
		var target = $(e.target);
		target.closest("div").next().stop().slideToggle();
	}
	
	function setWebsocket(){
		var wsUri = 'ws://localhost:8090/delivery/socketRequest';
		
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(e){		
			websocket.send("membersMsg:test@test:푸른눈:채팅테스트");
			websocket.send("membersMsg:test@test:유재:채팅테스트");
			websocket.send("membersMsg:test@test:ms:채팅테스트");
			websocket.send("membersMsg:test@test:푸른눈:채팅테스트2");
		}
		websocket.onmessage = function(e){
			socketController(e.data);
		}
		websocket.onerror = function(e){

		}
	}
</script>