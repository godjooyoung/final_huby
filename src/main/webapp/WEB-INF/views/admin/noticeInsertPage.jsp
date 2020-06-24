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
	
	function noticeInsert(){
		$("#frm").attr("action","noticeInsert.do");
		document.frm.submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
<h1>공지글 등록</h1>
<table>
<tr>
<th>제목</th>
<td><input type="text" id="notice_title" name="notice_title" style="width: 500px" required="required"></td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="30" cols="70" id="notice_contents" name="notice_contents" required="required"></textarea></td>
</tr>
</table>
<br>
<button type="button" class="btn-primary" onclick="noticeInsert()">등록하기</button>
<button type="reset" class="btn-primary">취소</button>
<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
</div>
<br>
</form>
</body>
</html>