<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	if ('${num}' == 1) {
		alert("등록되지 않았습니다. 관리자에게 문의하세요.");	
	}
</script>

<form id="frm" name="frm" method="post" action="habitInsert.do">
	<div align="center">
		<h1>습관등록하기</h1>
		습관명: <input type="text" id="habit_name" name="habit_name" required="required"><br> <br> 
		<input type="submit" value="등록하기">
	</div>
</form>