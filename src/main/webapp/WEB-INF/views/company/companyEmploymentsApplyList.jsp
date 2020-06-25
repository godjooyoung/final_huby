<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 공고목록과 그 공고에 지원한 지원자 목록이 뜬다. -->
<h1>POSTED EMPLOYMENTS</h1>
<span>
	<b> 
		공고제목을 눌러 지원자를 확인하세요.
	</b>
</span>
<br>
<!-- 제목 -->
<!-- 공고목록 -->
<div class="accordion-box">
	<c:forEach var="employment" items="${employmentList }">
  		<div id="accordion${employment.EMPLOYMENT_ID}">
    		<div class="card">
      			<div class="card-header">
        			<p class="card-link" 
        			onclick="go_applymen_list_page(event,${employment.EMPLOYMENT_ID})">
          				${employment.EMPLOYMENT_TITLE}
        			</p>
        			<span>${employment.EMPLOYMENT_TIME}</span>
        			<p>지원자 수 <span class="w3-badge w3-green">${employment.APPLYCNT}</span></p>
      			</div>
      			
      			<div id="div${employment.EMPLOYMENT_ID}" name="listBody" style="display:none">${employment.EMPLOYMENT_ID}</div>
    		
    		</div>
  		</div>
	</c:forEach>
</div>
<form id="applyIdfrm" name="applyIdfrm" action="companyEmploymentsApply.do">
	<input type="hidden" id ="applyIdInput"  name ="applyIdInput" value="">
</form>
<script>
function go_applymen_list_page(e, eid){
	var emp_id = eid;
	document.getElementById("applyIdInput").value=eid;
	document.applyIdfrm.action = "companyEmploymentsApply.do";
	document.applyIdfrm.method = "post";
	document.applyIdfrm.submit();
	
}; // END OF GO_APPLYMEN_LIST_PAGE

function showPeson(id){
		var apply_id = id.getAttribute( 'id' );
		alert(apply_id);
		document.getElementById("applyIdInput").value=apply_id;
		  document.applyIdfrm.action = "companyApplyMember.do";
		  document.applyIdfrm.method = "post";
		  document.applyIdfrm.submit();
};
</script>


