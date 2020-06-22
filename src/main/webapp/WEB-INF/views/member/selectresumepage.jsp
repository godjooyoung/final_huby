<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function applyinfoall(cid, eid){
		$("#COMPANY_ID").val(cid);
		$("#EMPLOYMENT_ID").val(eid);
		alert(eid+"번째 공고입니다.");
		$("#frm").attr("action","applyinfoall.do");
		document.frm.submit();
	} 	
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<br><br>
<div align="center">
<hr style="border: solid 10px red;">
<h2>채용공고 상세페이지</h2>
<p>회사명: ${ empMatch.COMPANY_NAME }</p>
<p>공고제목: ${ empMatch.EMPLOYMENT_TITLE }</p>
<p>경력: ${ empMatch.HOPE_CAREER }</p>
<p>학력: ${ empMatch.HOPE_GRADUATE }</p>
<p>채용희망직종: ${ empMatch.HOPE_JOB }</p>
<p>직급/직책: ${ empMatch.HOPE_JOB_POSITION }</p>
<p>근무형태: ${ empMatch.HOPE_WORK_TYPE }</p>
<p>채용공기간: ${ empMatch.EMPLOYMENT_TIME }</p>
<p>근무지역: ${ empMatch.COMPANY_NAME }</p>
<p>우대사항: ${ empMatch.PREFER }</p>
<p>근무내용: ${ empMatch.EMPLOYMENT_CONTENTS }</p>
<p>회사명: ${ empMatch.COMPANY_NAME }</p>
<p>대표명: ${ empMatch.CEO_NAME }</p>
<p>카테고리: ${ empMatch.COMPANY_NAME }</p>
<p>회사종목: ${ empMatch.BUSINESS_TYPE }</p>
<p>매출액: ${ empMatch.COMPANY_SALES }</p>
<p>회사명: ${ empMatch.COMPANY_NAME }</p>
<p>회사홈페이지: ${ empMatch.HOMEPAGE }</p>
<p>회사전화번호: ${ empMatch.COMPANY_TEL }</p>
<p>회사설립일: ${ empMatch.COMPANY_BIRTH }</p>
<p>회사주소: ${ empMatch.COMPANY_ADDR }</p>



<hr style="border: solid 10px red;">
<br>
<button class="btn-primary" type="button" style="height: 50px; size: 50px;" onclick="applyinfoall('${empMatch.COMPANY_ID}','${empMatch.EMPLOYMENT_ID}')">지원하기</button>
</div>
<input type="hidden" id="COMPANY_ID" name="COMPANY_ID">
<input type="hidden" id="EMPLOYMENT_ID" name="EMPLOYMENT_ID">
</form>
</body>
</html>