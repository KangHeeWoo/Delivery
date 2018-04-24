<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085&libraries=services"></script>
<script type="text/javascript"
	src='//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085'></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085&libraries=LIBRARY"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e62d111f7ae02205a9444c872d9a9085&libraries=services,clusterer,drawing"></script>
  <div id="page-top">
  
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
	color:black;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
	color:black;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	color:black;
}
</style>

    <!-- Header -->
    <header class="masthead">
      <div class="container" >
        <div class="intro-text" >
          <div class="intro-lead-in">느림의 미학 킥보드...</div>
          <div class="intro-heading text-uppercase">배달의 백성民</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">주문하기</a>
        </div>
        <div class="form-group">
			<div class="col-sm-6">
				<div class="input-group">
					<input type="text" class="form-control" id="sample5_address"
						placeholder="주소검색을 눌러 주소를 입력해 주세요" width="100" readonly="readonly" name="mem_addr">
					<span class="input-group-btn">							
					<input type="button" class="btn btn-success"
						onclick="sample5_execDaumPostcode()" value="주소검색">
					</span>
					<input type="text" class="form-control" id="detail_address" placeholder="상세 주소를 입력해 주세요" width="100" >
				</div>
			</div>
		</div>
		<br>
		<br>
        <div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;">
			</div>
			<div class="hAddr">
				<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
			</div>
			<br>
			<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
				href="#services" onclick="saveAddr()">이 주소가 확실합니다!</a>
		</div>
      </div>
    </header>

    <!-- Services -->
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">ORDER</h2>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4" onclick="getlist(1)">
          	<input type="hidden" class="cat" value="0">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">한식</h4>           
          </div>
        
          <div class="col-md-4" onclick="getlist(2)">
          	<input type="hidden" class="cat" value="분식">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">분식</h4>            
          </div>
          <div class="col-md-4" onclick="getlist(3)">
          	<input type="hidden" class="cat" value="일식">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">일식</h4>           
          </div>
          <div class="col-md-4" onclick="getlist(4)">
          	<input type="hidden" class="cat" value="치킨">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">치킨</h4>           
          </div>
          <div class="col-md-4" onclick="getlist(5)">
          	<input type="hidden" class="cat" value="피자">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">피자</h4>           
          </div>
          <div class="col-md-4" onclick="getlist(6)">
         	<input type="hidden" class="cat" value="중국집">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">중국집</h4>           
          </div>
          <div class="col-md-4" onclick="getlist(7)">
          	<input type="hidden" class="cat" value="족발·보쌈">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">족발·보쌈</h4>            
          </div>
          <div class="col-md-4" onclick="getlist(8)">
          	<input type="hidden" class="cat" value="야식">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">야식</h4>            
          </div>
          <div class="col-md-4" onclick="getlist(9)">
          	<input type="hidden" class="cat" value="카페·디저트">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">카페·디저트</h4>       
          </div>
          <div class="col-md-4" onclick="getlist(10)">
          	<input type="hidden" class="cat" value="도시락">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">도시락</h4>
          </div>
          <div class="col-md-4" onclick="getlist(11)">
          	<input type="hidden" class="cat" value="패스트푸드">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">패스트푸드</h4>     
          </div>
          <div class="col-md-4" onclick="getlist(12)">
          	<input type="hidden" class="cat" value="찜,탕">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">찜·탕</h4>     
          </div>
        </div>
      </div>
    </section>

    
    

    <!-- 회사연혁 -->
    <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">회사연혁</h2>
            <h3 class="section-subheading text-muted">우리가 배달을 시작한 이유.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <ul class="timeline">
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/1.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>2009-2011</h4>
                    <h4 class="subheading">Our Humble Beginnings</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/2.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>March 2011</h4>
                    <h4 class="subheading">An Agency is Born</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/3.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>December 2012</h4>
                    <h4 class="subheading">Transition to Full Service</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/4.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>July 2014</h4>
                    <h4 class="subheading">Phase Two Expansion</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <h4>Be Part
                    <br>Of Our
                    <br>Story!</h4>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- Team -->
    <section class="bg-light" id="team">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">개발한 남매들</h2>
            <h3 class="section-subheading text-muted">Developed siblings.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt="">
              <h4>Woo Kanghee</h4>           
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/2.jpg" alt="">
              <h4>Park Mina</h4>              
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
              <h4>Yoo Jaehee</h4>              
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/4.jpg" alt="">
              <h4>Kim Minsung</h4>              
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 mx-auto text-center" align="center">
            <p class="large text-muted" >우리의 시작은 개발을 하는 중에 배고픔에서 비롯되었다. 개발을 위한 밑 단계로는 든든한 배와 포만감, 행복함이 필요하며 이를 채워주는 것이 '배달의 백성民'이다.</p>
          </div>
        </div>
      </div>
    </section>
   </div> 
   <script type="text/javascript">
	var latitude =  37.59922888910534;
	var longitude = 127.09409930015491 ;

	var mapContainer = null;
	var mapOption = null;
	var map = null;
	var myAddr=null;
	var searchAddr=null;
	var sido=null;
	var sigungu=null;
	var bname=null;
	var myDetail=null;

	function getMap() {
		mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			//center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			center : new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		
		};

		// 지도를 생성합니다    
		map = new daum.maps.Map(mapContainer, mapOption);

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === daum.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
						myAddr=result[0].road_address.address_name;
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';
							
					/* console.log(result[0].address.region_1depth_name);
					console.log(result[0].address.region_2depth_name);
					console.log(result[0].address.region_3depth_name); */
					
					sido=result[0].address.region_1depth_name;
					sigungu=result[0].address.region_2depth_name;
					bname=result[0].address.region_3depth_name;
					
					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
					
					$("#sample5_address").val(result[0].address.address_name);
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
	}

	function getPosition() {
		if (navigator.geolocation) {
			var startPos;
			console.log("사용함");
			var options = {
				enableHighAccuracy : true,
				timeout : 1000,
				maximumAge : 0
			};
			//getCurrentPosition() 메서드를 이용하여 사용자의 현재 위치를 찾아낼 수 있다 이 것은 페이지 로드가 완료되는 시점에 실행된다.
			//getCurrentPosition()의 호출은 페이지가 로드되고 난 다음 딱 한 번만 하면 된다
			navigator.geolocation.getCurrentPosition(function(pos) {
				//alert('받아옴');
				startPos = pos;
				latitude = pos.coords.latitude;//시작위도
				longitude = pos.coords.longitude;//시작경도
				console.log("시작위도 : " + latitude);
				console.log("시작경도 : " + longitude);
				getMap();

			}, function(error) {
				console.log('Error occurred. Error code: ' + error.code);
				getMap();
				// error.code는 다음을 의미함:
				//   0: 알 수 없는 오류
				//   1: 권한 거부
				//   2: 위치를 사용할 수 없음 (이 오류는 위치 정보 공급자가 응답)
				//   3: 시간 초과
			}, options);
		} else {
			console.log("사용안함");
		}
	}

	getPosition();

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new daum.maps.InfoWindow({
		zindex : 1
	}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

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

			for (var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}
	}
	function saveAddr(){
		searchAddr=document.getElementById("sample5_address").value;
		myDetail = " " + document.getElementById("detail_address").value;
		
		if(!(searchAddr == null || searchAddr == '' || searchAddr ==' ')){
			$.ajax({
				url:"<c:url value='/myAddr'/>",
				data:{searchAddr:searchAddr},
				dataType:"json",
				success:function(data){
					console.log("Mydetail:"+myDetail+" searchAddr:"+searchAddr);
					alert("'"+searchAddr + myDetail + "'가 내 주소로 지정되었습니다.");
				}
			});
		}else{
			alert("내 주소를 선택해주세요.");
		}
	}
	
	function getlist(n){
		searchAddr=sido+" "+sigungu+" "+bname;
		if(sido != null && sigungu != null && bname != null ){
			location.href ="<c:url value='/myposition?cat_num="+n+"&able_loc="+searchAddr+"&myDetail="+myDetail+"'/>";
		}else{
			$.ajax({
				url:"<c:url value='/searchAddr'/>",
				data:{searchAddr:searchAddr},
				dataType:"json",
				success:function(data){
					//console.log(data.able_loc);
					location.href ="<c:url value='/myposition?cat_num="+n+"&able_loc="+data.able_loc+"&myDetail="+myDetail+"'/>";
				}
			});	
		}
	}
</script>
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
							sido=data.sido;
							sigungu=data.sigungu;
							bname=data.bname;
							/* console.log(data.sido);
							console.log(data.sigungu);
							console.log(data.bname); */
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수
							//console.log(data.address);
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
   