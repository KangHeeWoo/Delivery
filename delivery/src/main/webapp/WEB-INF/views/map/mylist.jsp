<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#store_list{
		width : 1000px;
		margin : auto;
	}
	#sto_img{
		width: 100px;
		height: 100px;
	}
	#ads_img{
		width: 150px;
		height: 150px;
	}
	
	#chatList{
		position : fixed;
		top : 200px;
		width : 100%;
	}
	
	.chat{
		position : absolute;
		width : 100%;
	}
	
	.chatheader{
		background-color: #aaaaaa;
		margin-left : 70%;
	}
	.chatroom{
		margin-left : 70%;
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
<div class="chatList">
	<div class="chat">
		<div class='col-sm-3 col-sm-offset-4 chatheader'><p onclick='toggleChagroom(event)' >&lt;&lt;&lt;&lt; 사장님 &gt;&gt;&gt;&gt;</p></div>
		<div class='chatroom col-sm-3 col-sm-offset-4 frame'>
			<ul class='chat_ul'></ul>
			<div>
				<div class='msj-rta macro'><div class='text text-r' style='background:whitesmoke !important'>
					<input class='mytext' placeholder='Type a message' onkeydown='inputText(event)'/>
				</div>
			</div>
			<div style='padding:10px;'><span class='glyphicon glyphicon-share-alt' onclick='sendText(event)'></span></div></div>						
		</div>
	</div>
</div>
<div id="store_list">
<table class="table" >
	<thead>
		<tr style="background-color: #ffcd28">
			<th colspan="7" style="text-align: center;">☆★☆★☆★슈퍼리스트 광고업소☆★☆★☆★</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${adsList }">
		<fmt:formatDate value="${vo.sto_open }" type="date" var="open" pattern="hh:mm"/>
		<fmt:formatDate value="${vo.sto_close }" type="date" var="close" pattern="hh:mm"/>
			<tr onclick="storedetail(${vo.sto_num })">
				<td><img id="ads_img" src="<c:url value='/resources/images/stores/${vo.sto_img }'/>"></td>
				<td>${vo.sto_name }</td>
				<td>${vo.sto_addr }</td>
				<td>${vo.sto_phone }</td>
				<td>${open }</td>
				<td>${close }</td>
				<td>사장님과 채팅하기</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<table class="table">
	<thead>
		<tr>
			<th>로고</th><th>매장이름</th><th>매장주소</th><th>매장전화번호</th><th>오픈시간</th><th>마감시간</th><th>채팅하기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list }">
		<fmt:formatDate value="${vo.sto_open }" type="date" var="open" pattern="hh:mm"/>
		<fmt:formatDate value="${vo.sto_close }" type="date" var="close" pattern="hh:mm"/>
			<tr onclick="storedetail(${vo.sto_num })">
				<td><img id="sto_img" src="<c:url value='/resources/images/stores/${vo.sto_img }'/>"></td>
				<td>${vo.sto_name }</td>
				<td>${vo.sto_addr }</td>
				<td>${vo.sto_phone }</td>
				<td>${open }</td>
				<td>${close }</td>
				<td>사장님과 채팅하기</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> 
				<a href="<c:url value='/myposition?pageNum=${i }&cat_num=${cat_num }&able_loc=${able_loc }'/>"><span style='color:blue'>[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/myposition?pageNum=${i }&cat_num=${cat_num }&able_loc=${able_loc }'/>"><span style='color:#555'>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
</div>
<script>
	function storedetail(num){
		location.href="<c:url value='/menu/menu?sto_num="+num+"'/>";
	}
	
	var websocket = null;
	
	$(function() {
		setWebsocket();
	});
	
	function setWebsocket(){
		var wsUri = 'ws://localhost:8090/delivery/socketRequest';
		
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(e){		
			
		}
		websocket.onmessage = function(e){
			socketController(e.data);
		}
		websocket.onerror = function(e){

		}
	}
	
	function socketController(msg){
		if(msg.startsWith("membersMsg:")){
			var getMsg = msg.split(":");
			if('${sessionScope.nick}' == getMsg[1]){
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
			var chatHeader = $("<div class='col-sm-3 col-sm-offset-4 chatheader'><p onclick='toggleChagroom(event)' >&lt;&lt;&lt;&lt;" + sendMember + "&gt;&gt;&gt;&gt;</p></div>")
			var chatRoom = $("<div class='chatroom col-sm-3 col-sm-offset-4 frame' id='" + sendMember + "'></div>");
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
</script>
