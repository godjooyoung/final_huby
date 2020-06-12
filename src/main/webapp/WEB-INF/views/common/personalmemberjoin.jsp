<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function MemberInsertJoin(){
		$("#frm").attr("action","MemberInsertJoin.do");
		$("#frm").submit();
	}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.error { color: red }
</style>
<script>
	function idCheck(){
		$.ajax({
		    url:'/idCheck.do', //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post, put 등)
		    data:{'member_id':'member_id'}, //보낼 데이터
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		    }
		});
	}
</script>
<script>
<!-- 정규식 검사 시작 -->
	function joincheck(){
		<!-- 오류 갯수 파악을 위한 cnt 값 -->
		var cnt = 0;
		
		<!-- id 검사 -->
		var id = document.getElementById("member_id");
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
        if( !idReg.test( $("input[name=member_id]").val() ) ) {
            /* alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다."); */
            $("#idcheck").html("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
            cnt++;
        }
        
        <!-- pw 검사 -->
        var pw = $("#member_pw").val();
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if(pw.length < 8 || pw.length > 20){
	         /* alert("8자리 ~ 20자리 이내로 입력해주세요."); */
	         $("#pwcheck").html("8자리 ~ 20자리 이내로 입력해주세요.")
        	 cnt++;
        }
        if(pw.search(/\s/) != -1){
	         /* alert("비밀번호는 공백 없이 입력해주세요."); */
	         $("#pwcheck").html("비밀번호는 공백 없이 입력해주세요.")
	         cnt++;
        }
        if(num < 0 || eng < 0){
	         /* alert("영문,숫자를 혼합하여 입력해주세요."); */
	         $("#pwcheck").html("영문,숫자를 혼합하여 입력해주세요.")
	         cnt++;
        }
        
        <!-- name 검사 -->
        var name = document.getElementById("member_name");
        var hangleRule= /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        if(!hangleRule.test($("input[id=member_name]").val())){
			$("#namecheck").html("한글만 입력하세요");
			cnt++;
        }
        if(name.length > 15){
        	$("#namecheck").html("한글 4자리 이하로 입력하세요");
        	cnt++;
        }
		
        <!-- phone 검사 -->
	    var phone = document.getElementById("member_tel");
		var phoneRule = /^\d{3}-\d{4}-\d{4}$/;
		if(!phoneRule.test($("input[id='member_tel']").val())){
			/* alert("ex) 010-1234-1234"); */
			$("#telcheck").html("폰번호 형식: 010-9931-1351");
			cnt++;
		}
		
		<!-- email 검사 -->
		var email = document.getElementById("member_email");
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
		if(!emailRule.test($("input[id='member_email']").val())){
			/* alert("이메일 형식: address@email.com") */
			$("#emailcheck").html("이메일 형식: address@email.com")
			cnt++;
		}
		
		<!-- 정규식 위배 된 개수 검사 -->
		if(cnt==0){
			return true;
		}else{
			return false;
		}
	}
</script>
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
                	frm.member_addr.value = roadAddr;
                } else {
                	frm.member_addr.value = data.jibunAddress;
                }
            }
        }).open();
    }
</script>
</head>
<body>
<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="MemberInsertJoin.do" onsubmit="return joincheck()">
<h1>개인 회원가입</h1><br>
아이디:<input type="text" id="member_id" name="member_id" width="200px" required="required"><button type="button" onclick="idCheck()">아이디 중복체크</button><br>
<div class="error" id="idcheck" name="idcheck"></div>
비번:<input type="password" id="member_pw" name="member_pw" width="200px" required="required"><br>
<div class="error" id="pwcheck" name="pwcheck"></div>
이름:<input type="text" id="member_name" name="member_name" width="200px" required="required"><br>
<div class="error" id="namecheck" name="namecheck"></div>
생일:<input type="date" id="member_birth" name="member_birth" width="200px" required="required"><br>
주소:<input type="text" id="member_addr" name="member_addr" width="200px"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
번호:<input type="text" id="member_tel" name="member_tel" width="200px" required="required"><br>
<div class="error" id="telcheck" name="telcheck"></div>
이메일:<input type="text" id="member_email" name="member_email" width="200px" required="required"><br>
<div class="error" id="emailcheck" name="emailcheck"></div>
성별:<input type="radio" id="member_gender" name="member_gender" width="200px" value="M" checked required="required">남
	<input type="radio" id="member_gender" name="member_gender" width="200px" value="W" required="required">여
<br>
프로필사진:<input type="file" id="member_photo" name="uploadFile" width="200px" required="required"><br>

<!-- <input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span> -->

<input type="submit" value="가입하기">
<!-- <button type="button" onclick="MemberInsertJoin()">전송</button> -->
</form>
</body>
</html>