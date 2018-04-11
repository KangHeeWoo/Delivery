<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Daum map</title>
</head>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085&libraries=services"></script>
<script type="text/javascript"
	src='//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085'></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085&libraries=LIBRARY"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085&libraries=services,clusterer,drawing"></script>
<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 700px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
<script type="text/javascript">
var latitude =37.566826;
var longitude=126.9786567;

var mapContainer=null;
var mapOption=null;
var map=null;

function getMap(){
	mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	   mapOption = {
	        //center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
	        center: new daum.maps.LatLng(latitude,longitude), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	map = new daum.maps.Map(mapContainer, mapOption); 	
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
	
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	            
	            
	        }   
	    });
	});
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
}

function getPosition(){
	if(navigator.geolocation){
		var startPos;
		console.log("사용함");
		var options = {
				  enableHighAccuracy: false,
				  timeout: 1000,
				  maximumAge: 0
				};
		//getCurrentPosition() 메서드를 이용하여 사용자의 현재 위치를 찾아낼 수 있다 이 것은 페이지 로드가 완료되는 시점에 실행된다.
		//getCurrentPosition()의 호출은 페이지가 로드되고 난 다음 딱 한 번만 하면 된다
		navigator.geolocation.getCurrentPosition(function(pos){
			//alert('받아옴');
			startPos = pos;
			latitude=pos.coords.latitude;//시작위도
			longitude=pos.coords.longitude;//시작경도
			console.log("시작위도 : "+latitude);
			console.log("시작경도 : "+longitude);
			getMap();
			
			
		}, function(error) {
			console.log('Error occurred. Error code: ' + error.code);
			getMap();
			// error.code는 다음을 의미함:
			//   0: 알 수 없는 오류
			//   1: 권한 거부
			//   2: 위치를 사용할 수 없음 (이 오류는 위치 정보 공급자가 응답)
			//   3: 시간 초과
		},options);
	}else{
		console.log("사용안함");
	}
}
</script>
<body>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<div class="hAddr">
			<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
		</div>
	</div>
	
	<script>

	getPosition();
		
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}
</script>
<input type="button" value="검색" onclick="getlist()">
</body>
<script type="text/javascript">
	function getlist(){
		
	}
</script>
</html>