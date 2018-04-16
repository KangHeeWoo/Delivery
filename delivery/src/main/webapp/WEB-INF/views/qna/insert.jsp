<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-theme.min.css'/>"
	media="screen" title="no title" ><!-- charset="utf-8" -->


</head>
<body>
	<div class="col-md-12">
		<div class="page-header">
			<h1>
				1:1 질문 <small>QnA</small>
			</h1>
		</div>
		<form class="form-horizontal" action="<c:url value='/qna/insertOk'/>" method="post">
			<input type="hidden" name="mem_num" value="${mem_num}">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputtitle">제목</label>
				<div class="col-sm-6">
					<input class="form-control" id="qna_title" type="text" name="qna_title">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input">내용</label>
				<div class="col-sm-6">
					<textarea rows="6" cols="128" overflow="scroll" name="qna_cont"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						질문하기<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="reset">
						질문취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
		<hr>
	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c0bb384860705065e4de2f7b7b454&libraries=services"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>