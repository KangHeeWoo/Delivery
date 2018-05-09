<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="width: 800px; margin: auto;">
<form method="post" action="<c:url value='/mainAdsInsertOk'/>" enctype="multipart/form-data">
	<table class="table">
	<tr>
	<th>광고 희망달</th>
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
	<th>광고 이미지</th>
	<td>
	<input type='file' name='mainAds_img' required='required'>
	</td>
	</tr>
	<tr>
	<th>금액</th>
	<td>
	<input type="text" name="main_ads_price">
	</td>
	</tr>
	</table>
	<div align="center">
	<input type="submit" value="신청">
	</div>
</form>
</div>