<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.error {
	color: blue
}
</style>
<script>
	function idcheckajax() {
		$.ajax({
			url : '/idCheck.do', //request 보낼 서버의 경로
			dataType : 'json',
			type : 'post', // 메소드(get, post, put 등)
			data : {
				'member_id' : $("#member_id").val()
			}, //보낼 데이터
			success : function(data) {
				if (data == 1) {
					$("#overlap").html("아이디가 중복입니다.");
				} else {
					$("#overlap").html("사용할 수 있는 아이디입니다.");
				}
			}
		});
	}
</script>
<script>
<!-- 정규식 검사 시작 -->
	function joincheck() {
		var cnt = 0;

		var addr1 = $("#member_addr1").val();
		$("#member_addr").val(addr1);

		var pw = $('#member_pw').val();
		var pwcheck = /^[A-Za-z0-9]{6,20}$/;

		if (pw != "") {
			if (!pwcheck.test(pw)) {
				$('#pwcheck').html("6~20자 영문자 또는 숫자 입력.");
				$('#pwcheck').css("color", "red");
				cnt++;
			} else {
				$('#pwcheck').html("사용 가능한 패스워드입니다.");
				$('#pwcheck').css("color", "blue");
			}
		}

		var pw = $('#member_pw').val();
		var pw2 = $('#member_pw2').val();

		if (pw != "" && pw2 != "") {
			if (pw == pw2) {
				$('#pwcheck2').html("패스워드가 일치합니다.");
				$('#pwcheck2').css("color", "blue");
			} else {
				$('#pwcheck2').html("패스워드가 일치하지않습니다. 다시 확인해주세요");
				$('#pwcheck2').css("color", "red");
				cnt++;
			}
		}

		var tel = $("#member_tel").val();
		var telRule = /^\d{3}-\d{3,4}-\d{4}$/;

		if (!telRule.test(tel)) {
			$('#telcheck').html("ex) 010-8164-2731 또는 016-593-1929");
			$('#telcheck').css("color", "red");
			cnt++;
		} else {
			$('#telcheck').html("사용 가능한 번호입니다.");
			$('#telcheck').css("color", "blue");
		}

		var email = $("#member_email").val();
		var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (!emailRule.test(email)) {
			$("#emailcheck").html("ex) abcd1234@naver.com")
			$('#emailcheck').css("color", "red");
			cnt++;
		} else {
			$("#emailcheck").html("사용 가능한 이메일입니다.")
			$('#emailcheck').css("color", "blue");

		}

		if (cnt > 0) {
			alert("조건을 정확히 입력해주세요");
			return false;
		} else {
			return true;
		}
	}
</script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.

				/* document.getElementById('sample4_postcode').value = data.zonecode;
				
				document.getElementById("sample4_roadAddress").value = roadAddr;
				
				document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				console.log(data) */
				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (data.userSelectedType == 'R') {
					frm.member_addr1.value = roadAddr;
				} else {
					frm.member_addr1.value = data.jibunAddress;
				}
			}
		}).open();
	}
