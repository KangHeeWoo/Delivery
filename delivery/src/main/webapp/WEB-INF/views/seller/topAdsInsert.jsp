<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;상단 광고 신청 &nbsp;&gt;</span></h2></div><br>

<div style="width: 1000px; margin: auto;">
<br><br>

<form method="post" action="<c:url value='/topAdsInsertOk'/>" enctype="multipart/form-data" id="formTOP">
	<table class="table" >
	<tr>
	<th class="font2" style="font-size: 18px;">광고 희망 월</th>
	<td>
	<select size="1" name="adsMonth">
		<option value="0">1</option>
		<option value="1">2</option>
		<option value="2">3</option>
		<option value="3">4</option>
		<option value="4">5</option>
		<option value="5">6</option>
		<option value="6">7</option>
		<option value="7">8</option>
		<option value="8">9</option>
		<option value="9">10</option>
		<option value="10">11</option>
		<option value="11">12</option>
	</select>
	</td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">광고 이미지</th>
	<td>
	<input type='file' name='topAds_img' required='required'>
	</td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">금액</th>
	<td>
	500,000 원
	</td>
	</tr>
	</table>
	<div align="center">
	 <div align="center"><a href="javascript:gostTop()"><img alt="로고" src="<c:url value='/resources/images/등록.png'/>" style="margin-bottom: 50px; width: 250px;" ></a></div>
	</div>
</form>
</div><br><br><br><br><br>
<script>
	function gostTop(){
		 $("#formTOP").submit(); 
	}
</script>