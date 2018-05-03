<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form class="form-horizontal" action="<c:url value='/members/Pwd'/>"
	method="post">

	<div class="form-group">
		<label class="col-sm-3 control-label" for="inputNumber"
			onsubmit="return emailOK()">이메일</label>
		<div class="col-sm-6">
			<div class="input-group">
				<input type="email" class="form-control" id="inputEmail"
					placeholder="Email" name="mem_email"> <span	class="input-group-btn">
					<input type="button" class="btn btn-success" onclick="emailCheck()" value="이메일확인">
				</span>
			</div>
			<p class="help-block" id="emailcheckP"></p>
		</div>
	</div>

		
	<div class="form-group">
		<div class="col-sm-12 text-center">
			<button class="btn btn-primary" type="submit">
				임시번호 전송<i class="fa fa-check spaceLeft"></i>
			</button>

		</div>
	</div>
</form>

<script>
	


	function emailOK() {
		if (!email)	return false;

		return true;
	}

	function emailCheck() {
		var mem_email = $("#inputEmail").val();
		var emailcheckP=$("#emailcheckP");

		$.ajax({
			url : "<c:url value='/member/emailCheck'/>",
			data : {mem_email : mem_email},
			type : "post",
			dataType : "json",
			success : function(data) {
				if (data.result) {
					console.log("이메일잇음");
					emailcheckP.html("이메일이 확인되었습니다.").css({color: "#003399"});
					email = true;
					
				} else {
					
					emailcheckP.html("존재하지 않는 이메일입니다.").css({color : "#AA1212", display:"block"});
				}
			},
			error : function() {
				alert("이메일 중복 오류");
			}
		});
	}
</script>