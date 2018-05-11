<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#detail_event{
		width : 900px;
		margin : auto;
	}
	#win_row span{
		margin-left: 30px;
		font-size: 15px;
	}
</style>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;이벤트&nbsp;&gt;</span></h2></div><br>
<div id="detail_event">
	<fmt:formatDate value="${event.eve_start }" var="start" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate value="${event.eve_end }" var="end" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate value="${event.eve_regd }" var="regd" pattern="yyyy-MM-dd HH:mm"/>
	<table class="table">
		<thead>
			<tr><th colspan="2" class="font1" style="font-size:20px;">제목 : ${event.eve_title }</th></tr>
		</thead>
		<tbody>
			<tr>
				<td>기간 : ${start } &sim; ${end }</td><td>등록일 : ${regd }</td>
			</tr>
			<tr>
				<td colspan="2">
					<img style="width: 100%; height: auto;" src="<c:url value='/resources/images/event/${event.eve_img }' />">
					<p>${event.eve_cont }</p>
				</td>
			</tr>
		</tbody>
	</table>
	<br><br>
	<table class="table">
		<thead>
			<tr class="font2" style="font-size:18px;">
				<th>응모번호</th><th>당첨여부</th><th>응모 아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entry" items="${entry }">
				<c:set var="win" value="${entry.eve_win }"/>
				<tr>
					<td>${entry.eve_ent_num }</td><td>${entry.eve_win }</td><td>${entry.mem_email }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center" style="width: 100%">
		<c:forEach var="i" begin="${pu.startPageNum }"	end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i == pu.pageNum }">
					<span style="color: black;">[${i }]</span>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/coupon?num=${event.eve_num }&pageNum=${i }' />"><span style="color: #555;">[${i }]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<br><br>
	<!-- 당첨처리 추가 : 몇명, 어떤거 지급  -->
	<div style="width : 100%;">
		<form id="form_winpro" method="post" action="<c:url value='/admin/winpro' />" onsubmit="return checkEntCnt(${pu.totalRowCount})">
			<input type="hidden" name="num" value="${event.eve_num }">
			<h4 class="font2" style="font-size:18px;" >추첨하기</h4>
			<div id="win_row">
				<span>지급 쿠폰 :  
					<select name="win_pro">
						<c:forEach var="cou" items="${cou_list }">
							<option value="${cou.cou_num }">${cou.cou_type }</option>
						</c:forEach>
					</select>
				</span>
				<span>당첨 인원 : <input type="number" id="win_cnt" name="win_cnt" value="10"></span>
				<br><br><br><br><br>
				<div style="width : 100%" align="center">
					<a href="javascript:submitWinpro()"><img src="<c:url value='/resources/images/추첨.png' />" style="width:514px;height:189px;"></a>
				</div>
			</div>
		</form>
	</div>
</div>
<br><br><br><br><br>
<script>
	function submitWinpro(){
		$("#form_winpro").submit();
	}
	function checkEntCnt(entCnt){
		var winCnt = $("#win_cnt").val();
		
		console.log(entCnt);
		console.log(winCnt);
		
		if(winCnt > entCnt){
			alert("응모인원보다 당첨인원이 더 많습니다.");
			return false;
		}
		
		var endDate = '${end }';
		
		if(new Date() <= new Date(endDate)){
			alert("아직 진행중인 이벤트 입니다.");	
			return false;
		}		
		
		var state = '${win}';
		
		if(state != '응모'){
			alert("이미 추첨 완료된 이벤트 입니다.");
			return false;
		}
	}	
</script>