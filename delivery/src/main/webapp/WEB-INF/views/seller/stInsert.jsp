<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/"/>resources/js/bootstrap-timepicker.min.js"></script>


<div style="width: 1000px; margin: auto;">
<div align="left"><h2 class="font1" style=" color:#34bdb9; width:1100px; height: 60px; padding-top: 10px;"><span>&lt;&nbsp;내 가게 등록&nbsp;&gt;</span></h2>
		<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 240px; margin-left: -10px; margin-top: -70px;" ></div>



<form method="post" name="cc" action="<c:url value='/stInsert'/>" onsubmit="add();" enctype="multipart/form-data">
<table class="table">
	<tr>
	<th class="font2" style="font-size: 18px;">사업자 등록번호</th><td><input type="text" id="sto_regnum" name="sto_regnum" style="width: 442px;"></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">매장명</th><td><input type="text" name="sto_name"  style="width: 442px;"></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">주소</th><td><input type="text" id="sample5_address" placeholder="Address" style="width:367px" readonly="readonly">
							<input type="button" onclick="sample5_execDaumPostcode()" value="주소검색">
						</td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">상세주소</th><td><input type="text" id="addr2" style="width: 442px;"><input type="hidden" id="sto_addr" name="sto_addr"  ></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">전화번호</th><td><input type="text" name="sto_phone"  style="width: 442px;"></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">오픈시간</th><td><input type="time" name="sto_open"  style="width: 442px;"></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">마감시간</th><td><input type="time" name="sto_close"  style="width: 442px;"></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">휴무일</th><td><input type="text" name="sto_holiday"  style="width: 442px;"></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">소개 및 안내</th><td><textarea cols="60" rows="10" name="sto_intro"></textarea></td>
	</tr>
	<tr>
		<th class="font2" style="font-size: 18px;">이미지 등록</th><td><input type='file' name='sto_img' required='required'></td>
	</tr>
	<tr>
	<th class="font2" style="font-size: 18px;">카테고리</th><td><select name="cat_num" size="1" style="width: 442px;">
<option value="1">한식</option>
<option value="2">분식</option>
<option value="3">일식</option>
<option value="4">치킨</option>
<option value="5">피자</option>
<option value="6">중식</option>
<option value="7">족발,보쌈</option>
<option value="8">야식</option>
<option value="9">카페,디저트</option>
<option value="10">도시락</option>
<option value="11">패스트푸드</option>
<option value="12">찜,탕</option>
</select></td>
	</tr>
</table><br>
<div align="center">
<input type="submit" value="신청할래요" class="btn btn-primary font1" style="font-size:18px;">
</div>
</form>
</div><br><br><br><br><br>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c0bb384860705065e4de2f7b7b454&libraries=services"></script>
<script>
$('#sto_regnum').blur(function() {
	var sto_regnum=$("#sto_regnum").val();
	$.ajax({
		url:"<c:url value='/stRegnumCheck'/>",
		data:{sto_regnum:sto_regnum},
		dataType:"text",
		success:function(data){
			console.log(data);
			if(data!=""){
				alert("존재하는 사업자등록번호 입니다.");
				document.cc.sto_regnum.value=""; 
			}
		}, error : function(){
			console.log("error!");
		}
	});
});
function add(){
	alert("신청이 완료 되었습니다");
	var addr1=document.getElementById("sample5_address").value;
	var addr2=document.getElementById("addr2").value;
	$("#sto_addr").val(addr1+addr2);
}

function sample5_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					var fullAddr = data.address;
					var extraAddr = '';
					if (data.addressType === 'R') {
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						fullAddr += (extraAddr !== '' ? ' ('
								+ extraAddr + ')' : '');
					}
					document.getElementById("sample5_address").value = fullAddr;
				}
			}).open({
		popupName : 'findAddr',
		autoClose : true
	});
}
	</script>