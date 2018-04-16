<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="add_event">
	<form method="post" action="<c:url value='/admin/addEvent' />" enctype="multipart/form-data" id="frm" onsubmit="return setData()">
		<table class="table">
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="eve_title"></td>
				</tr>
				<tr>
					<th>시작일</th>
					<td><input type="date" name="eve_sDate">
					<input type="time" name="eve_sTime"></td>
				</tr>
				<tr>
					<th>종료일</th>
					<td><input type="date" name="eve_eDate">
					<input type="time" name="eve_eTime"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="eve_cont"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="img"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="eve_start">
		<input type="hidden" name="eve_end"> 
	</form>
</div>

<script>
	function setData(){
		frm.eve_start.value = frm.eve_sDate.value + " " + frm.eve_sTime.value;
		frm.eve_end.value = frm.eve_eDate.value + " " + frm.eve_eTime.value;
		
		console.log(frm.eve_start.value);
		console.log(frm.eve_end.value);
	}
</script>