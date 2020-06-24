<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	button { width: 100px; height: 50px}
</style>
<script>
	function back(){
		history.back();
	}
	
	function careerInsert(){
		$("#frm").attr("action","careerInsert.do");
		document.frm.submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
<h1>커리어 등록</h1>
<table>
<tr>
<th>시작기간</th>
<td><input type="date" id="start_date" name="start_date" required="required"></td>
</tr>
<tr>
<th>종료기간</th>
<td><input type="date" id="end_date" name="end_date" required="required"></td>
</tr>
<tr>
<th>회사명</th>
<td><input type="text" id="company_name" name="company_name"></td>
</tr>
<tr>
<th>업무내용</th>
<td><input type="text" id="career_content" name="career_content"></td>
</tr>
<tr>
<th>업무직종</th>
<td>
<select class="form-control input-md" id="job" name="job" required="required" onchange="typecheck(this.value)">
  		<option value="">종목 선택</option>
  		<c:forEach items="${ typeVo }" var="type">
  		<option value=${ type.code_id }>${ type.code_name }</option>
  		</c:forEach>
  	</select>
<!-- <input type="text" id="job" name="job"> -->
</td>
</tr>
<tr>
<th>업무직책</th>
<td><input type="text" id="job_position" name="job_position"></td>
</tr>
</table>
<br>
<button type="button" class="btn-primary" onclick="careerInsert()">등록하기</button>
<button type="reset" class="btn-primary">취소</button>
<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
</div>
<br>
</form>
</body>
</html>