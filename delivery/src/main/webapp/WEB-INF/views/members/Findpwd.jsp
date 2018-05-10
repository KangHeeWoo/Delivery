<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="wrap_subContent" style="height : 158px;">
	<div align="center"><h2 class="subTitle" style="background-color:#34bdb9; color:white; width:1100px; height: 60px; padding: 15px;"><span>&lt;&nbsp;비밀번호 찾기&nbsp;&gt;</span></h2></div><br>
</div>

<div align="center" style="margin: auto; width: 1000px; margin-top: -80px;">
<form class="form-horizontal" action="<c:url value='/members/Pwd'/>" method="post" id="mem_selPwd">
	<ul class="mypageul">
		<li><input type="radio" name="joinradio" value="mem_email" checked="checked"><span style="margin-left:80px; font-family: baemin4; font-size: 40px; margin-left: 50px;">우리 백성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
		<li><input type="radio" name="joinradio" value="sel_email" ><span style="font-family: baemin4; font-size: 40px; margin-left: 50px;">사장님</span></li>
	</ul>
<br><br><br><br><br><br>
		
	<div class="form-group">
	     
		<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1" onsubmit="return emailOK()">이메일</label>
		
		<div class="col-sm-6">
			<div class="input-group">
				<input type="email" class="form-control" id="inputEmail"
					placeholder="Email" name="mem_email"> <span	class="input-group-btn">
					<input type="button" class="btn btn-success" onclick="emailCheck()" value="이메일확인" id="btnSendEmail">
				</span>
			</div>
			<p class="help-block" id="emailcheckP"></p>
		</div>
	</div>

<br><br>
		
	<div class="form-group">
		<div class="col-sm-12 text-center">
			<input type="submit" value="임시번호 전송" class="btn btn-primary font1" style="font-size:18px; ">

		</div>
	</div>
</form>
<br><br><br><br><br>
</div>

<script>
	


	function emailOK() {
		if (!email)	return false;

		return true;
	}

	function emailCheck() {
		var mem_email = $("#inputEmail").val();
		var emailcheckP=$("#emailcheckP");
		var form = mem_selPwd;
		var radiovalue=form.joinradio.value;
		//console.log(form.joinradio.value);
		
		//return ;
		$("#btnSendEmail").prop("disabled", true);

		$.ajax({
			url : "<c:url value='/member/emailCheck'/>",
			data : {mem_email : mem_email, radiovalue : radiovalue},
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
				$("#btnSendEmail").prop("disabled", false);
			},
			error : function() {
				alert("이메일 중복 오류");
				$("#btnSendEmail").prop("disabled", false);
			}
		});
	}
</script>