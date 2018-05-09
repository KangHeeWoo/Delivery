<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">


<div align="left"><h2 class="subTitle" style=" color:#212529; width:1100px; height: 60px; margin-left: 490px;"><span>&lt;&nbsp; 1:1 Q&A &nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 230px; margin-left: 470px; margin-top: -80px;" ></div>
	<form class="form-horizontal" action="<c:url value='/qna/insertOk'/>" method="post">
			<input type="hidden" name="mem_num" value="${mem_num}">
			<div style="width: 800px; margin-left: 500px;">
				<p class="font1" style="font-size:20px; margin-left: 15px;" >제목</p>
				<div align="center">
					<input style="width:920px; height:35px; margin-left:14px;" id="qna_title" type="text" name="qna_title">
				</div>
			</div><br>
			<div style="width: 800px; margin-left: 500px;">
				<p class="font1" style="font-size:20px; margin-left: 15px;">내용</p>
				<div class="col-sm-6">
					<textarea rows="10" cols="128" overflow="scroll" name="qna_cont"></textarea>
				</div>
			</div><br>
			<div class="form-group" style="margin-top: 20px;">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						<span class="font1" style="font-size:18px;">질문할래요</span><i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="reset">
						<span class="font1" style="font-size:18px;">취소할래요</span><i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
		<hr>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c0bb384860705065e4de2f7b7b454&libraries=services"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

