<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"	href="<c:url value='/resources/css/map-mylist.css'/>">
<div class="chat" style="display: none;">
	<div class='chatheader'>
		<p onclick='toggleChagroom(event)'>&lt;&lt;&lt;&lt; 사장님
			&gt;&gt;&gt;&gt;</p>
	</div>
	<div class='chatroom frame'>
		<ul class='chat_ul'></ul>
		<div>
			<div class='msj-rta macro'>
				<div class='text text-r' style='background: whitesmoke !important'>
					<input class='mytext' placeholder='Type a message'
						onkeydown='inputText(event)' />
				</div>
			</div>
			<div style='padding: 10px;'>
				<span class='glyphicon glyphicon-share-alt'
					onclick='sendText(event)'></span>
			</div>
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
			<tr>
				<td onclick="storedetail(${vo.sto_num })"><img id="ads_img" src="<c:url value='/resources/images/stores/${vo.sto_img }'/>"></td>
				<td onclick="storedetail(${vo.sto_num })">${vo.sto_name }</td>
				<td onclick="storedetail(${vo.sto_num })">${vo.sto_addr }</td>
				<td onclick="storedetail(${vo.sto_num })">${vo.sto_phone }</td>
				<td onclick="storedetail(${vo.sto_num })">${open }</td>
				<td onclick="storedetail(${vo.sto_num })">${close }</td>
				<td><a href="javascript:setChatId('${vo.sel_email }')">사장님과 채팅하기</a></td>
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
			<tr>
				<td onclick="storedetail(${vo.sto_num })"><img id="sto_img" src="<c:url value='/resources/images/stores/${vo.sto_img }'/>"></td>
				<td onclick="storedetail(${vo.sto_num })">${vo.sto_name }</td>
				<td onclick="storedetail(${vo.sto_num })">${vo.sto_addr }</td>
				<td onclick="storedetail(${vo.sto_num })">${vo.sto_phone }</td>
				<td onclick="storedetail(${vo.sto_num })">${open }</td>
				<td onclick="storedetail(${vo.sto_num })">${close }</td>
				<td><a href="javascript:setChatId('${vo.sel_email }')">사장님과 채팅하기</a></td>
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
		var ul = $(".chat_ul");
		var addMsg = insertChat(sendMember, sendMsg);
		ul.append(addMsg);
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
	
	function inputText(e) {
		var target = e.target;
		if (e.which == 13) {
			var text = $(target).val();
			if (text !== "") {
				var addMsg = insertChat("me", text);
				var chatroom = $(target).closest(".chatroom");
				var receiveNick = $(chatroom).prop("id");
				var ul = chatroom.find("ul");
				ul.append(addMsg);
				$(ul).scrollTop($(ul).height());
				$(target).val('');
				websocket.send("membersMsg:" + receiveNick + ":${sessionScope.nick}:" + text);
			}
		}
	}

	function sendText(e) {
		var target = $(e.target);
		var input = target.closest("div").prev().find("input");

		var text = $(input).val();
		if (text !== "") {
			var addMsg = insertChat("me", text);
			var chatroom = $(target).closest(".chatroom");
			var receiveNick = $(chatroom).prop("id");
			var ul = chatroom.find("ul");
			ul.append(addMsg);
			$(input).val('');
			websocket.send("membersMsg:" + receiveNick
					+ ":${sessionScope.nick}:" + text);
		}
	}
	
	function toggleChagroom(e) {
		var target = $(e.target);
		target.closest("div").next().stop().slideToggle();
	}
	
	function setChatId(email){
		$(".chat").css({display : "block"});
		$(".chatroom").prop("id", email);
	}
</script>
