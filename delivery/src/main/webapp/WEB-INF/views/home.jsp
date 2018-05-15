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
 

    <!-- Header -->
    <header class="masthead">
      <div class="container" >

         
         <div id="blueimp-gallery-carousel" class="blueimp-gallery blueimp-gallery-carousel" style="width:1000px;">
          <div class="slides">
            <div id="links">
                <c:forEach var="vo" items="${list }">
                  <a href="<c:url value='/resources/images/main_ads/${vo.main_ads_img }'/>" data-id="${vo.sto_num }">
                     <img class="main_ads" src="<c:url value='/resources/images/main_ads/${vo.main_ads_img }'/>" alt="main">      
                  </a>
               </c:forEach>
            </div>
          </div>
         <h3 class="title"></h3>
          <a class="prev">‹</a>
          <a class="next">›</a>
          <a class="play-pause"></a>
          <ol class="indicator"></ol>
        </div>
         
          <div>
 
              <a id="goMenu"><img alt="백성로고" src="<c:url value='/resources/images/주문버튼.png'/>" style="margin-bottom: 50px;"></a>
              
          </div>
         
   <br><br><br><br>
        <div class="form-group">
         <div class="col-sm-8">
            <div class="input-group">
               <input type="text" class="form-control" id="sample5_address"
                  placeholder="주소검색을 눌러 주소를 입력해 주세요" style="width:350px;" readonly="readonly" name="mem_addr">
               <span class="input-group-btn">                     
               <input type="button" class="btn btn-success" style="font-family: baemin1"
                  onclick="sample5_execDaumPostcode()" value="주소검색">
               </span>
               <input type="text" class="form-control" id="detail_address" placeholder="상세 주소를 입력해 주세요" style="width:300px;" >
            </div>
         </div>
      </div>
      <br><br>
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
            href="#services" onclick="saveAddr()" style="font-family: baemin1; font-size: 25px;">이 주소가 확실합니다!</a>
      </div>
      </div>
    </header>

    <!-- Services -->
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="font2" style="font-size: 50px;">ORDER</h2><br><br>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4" onclick="getlist(1)">
            <h4 class="font1" style="font-size: 18px;">한식</h4>           
          </div>
        
          <div class="col-md-4" onclick="getlist(2)">
             <input type="hidden" class="cat" value="분식">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">분식</h4>            
          </div>
          <div class="col-md-4" onclick="getlist(3)">
             <input type="hidden" class="cat" value="일식">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">일식</h4>           
          </div>
   
          <div class="col-md-4" onclick="getlist(4)">
             <input type="hidden" class="cat" value="치킨">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">치킨</h4>           
          </div>
          <div class="col-md-4" onclick="getlist(5)">
             <input type="hidden" class="cat" value="피자">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">피자</h4>           
          </div>
          <div class="col-md-4" onclick="getlist(6)">
            <input type="hidden" class="cat" value="중국집">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">중국집</h4>           
          </div>

          <div class="col-md-4" onclick="getlist(7)">
             <input type="hidden" class="cat" value="족발·보쌈">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">족발·보쌈</h4>            
          </div>
          <div class="col-md-4" onclick="getlist(8)">
             <input type="hidden" class="cat" value="야식">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">야식</h4>            
          </div>
          <div class="col-md-4" onclick="getlist(9)">
             <input type="hidden" class="cat" value="카페·디저트">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">카페·디저트</h4>       
          </div>

          <div class="col-md-4" onclick="getlist(10)">
             <input type="hidden" class="cat" value="도시락">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">도시락</h4>
          </div>
          <div class="col-md-4" onclick="getlist(11)">
             <input type="hidden" class="cat" value="패스트푸드">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">패스트푸드</h4>     
          </div>
          <div class="col-md-4" onclick="getlist(12)">
             <input type="hidden" class="cat" value="찜,탕">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="font1" style="font-size: 18px;">찜·탕</h4>     
          </div>
        </div>
      </div>
    </section>

    
    

    <!-- 회사연혁 -->
    <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="font4" style="font-size: 50px;">회사연혁</h2>
            <h3 class="section-subheading text-muted">우리가 배달을 시작한 이유.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <ul class="timeline">
              <li>
                
                  <img class="rounded-circle img-fluid" src="<c:url value='resources/images/main_img/2.png'/>" alt="" style="width: 200px; height: 200px;">
                
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 style="font-family: baemin; font-size: 20px;">2010 ~ 2011</h4>
                    <h4 class="subheading" style="font-family: baemin; font-size: 20px;">남매의 시작</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">배달의 백성은 초라하고 심플하지만 개성넘치는 모습으로 시작했습니다. 우리는 정보기술을 활용하여 배달산업을 발전시키고 싶었습니다. 그리하여 2011년네 (주)개발한 남매들 법인을 설립했습니다. 벤처인증도 받고 3억 원의 투자도 받고 누적 다운로드는 200만건이 넘었으며, 한국 인터넷 전문가협회에서 대상도 받았습니다.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                
                  <img class="rounded-circle img-fluid" src="<c:url value='resources/images/main_img/3.png'/>" alt="" style="width: 200px; height: 200px; margin-left: 470px;">
               
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 style="font-family: baemin; font-size: 20px;">2012</h4>
                    <h4 class="subheading" style="font-family: baemin; font-size: 20px;">남매의 반란</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted" >결제서비스를 오픈하고 바로 결제는 배달음식도 모바일로 주문할 수 있는 시대를 열었습니다. 실리콘 밸리의 투자사로부터 20억원의 투자를 받았으며, 대한민국 인터넷 대상 국무총리상도 받았습니다.</p>
                  </div>
                </div>
              </li>
              <li>
            
                  <img class="rounded-circle img-fluid" src="<c:url value='resources/images/main_img/4.png'/>" alt="" style="width: 200px; height: 200px;">
          
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 style="font-family: baemin; font-size: 20px;">2013</h4>
                    <h4 class="subheading" style="font-family: baemin; font-size: 20px;">남매 성공하다</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">석촌호수가 내려다보이는 네버랜드 사무실에 자리를 잡고 첫 서체인 한나체를 만들어 무료로 배포했습니다. IOS 9001인증도 획득하고 구글 세계 개발자 컨퍼런스도 다녀왔습니다. KDA(코리아디자인어워드) 마이덴티티 부문에서 수상을 했고, 2013년을 빛낸 
                          스타트업 톱 100에 선정되었습니다.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
             
                  <img class="rounded-circle img-fluid" src="<c:url value='resources/images/main_img/5.png'/>" alt="" style="width: 200px; height: 200px; margin-left: 470px;" >
              
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 style="font-family: baemin; font-size: 20px;">2014</h4>
                    <h4 class="subheading" style="font-family: baemin; font-size: 20px;">승승장구</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted" >업계 최초로 누적 다운로드 1.000만 건을 돌파했습닏. 기념으로 시원하게 쐈습니다. 원간 주문 수는 500만 건을 훌쩍 넘었습니다. TV광고를 만들어 전국을 떠들썩하게 만들었습니다. '우리가 어떤 민족입니까!'
                    </p>
                  </div>
                </div>
              </li>
              <li>
              
                  <img class="rounded-circle img-fluid" src="<c:url value='resources/images/main_img/6.png'/>" alt="" style="width: 200px; height: 200px;">
               
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 style="font-family: baemin; font-size: 20px;">2015</h4>
                    <h4 class="subheading" style="font-family: baemin; font-size: 20px;">노력하는 남매</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">바로결제 수수료를 없애고 밖에서 사먹던 음식도 배달되는 외식배달서비스 '배민라이더스'를 오픈했습니다. 모바일 넘버원 반찬가게 '배민찬'도 오픈했습니다. 대한민국 광고대상, 에피어워드, 서울 영상 광고제, 대한민국 마케팅 대상 등 주요 시상식을 휩쓸며 1년동안 13개의 트로피를 받았습니다.</p>
                  </div>
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
          <div align="center">
            <h2 class="font4" style="font-size: 60px;">개발한 남매들</h2>
            <h3 class="section-subheading text-muted">Developed siblings.</h3>
          </div>
        </div>
        <div class="row" >
          <div class="col-sm-3">
            <div class="team-member">
              <img style="width: 300px; height: auto;" src="<c:url value='/resources/images/member/강1.png'/>" alt="">
              <h4 style="margin-left: 40px;" class="font2">Woo Kanghee</h4>           
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" style="width: 300px; height: auto;" src="<c:url value='/resources/images/member/민1.png'/>" alt="">
              <h4 style="margin-left: 40px;"  class="font2">Park Mina</h4>              
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" style="width: 300px; height: auto;" src="<c:url value='/resources/images/member/재1.png'/>" alt="">
              <h4 style="margin-left: 40px;"  class="font2">Yoo Jaehee</h4>              
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <img class="mx-auto rounded-circle" style="width: 300px; height: auto;" src="<c:url value='/resources/images/member/성1.png'/>" alt="">
              <h4 style="margin-left: 40px;" class="font2">Kim Minsung</h4>              
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
   var latitude =  37.5728737695435;
   var longitude = 126.99165293534294;

   var mapContainer = null;
   var mapOption = null;
   var map = null;
   var myAddr=null;
   var searchAddr=null;
   var sido=null;
   var sigungu=null;
   var bname=null;
   var myDetail=null;
   
   $(function(){

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
	      var marker = new daum.maps.Marker({
	          position : new daum.maps.LatLng(latitude, longitude),
	          map : map
	       });
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
	   var marker = new daum.maps.Marker({
	       position : new daum.maps.LatLng(37.537187, 127.005476),
	       map : map
	    });
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
   });
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
      /* var mapContainer = document.getElementById('map'), // 지도를 표시할 div
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
      }); */
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
   <script type="text/javascript">
      $(function(){
         blueimp.Gallery(
                document.getElementById('links').getElementsByTagName('a'),
                {
                    container: '#blueimp-gallery-carousel',
                    carousel: true,
                    startSlideshow: true,
                    slideshowInterval: 3000/* ,
                    onslide: function(index,slide){
                       var text = this.list[index].getAttribute('data-id');
                       //console.log("text : "+text);
                    } */
                });
         
         $("#goMenu").on('click', function(e) {
         	e.preventDefault();
         	var offset = $("#sample5_address").offset().top;
         	console.log(offset-100+"...............");
         	 
         	console.log($(window).scrollTop());
         	 
         	// $("body").animate({
         	$('html').animate({
         		scrollTop : (offset - 40)+"px"
         	}, 400);	  
         	
         	//$(window).scrollTop(offset - 100);
         	//$(window).scrollTop(0);
          }); 
      });
      

   </script>
   