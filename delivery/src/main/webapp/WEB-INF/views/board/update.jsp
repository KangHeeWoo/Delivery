<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div align="left"><h2 class="subTitle" style=" color:#212529; width:1100px; height: 60px; margin-left: 500px; padding-top: 5px;"><span>&lt;자유게시판&nbsp;&gt;</span></h2>
<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 475px; margin-top: -80px;" ></div>
		<div align="center">
		<form class="form-horizontal" action="<c:url value='/board/updateOk'/>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boa_writer" value="${boa_writer}">
			<input type="hidden" name="boa_num" value="${boa_num }">
			<table class="table" style="width: 1020px;">
				<thead>
					<tr><td class="font1" style="font-size:20px; margin-left: 12px; margin-left: 10px; width: 150px;">제목 </td>
					<td><input class="form-control" id="boa_title" type="text" name="boa_title" value="${vo.boa_title }"></td></tr>
				</thead>
				<tbody>
					<tr>
						<td class="font1" style="font-size:20px; margin-left: 12px; margin-left: 10px; width: 150px;">내용</td>
						<td><textarea rows="10" cols="128" overflow="scroll" name="boa_cont">${vo.boa_cont}</textarea></td>
					</tr>
					<tr>
					
				<td class="font1" style="font-size:20px; margin-left: 12px; margin-left: 10px; width: 150px;">이미지</td>
				
				<td><input id="fileCnt" type="number" min="0" max="5" width="200px" style="width: 200px;" placeholder="이미지는 최대 5장입니다.">&nbsp;<button type="button" onclick="uploadCnt()">적용</button></td>
				
				
			</tr>
				</tbody>
				</table>
		
			<br><br>
			<div id="fileupload" style="display: block"></div><br>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<input type="submit" value="등록할래요" class="btn btn-primary font1" style="font-size:18px;">
					<input type="reset" value="취소할래요" class="btn btn-danger font1" style="font-size:18px;">
				</div>
			</div>
		</form>
		</div>


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
			var inputFile = $("<div><div style='width:300px; '><input class='form-control' id='boa_img' type='file' name='boa_img' required='required'></div></div>");
			fileupload.append(inputFile);
		}
		
	}
</script>