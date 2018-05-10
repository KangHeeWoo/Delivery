<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;메뉴 등록&nbsp;&gt;</span></h2></div>
<div style="width: 1000px; margin: auto;">
<br><br>
<form method="post" action="<c:url value='/stMenuInsert'/>" id="formST">
				<label class="col-sm-3 control-label" for="input" style="font-size:20px; margin-left: 20px; font-family: baemin1">추가 메뉴 개수?</label><br>
					<input id="menuCnt" min="0" type="number" style="width:400px; margin-left: -240px; margin-top: 30px; ">&nbsp;<button type="button" onclick="uploadCnt()">적용</button>
			<div id="menuupload" style="display: block"></div>
			
			<br><br><br><br>
			 <div align="center"><a href="javascript:gostMenu()"><img alt="로고" src="<c:url value='/resources/images/등록.png'/>" style="margin-bottom: 50px; width: 250px;" ></a></div>

</form>
</div>
<br><br><br><br><br>

<script type="text/javascript">
	function uploadCnt(){
		var cnt = $("#menuCnt").val();
		var menuupload = $("#menuupload");
		$(menuupload).html("");
		for(var i=0;i<cnt;i++){
			var inputMenu = $("<br><br><table class='table'><tr><th class='font2' style='font-size: 18px; padding-left:30px;'>메뉴명</th><td><input type='text' name='men_name'></td></tr><tr><th class='font2' style='font-size: 18px; padding-left:30px;'>가격</th>	<td><input type='text' name='men_price'></td></tr><tr><th class='font2' style='font-size: 18px; padding-left:30px;'>상태</th><td>"
			 + "<select name='men_state'><option value='가능' selected='selected'>주문가능</option><option value='불가능'>주문불가능</option></select></td></tr></table><br>");
			menuupload.append(inputMenu);
		}
	}

	 
	 function gostMenu(){
		 $("#formST").submit(); 
	 }
</script>