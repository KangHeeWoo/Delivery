<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				회원정보 변경
			</h1>
		</div>
		<form class="form-horizontal" action="<c:url value='/seller/selUpdate'/>"
			method="post" onsubmit="return updateOk()">

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">이메일</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputEmail" type="text" name="sel_email" readonly="readonly" value="${selDetail.sel_email }">
				</div>
			</div>

		
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputName" type="text" name="sel_name" value="${selDetail.sel_name }">
				</div>
			</div>
			
			
			<!-- 현재비밀번호 일치여부확인  -->
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPasswordCheck">현재 비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="PasswordCheck" type="password" placeholder="Password Check"  onkeyup="pwd()" >
					<p class="help-block" id="pwd">현재 사용중인 비밀번호를 입력해주세요.</p>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPassword">변경할 비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPassword" type="password"
						placeholder="Password" onkeyup="pwd1()">
					<p class="help-block" id="pwd1">영문, 숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPasswordCheck" type="password" placeholder="Password Check" name="sel_pwd" onkeyup="pwd1()" >
					<p class="help-block" id="pwd2">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>

			

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPhone">전화번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPhone" type="text" name="sel_phone" placeholder="-를 빼고 입력해주시기 바랍니다." onkeyup="phonecheck()" value="${selDetail.sel_phone }">
					<p class="help-block" id="phonecheckP"></p>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAddr">주소</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" id="sample5_address" placeholder="Address" width="100" readonly="readonly" name="sel_addr" value="${selDetail.sel_addr }">
						<span class="input-group-btn">
							<input type="button" class="btn btn-success" onclick="sample5_execDaumPostcode()" value="주소검색">
						</span>
					</div>
				</div>
			</div>
			<div class="form-group" align="center">
				<label class="col-sm-3 control-label" for="inputAddr"> </label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPhone" type="text" name="sel_addr2" placeholder="Detailed address" >
				</div>
			</div>


			<!--    <tr><td><input type="text" id="sample5_address" placeholder="주소" width="100" readonly="readonly" name="mem_addr"></td></tr>
  	 <tr><td><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td></tr>
  	 <tr><td>상세주소<input type="text" width="50" name="mem_addr2"></td></tr>  -->


	
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						수정하기<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-primary" type="reset">
						취소<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" onclick="deleteM()">
						탈퇴하기
					</button>
				</div>
			</div>
		</form>
		<hr>
	</div>






	<div id="map"
		style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c0bb384860705065e4de2f7b7b454&libraries=services"></script>
	<script>
		function deleteM(){
			location.href="<c:url value='/seller/delete'/>";
		}
		
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		
		
		
		//var email_num; //이메일 인증번호
		//var emailCheck = false;
		var pwdCheck = false;
		var phoneCheck = false;
		var password= false;
		
		///////////////////////Ok///////////////////////////////////////
		function updateOk() {
			console.log("dhsl");
			if (!pwdCheck) return false;
			if (!password) return false;
			//추가로 달아요

			return true;
		}
		////////번호 유효성
		function phonecheck(){
			var inputPhone=$("#inputPhone").val();
			var phonecheckP=$("#phonecheckP");
			var reg=/^[0-9]{10,11}/;
			
			
			if(inputPhone.match(reg)){
				phonecheckP.html("");
				phoneCheck = true;
			}else{
				phonecheckP.html("전화번호는 숫자로만 입력해주세요.").css({color: "#AA1212"});
			}
		}
		//현재사용중인번호 일치체크
		function pwd(){
			var Password=$("#PasswordCheck").val();
			var pwd=$("#pwd");
			password = false;
			$.ajax({
				url : "<c:url value='/seller/password'/>",
				data: {Password :Password},
				dataType : "json",
				success : function(data){
					if(data.result){
						pwd.html("비밀번호가 일치합니다").css({color: "#003399"}); 
						password = true;
					}else {
						pwd.html("비밀번호가 일치하지 않습니다.").css({color: "#AA1212"});
					}
				},
				error : function(){
					console.log("사용비번json 오류");
				}
				
			});		
		}
		///////////비번유효성
		function pwd1(){
			var inputPassword=$("#inputPassword").val();
			var inputPasswordCheck=$("#inputPasswordCheck").val();
			var reg=/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-.]).{8,}$/;
			var pwd1=$("#pwd1");
			var pwd2=$("#pwd2");
			pwdCheck = false;
			
			if(inputPassword.match(reg)){ 
				pwd1.html("사용가능한 비밀번호입니다.").css({color: "#003399"});
				
				if(inputPassword===inputPasswordCheck){
					pwd2.html("비밀번호 일치").css({color: "#003399"});
					pwdCheck=true;
				}else{
					pwd2.html("비밀번호 불일치").css({color: "#AA1212"});		
				}
			}
			else  pwd1.html("숫자, 특수문자 포함 8자 이상으로 입력하세요").css({color: "#AA1212"});			
		}
		

		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 기본 주소가 도로명 타입일때 조합한다.
							if (data.addressType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 주소 정보를 해당 필드에 넣는다.
							document.getElementById("sample5_address").value = fullAddr;
							// 주소로 상세 정보를 검색

							/* geocoder.addressSearch(data.address, function(results, status) {
							    // 정상적으로 검색이 완료됐으면
							    if (status === daum.maps.services.Status.OK) {

							        var result = results[0]; //첫번째 결과의 값을 활용

							        // 해당 주소에 대한 좌표를 받아서
							        var coords = new daum.maps.LatLng(result.y, result.x);
							        // 지도를 보여준다.
							        mapContainer.style.display = "block";
							        map.relayout();
							        // 지도 중심을 변경한다.
							        map.setCenter(coords);
							        // 마커를 결과값으로 받은 위치로 옮긴다.
							        marker.setPosition(coords)
							    }
							}); */
						}
					}).open({
				popupName : 'findAddr',
				autoClose : true
			});
		}
	</script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

