<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<br>

	<div>
		<div align="left"><h2 class="font4" style=" color:#34bdb9; width:1100px; height: 60px; margin-left: 320px; font-size: 40px;"><span>&lt;&nbsp;백성님 가입&nbsp;&gt;</span></h2>
		<img src="<c:url value='/resources/images/밑줄쫙.png'/>" style="width: 250px; margin-left: 300px; margin-top: -70px;" ></div>
		<form class="form-horizontal" action="<c:url value='/join'/>"
			method="post" onsubmit="return joinOk()">

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">이메일</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="email" class="form-control" id="inputEmail"
							placeholder="Email" name="mem_email"> <span
							class="input-group-btn">
							<button class="btn btn-success" onclick="email_check()" id="btnSendEmail">
								인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
							</button>
						</span>
					</div>
					<p class="help-block" id="emailcheckP"></p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">인증번호 확인</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input class="form-control" id="inputNumberCheck" type="text"
							placeholder="Verification Code"> <span class="input-group-btn">
							<button class="btn btn-success" type="button"
								onclick="emailNum_check()">
								인증번호 확인<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
					<p class="help-block" id="emailP">전송된 인증번호를 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputName" type="text"
						name="mem_name" placeholder="Name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPassword" type="password"
						placeholder="Password" onkeyup="pwd1()">
					<p class="help-block" id="pwd1">영문, 숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">비밀번호 확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPasswordCheck" type="password"
						placeholder="Password Check" name="mem_pwd" onkeyup="pwd1()" >
					<p class="help-block" id="pwd2">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">닉네임</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" id="inputNick"
							placeholder="Nickname" name="mem_nick"> <span
							class="input-group-btn">
							<button class="btn btn-success" onclick="nickCheck()">
								중복확인<i class="fa fa-mail-forward spaceLeft"></i>
							</button>
						</span>
					</div>
					<p class="help-block" id="nickcheckP"></p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">탄생일</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputBirth" type="date"
						name="mem_birth">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">전화번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPhone" type="text"
						name="mem_phone" placeholder="-를 빼고 입력해주시기 바랍니다." onkeyup="phonecheck()">
					<p class="help-block" id="phonecheckP"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">성별</label>
				<div class="col-sm-6">
					<select name="mem_sex" style="width: 150px">
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">주소</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control" id="sample5_address"
							placeholder="Address" width="100" readonly="readonly" name="mem_addr">
						<span class="input-group-btn">
							<input type="button" class="btn btn-success"
								onclick="sample5_execDaumPostcode()" value="주소검색">
						</span>
					</div>
				</div>
			</div>
			<div class="form-group" align="center">
				<label class="col-sm-3 control-label" for="inputAddr"> </label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPhone" type="text"
						name="mem_addr2" placeholder="Detailed address">
				</div>
			</div>


			<!--    <tr><td><input type="text" id="sample5_address" placeholder="주소" width="100" readonly="readonly" name="mem_addr"></td></tr>
  	 <tr><td><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td></tr>
  	 <tr><td>상세주소<input type="text" width="50" name="mem_addr2"></td></tr>  -->


			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber" style="font-size:16px; margin-left: 14px; font-family: baemin1">가입약관</label>
				<div class="col-sm-6">
					<textarea rows="6" cols="128" overflow="scroll">제 1 조 (목적)
이 약관은 주식회사 우아한형제들(이하 "회사”라 합니다)이 제공하는 배달의민족 서비스(이하 "서비스”라 합니다)와 관련하여, 회사와 이용 고객간에 서비스의 이용조건 및 절차, 회사와 회원간의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다. 본 약관은 PC통신, 스마트폰(안드로이드폰, 아이폰 등) 앱 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다. 

제 2 조 (용어의 정의)
1. “사이트”란 “업주”가 재화 또는 서비스 상품(이하 “재화 등”이라 합니다)을 “이용자”에게 판매하기 위하여, “회사”가 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정하여 제공하는 가상의 영업장을 말합니다. 
2. “회원”이라 함은 “배달의민족”에 개인정보를 제공하여 회원등록을 한 자로서, “배달의민족”의 정보를 지속적으로 제공받으며, “배달의민족”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 의미하고, “배달의민족” 광고업소는 포함되지 않습니다. 
3. “비회원”이라 함은 “회원”으로 가입하지 않고 “회사”가 제공하는 서비스를 이용하는 자를 말합니다. 
4. “이용자”라 함은 배달의민족 서비스를 이용하는 자를 말하며, 회원과 비회원을 모두 포함합니다. 
5. “비밀번호(Password)”라 함은 회원의 동일성 확인과 회원의 권익 및 비밀보호를 위하여 회원 스스로가 설정하여 사이트에 등록한 영문과 숫자 등의 조합을 말합니다. 
6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 서비스 상에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
7. “바로결제서비스”라 함은 “회원”이 “업주”의 “재화 등”을 주문, 결제할 수 있도록 “회사”가 제공하는 서비스를 말하며, 결제방식은 바로결제방식과 만나서결제방식으로 나누어집니다. 
8. “업주”란 “회사”가 제공하는 “서비스”를 이용해 “재화 등”에 관한 정보를 게재하고, 판매(조리 및 배달포함)하는 주체를 말합니다. 

