<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="left"><h2 class="subTitle" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 520px; padding-top: 5px;"><span>&lt;&nbsp;이벤트 등록&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 495px; margin-top: -80px;" ></div>
<div id="add_event" style="width : 900px; margin : auto;">
	<form method="post" action="<c:url value='/admin/addEvent' />" enctype="multipart/form-data" id="frm" onsubmit="return setData()">
		<table class="table">
			<tbody>
				<tr>
					<th class="font1" style="font-size:15px;">제목</th>
					<td><input type="text" name="eve_title"></td>
				</tr>
				<tr>
					<th class="font1" style="font-size:15px;">시작일</th>
					<td><input type="date" name="eve_sDate">
					<input type="time" name="eve_sTime"></td>
				</tr>
				<tr>
					<th class="font1" style="font-size:15px;">종료일</th>
					<td><input type="date" name="eve_eDate">
					<input type="time" name="eve_eTime"></td>
				</tr>
				<tr>
					<th class="font1" style="font-size:15px;">내용</th>
					<td><textarea rows="5" cols="30" name="eve_cont"></textarea></td>
				</tr>
				<tr>
					<th class="font1" style="font-size:15px;">이미지</th>
					<td><input type="file" name="img"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록할래요" class="btn btn-primary font1" style="font-size:18px;"></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="eve_start">
		<input type="hidden" name="eve_end"> 
	</form>
</div>
<br><br><br><br><br>
<script>
	function setData(){
		var check = true;
		
		if(frm.eve_title.value == '') check = false;
		if(frm.eve_sDate.value == '') check = false;
		if(frm.eve_sTime.value == '') check = false;
		if(frm.eve_eDate.value == '') check = false;
		if(frm.eve_eTime.value == '') check = false;
		if(frm.eve_cont.value == '') check = false;
		if(frm.img.value == '') check = false;
		
		if(!check){
			alert("모든 항목을 입력해주세요.");
			return false;
		}
		
		frm.eve_start.value = frm.eve_sDate.value + " " + frm.eve_sTime.value;
		frm.eve_end.value = frm.eve_eDate.value + " " + frm.eve_eTime.value;

		
		if(new Date(frm.eve_start.value) <= new Date()){
			alert('시작일은 현재 날짜보다 빠를 수 없습니다.');
			return false;
		}
		
		if(new Date(frm.eve_start.value) >= new Date(frm.eve_end.value)){
			alert('종료일은 시작일보다 빠를 수 없습니다.');
			return false;
		}
	}
</script>