</script>
<script>
	if('${resultCheck}' != null && '${resultCheck}' != ""){
		if ('${resultCheck}' == 1) {
			alert("비밀번호가 정상적으로 변경되었습니다.");
		}else{
			alert("비밀번호가 변경을 실패했습니다.");
		}
	}
	

	function back() {
		history.back();
	}

	function idcheck() {
		var id = $("#member_id").val();
		var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;

		$.ajax({
			url : '/idCheck.do', //request 보낼 서버의 경로
			dataType : 'json',
			type : 'post', // 메소드(get, post, put 등)
			data : {
				'member_id' : $("#member_id").val()
			}, //보낼 데이터
			success : function(data) {
				if (data == 1) {
					$("#overlap").html("아이디가 중복입니다.");
					$('#overlap').css("color", "red");
					return false;
				} else if (id == "" || !idCheck.test(id)) {
					$("#overlap").html("영문자로 시작하는 6~20자 영문자 또는 숫자 입력.");
					$('#overlap').css("color", "red");
					return false;
				} else {
					$('#overlap').html("사용 가능한 아이디입니다.");
					$('#overlap').css("color", "blue");
					return true;
				}
			}
		});

	}

	function pwcheck() {
		var pw = $('#member_pw').val();
		var pwcheck = /^[A-Za-z0-9]{6,20}$/;

		if (pw == '' || !pwcheck.test(pw)) {
			$('#pwcheck').html("6~20자 영문자 또는 숫자 입력.");
			$('#pwcheck').css("color", "red");
			return;
		} else {
			$('#pwcheck').html("사용 가능한 패스워드입니다.");
			$('#pwcheck').css("color", "blue");
			return true;
		}
	}

	function pwcheck2() {
		var pw = $('#member_pw').val();
		var pw2 = $('#member_pw2').val();

		if (pw != '' && pw == pw2) {
			$('#pwcheck2').html("패스워드가 일치합니다.");
			$('#pwcheck2').css("color", "blue");
			return false;
		} else {
			$('#pwcheck2').html("패스워드를 확인하세요.");
			$('#pwcheck2').css("color", "red");
			return true;
		}
	}

	function namecheck() {
		var name = $('#member_name').val();
		var nameCheck = /^[가-힣]{2,5}$/;
		if (name == '' || !nameCheck.test(name)) {
			$('#namecheck').html("2~5글자(공백 없음) 한글만 입력 가능.");
			$('#namecheck').css("color", "red");
			return false;
		} else {
			$('#namecheck').html("사용 가능한 이름입니다.");
			$('#namecheck').css("color", "blue");
			return true;
		}
	}

	/* function telcheck(){
	 var phoneRule = /^[0-9]*$/
	 var tel1 = $("#member_tel1").val();
	 var tel2 = $("#member_tel2").val();
	 var tel3 = $("#member_tel3").val();
	
	 if(tel1 == "" || tel2 == "" || tel3 == ""){
	 $('#telcheck').html("번호를 전부 입력해주세요");
	 $('#telcheck').css("color", "red");
	 return;
	 }
	
	 if(!phoneRule.test(tel1) || !phoneRule.test(tel2) || !phoneRule.test(tel3)){
	 $('#telcheck').html("숫자만 입력해주세요.");
	 $('#telcheck').css("color", "red");
	 return;
	
	 } else {
	 $('#telcheck').html("정상적으로 번호가 입력되었습니다.");
	 $('#telcheck').css("color", "blue");
	 return true;
	 } 
	 } */

	function telcheck() {
		var tel = $("#member_tel").val();
		var telRule = /^\d{3}-\d{3,4}-\d{4}$/;

		if (!telRule.test(tel)) {
			$('#telcheck').html("ex) 010-8164-2731 또는 016-593-1929");
			$('#telcheck').css("color", "red");
			return false;
		} else {
			$('#telcheck').html("사용 가능한 번호입니다.");
			$('#telcheck').css("color", "blue");
			return true;
		}
	}

	function emailcheck() {
		var email = $("#member_email").val();
		var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (!emailRule.test(email)) {
			$("#emailcheck").html("ex) abcd1234@naver.com")
			$('#emailcheck').css("color", "red");
			return false;
		} else {
			$("#emailcheck").html("사용 가능한 이메일입니다.")
			$('#emailcheck').css("color", "blue");
			return true;
		}
	}
	
	function pwupdatecheck(){
		var pwupdate1 = $("#member_pwcheck1").val();
		var pwupdate2 = $("#member_pwcheck2").val();
		var realpw = $("#member_pw").val();
		
		if(realpw == null || realpw == ""){
			alert("현재 패스워드를 입력해주세요.")
			return;
		}	
		if(pwupdate1 == null || pwupdate1 == ""){
			alert("변경 할 패스워드를 입력해주세요.")
			return;
		}
		if(pwupdate2 == null || pwupdate2 == ""){
			alert("변경 할 패스워드를 입력해주세요.")
			return;
		}
		
		$.ajax({
		    url: "realpwcheck.do",
		    type: "post",
		    dataType: "json",
		    async: false,
		    data: {'member_pw':realpw},
		    success: function(data){
		    	result = data;
		    },
		    error: function (request, status, error){ 
		    }
		  });
		
		if(result==0){
			alert("현재 패스워드가 일치하지 않습니다.")
			return;
		}
		
		$("#frm").attr("action","pwUpdate.do");
		document.frm.submit();
		
		
		
		/* $(document).ready(function(){
			$("#plzreset").click(function(){
				alert(1);
			});
		}); */
	}
</script>
</head>
<body>
	<div>
