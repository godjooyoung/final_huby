<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	.r_num1{ width: 30px }
	.r_num2{ width: 25px }
	.r_num3{ width: 50px }
	.tel1{ width: 30px }
	.tel2{ width: 40px }
	.tel3{ width: 40px }
</style>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                /* document.getElementById('sample4_postcode').value = data.zonecode;
                
                document.getElementById("sample4_roadAddress").value = roadAddr;
                
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                console.log(data) */
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(data.userSelectedType == 'R'){
                	frm.company_addr1.value = roadAddr;
                } else {
                	frm.company_addr1.value = data.jibunAddress;
                }
            }
        }).open();
    }
</script>
<script>

function idcheck(){
	var id = $("#company_id").val();
	var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
	
	$.ajax({
	    url:'/CompanyidCheck.do', //request 보낼 서버의 경로
	    dataType: 'json',
	    type:'post', // 메소드(get, post, put 등)
	    data:{'company_id':$("#company_id").val()}, //보낼 데이터
	    success: function(data) {
	        if(data==1){
	        	$("#overlap").html("아이디가 중복입니다.");
	        	$("#overlap").css("color", "red");
	        	return false;
	        }else if(id == "" || !idCheck.test(id)) {
				$("#overlap").html("영문자로 시작하는 6~20자 영문자 또는 숫자 입력.");
				$('#overlap').css("color", "red");
				return false;
			}else {
				$('#overlap').html("사용 가능한 아이디입니다.");
				$('#overlap').css("color", "blue");
				return true;
			}
	    }
	});
}
/* function r_numcheck(){
	var r_numRule = /^[0-9]*$/	
	var r_num1 = $("#regist_number1").val();
	var r_num2 = $("#regist_number2").val();
	var r_num3 = $("#regist_number3").val();
	var r_num = $("#regist_number").val();
	
	if(r_num1 == "" || r_num2 == "" || r_num3 == ""){
		$("#r_numblur").html("숫자를 모두 입력해주세요.");
		$('#r_numblur').css("color", "red");
		return;
	}
	
	if(!r_numRule.test(r_num1) || !r_numRule.test(r_num2) || !r_numRule.test(r_num3)){
		$("#r_numblur").html("숫자만 입력해주세요.");
		$('#r_numblur').css("color", "red");
		return;
	}
	
	if(r_numRule.test(r_num1) || r_numRule.test(r_num2) || r_numRule.test(r_num3)){
		r_num = r_num1 + "-" + r_num2 + "-" + r_num3;
		$.ajax({
		    url:'/CompanyrNumCheck.do', //request 보낼 서버의 경로
		    dataType: 'json',
		    type:'post', // 메소드(get, post, put 등)
		    data:{'regist_number':r_num}, //보낼 데이터
		    success: function(data) {
		        if(data==1){
		        	$("#r_numblur").html("이미 가입된 사업자입니다.");
		        	$("#r_numblur").css("color", "red");
		        	return false;
		        }else {
					$('#r_numblur').html("사용할 수 있는 사업자 번호입니다.");
					$('#r_numblur').css("color", "blue");
					return true;
				}
		    }
		});
	}
} */
	function r_numcheck(){
		var r_num = $("#regist_number").val();
		var r_numRule = /^\d{3}-\d{2}-\d{5}$/;
	
		if(!r_numRule.test(r_num)){
			$("#r_numblur").html("ex) 604-12-63412");
			$("#r_numblur").css("color","red");
		}else{
			$.ajax({
			    url:'/CompanyrNumCheck.do', //request 보낼 서버의 경로
			    dataType: 'json',
			    type:'post', // 메소드(get, post, put 등)
			    data:{'regist_number':r_num}, //보낼 데이터
			    success: function(data) {
			        if(data==1){
			        	$("#r_numblur").html("이미 가입된 사업자입니다.");
			        	$("#r_numblur").css("color", "red");
			        	return false;
			        }else {
						$('#r_numblur').html("사용 가능한 사업자 번호입니다.");
						$('#r_numblur').css("color", "blue");
						return true;
					}
			    }
			});
		}
	}

function namecheck(){
	var name = $("#company_name").val();
	var nameRule = /^[가-힣a-zA-Z()]{1,7}$/;
	if(name == "" || !nameRule.test(name)){
		$("#nameblur").html("1~7글자 한글,영어(공백 없음)만 입력 가능합니다.");
		$("#nameblur").css("color", "red");
	}else{
		$("#nameblur").html("사용 가능한 회사명입니다");
		$("#nameblur").css("color", "blue");
	}
}