제 3 조 (약관의 명시와 개정)
1. “회사”는 이 약관의 내용과 상호, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 대표자의 성명, 사업자등록번호, 통신판매업 신고번호, 연락처(전화, 전자우편 주소 등) 등을 “이용자”가 쉽게 알 수 있도록 “사이트”의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자”가 연결화면을 통하여 보도록 할 수 있습니다. 
2. “회사”는 『전자상거래 등에서의 소비자보호에 관한 법률』, 『약관의 규제등에 관한 법률』, 『전자문서 및 전자거래기본법』, 『전자서명법』, 『정보통신망 이용촉진 등에 관한 법률』, 『소비자기본법』 등 관련법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 
3. “회사”는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 “사이트”의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, “이용자”에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “회사”는 개정 전과 개정 후 내용을 “이용자”가 알기 쉽도록 표시합니다. 
4. “회원”은 변경된 약관에 동의하지 않을 권리가 있으며, 변경된 약관에 동의하지 않을 경우에는 서비스 이용을 중단하고 탈퇴를 요청할 수 있습니다. 다만, “이용자”가 제3항의 방법 등으로 “회사”가 별도 고지한 약관 개정 공지 기간 내에 “회사”에 개정 약관에 동의하지 않는다는 명시적인 의사표시를 하지 않는 경우 변경된 약관에 동의한 것으로 간주합니다. 
5. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 『전자상거래 등에서의 소비자보호에 관한 법률』, 『약관의 규제 등에 관한 법률』, 공정거래위원회가 정하는 『전자상거래 등에서의 소비자보호지침』 및 관계 법령 또는 상관례에 따릅니다. 

제 4 조 (관련법령과의 관계)
이 약관 또는 개별약관에서 정하지 않은 사항은 전기통신사업법, 전자거래기본법, 정보통신망법, 전자상거래 등에서의 소비자보호에 관한 법률, 개인정보보호법 등 관련 법령의 규정과 일반적인 상관례에 의합니다. 

제 5 조 (서비스의 제공 및 변경)
1. “회사”는 다음과 같은 서비스를 제공합니다. 
1) “재화 등”에 대한 광고플랫폼 서비스 
2) “재화 등”에 대한 주문중계 등 통신판매중개서비스 
3) 배달대행 서비스 
4) 위치기반 서비스 
5) 기타 “회사”가 정하는 서비스 
2. “회사”는 서비스 제공과 관련한 회사 정책의 변경 등 기타 상당한 이유가 있는 경우 등 운영상, 기술상의 필요에 따라 제공하고 있는 “서비스”의 전부 또는 일부를 변경 또는 중단할 수 있습니다. 
3. “서비스”의 내용, 이용방법, 이용시간에 대하여 변경 또는 “서비스” 중단이 있는 경우에는 변경 또는 중단될 “서비스”의 내용 및 사유와 일자 등은 그 변경 또는 중단 전에 회사 "웹사이트" 또는 “서비스” 내 "공지사항" 화면 등 “회원”이 충분이 인지할 수 있는 방법으로 사전에 공지합니다.

제 6 조 (서비스 이용시간 및 중단)
1. “서비스”의 이용은 “회사”의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 등의 필요로 “회사”가 정한 날이나 시간은 제외됩니다. 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다. 
2. “회사”는 “서비스”의 원활한 수행을 위하여 필요한 기간을 정하여 사전에 공지하고 서비스를 중지할 수 있습니다. 단, 불가피하게 긴급한 조치를 필요로 하는 경우 사후에 통지할 수 있습니다. 
3. “회사”는 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 “서비스”의 제공을 일시적으로 중단할 수 있습니다. 

