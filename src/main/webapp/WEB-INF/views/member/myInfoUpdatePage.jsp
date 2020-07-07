<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
<meta charset="UTF-8" name="viewport" content="width=device-width, user-scalable=no">
<style>
.container
{
    width: 400px;
    margin: 20px auto;
}

.preview
{
    padding: 10px;
    position: relative;
}

.preview i
{
    color: white;
    font-size: 35px;
    transform: translate(50px,130px);
}

.preview-img
{
    border-radius: 100%;
    box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.7);
}

.browse-button
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    position: absolute; /* Tweak the position property if the element seems to be unfit */
    top: 10px;
    left: 132px;
    background: linear-gradient(180deg, transparent, black);
    opacity: 0;
    transition: 0.3s ease;
}

.browse-button:hover
{
    opacity: 1;
}

.browse-input
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    transform: translate(-1px,-26px);
    opacity: 0;
}

.form-group
{
    /* width:  250px; */
    margin: 10px auto;
}

.form-group input
{
    transition: 0.3s linear;
}

.form-group input:focus
{
    border: 1px solid crimson;
    box-shadow: 0 0 0 0;
}

.Error
{
    color: crimson;
    font-size: 13px;
}

.Back
{
    font-size: 25px;
}
</style>
    
<script>
	function back(){
		history.back();
	}
	
	if("${result}" == 'success'){
		alert("비밀번호가 변경 되었습니다.");
	}
	
	if("${updateCheck}" == '1'){
		alert("정보가 수정되었습니다.");
	}
	
	if("${updateCheck}" == '0'){
		alert("정보 수정 실패. 관리자 문의");
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
			$('#telcheck').html("010-####-#### 또는 016-###-####");
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
			alert("입력 값이 잘못 됐거나 필수 값이 누락 됐습니다.");
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

	function telcheck() {
		var tel = $("#member_tel").val();
		var telRule = /^\d{3}-\d{3,4}-\d{4}$/;
		if (tel != null && tel != "") {
			if (!telRule.test(tel)) {
				$('#telcheck').html("ex) 010-####-#### 또는 016-###-####");
				$('#telcheck').css("color", "red");
				return false;
			} else {
				$('#telcheck').html("사용 가능한 번호입니다.");
				$('#telcheck').css("color", "blue");
				return true;
			}
		} else {
			$('#telcheck').html("");
		}
	}

	function emailcheck() {
		var email = $("#member_email").val();
		var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (email != null && email != "") {
			if (!emailRule.test(email)) {
				$("#emailcheck").html("ex) abcd1234@naver.com")
				$('#emailcheck').css("color", "red");
				return false;
			} else {
				$("#emailcheck").html("사용 가능한 이메일입니다.")
				$('#emailcheck').css("color", "blue");
				return true;
			}
		} else {
			$("#emailcheck").html("");
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
		
		if(pwupdate1 != pwupdate2){
			alert("변경 할 패스워드가 일치하지 않습니다.");
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
			alert("현재 패스워드가 일치하지 않습니다.");
			return;
		}
		if(result==1){
			alert("비밀번호가 변경되었습니다.");
		}
		
		$("#frm").attr("action","pwUpdate.do")
		document.frm.submit();
	}
</script>
<body>
    <div class="container">
       <div class="Back">
            <i class="fa fa-arrow-left" onclick="back()"></i>
        </div>
        <p class="h2 text-center"></p>
        <form class="form-horizontal" id="frm" name="frm" method="post"
			enctype="multipart/form-data" action="myInfoUpdate.do"
			onsubmit="return joincheck()">
            <div class="preview text-center">
                <img src="${pageContext.request.contextPath}/resources/FileUpload/${ mlist.member_photo }" style="width: 150px; height: 200px" alt="Avatar">
                <div class="browse-button">
                    <i class="fa fa-pencil-alt"></i>
                    <input type="file" id="member_photo" name="uploadFile" maxlength="50">
                </div>
                <span class="Error"></span>
            </div>
            <div class="form-group">
                <label>아이디</label>
                <input class="form-control input-md" type="text" id="member_id"
							name="member_id" required="required" maxlength="20"
							value="${ mlist.member_id }" readonly="readonly"> <span
							class="help-block" class="error" id="overlap"></span>
            </div>
            <div class="form-group">
                <label>이름</label>
                <input class="form-control input-md" type="text" id="member_name"
							name="member_name" required="required" maxlength="5"
							readonly="readonly" value="${ mlist.member_name }"> <span
							class="help-block" id="namecheck"></span>
            </div>
            <div class="form-group">
                <label>생일</label>
                <fmt:formatDate value="${ mlist.member_birth }"
							pattern="yyyy-MM-dd" var="member_birth" />
						<input class="form-control input-md" type="text" id="member_birth"
							name="" required="required" readonly="readonly"
							value="${ member_birth }"> <span class="help-block"></span>
            </div>
            <div class="form-group">
                <label>주소</label><br/>
                <input class="form-control input-md" type="text" id="member_addr1"
							name="member_addr1" maxlength="50" value="${ mlist.member_addr }">
						<input class="btn btn-primary btn-block" type="button"
							onclick="sample4_execDaumPostcode()" value="주소 찾기"> <input
							type="hidden" id="member_addr" name="member_addr" width="200px" maxlength="80">
						<span class="help-block"></span>
            </div>
            <div class="form-group">
                <label>전화번호</label><br/>
                <input class="form-control input-md" type="text" id="member_tel"
							name="member_tel" onblur="telcheck()" maxlength="13"
							value="${ mlist.member_tel }"> <span class="help-block"
							id="telcheck"></span>
            </div>
            <div class="form-group">
                <label>이메일</label><br/>
                <input class="form-control input-md" type="text" id="member_email"
							name="member_email" onblur="emailcheck()" maxlength="30"
							value="${ mlist.member_email }"> <span class="help-block"
							id="emailcheck"></span>
            </div>
            <div class="form-group">
                <label>성별</label><br/>
                <c:if test="${ mlist.member_gender == 'M'}">
					<input class="form-control input-md" type="text" id="member_gender" name="member_gender" readonly="readonly" value="남자">
				</c:if>
				<c:if test="${ mlist.member_gender == 'Y'}">
					<input class="form-control input-md" type="text" id="member_gender" name="member_gender" readonly="readonly" value="여자">
				</c:if>
				<span class="help-block"></span>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="정보 수정하기"/>
                <button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#myModal">비밀번호 변경</button>
            
					<div class="col-md-8">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="left">비밀번호 변경</h4>
        </div>
        <div class="modal-body">
        <div align="center">
		현재 비밀번호를 입력해주세요.<input class="form-control input-md" type="password" id="member_pw" name="member_pw"><br>
		변경 할 비밀번호를 입력해주세요.<input class="form-control input-md" type="password" id="member_pwcheck1" name="member_pwcheck"><br>
		변경 할 비밀번호 재확인.<input class="form-control input-md" type="password" id="member_pwcheck2">
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="pwupdatecheck()">변경하기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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