function pwcheck(){
	var pw = $("#company_pw").val();
	var pwcheck = /^[A-Za-z0-9]{6,20}$/;
	
	if (pw == '' || !pwcheck.test(pw)) {
		$('#pwblur').html("6~20자 영문자 또는 숫자 입력.");
		$('#pwblur').css("color", "red");
	} else {
		$('#pwblur').html("사용가능한 패스워드입니다.");
		$('#pwblur').css("color", "blue");
	}
} 

function pwcheck2(){
	var pw2 = $("#company_pw2").val();
	var pw = $("#company_pw").val();
	
	if(pw != '' && pw2 == pw){
		$('#pwblur2').html("패스워드가 일치합니다.");
		$('#pwblur2').css("color", "blue");
	}else{
		$('#pwblur2').html("패스워드를 확인하세요.");
		$('#pwblur2').css("color", "red");
	}
}

/* function telcheck(){
	var telRule = /^[0-9]*$/
	var tel1 = $("#company_tel1").val();
	var tel2 = $("#company_tel2").val();
	var tel3 = $("#company_tel3").val();
	
	if(tel1 == "" || tel2 == "" || tel3 == ""){
		$('#telblur').html("번호를 전부 입력해주세요");
		$('#telblur').css("color", "red");
		return;
	}
	
	if(!telRule.test(tel1) || !telRule.test(tel2) || !telRule.test(tel3)){
		$('#telblur').html("숫자만 입력해주세요.");
		$('#telblur').css("color", "red");
		return;
		
	} else {
		$('#telblur').html("정상적으로 번호가 입력되었습니다.");
		$('#telblur').css("color", "blue");
		return true;
	} 
} */

function telcheck(){
	var tel = $("#company_tel").val();
	var telRule = /^\d{3}-\d{3,4}-\d{4}$/;

	if(!telRule.test(tel)){
		$('#telblur').html("ex) 010-8164-2731 또는 016-593-1929");
		$('#telblur').css("color", "red");
		return false;
	}else{
		$('#telblur').html("사용 가능한 번호입니다.");
		$('#telblur').css("color", "blue");
		return true;
	}
}

/* function emailcheck(){
	var email1 = $("#company_email1").val();
	var email2 = $("#company_email2").val();
	var email3 = $("#company_email3").val();
	var emailRule = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	
	if(email3 == "custom"){
			if(email1 == "" || email2 == ""){
				$("#emailblur").html("이메일을 입력해주세요.");
				$("#emailblur").css("color","red");
				return;
			}else{
				var email = email1 + "@" + email2;
				if(emailRule.test(email)){
					$("#emailblur").html("사용가능한 이메일입니다.");
					$("#emailblur").css("color","blue");
				}else{
					$("#emailblur").html("이메일 형식이 맞지않습니다.");
					$("#emailblur").css("color","red");
				}
			}
	}else{
			if(email1 == ""){
				$("#emailblur").html("이메일을 입력해주세요.");
				$("#emailblur").css("color","red");
				return;
			}else{
				if(emailRule.test(email)){
				$("#emailblur").html("사용가능한 이메일입니다.");
				$("#emailblur").css("color","blue");
				}
			}
	}
}

function custom(selected){	
	var email1 = $("#company_email1").val();
	var email2 = $("#company_email2").val();
	var email3 = $("#company_email3").val();
	
	if(selected == "custom"){
		$("#company_email2").show();
		if(email1 == "" || email2 == ""){
			$("#emailblur").html("이메일을 입력해주세요.");
			$("#emailblur").css("color","red");
			return;
		}
	}
	else{
		$("#company_email2").val("");
		$("#company_email2").hide();
		if(email1 != ""){
			$("#emailblur").html("사용가능한 이메일입니다.");
			$("#emailblur").css("color","blue");
			return;
		}else{
			$("#emailblur").html("이메일을 입력해주세요.");
			$("#emailblur").css("color","red");
		}
	}
} */

function emailcheck(){
	var email = $("#company_email").val();
	var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(email != ""){
		if(!emailRule.test(email)){
			$("#emailblur").html("ex) abcd1234@naver.com")
			$('#emailblur').css("color", "red");
			return false;
		}else{
			$("#emailblur").html("사용 가능한 이메일입니다.")
			$('#emailblur').css("color", "blue");
			return true;
		}
	}
}