<h1 align="center">개인정보 변경</h1><br>
		<form class="form-horizontal" id="frm" name="frm" method="post" style="width: 500px; margin: auto;"
			enctype="multipart/form-data" action="myInfoUpdate.do"
			onsubmit="return joincheck()">

				<!-- Form Name -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password"></label>
					<div class="col-md-6">
						<img
							src="${pageContext.request.contextPath}/resources/FileUpload/${mlist.member_photo }"
							style="width: 100px; height: 100px" alt="Avatar"> <input
							type="file" id="member_photo" name="uploadFile" maxlength="50">
						<span class="help-block"></span>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">아이디</label>
					<div class="col-md-6">
						<input class="form-control input-md" type="text" id="member_id"
							name="member_id" required="required" maxlength="20"
							value="${ mlist.member_id }" readonly="readonly"> <span
							class="help-block" class="error" id="overlap"></span>
					</div>
				</div>

				<!-- Text input-->
				<!-- <div class="form-group">
          <label class="col-md-4 control-label" for="phone">비밀번호 변경</label>  
          <div class="col-md-4">
          <input class="form-control input-md" type="password" id="member_pw" name="member_pw" onblur="pwcheck()" maxlength="20">
          <span class="help-block" id="pwcheck"></span>  
          </div>
        </div> -->

				<!-- Text input-->
				<!-- <div class="form-group">
          <label class="col-md-4 control-label" for="phone">비밀번호 변경 확인</label>  
          <div class="col-md-4">
          <input class="form-control input-md" type="password" id="member_pw2" name="member_pw2" onblur="pwcheck2()" maxlength="20">
          <span class="help-block" id="pwcheck2"></span>  
          </div>
        </div> -->

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">이름</label>
					<div class="col-md-6">
						<input class="form-control input-md" text" id="member_name"
							name="member_name" required="required" maxlength="5"
							readonly="readonly" value="${ mlist.member_name }"> <span
							class="help-block" id="namecheck"></span>
					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">생일 </label>
					<div class="col-md-6">
						<fmt:formatDate value="${ mlist.member_birth }"
							pattern="yyyy-MM-dd" var="member_birth" />
						<input class="form-control input-md" type="text" id="member_birth"
							name="" required="required" readonly="readonly"
							value="${ member_birth }"> <span class="help-block"></span>
					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="rpassword">주소</label>
					<div class="col-md-4">
						<input class="form-control input-md" type="text" id="member_addr1"
							name="member_addr1" maxlength="50" value="${ mlist.member_addr }">
						<input class="btn btn-primary" type="button"
							onclick="sample4_execDaumPostcode()" value="주소 찾기"> <input
							type="hidden" id="member_addr" name="member_addr" width="200px">
						<span class="help-block"></span>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">번호</label>
					<div class="col-md-4">
						<input class="form-control input-md" type="text" id="member_tel"
							name="member_tel" onblur="telcheck()" maxlength="13"
							value="${ mlist.member_tel }"> <span class="help-block"
							id="telcheck"></span>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">이메일</label>
					<div class="col-md-4">
						<input class="form-control input-md" type="text" id="member_email"
							name="member_email" onblur="emailcheck()" maxlength="30"
							value="${ mlist.member_email }"> <span class="help-block"
							id="emailcheck"></span>
					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">성별 </label>
					<div class="col-md-4">
						<c:if test="${ mlist.member_gender == 'M'}">
							<input class="form-control input-md" type="text"
								id="member_gender" name="member_gender" readonly="readonly"
								value="남자">
						</c:if>
						<c:if test="${ mlist.member_gender == 'Y'}">
							<input class="form-control input-md" type="text"
								id="member_gender" name="member_gender" readonly="readonly"
								value="여자">
						</c:if>
						<span class="help-block"></span>
					</div>
				</div>

				<!-- Button (Double) -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="save"></label>
					<div class="col-md-8">
						<input class="btn btn-success" type="submit" value="정보 수정하기">
						<input class="btn btn-success" type="reset" value="취소"> <input
							class="btn btn-success" type="button" value="이전 페이지"
							onclick="back()">
							<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">비밀번호 변경</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" id="plzreset" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 변경</h4>
        </div>
        <div class="modal-body">
        <div align="center">
		현재 비밀번호를 입력해주세요.<input type="password" id="member_pw" name="member_pw"><br>
		변경 할 비밀번호를 입력해주세요.<input type="password" id="member_pwcheck1" name="member_pwcheck"><br>
		변경 할 비밀번호 재확인.<input type="password" id="member_pwcheck2">
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="pwupdatecheck()">변경하기</button>
          <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
      
    </div>
  </div>
					</div>
				</div>
		</form>
	</div>
</body>
</html>