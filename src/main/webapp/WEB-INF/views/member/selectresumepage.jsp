<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function applyinfoall(cid, eid){
		$("#COMPANY_ID").val(cid);
		$("#employment_id").val(eid);
		alert(eid+"번째 공고입니다.");
		$("#frm").attr("action","applyinfoall.do");
		document.frm.submit();
	} 	
</script>
<style>
#table {display: table; width: 100%;}
.row {display: table-row;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
.col1 { width: 20%;}
.col2 {width: 20%;}
.col3 {width: 20%;}
.col4 {width: 20%;}
.layout { float: left; }
.fl { width:68%; height: 300px; background-color: white;}
span#middle1{
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
	color: black;
	font-size: larger;
	}
</style>
</head>
<body>
<form id="frm" name="frm" method="post">
<br><br><br>
<h1 align="center"> < 채용 공고 > </h1>
<h3 style="margin-left: 100px;">${ empMatch.COMPANY_NAME }</h3>
<h2 style="margin-left: 130px;">${ empMatch.EMPLOYMENT_TITLE }</h2>
<div id="table" align="center">
<div class="row">
<span class="cell col1"></span>
<span class="cell col2"></span>
<span class="cell col3"></span>
<span class="cell col4"></span>
</div>
<div class="row">
<span class="cell col1" style="background: lightgray; font-weight: bolder;">경력</span>
<span class="cell col2" style="background: lightgray; font-weight: bolder;">학력</span>
<span class="cell col3" style="background: lightgray; font-weight: bolder;">근무형태</span>
<span class="cell col4" style="background: lightgray; font-weight: bolder;">채용희망직종</span>
</div>
<div class="row">
<span id="middle1" class="cell col1" style="height: 100px">${ empMatch.HOPE_CAREER }</span>
<span class="cell col2">${ empMatch.HOPE_GRADUATE }</span>
<span class="cell col3">${ empMatch.HOPE_WORK_TYPE }</span>
<span class="cell col4">${ empMatch.HOPE_JOB }</span>
</div>
<div class="row">
<span class="cell col1" style="background: lightgray; font-weight: bolder;">직급/직책</span>
<span class="cell col2" style="background: lightgray; font-weight: bolder;">근무지역</span>
<span class="cell col3" style="background: lightgray; font-weight: bolder;">근무내용</span>
<span class="cell col4" style="background: lightgray; font-weight: bolder;">채용공개기간</span>
</div>
<div class="row">
<span id="middle1"  class="cell col1" style="height: 100px">${ empMatch.HOPE_JOB_POSITION }</span>
<span class="cell col2">${ empMatch.COMPANY_NAME }</span>
<span class="cell col3">${ empMatch.EMPLOYMENT_CONTENTS }</span>
<span class="cell col4">${ empMatch.EMPLOYMENT_TIME }</span>
</div>
<div class="row">
<span class="cell col1" style="background: lightgray; font-weight: bolder;">우대사항</span>
<span class="cell col2" style="background: lightgray; font-weight: bolder;">카테고리</span>
<span class="cell col3" style="background: lightgray; font-weight: bolder;">회사종목</span>
<span class="cell col4" style="background: lightgray; font-weight: bolder;">매출액</span>
</div>
<div class="row">
<span id="middle1" class="cell col1" style="height: 100px">${ empMatch.EMPLOYMENT_PREFER }</span>
<span class="cell col2">${ empMatch.COMPANY_NAME }</span>
<span class="cell col3">${ empMatch.BUSINESS_TYPE }</span>
<span class="cell col4">${ empMatch.COMPANY_SALES }</span>
</div>
<div class="row">
<span class="cell col1" style="background: lightgray; font-weight: bolder;">회사홈페이지</span>
<span class="cell col2" style="background: lightgray; font-weight: bolder;">회사전화번호</span>
<span class="cell col3" style="background: lightgray; font-weight: bolder;">회사설립일</span>
<span class="cell col4" style="background: lightgray; font-weight: bolder;">회사주소</span>
</div>
<div class="row">
<span id="middle1" class="cell col1" style="height: 100px">${ empMatch.HOMEPAGE }</span>
<span class="cell col2" >${ empMatch.COMPANY_TEL }</span>
<span class="cell col3">${ empMatch.COMPANY_BIRTH }</span>
<span class="cell col4">${ empMatch.COMPANY_ADDR }</span>
</div>

<br><br>
<h5>마감상태 ${ empMatch.COMPLETE }</h5>

<hr style="border: solid 10px red;">
<br>
<c:set var="complete_state" value="${ empMatch.COMPLETE }" />
<c:choose>
<c:when  test="${complete_state == 'N'}">
<div align="center"> 
<button class="btn btn-primary" type="button" style="height: 50px; size: 50px;" onclick="applyinfoall('${empMatch.COMPANY_ID}','${empMatch.employment_id}')">지원하기</button>
</div>
<div></div>
</c:when>
<c:when test="${complete_state == 'Y'}">
<div align="center">  
<button class="btn btn-secondary" type="button" style="height: 50px; size: 50px;" onclick="#">마감된 공고입니다.</button>
</div>
</c:when>
</c:choose>

</div>
<input type="hidden" id="COMPANY_ID" name="COMPANY_ID">
<input type="hidden" id="employment_id" name="employment_id">
</form>
</body>
</html>