제 7 조 (이용계약의 성립)
1. 이용계약은 “회원”이 되고자 하는 자(이하 “가입신청자”)가 약관의 내용에 동의를 하고, “회사”가 정한 가입 양식에 따라 회원정보를 기입하여 회원가입신청을 하고 “회사”가 이러한 신청에 대하여 승인함으로써 체결됩니다. 
2. “회사”는 다음 각 호에 해당하는 신청에 대하여는 승인을 하지 않거나 사후에 이용계약을 해지할 수 있습니다. 
1) 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 함 
2) 실명이 아니거나 타인의 명의를 이용한 경우 
3) 회사가 실명확인절차를 실시할 경우에 이용자의 실명가입신청이 사실 아님이 확인된 경우 
4) 등록내용에 허위의 정보를 기재하거나, 기재누락, 오기가 있는 경우 
5) 이미 가입된 회원과 전화번호나 전자우편주소가 동일한 경우 
7) 부정한 용도 또는 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우 
8) 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 및 회사가 합리적인 판단에 의하여 필요하다고 인정하는 경우 
3. 제1항에 따른 신청에 있어 “회사”는 “회원”에게 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다. 
4. “회사”는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다. 
5. “회원”은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “회사”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다. 

제 8 조 (이용계약의 종료)
1. “회원”의 해지 
1) “회원”은 언제든지 “회사”에게 해지의사를 통지함으로써 이용계약을 해지할 수 있습니다. 
2) “회사”는 전항에 따른 “회원”의 해지요청에 대해 특별한 사정이 없는 한 이를 즉시 처리합니다. 
3) “회원”이 계약을 해지하는 경우 “회원”이 작성한 게시물은 삭제되지 않습니다. 
2. “회사”의 해지 
1) “회사”는 다음과 같은 사유가 있는 경우, 이용계약을 해지할 수 있습니다. 이 경우 “회사”는 “회원”에게 전자우편, 전화, 팩스 기타의 방법을 통하여 해지사유를 밝혀 해지의사를 통지합니다. 다만, “회사”는 해당 “회원”에게 해지사유에 대한 의견진술의 기회를 부여 할 수 있습니다. 
가. 제7조 제2항에서 정하고 있는 이용계약의 승낙거부사유가 있음이 확인된 경우 
나. “회원”이 “회사”나 다른 회원 기타 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하는 행위를 한 경우 
다. 기타 “회원”이 이 약관 및 “회사”의 정책에 위배되는 행위를 하거나 이 약관에서 정한 해지사유가 발생한 경우 
라. 1년 이상 서비스를 이용한 이력이 없는 경우 
2) 이용계약은 “회사”가 해지의사를 “회원”에게 통지함으로써 종료됩니다. 이 경우 “회사”가 해지의사를 “회원”이 등록한 전자우편주소로 발송하거나 “회사” 게시판에 게시함으로써 통지에 갈음합니다. 

제 9 조 (회원의 ID 및 비밀번호에 대한 의무)
1. ID와 비밀번호에 관한 관리책임은 “회원”에게 있습니다.
2. “회원”은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. 
3. “회원”이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 “회사”에 통보하고 “회사”의 조치가 있는 경우에는 그에 따라야 합니다. 
4. “회원”이 제3항에 따른 통지를 하지 않거나 “회사”의 조치에 응하지 아니하여 발생하는 모든 불이익에 대한 책임은 “회원”에게 있습니다. 

제 10 조 (회원 및 이용자의 의무)
1. “이용자”는 관계법령 및 이 약관의 규정, “회사”의 정책, 이용안내 등 “회사”가 통지 또는 공지하는 사항을 준수하여야 하며, 기타 “회사” 업무에 방해되는 행위를 하여서는 안됩니다. 
2. “이용자”는 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. 
1) 서비스 신청 또는 변경 시 허위내용의 등록 
2) “회사”에 게시된 정보의 허가 받지 않은 변경 
3) “회사”가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시 
4) “회사” 또는 제3자의 저작권 등 지적 재산권에 대한 침해 
5) “회사 또는 제3자의 명예를 손상시키거나 업무를 방해하는 행위 
6) 외설 또는 폭력적인 메시지, 화상, 음성 기타 공공질서 미풍양속에 반하는 정보를 “서비스”에 공개 또는 게시하는 행위 
7) 고객센터 상담 내용이 욕설, 폭언, 성희롱 등에 해당하는 행위 
8) 포인트를 부정하게 적립하거나 사용하는 등의 행위 
9) 허위 주문, 허위 리뷰작성 등을 통해 서비스를 부정한 목적으로 이용하는 행위 
10) 자신의 ID, PW를 제3자에게 양도하거나 대여하는 등의 행위 
11) 정당한 사유 없이 당사의 영업을 방해하는 내용을 기재하는 행위 
12) 리버스엔지니어링, 디컴파일, 디스어셈블 및 기타 일체의 가공행위를 통하여 서비스를 복제, 분해 또 모방 기타 변형하는 행위 
13) 자동 접속 프로그램 등을 사용하는 등 정상적인 용법과 다른 방법으로 서비스를 이용하여 회사의 서버에 부하를 일으켜 회사의 정상적인 서비스를 방해하는 행위 
14) 기타 관계법령에 위반된다고 판단되는 행위 
3. “회사”는 이용자가 본 조 제2항의 금지행위를 한 경우 본 약관 제13조에 따라 서비스 이용 제한 조치를 취할 수 있습니다. 

