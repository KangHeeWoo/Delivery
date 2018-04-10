<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action="<c:url value='/join'/>" method="post">
<table class="table">
	<tr><td>이메일<input type="text" name="mem_email"><input type="button" value="이메일 인증"></td></tr>
	<tr><td>인증번호<input type="text" id="comfirmNum"><span id="email_comfirm"></span></td></tr>
	<tr><td>이름<input type="text" name="mem_name"></td></tr>
	<tr><td>비밀번호<input type="password" name="mem_pwd"></td></tr>
	<tr><td>비밀번호확인<input type="password" name="mem_pwd2"></td></tr>
	<tr><td>생년월일<input type="date" name="mem_birth" ></td></tr>
	<tr><td>성별
		<select name="sex" style="width : 150px">
			<option value="남자">남자</option>
			<option value="여자">여자</option>
		</select>
	</td></tr>
	<tr><td>전화번호<input type="text" name="mem_phone"></td></tr>
	<tr><td>닉네임<input type="text" name="mem_nick"><span id="nick_comfirm"></span></td></tr>
	<tr><td><input type="text" id="sample5_address" placeholder="주소" width="100" readonly="readonly" name="mem_addr"></td></tr>
	<tr><td><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td></tr>
	<tr><td>상세주소<input type="text" width="50" name="mem_addr2"></td></tr> 
	<tr><td><input type="submit" value="가입"></td></tr>
</table>
</form>





<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c0bb384860705065e4de2f7b7b454&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
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
                });
            }
        }).open({
        	popupName : '주소 찾기',
            autoClose: true
        });
    }
</script>

</body>
</html>