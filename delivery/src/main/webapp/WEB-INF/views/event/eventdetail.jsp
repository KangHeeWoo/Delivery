<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<fmt:formatDate value="${event.eve_start }" var="start" pattern="yyyy-MM-dd "/>
	<fmt:formatDate value="${event.eve_end }" var="end" pattern="yyyy-MM-dd "/>
	<fmt:formatDate value="${event.eve_regd }" var="regd" pattern="yyyy-MM-dd"/>
<h1>이벤트 팡팡</h1>
<div align="right" style="padding-right: 300px;">등록일 : ${regd }</div>
<div align="center">
	<img src="<c:url value='/resources/images/event/${event.eve_img }' />">
	<p>${event.eve_cont }</p>
	제목 : ${event.eve_title }<br><br>
		
	 ${start } &sim; ${end }<br><br><br>
	 <img src="<c:url value='/resources/images/event/참쉬운-방법.png' />" style="width:900px;height:auto;"><br><br><br>
	 <img src="<c:url value='/resources/images/버튼.png' />" style="width:514px;height:189px;" onclick="eventMem(${event.eve_num})">
</div>
<br><br><br><br><br><br><br><br><br><br><br>
<script>
	function eventMem(eve_num){
		$.ajax({
			url : "<c:url value='/member/eventMem'/>",
			data : {eve_num:eve_num},
			type : "post",
			dataType: "json",
			success: function(data){
				if(data.result){
					//해당 이벤트를 참여한 적이 없을떄
					alert("이벤트 신청 완료");
				}else{
					//중복 참여
					alert("이미 참여 중인 이벤트입니다");
				}
			},
			error : function(){
				console.log("이벤트 json에러");
			}
			
		});
	}
</script>