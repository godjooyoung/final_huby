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
	
	function skillUpdate(sid){
		$("#sid").val(sid);
		$("#frm").attr("action","skillUpdate.do");
		document.frm.submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
<h1>스킬 수정</h1>
<table>
<tr>
<th>스킬이름</th>
<td><input type="text" id="skill_name" name="skill_name" value="${svo.skill_name}" required="required"></td>
</tr>
<tr>
<th>스킬레벨</th>
<td><input type="text" id="skill_level" name="skill_level" value="${svo.skill_level}"></td>
</tr>
</table>
<br>
<button type="button" class="btn-primary" onclick="skillUpdate(${svo.skill_id})">수정하기</button>
<button type="reset" class="btn-primary">취소</button>
<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
<input type="hidden" id="sid" name="skill_id">
</div>
<br>
</form>
</body>
</html>