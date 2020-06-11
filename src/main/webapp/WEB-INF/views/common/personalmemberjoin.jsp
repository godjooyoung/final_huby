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
<form id="frm" name="frm" method="post" enctype="multipart/form-data">
<h1>개인 회원가입</h1><br>
아이디:<input type="text" id="member_id" name="member_id" width="200px" ><br>
비번:<input type="password" id="member_pw" name="member_pw" width="200px"><br>
이름:<input type="text" id="member_name" name="member_name" width="200px"><br>
생일:<input type="date" id="member_birth" name="member_birth" width="200px"><br>
주소:<input type="text" id="member_addr" name="member_addr" width="200px"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
번호:<input type="text" id="member_tel" name="member_tel" width="200px"><br>
이메일:<input type="text" id="member_email" name="member_email" width="200px"><br>
성별:<input type="radio" id="member_gender" name="member_gender" width="200px" value="M">남
	<input type="radio" id="member_gender" name="member_gender" width="200px" value="W">여
<br>
프로필사진:<input type="file" id="member_photo" name="uploadFile" width="200px"><br>

<!-- <input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span> -->


<button type="button" onclick="MemberInsertJoin()">전송</button>
</form>
</body>
</html>