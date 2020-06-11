<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function companyinsertgo(){
		$("#frm").attr("action","CompanyInsertJoin.do");
		$("#frm").submit();
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
                	frm.company_addr.value = roadAddr;
                } else {
                	frm.company_addr.value = data.jibunAddress;
                }
            }
        }).open();
    }
</script>
</head>
<body>
<h1>기업 회원가입</h1>
<form id="frm" name="frm" method="post">
회사아이디:<input type="text" id="company_id" name="company_id" width="300px"><br>
사업자등록번호:<input type="text" id="regist_number" name="regist_number" width="300px"><br>
회사명:<input type="text" id="company_name" name="company_name" width="300px"><br>
회사비밀번호:<input type="password" id="company_pw" name="company_pw" width="300px"><br>
회사전화번호:<input type="text" id="company_tel" name="company_tel" width="300px"><br>
회사이메일:<input type="text" id="company_email" name="company_email" width="300px"><br>
CEO명:<input type="text" id="ceo_name" name="ceo_name" width="300px"><br>
종목:<input type="text" id="business_type" name="business_type" width="300px"><br>
회사주소:<input type="text" id="company_addr" name="company_addr" width="300px"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
카테고리:<input type="text" id="business_category" name="business_category" width="300px"><br>
회사설립일:<input type="date" id="company_birth" name="company_birth" width="300px"><br>
회사매출액:<input type="text" id="company_sales" name="company_sales" width="300px"><br>
회사홈페이지:<input type="text" id="homepage" name="homepage" width="300px"><br>
<button type="button" onclick="companyinsertgo()">전송</button>
</form>
</body>
</html>