function ceonamecheck(){
	var ceoname = $("#ceo_name").val();
	var ceonameRule = /^[가-힣]{2,5}$/;
	
	if (ceoname == '' || !ceonameRule.test(ceoname)) {
		$('#ceoblur').html(" 2~5글자(공백 없음) 한글만 입력 가능.");
		$('#ceoblur').css("color", "red");
		return;
	} else {
		$('#ceoblur').html("사용가능한 이름입니다.");
		$('#ceoblur').css("color", "blue");
		return true;
	}
}

function bcategorycheck(){
	var bcategory = $("#business_category").val();  
	var bcategoryRule = /^[가-힣]{2,5}$/;
	
	if(!bcategoryRule.test(bcategory)){
		$("#bcategoryblur").html("2~5글자(공백 없음) 한글만 입력 가능.");
		$('#bcategoryblur').css("color", "red");
	}else{
		$("#bcategoryblur").html("사용 가능한 카테고리입니다.");
		$('#bcategoryblur').css("color", "blue");
	}
}

function homepagecheck(){
	var homepage = $("#homepage").val();
	var homepageRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(homepage != ""){
		if(!homepageRule.test(homepage)){
			$("#homepageblur").html("ex) abcd1234@naver.com");
			$('#homepageblur').css("color", "red");
		}else{
			$("#homepageblur").html("사용 가능한 이메일입니다.")
			$('#homepageblur').css("color", "blue");
		}
	}
}