제 11 조 (회원의 게시물)
“회원”이 작성한 게시물에 대한 저작권 및 모든 책임은 이를 게시한 “회원”에게 있습니다. 단, “회사”는 “회원”이 게시하거나 등록하는 게시물의 내용이 다음 각 호에 해당한다고 판단되는 경우 해당 게시물을 사전통지 없이 삭제 또는 임시조치(블라인드)할 수 있습니다. 
1) 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우 
2) 공공질서 및 미풍양속에 위반되는 내용일 경우 
3) 범죄적 행위에 결부된다고 인정되는 경우 
4) 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우 
5) 회원이 사이트와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우 
6) 회사로부터 사전 승인 받지 아니한 상업광고, 판촉 내용을 게시하는 경우 
7) 해당 상품과 관련 없는 내용인 경우 
8) 정당한 사유 없이 “회사” 또는 “업주”의 영업을 방해하는 내용을 기재하는 경우 
9) 자신의 업소를 홍보할 목적으로 직접 또는 제3자(리뷰대행업체 등)을 통하여 위법 부당한 방법으로 허위 또는 과장된게시글을 게재하는 경우 
10) 허위주문 또는 주문취소 등 위법 부당한 방법으로 리뷰권한을 획득하여 “회원” 또는 제3자의 계정을 이용하여 게시글을 게시하는 경우 
11) 의미 없는 문자 및 부호에 해당하는 경우 
12) 제3자 등으로부터 권리침해신고가 접수된 경우 
13) 관계법령에 위반된다고 판단되는 경우 
14) 기타 회사의 서비스 약관, 운영정책 등 위반행위를 할 우려가 있거나 위반행위를 한 경우 

제 12 조 (회원게시물의 관리)
1. “회원”의 "게시물"이 정보통신망법 및 저작권법 등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다. 
2. 회사는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다. 
3. 본 조에 따른 세부절차는 정보통신망법 및 저작권법이 규정한 범위 내에서 회사가 정한 게시중단요청서비스에 따릅니다. 
- 게시중단요청: help@woowahan.com 

제 13 조 (이용제한 등)
1. “회사”는 “이용자”가 이 약관의 의무를 위반하거나 “서비스”의 정상적인 운영을 방해한 경우, 주의, 경고, 일시정지, 영구이용정지, 계약해지 등의 (삭제)조치를 즉시 취할 수 있으며, “이용자”는 법적책임을 부담합니다. 
2. “회사”는 "주민등록법"을 위반한 명의도용 및 결제도용, 전화번호 도용, "저작권법"(삭제)을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망 이용촉진 및 정보보호 등에 관한 법률"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위, “여신전문금융업법”을 위반한 “이용자”의 신용카드 부정거래 등 이와 유사한 형태의 부정행위 등과 같이 관련법을 위반한 경우에는 주의, 경고, 일시정지, 영구이용정지, 계약해지 등의 조치를 즉시 취할 수 있으며, “이용자”는 법적책임을 부담할 수 있습니다. 
3. 회사는 회원이 계속해서 1년 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다. 
4. 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 회사의 이용제한정책에서 정하는 바에 의합니다. 
5. 본 조에 따라 서비스 이용을 제한하거나 계약을 해지하는 경우에는 회사는 제15조[회원에 대한 통지]에 따라 통지합니다. 
6. “회원”은 본 조에 따른 이용제한 등에 대해 “회사”가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 “회사”는 즉시 서비스의 이용을 재개합니다. 
7. 본 조에 따라 이용제한이 되는 경우 서비스 이용을 통해 획득한 혜택 등도 모두 이용중단, 또는 소멸되며, “회사”는 이에 대해 별도로 보상하지 않습니다. 

