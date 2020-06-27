<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	function skillInsertPage(){
		$("#frm2").attr("action","skillInsertPage.do");
		document.frm2.submit();
	}
	
	function skillDelete(sid){
		$("#sid").val(sid);
		alert(sid);
		$("#frm2").attr("action","skillDelete.do");
		document.frm2.submit();
	}
	
	function skillUpdatePage(sid){
		$("#sid").val(sid);
		$("#frm2").attr("action","skillUpdatePage.do");
		document.frm2.submit();
	}
	
	function careerDelete(cid){
		$("#cid").val(cid);
		$("#frm3").attr("action","careerDelete.do");
		document.frm3.submit();
	}
	
	function careerUpdatePage(cid){
		$("#cid").val(cid);
		$("#frm3").attr("action","careerUpdatePage.do");
		document.frm3.submit();
	}
	
	function resumeCheckDelete(){
		$("#frm").attr("action", "resumeCheckDelete.do")
		document.frm.submit();
	}
</script>
</head>
<body>
<div align="center">
<button class="btn-primary" type="button" onclick="location.href='resumeinsertpage.do'">이력서등록</button><br>
<button class="btn-primary" type="button" onclick="resumeCheckDelete()">이력서삭제하기</button><br>
</div>
<div align="center">
<h1>이력서 관리</h1>
<form id="frm" name="frm" method="post">
<br>
<table>
<tr>
<c:forEach items="${ rlist }" var="list">
<td>
	<input type="checkbox" id=resumeDelete name="resumeDelete" value=${ list.resume_id }>
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
<br>


<div align="center">
<button class="btn-primary" type="button" onclick="skillInsertPage()">스킬 등록</button>
</div>
<div align="center">
<h1>스킬 관리</h1>
<form id="frm2" name="frm2" method="post">
<br>
<table>
<tr>
<c:forEach items="${ slist }" var="skill">
<td>
${ skill.SKILL_ID }<br>
${ skill.SKILL_NAME }<br>
${ skill.SKILL_LEVEL }<br>
<button type="button" class="btn-primary" onclick="skillDelete(${ skill.SKILL_ID })">스킬 삭제</button><br>
<button type="button" class="btn-primary" onclick="skillUpdatePage(${ skill.SKILL_ID })">스킬 수정</button><br>
</td>
</c:forEach>
</tr>
</table>
<input type="hidden" id="sid" name="skill_id">
</form>
</div><br>

<div align="center">
<button class="btn-primary" type="button" onclick="location.href='careerInsertPage.do'">커리어 등록</button>
</div>
<div align="center">
<h1>커리어 관리</h1>
<form id="frm3" name="frm3" method="post">
<br>
<table>
<tr>
<c:forEach items="${ clist }" var="career">
<td>
<fmt:formatDate value="${career.start_date}" pattern="yyyy-MM-dd" var="startDate" />
<fmt:formatDate value="${career.end_date}" pattern="yyyy-MM-dd" var="endDate" />
${ career.career_id }<br>
${ startDate }<br>
${ endDate }<br>
${ career.company_name }<br>
${ career.career_content}<br>
${ career.job_name }<br>
${ career.job_position }<br>
<button type="button" class="btn-primary" onclick="careerDelete(${ career.career_id })">커리어 삭제</button><br>
<button type="button" class="btn-primary" onclick="careerUpdatePage(${ career.career_id })">커리어 수정</button><br>
</td>
</c:forEach>
</tr>
</table>
<input type="hidden" id="cid" name="career_id">
</form>
</div>

</body>
</html>