function joincheck(){
		var cnt = 0;
		/* var tel1 = $("#company_tel1").val();
		var tel2 = $("#company_tel2").val();
		var tel3 = $("#company_tel3").val();
		$("#company_tel").val(tel1 + "-" + tel2 + "-" + tel3); */
		
		/* var rnum1 = $("#regist_number1").val();
		var rnum2 = $("#regist_number2").val();
		var rnum3 = $("#regist_number3").val();
		$("#regist_number").val(rnum1 + "-" + rnum2 + "-" + rnum3); */
		
		var addr1 = $("#company_addr1").val();
		var addr2 = $("#company_addr2").val();
		$("#company_addr").val(addr1+" "+addr2); 
		
		/* var email1 = $("#company_email1").val();
		var email2 = $("#company_email2").val();
		var email3 = $("#company_email3").val();
		var email = "";
		
		if(email3 == "custom"){
			email = email1 + "@" + email2;
		}else{
			email = email1 + "@" + email3;	
		}
		$("#company_email").val(email); */
		var id = $("#company_id").val();
		var idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		$.ajax({
		    url:'/CompanyidCheck.do', //request 보낼 서버의 경로
		    dataType: 'json',
		    type:'post', // 메소드(get, post, put 등)
		    data:{'company_id':$("#company_id").val()}, //보낼 데이터
		    success: function(data) {
		        if(data==1){
		        	$("#overlap").html("아이디가 중복입니다.");
		        	$("#overlap").css("color", "red");
		        	cnt++;
		        }else if(id == "" || !idCheck.test(id)) {
					$("#overlap").html("영문자로 시작하는 6~20자 영문자 또는 숫자 입력.");
					$('#overlap').css("color", "red");
					cnt++;
				}else {
					$('#overlap').html("사용 가능한 아이디입니다.");
					$('#overlap').css("color", "blue");
				}
		    }
		});		
		
		var r_num = $("#regist_number").val();
		var r_numRule = /^\d{3}-\d{2}-\d{5}$/;
	
		if(!r_numRule.test(r_num)){
			$("#r_numblur").html("ex) 604-12-63412");
			$("#r_numblur").css("color","red");
		}else{
			$.ajax({
			    url:'/CompanyrNumCheck.do', //request 보낼 서버의 경로
			    dataType: 'json',
			    type:'post', // 메소드(get, post, put 등)
			    data:{'regist_number':r_num}, //보낼 데이터
			    success: function(data) {
			        if(data==1){
			        	$("#r_numblur").html("이미 가입된 사업자입니다.");
			        	$("#r_numblur").css("color", "red");
			        	cnt++;
			        }else {
						$('#r_numblur').html("사용 가능한 사업자 번호입니다.");
						$('#r_numblur').css("color", "blue");
					}
			    }
			});
		}
		
		var name = $("#company_name").val();
		var nameRule = /^[가-힣a-zA-Z()]{1,7}$/;
		if(name == "" || !nameRule.test(name)){
			$("#nameblur").html("1~7글자 한글,영어(공백 없음)만 입력 가능합니다.");
			$("#nameblur").css("color", "red");
			cnt++;
		}else{
			$("#nameblur").html("사용 가능한 회사명입니다");
			$("#nameblur").css("color", "blue");
		}
		
		var pw = $("#company_pw").val();
		var pwcheck = /^[A-Za-z0-9]{6,20}$/;
		
		if (pw == '' || !pwcheck.test(pw)) {
			$('#pwblur').html("6~20자 영문자 또는 숫자 입력.");
			$('#pwblur').css("color", "red");
			cnt++;
		} else {
			$('#pwblur').html("사용가능한 패스워드입니다.");
			$('#pwblur').css("color", "blue");
		}
		
		var pw2 = $("#company_pw2").val();
		var pw = $("#company_pw").val();
		
		if(pw != '' && pw2 == pw){
			$('#pwblur2').html("패스워드가 일치합니다.");
			$('#pwblur2').css("color", "blue");
		}else{
			$('#pwblur2').html("패스워드를 확인하세요.");
			$('#pwblur2').css("color", "red");
			cnt++;
		}
		
		var tel = $("#company_tel").val();
		var telRule = /^\d{3}-\d{3,4}-\d{4}$/;

		if(!telRule.test(tel)){
			$('#telblur').html("ex) 010-8164-2731 또는 016-593-1929");
			$('#telblur').css("color", "red");
			cnt++;
		}else{
			$('#telblur').html("사용 가능한 번호입니다.");
			$('#telblur').css("color", "blue");
		}
		
		var email = $("#company_email").val();
		var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(email != ""){
			if(!emailRule.test(email)){
				$("#emailblur").html("ex) abcd1234@naver.com")
				$('#emailblur').css("color", "red");
				cnt++;
			}else{
				$("#emailblur").html("사용 가능한 이메일입니다.")
				$('#emailblur').css("color", "blue");
			}
		}
		
		var ceoname = $("#ceo_name").val();
		var ceonameRule = /^[가-힣]{2,5}$/;
		
		if (ceoname == '' || !ceonameRule.test(ceoname)) {
			$('#ceoblur').html(" 2~5글자(공백 없음) 한글만 입력 가능.");
			$('#ceoblur').css("color", "red");
			cnt++;
		} else {
			$('#ceoblur').html("사용가능한 이름입니다.");
			$('#ceoblur').css("color", "blue");
		}

		var type = $("#business_type").val();
		if(type == ""){
			$("#typeblur").html("종목을 선택하세요");
			$("#typeblur").css("color","red");
			cnt++;
		}else{
			$("#typeblur").html("입력 완료.");
			$("#typeblur").css("color","blue");
		}
		
		var bcategory = $("#business_category").val();  
		var bcategoryRule = /^[가-힣]{2,5}$/;
		
		if(!bcategoryRule.test(bcategory)){
			$("#bcategoryblur").html("2~5글자(공백 없음) 한글만 입력 가능.");
			$('#bcategoryblur').css("color", "red");
			cnt++;
		}else{
			$("#bcategoryblur").html("사용 가능한 카테고리입니다.");
			$('#bcategoryblur').css("color", "blue");
		}
		
		
		
		var birth = $("#company_birth").val()
		var birthRule = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
				
		
		var homepage = $("#homepage").val();
		var homepageRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(homepage != ""){
			if(homepage != "" && !homepageRule.test(homepage)){
				$("#homepageblur").html("ex) abcd1234@naver.com");
				$('#homepageblur').css("color", "red");
				cnt++;
			}else{
				$("#homepageblur").html("사용 가능한 이메일입니다.")
				$('#homepageblur').css("color", "blue");
			}
		}
		
		if(cnt > 0){
			alert("조건을 정확히 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	
		function typecheck(selected){
			var type = $("#business_type").val();
			if(type == ""){
				$("#typeblur").html("종목을 선택하세요");
				$("#typeblur").css("color","red");
			}else{
				$("#typeblur").html("입력 완료.");
				$("#typeblur").css("color","blue");
			}		
		}
		
		function salescheck(selected){
			$("#company_sales").val();
		}
</script>
</head>
<body>
<form class="form-horizontal" id="frm" name="frm" method="post" action="CompanyInsertJoin.do" onsubmit="return joincheck()">
<fieldset style="padding: 20px 20px 20px 20px;">

<!-- Form Name -->
<legend align="center">기업 회원가입</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*아이디</label>  
  <div class="col-md-4">
	 <input class="form-control input-md" type="text" id="company_id" name="company_id" required="required" onblur="idcheck()" maxlength="20" placeholder="Enter Your ID">
	 <span class="help-block" id="overlap"></span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*사업자등록번호</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="regist_number" name="regist_number" required="required" onblur="r_numcheck()" maxlength="12" placeholder="Enter Your Company Registration Number">
    <span class="help-block" id="r_numblur"></span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*회사명</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="company_name" name="company_name" required="required" onblur="namecheck()" maxlength="5" placeholder="Enter Your Company Name">
    <span class="help-block" id="nameblur"></span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*비밀번호</label>  
  <div class="col-md-4">
 	 <input class="form-control input-md" type="password" id="company_pw" name="company_pw" required="required" onblur="pwcheck()" maxlength="20" placeholder="Enter Your Password">
 	 <span class="help-block" id="pwblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*비밀번호 확인</label>  
  <div class="col-md-4">
 	 <input class="form-control input-md" type="password" id="company_pw2" name="company_pw2" required="required" onblur="pwcheck2()" maxlength="20" placeholder="Repeat Your Password"><br>
 	 <span class="help-block" id="pwblur2"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*전화번호</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="company_tel" name="company_tel" required="required" onblur="telcheck()" maxlength="13" placeholder="Enter Your Phone">
  	<span class="help-block" id="telblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">이메일</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="company_email" name="company_email" onblur="emailcheck()" maxlength="30" placeholder="Enter Your Email">
  	<span class="help-block" id="emailblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*CEO이름</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="ceo_name" name="ceo_name" required="required" maxlength="5" onblur="ceonamecheck()" placeholder="Enter Company CEO Name">
  	<span class="help-block" id="ceoblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*종목</label>  
  <div class="col-md-4">
  	<!-- <input class="form-control input-md" type="text" id="business_type" name="business_type" required="required" maxlength="15" placeholder="Enter Your Company Code"> -->
  	<select class="form-control input-md" id="business_type" name="business_type" required="required" onchange="typecheck(this.value)">
  		<option value="">종목 선택</option>
  		<c:forEach items="${ typeVo }" var="type">
  		<option value=${ type.code_id }>${ type.code_name }</option>
  		</c:forEach>
  	</select>
  	<span class="help-block" id="typeblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">주소</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="company_addr1" name="company_addr1" maxlength="50" placeholder="Enter Your Company Address">
  	<input class="form-control input-md" type="text" id="company_addr2" name="company_addr2" placeholder="Detail Company Address" maxlength="50">
  	<input class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
  	<input type="hidden" id="company_addr" name="company_addr">
  	<span class="help-block" id=""></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">*카테고리</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="business_category" name="business_category" required="required" onblur="bcategorycheck()" maxlength="5" placeholder="Enter Your Company Category"><br>
  	<span class="help-block" id="bcategoryblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">설립일</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="date" id="company_birth" name="company_birth" onblur="birthcheck()">
  	<span class="help-block" id=""></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">매출액</label>  
  <div class="col-md-4">
  	<!-- <input class="form-control input-md" type="text" id="company_sales" name="company_sales" placeholder="Enter Your Company Sales" maxlength="10"><br> -->
  	<select class="form-control input-md" type="text" id="company_sales" name="company_sales" onchange="salescheck(this.value)">
  		<option value="">매출액 선택</option>
  		<option value="5,000만원 이하">5,000만원 이하</option>  		
  		<option value="5,000만원 ~ 1억">5,000만원 ~ 1억</option>
  		<option value="1억 ~ 5억">1억 ~ 5억</option>
  		<option value="10억이상">10억이상</option>  		
  	</select>
  	<span class="help-block" id="salesblur"></span> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">홈페이지</label>  
  <div class="col-md-4">
  	<input class="form-control input-md" type="text" id="homepage" name="homepage" onblur="homepagecheck()" maxlength="30" placeholder="Enter Your Company Homepage Address"><br>
  	<span class="help-block" id="homepageblur"></span> 
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <input class="btn btn-success" type="submit" value="가입하기">
    <input class="btn btn-success" type="reset"" value="취소">
    <input class="btn btn-success" type="button" value="로그인 홈" onclick="location.href='login.do'">
  </div>
</div>

</fieldset>
</form>
</body>
</html>