제 14 조 (권리의 귀속)
1. “서비스”에 대한 저작권 및 지적재산권은 “회사”에 귀속됩니다. 단, “회원”의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다. 
2. “회사”가 제공하는 “서비스”의 디자인, “회사”가 만든 텍스트, 스크립트(script), 그래픽, “회원” 상호간 전송 기능 등 “회사”가 제공하는 “서비스”에 관련된 모든 상표, 서비스 마크, 로고 등에 관한 저작권 기타 지적재산권은 대한민국 및 외국의 법령에 기하여 “회사”가 보유하고 있거나 “회사”에게 소유권 또는 사용권이 있습니다. 
3. “회원”은 이 이용약관으로 인하여 서비스를 소유하거나 “서비스”에 관한 저작권을 보유하게 되는 것이 아니라, “회사로부터 서비스의 이용을 허락 받게 되는바, 정보취득 또는 개인용도로만 “서비스”를 이용할 수 있습니다. 
4. “회원”은 명시적으로 허락된 내용을 제외하고는 “서비스”를 통해 얻어지는 정보를 영리 목적으로 사용, 복사, 유통하는 것을 포함하여, “회사”가 만든 텍스트, 스크립트, 그래픽의 “회원” 상호간 전송기능 등을 복사하거나 유통할 수 없습니다. 
5. “회사”는 서비스와 관련하여 “회원”에게 “회사”가 정한 이용조건에 따라 계정, ID, 콘텐츠 등을 이용할 수 있는 이용권만을 부여하며, 이용자는 회사를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 등 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용, 양도, 판매, 담보목적으로 제공하여서는 안됩니다.

제 15 조 (회원에 대한 통지)
1. “회사”가 “회원”에 대한 통지를 하는 경우, “회원”이 가입신청 시 “회사”에 제출한 전자우편 주소나 휴대전화번호 등으로 할 수 있습니다. 
2. “회사”는 불특정다수 “회원”에 대한 통지의 경우, 1주일 이상 사이트에 게시함으로써 개별 통지에 갈음할 수 있습니다. 

제 16 조 (회사의 의무)
1. “회사”는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 “서비스”를 제공하기 위하여 최선을 다하여 노력합니다. 
2. “회사”는 “회원”이 안전하게 “서비스”를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 개인정보처리방침을 수립하여 공시하고 준수합니다. 
3. 회사는 관계 법령이 정한 의무사항을 준수합니다. 

제 17 조 (개별 서비스에 대한 약관 및 이용조건)
1. “회사”는 개별 서비스와 관련한 별도의 약관 및 이용정책을 둘 수 있으며, 개별서비스에서 별도로 적용되는 약관에 대한 동의는 “회원”이 개별서비스를 최초로 이용할 경우 별도의 동의절차를 거치게 됩니다. 이 경우 개별 서비스에 대한 이용약관 등이 본 약관에 우선합니다. 
2. 전항에도 불구하고 “회사”는 개별 서비스에 대한 이용정책에 대해서는 “서비스”를 통해 공지할 수 있으며, “이용자”는 이용정책을 숙지하고 준수하여야 합니다. 

제 18 조 (포인트)
1. 포인트는 “서비스”를 통해 “재화 등”을 구매하는 경우 대금 결제 수단으로 사용할 수 있는 현금 등가 등의 결제수단을 의미합니다. 
2. 포인트는 “회원”의 구매활동, 이벤트 참여 등에 따라 “회사”가 적립, 부여하는 무료 포인트와 “회원”이 유료로 구매하는 유료포인트로 구분됩니다. 
3. 무료포인트의 유효기간은 적립일로부터 1년이며, 유료 포인트는 충전일로부터 5년이 경과하는 날까지 이용하지 않을 경우 상법상 소멸시효에 따라 소멸됩니다. 단, “회사”는 무료포인트의 유효기간을 변경할 수 있으며 이 경우 발급 시점에 “회원”에게 고지합니다. 
4. “회사”가 무상으로 적립 또는 부여하는 무료포인트는 현금환급 신청이 불가합니다. 
5. “회사”는 “회원”이 유료포인트에 대한 환급을 요구할 경우, 환급수수료를 공제하고 환급할 수 있으며, 환급조건 및 환급수수료에 대한 구체적인 내용은 서비스 페이지를 통해 안내합니다. 
6. “회원” 탈퇴 시 미 사용한 무료포인트는 소멸되며, “회사”는 소멸되는 무료 포인트에 대해서 별도의 보상을 하지 않습니다. 
7. “회사”는 “회원”이 포인트를 적립, 구매, 사용하는 경우 휴대폰인증, I-PIN 등 “회사”가 정한 인증절차를 거치도록 할 수 있습니다. 
8. “회사”는 포인트 적립기준, 사용조건 및 제한 등에 관한 사항을 서비스 화면에 별도로 게시하거나 통지합니다. 

제 19 조 (할인쿠폰)
1. 할인쿠폰은 “회사”의 이벤트 프로모션 참여, “업주” 발급, “회사”의 정책에 따른 “회원” 등급별 부여 등을 통하여 “회원”에게 지급되며, “할인쿠폰”별 유효기간, 할인금액 및 사용방법 등은 개별 안내사항을 통하여 확인 가능합니다. 
2. 할인쿠폰은 현금으로 환급될 수 없으며, 할인쿠폰에 표시된 유효기간이 만료되거나 이용계약이 종료되면 소멸합니다. 
3. “회사”는 “회원”이 부정한 목적과 방법으로 할인쿠폰 등을 획득하거나 사용하는 사실이 확인될 경우, 해당 이용자에 대한 할인쿠폰을 회수 또는 소멸시키거나 회원자격을 제한할 수 있습니다. 
4. 할인쿠폰의 제공내용 및 운영방침은 “회사”의 정책에 따라 달라질 수 있습니다. 

