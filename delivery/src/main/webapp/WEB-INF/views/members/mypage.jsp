<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="wrap_subContent" style="height : 158px;">
	<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;마이페이지&gt;</span></h2></div><br>
	<ul id="mypageul">
		<li><a href="<c:url value='/qna/list'/>" style="font-family: baemin4; font-size: 20px; margin-left: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;Q&amp;A &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<c:url value='/members/orderlist'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;주문내역&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<c:url value='/members/review'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;My 리뷰 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<c:url value='/members/pointlist'/>" style="font-family: baemin4; font-size: 20px;"> &nbsp;&nbsp;&nbsp;&nbsp;My 포인트&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<c:url value='/members/couponlist'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;My 쿠폰 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<c:url value='/members/eventlist'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;My 이벤트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<c:url value='/members/information'/>" style="font-family: baemin4; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;내정보&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	</ul>
</div>
<br><br><br><br><br>
