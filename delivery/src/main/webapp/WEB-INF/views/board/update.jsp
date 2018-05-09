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
				자유게시판 <small>BOARD</small>
			</h1>
		</div>
		<form class="form-horizontal" action="<c:url value='/board/updateOk'/>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boa_writer" value="${boa_writer}">
			<input type="hidden" name="boa_num" value="${boa_num }">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputtitle">제목</label>
				<div class="col-sm-6">
					<input class="form-control" id="boa_title" type="text" name="boa_title" value="${vo.boa_title }">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input">내용</label>
				<div class="col-sm-6">
					<textarea rows="6" cols="128" overflow="scroll" name="boa_cont">${vo.boa_cont}</textarea>
				</div>
			</div>
			<div style="width: 800px; margin-left: 400px;">
				<p class="font1" style="font-size:20px; margin-left: 15px;">이미지 개수</p>
				<div class="col-sm-6">
					<input id="fileCnt" type="number" min="0" max="5" width="200px" style="width: 200px;" placeholder="이미지는 최대 5장입니다.">&nbsp;<button type="button" onclick="uploadCnt()">적용</button>
				</div>
			</div><br><br>
			<div id="fileupload" style="display: block"></div><br>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						등록<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="reset">
						취소<i class="fa fa-times spaceLeft"></i>
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
<script type="text/javascript">
	function uploadCnt(){
		var cnt = $("#fileCnt").val();
		var fileupload = $("#fileupload");
		
		if(cnt == ''){
			alert("첨부할 파일 개수를 입력해주세요.");
			return;
		}
		if(5<cnt || 0>cnt){
			alert("파일첨부는 5개 이하로 가능합니다.");
			return;
		}
		
		$(fileupload).html("");
		
		for(var i=0;i<cnt;i++){
			var inputFile = $("	<div><div style='width:300px; margin-left:515px;'><input class='form-control' id='boa_img' type='file' name='boa_img' required='required'></div></div>");
			fileupload.append(inputFile);
		}
		
	}
</script>
</html>