제 20 조 (개인정보보호)
1. “회사”는 “회원”의 개인정보를 보호하기 위하여 정보통신망법 및 개인정보 보호법 등 관계 법령에서 정하는 바를 준수합니다. 
2. “회사”는 “회원”의 개인정보를 보호하기 위한 개인정보처리방침을 수립하여 서비스 초기화면에 게시합니다. 다만, 개인정보처리방침의 구체적 내용은 연결화면을 통하여 볼 수 있습니다. 
3. “회사”는 관련법령 및 개인정보처리방침에 따라 “회원”의 개인정보를 최대한 보호하기 위하여 노력합니다. 
4. “회사”의 공식 사이트 이외의 링크된 사이트에서는 “회사”의 개인정보처리방침이 적용되지 않습니다. 링크된 사이트 및 구매 상품이나 서비스를 제공하는 제3자의 개인정보 취급과 관련하여는 해당 사이트 및 해당 제3자의 개인정보처리방침을 확인할 책임이 “회원”에게 있으며, “회사”는 이에 대하여 책임을 부담하지 않습니다. 

제 21 조 (주문 및 결제)
1. “재화 등”에 대한 매매계약은 “회원”이 “업주”가 제시한 상품의 판매 조건에 응하여 청약의 의사표시를 하고 이에 대하여 “업주”가 승낙의 의사표시를 함으로써 “회원”과 “업주”간에 체결됩니다. 
2. “회원”은 다음 또는 이와 유사한 방법에 의한 구매를 신청할 수 있습니다. 
1) 전화주문서비스 
2) 바로결제서비스(수취인 정보의 입력 및 결제수단의 선택 포함) 
3. “회사”가 “업주” 등 제3자에게 이용자의 개인정보를 제공할 필요가 있는 경우 ① 개인정보를 제공받는 자, ② 개인정보를 제공받는 자의 개인정보 이용목적, ③ 제공하는 개인정보의 항목, ④ 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받습니다. 
4. “회사”가 제3자에게 구매자의 개인정보를 처리할 수 있도록 업무를 위탁하는 경우에는 ① 개인정보 처리위탁을 받는 자, ② 개인정보 처리위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받습니다. 다만, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 처리방침을 통해 알림으로써 동의절차를 갈음할 수 있습니다. 
5. “회원”이 전화주문서비스를 통해 업주에게 직접 주문을 경우, 회사는 주문내역 및 취소, 환불, 거래정보 등에 대해 관여하거나, 이에 대한 일체의 책임을 부담하지 않습니다. 
6. “회사”는 바로결제 방식에 의한 대금지급방법으로 신용카드 결제, 핸드폰 결제, 포인트, 기타 “회사”가 추가 지정하는 결제수단 등을 제공할 수 있습니다. 
7. “회원”이 바로결제서비스를 주문을 하는 경우 주소, 연락처 등 배송지 정보에 대한 정확한 정보를 기재해야 하며, “회원”이 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 “회원”이 부담합니다. 
8. “회사”는 “회원”의 바로결제내역을 서비스 화면을 통해 확인할 수 있도록 조치하며, 전자상거래등에서의 소비자보호에 관한 법률에 규정에 의해 일정기간 동안 보존 할 수 있습니다. 

제 22 조 (배달)
“재화 등”에 대한 배달은 “업주”의 책임에 따라 제공되며, “회사”는 주문정보의 중계 이 외에 “재화 등”의 배달(“업주”가 입력하는 배달 예상시간에 대한 정보 전송 포함)에 대한 책임을 부담하지 않습니다. 단, 제25조에 따른 배달대행서비스의 특칙이 적용되는 경우에는 그러하지 않습니다. 

