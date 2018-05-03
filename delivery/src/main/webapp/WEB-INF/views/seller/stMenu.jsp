<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width: 800px; margin: auto;">
<h1>메뉴 등록</h1>
<form method="post" action="<c:url value='/stMenuInsert'/>">
				<label for="input">추가할 메뉴 개수</label><br>
					<input id="menuCnt" min="0" type="number" width="200px">&nbsp;<button type="button" onclick="uploadCnt()">적용</button>
			<div id="menuupload" style="display: block"></div>
<input type="submit" value="등록">
</form>
</div>
<script type="text/javascript">
	function uploadCnt(){
		var cnt = $("#menuCnt").val();
		var menuupload = $("#menuupload");
		$(menuupload).html("");
		for(var i=0;i<cnt;i++){
			var inputMenu = $("<table class='table'><tr><th>메뉴명</th><td><input type='text' name='men_name'></td></tr><tr><th>가격</th><td><input type='text' name='men_price'></td></tr><tr><th>상태</th><td>"
			 + "<select name='men_state'><option value='주문가능' selected='selected'>주문가능</option><option value='주문불가능'>주문불가능</option></select></td></tr></table><br>");
			menuupload.append(inputMenu);
		}
	}
</script>