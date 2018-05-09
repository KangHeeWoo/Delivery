<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">


<br>
<div align="left"><h2 class="subTitle" style=" color:#212529; width:1100px; height: 60px; margin-left: 490px;"><span>&lt;&nbsp; 자유 게시판 &nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 230px; margin-left: 470px; margin-top: -80px;" ></div>

		<form class="form-horizontal" action="<c:url value='/board/insertOk'/>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boa_writer" value="${boa_writer}">
			<div class="form-group" style="width: 800px; margin-left: 500px;">
				<p class="font1" style="font-size:20px; margin-left: 15px;" >제목</p>
				<div align="center">
					<input style="width:920px; height:35px; margin-left:14px;" id="boa_title" type="text" name="boa_title">
				</div>
				
			</div>
			<div style="width: 800px; margin-left: 500px;">
				<p class="font1" style="font-size:20px; margin-left: 15px;">내용</p>
				<div class="col-sm-6">
					<textarea rows="10" cols="128" overflow="scroll" name="boa_cont"></textarea>
				</div>
				
			</div>
			<div style="width: 800px; margin-left: 500px; margin-top: 230px; margin-right:490px; ">
				<p class="font1" style="font-size:20px; margin-left: 15px;">이미지 개수</p>
				<div class="col-sm-6">
					<input id="fileCnt" type="number" min="0" max="5" width="200px" style="width: 200px;" placeholder="이미지는 최대 5장입니다.">&nbsp;<button type="button" onclick="uploadCnt()">적용</button>
				</div>
			</div><br><br>
			<div id="fileupload" style="display: block"></div><br>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						<span class="font1" style="font-size:18px;">등록할래요</span><i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="reset">
						<span class="font1" style="font-size:18px;">취소할래요</span><i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
<br><br><br><br><br>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c0bb384860705065e4de2f7b7b454&libraries=services"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>


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