제 23 조 (취소・환불)
1. “재화 등”에 대한 취소 및 환불 규정은 전자상거래등에서의 소비자보호에 관한 법률 등 관련 법령을 준수합니다. 또한, 음식배달의 성격에 따라 음식 조리가 시작된 이후에는 “업주”에게 회복할 수 없는 손해가 발생하므로 단순변심에 의한 청약철회 등은 할 수 없습니다. 
2. “회사” 및 “업주”는 별도의 취소 및 환불 관련 규정을 정할 수 있으며, 이 경우 별도 계약 및 이용조건상의 취소 및 환불 규정이 우선 적용됩니다. 
3. “회사”는 “회원”이 본 조에 따라 바로결제를 통한 구매에 대해 청약철회를 하고 “업주”의 승인이 있는 경우 또는 구매 신청한 상품이 품절 등의 사유로 인도 또는 제공을 할 수 없음을 인지한 경우 지체 없이 그 사유를 “회원”에게 통지하고, 바로결제 내역을 취소하거나 대금을 받은 경우에는 환급에 필요한 조치를 취합니다. 
4. 취소와 환불은 “업주”와 확인 후 처리 하게 되며, 신용카드결제 및 핸드폰결제는 신용카드사 및 이동통신사의 환불기준에 의거하여 처리가 완료되는데 시일이 소요될 수 있습니다. 

제 24 조 (책임제한)
1. “회사”는 “업주”와 “회원” 간의 상품거래를 중개하는 플랫폼 서비스만을 제공할 뿐, “재화 등”을 판매하는 당사자가 아니며, “재화 등”에 대한 정보 및 배송, 하자 등에 대한 책임은 “업주”에게 있습니다. 
2. “회사”는 “업주”가 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관해서는 책임을 지지 않습니다. 
3. “회사”는 천재지변 또는 이에 준하는 불가항력으로 인하여 “서비스”를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. 
4. “회사”는 “회원”의 귀책사유로 인한 “서비스” 이용의 장애에 대하여는 책임을 지지 않습니다. 
5. “회사”는 “회원” 및 “업주”가 게재한 이용후기, 맛집 평가, 사진 등 정보/자료/사실의 신뢰도, 정확성에 대해서는 책임을 지지 않습니다. 
6. “회사”는 제3자가 서비스 내 화면 또는 링크된 웹사이트를 통하여 광고한 제품 또는 서비스의 내용과 품질에 대하여 감시할 의무 기타 어떠한 책임도 지지 아니합니다. 
7. “회사”는 “회원”이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다. 
8. “회사”는 “회원”간 또는 “회원”과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다. 
9. “회사” 및 “회사”의 임직원 그리고 대리인은 고의 또는 중대한 과실이 없는 한 다음과 같은 사항으로부터 발생하는 손해에 대해 책임을 지지 아니합니다. 
1) 회원 정보의 허위 또는 부정확성에 기인하는 손해 
2) 서비스에 대한 접속 및 서비스의 이용과정에서 “회원”의 귀책사유로 발생하는 손해 
3) 서버에 대한 제3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해 및 제3자의 불법적인 행위를 방지하거나 예방하는 과정에서 발생하는 손해 
4) 제3자가 서비스를 이용하여 불법적으로 전송, 유포하거나 또는 전송, 유포되도록 한 모든 바이러스, 스파이웨어 및 기타 악성 프로그램으로 인한 손해 

제 25 조 (배달대행서비스에 대한 특칙)
1. “배달대행서비스”란 “회사”가 “업주”를 대신하여 상품을 “업주”로부터 “회원” 또는 “비회원”에게 배달하는 서비스를 말합니다. 
2. “회사”는 “배달대행서비스”의 특성을 고려하여, 서비스 이용시간 및 대상 상품 등을 별도로 정해서 운영할 수 있습니다. 
3. “회사”는 “배달대행서비스”에 대한 이용요금을 부과할 수 있으며, 배달상품, 배달거리, 배달시간 등에 따라 이용요금을 달리 정할 수 있습니다. 단, 부과되는 이용요금은 사전에 안내합니다. 
4. “회원”은 “배달대행서비스”가 적용되는 “재화 등”에 대해 상품과 배달대행서비스를 구분해서, 결제, 청약철회, 환불 등을 요청할 수 없습니다. 단, “회사”가 인정하는 경우에는 구분해서 환불 처리 등을 할 수 있습니다. 
5. “회사”는 “배달대행서비스의 제공과 관련해서 “업주”로부터 상품을 전달받은 이후 “회사”의 귀책사유로 발생한 배달사고, 음식물의 훼손 등 이에 상응하는 책임을 부담하며, 만약 원만한 분쟁해결이 이루어지지 않는 경우, 공정거래위원회의 소비자분쟁해결기준에 따라 해결합니다. 
6. 본 조는 “회사”의 배달대행 용역에 대한 책임범위 등을 규정하며, 이 약관의 다른 규정에 따라 “업주”가 취급하는 “재화 등”에 대한 책임소재에 대해서는 책임을 부담하지 않습니다. 

제 26 조 (분쟁해결)
1. “회사”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 고객상담 및 피해보상처리기구를 설치・운영합니다. 
2. “회사”는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다. 
3. “회사”와 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. 

