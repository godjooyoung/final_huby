<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2><b>공고 </b> : ${title.employment_title} </h2>
${title.employment_contents} <br>
${title.hope_career}<br>
${title.hope_graduate}<br>
${title.hope_job_position}<br>
${title.hope_location}<br>
${title.hope_work_type}<br>
${title.employment_prefer}<br>

<h1>공고 지원자 목록 페이지</h1>
<c:forEach var="applymen" items="${applymenList}">
<h2><b>공고 </b>
${applymen.apply_date}</h2> 
<span>
${applymen.member_name}
<a href="javascript:void(0);" onClick="showPeson(${applymen.apply_id})"><b>${applymen.apply_id}번 지원자</b></a>
<form id="applyfrm${applymen.apply_id}" name="applyfrm" action="" method="">
<input type="hidden" value="" name="applyidInput" id="applyidInput${applymen.apply_id}">
</form>
</span>
</c:forEach>

<script>
function showPeson(id){
	var apply_id = id;
	var inputTagId = "applyidInput"+apply_id;
	var formTagId="applyfrm"+apply_id;
	alert(apply_id);
	document.getElementById(inputTagId).value=apply_id;
	  document.getElementById(formTagId).action = "companyApplyMember.do";
	  document.getElementById(formTagId).method = "post";
	  document.getElementById(formTagId).submit();
};
</script>

