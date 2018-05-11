<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function tt(){
	var a=$("#sample5_address").val();
	if(a == '클릭 해주세요'){
		alert("주소를 입력해 주세요.");
		return false;
	}else{
		$("#formA").submit();
	}
};
</script>
<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;배달가능 지역&nbsp;&gt;</span></h2></div>
<div style="width: 1000px; margin: auto;">
<br><br>

<form method="post" action="<c:url value='/stLocInsert'/>" id="formA">
				<label class="col-sm-3 control-label" for="input" style="font-size:20px; margin-left: 10px; font-family: baemin1">주소</label>
						<input type="text" id="sample5_address" onclick="sample5_execDaumPostcode()" value="클릭 해주세요" width="100" readonly="readonly" name="able_loc" style="width: 200px; margin-left: -100px;">
			<input type="button" value="등록" onclick="tt();">
</form><br><br>
<table class="table">
	<tr class="font2" style="font-size: 18px; ">
	<th style="padding-left:30px;">번호</th><th>배달 가능지역</th><th>삭제</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr >
		<td style="padding-left:30px;">${vo.able_loc_num }</td><td>${vo.able_loc }</td><td><a href="<c:url value='/stLocDelete?able_loc_num=${vo.able_loc_num }'/>">삭제</a></td>
		</tr>
	</c:forEach>
</table>
</div>

<br><br><br><br><br>

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
		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수
							
							 var sido=data.sido;
			                 var sigungu=data.sigungu;
			                 var bname=data.bname;

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
								/* fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : ''); */
										fullAddr=sido+' '+sigungu+' '+bname;
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