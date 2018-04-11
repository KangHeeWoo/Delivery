<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	media="screen" title="no title" charset="utf-8">


</head>
<body>
	<div class="col-md-12">
		<div class="page-header">
			<h1>
				회원가입 <small>Membership</small>
			</h1>
		</div>
		<form class="form-horizontal" action="<c:url value='/join'/>"
			method="post" onsubmit="return joinOk()">

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">이메일</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="email" class="form-control" id="inputEmail"
							placeholder="이메일" name="mem_email"> <span
							class="input-group-btn">
							<button class="btn btn-success" onclick="email_check()">
								인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumberCheck">인증번호
					확인</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input class="form-control" id="inputNumberCheck" type="text"
							placeholder="인증번호"> <span class="input-group-btn">
							<button class="btn btn-success" type="button"
								onclick="emailNum_check()">
								인증번호 확인<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
					<p class="help-block" id="emailP">전송된 인증번호를 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputName" type="text"
						name="mem_name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPassword" type="password"
						placeholder="비밀번호">
					<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPasswordCheck" type="password"
						placeholder="비밀번호 확인" name="mem_pwd">
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">닉네임</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" id="inputNick"
							placeholder="닉네임" name="mem_nick"> <span
							class="input-group-btn">
							<button class="btn btn-success">
								중복확인<i class="fa fa-mail-forward spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputBirth">생년월일</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputBirth" type="date"
						name="mem_birth">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPhone">전화번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPhone" type="text"
						name="mem_phone" placeholder="-를 빼고 입력해주세요.">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPhone">성별</label>
				<div class="col-sm-6">
					<select name="mem_sex" style="width: 150px">
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAddr">주소</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" id="sample5_address"
							placeholder="주소" width="100" readonly="readonly" name="mem_addr">
						<span class="input-group-btn">
							<input type="button" class="btn btn-success"
								onclick="sample5_execDaumPostcode()" value="주소검색">
						</span>
					</div>
				</div>
			</div>
			<div class="form-group" align="center">
				<label class="col-sm-3 control-label" for="inputAddr"> </label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPhone" type="text"
						name="mem_addr2" placeholder="상세주소">
				</div>
			</div>


			<!--    <tr><td><input type="text" id="sample5_address" placeholder="주소" width="100" readonly="readonly" name="mem_addr"></td></tr>
  	 <tr><td><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td></tr>
  	 <tr><td>상세주소<input type="text" width="50" name="mem_addr2"></td></tr>  -->


			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
				<div class="col-sm-6" data-toggle="buttons">
					<label class="btn btn-warning active"> <input id="agree"
						type="checkbox" autocomplete="off"> <span
						class="fa fa-check"></span>
					</label> <a href="#">이용약관</a> 에 동의 합니다.
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="reset">
						가입취소<i class="fa fa-times spaceLeft"></i>
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
		var email_num;
		var emailCheck = false;

		///////////////////////joinOk
		function joinOk() {
			if (!emailCheck)
				return false;
			//추가로 달아요

			return true;
		}

		//////////////////////이메일 체크
		function email_check() {
			email_num = Math.floor(Math.random() * 899999 + 100000);
			var mem_email = $("#inputEmail").val(); //이메일값

			$.ajax({
				url : "<c:url value='/member/email'/>",
				data : {
					email_num : email_num,
					mem_email : mem_email
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.result)
						alert("메일이 전송되었습니다.");
					else
						alert("메일 전송이 실패했습니다.");
				},
				error : function() {
					alert("실패");
				}
			})
		}
		function emailNum_check() {
			var inputNumberCheck = $("#inputNumberCheck").val();
			var emailP = $("#emailP");
			console.log("되는가");
			emailCheck = false;
			if (email_num == inputNumberCheck) {
				emailP.html("인증완료").css({
					color : "#003399"
				});
				emailCheck = true;
			} else {
				emailP.html("인증실패").css({
					color : "#AA1212"
				});
			}
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

</body>
</html>