제 27 조 (준거법 및 관할법원)
1. 이 약관의 해석 및 회사와 회원간의 분쟁에 대하여는 대한민국의 법을 적용합니다. 
2. 서비스 이용 중 발생한 회원과 회사간의 소송은 민사소송법에 의한 관할법원에 제소합니다. 

					</textarea>
					<br><input type="checkbox" required="required"> 회원가입 동의
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<input type="submit" value="저장할래요" class="btn btn-primary font1" style="font-size:18px;">
					<input type="reset" value="취소할래요" class="btn btn-danger font1" style="font-size:18px;">
					<!-- 
					<button class="btn btn-primary" type="submit">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="reset">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
					 -->
				</div>
			</div>
		</form>
		<hr>
	</div>

	<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

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
		var email_num; //이메일 인증번호
		var emailCheck = false;
		var nickCheck = false;
		var pwdCheck = false;
		var phoneCheck = false;
		
		///////////////////////joinOk///////////////////////////////////////
		function joinOk() {
			if (!emailCheck) return false;
			if (!nickCheck) return false;
			if (!pwdCheck) return false;
			if (!phoneCheck) return false;
			//추가로 달아요
			return true;
		}
		////////번호 유효성
		function phonecheck(){
			var inputPhone=$("#inputPhone").val();
			var phonecheckP=$("#phonecheckP");
			var reg=/^[0-9]{10,11}/;
			phoneCheck = false;
			
			if(inputPhone.match(reg)){
				phonecheckP.html("");
				phoneCheck = true;
			}else{
				phonecheckP.html("전화번호는 숫자로만 입력해주세요.").css({color: "#AA1212"});
			}
		}
		
		///////////비번유효성
		function pwd1(){
			var inputPassword=$("#inputPassword").val();
			var inputPasswordCheck=$("#inputPasswordCheck").val();
			var reg=/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-.]).{8,}$/;
			var pwd1=$("#pwd1");
			var pwd2=$("#pwd2");
			pwdCheck = false;
			
			if(inputPassword.match(reg)){ 
				pwd1.html("사용가능한 비밀번호입니다.").css({color: "#003399"});
				
				if(inputPassword===inputPasswordCheck){
					pwd2.html("비밀번호 일치").css({color: "#003399"});
					pwdCheck=true;
				}else{
					pwd2.html("비밀번호 불일치").css({color: "#AA1212"});		
				}
			}
			else  pwd1.html("숫자, 특수문자 포함 8자 이상으로 입력하세요").css({color: "#AA1212"});			
		}
		////////////////////////닉네임 체크
		function nickCheck(){
			nickCheck = false;
			
			var inputNick=$("#inputNick").val(); //입력한 닉네임
			var nickcheckP=$("#nickcheckP"); //가능여부
			$.ajax({
				url : "<c:url value='/member/nick'/>",
				data: {inputNick :inputNick},
				dataType : "json",
				success : function(data){
					if(data.result){
						nickcheckP.html("사용 가능한 닉네임입니다.").css({color: "#003399"}); 
						nickCheck = true;
					}else {
						nickcheckP.html("사용 불가능한 닉네임입니다.").css({color: "#AA1212"});
					}
				},
				error : function(){
					alert("닉네임 중복 오류");
				}
				
			});
		}
		//////////////////////이메일 체크+전송
		function email_check() {
			email_num = Math.floor(Math.random() * 899999 + 100000);
			$("#btnSendEmail").prop("disabled", true);
			var mem_email = $("#inputEmail").val(); //이메일값
			var emailcheckP=$("#emailcheckP");
			$.ajax({
				url : "<c:url value='/member/email'/>",
				data : {
					email_num : email_num,
					mem_email : mem_email
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.result){
						console.log("메일이 전송되었습니다.");
						emailcheckP.html("사용 가능한 이메일입니다.").css({color: "#003399"});
					}else{
						//alert("메일 전송이 실패했습니다.");
						emailcheckP.html("이미 사용중인 이메일입니다.").css({color: "#AA1212"});
					}
					
					$("#btnSendEmail").prop("disabled", false);
				},
				error : function() {
					alert("이메일 중복 오류");
					$("#btnSendEmail").prop("disabled", false);
				}
			});
			
		}
		function emailNum_check() {
			var inputNumberCheck = $("#inputNumberCheck").val();
			var emailP = $("#emailP");
			console.log("되는가");
			emailCheck = false;
			if (email_num == inputNumberCheck) {
				console.log("되는가1");
				emailP.html("인증완료").css({
					color : "#003399"
				});
				emailCheck = true;
			} else {
				console.log("되는가2");
				emailP.html("인증실패").css({
					color : "#AA1212"
				});
			}
		}
		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수
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
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
