<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td{ border: 1px solid black ;
				border-collapse: collapse;
	}
	
</style>
<script>
	function resumedelete(rid){
		$("#rid").val(rid);
		$("#frm").attr("action","resumedelete.do");
		document.frm.submit(); 
	}	
	
	function resumeupdate(rid){
		$("#rid").val(rid);
		$("#frm").attr("action","resumeupdatepage.do");
		document.frm.submit();
	}
</script>
</head>
<body>
<br><br><br><br><br>
<div align="center">
<button class="btn-primary" type="button" onclick="location.href='resumeinsertpage.do'">이력서등록</button>
</div>
<div align="center">
<h1>이력서 관리</h1>
<form id="frm" name="frm" method="post">
<br>
<table>
<tr>
<c:forEach items="${ rlist }" var="list">
<td>
	${ list.resume_id }<br>
	${ list.resume_title }<br>
	${ list.hope_job }<br>
	${ list.hope_salary }<br>
	${ list.hope_location }<br>
	${ list.final_education }<br>
	${ list.select_resume }<br>
	${ list.select_public }<br>
	${ list.resume_coment }<br>
	<button type="button" class="btn-primary" onclick="resumedelete(${ list.resume_id })">이력서 삭제</button><br>
	<button type="button" class="btn-primary" onclick="resumeupdate(${ list.resume_id })">이력서 수정</button><br>
</td>
</c:forEach>
</tr>
</table>
<input type="hidden" id="rid" name="resume_id">
</form>
</div>
</body>
</html>