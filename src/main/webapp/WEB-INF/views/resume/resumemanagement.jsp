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
		alert(rid)
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
	
	function resumeupdateAjax(rid){
		
		if($("#ajaxTest2").css("display") == "none") {
			$("#ajaxTest").attr("style", "float:left;");
			$("#ajaxTest2").show();
		}else{
			$("#ajaxTest").attr("style", "");
			$("#ajaxTest2").hide();
		}
		
		$.ajax({
		    url: "resumeUpdateAjax.do",
		    type: "post",
		    dataType: "json",
		    data: {'resume_id' : rid},
		    success: function(data){
		    	$("#resume_id").val(data.resume_id);
		    	$("#resume_title").val(data.resume_title);
		    	$("#resume_hope_job").val(data.hope_job);
		    	$("#resume_hope_salary").val(data.hope_salary);
		    	$("#resume_hope_location").val(data.hope_location);
		    	$("#resume_final_education").val(data.final_education);
		    	$("#resume_select_resume_"+data.select_resume).attr('checked', 'checked');
		    	$("#resume_select_public_"+data.select_public).attr('checked', 'checked');
		    	$("#resume_coment").val(data.resume_coment);
		    },
		    error: function (request, status, error){
		    	
		    }
		  });
	}
	
	function ajaxResumeUpdate(){
		var resume_id = $("#resume_id").val();
		var resume_title = $("#resume_title").val();
		var resume_hope_job = $("#resume_hope_job").val();
		var resume_hope_job_name = $("#resume_hope_job option:checked").text();
		var resume_hope_salary = $("#resume_hope_salary").val();
		var resume_hope_location = $("#resume_hope_location").val();
		var resume_final_education = $("#resume_final_education").val();
		var resume_select_resume = $('input[name="resume_select_resume"]').val();
		var resume_select_public = $('input[name="resume_select_public"]').val();
		var resume_coment = $("#resume_coment").val();
		
		$.ajax({
		    url: "resumeUpdateAjaxGo.do",
		    type: "post",
		    dataType: "json",
		    data: {
		    	'resume_id' : resume_id,
		    	'resume_title' : resume_title,
		    	'hope_job' : resume_hope_job,
		    	'hope_salary' : resume_hope_salary,
		    	'hope_location' : resume_hope_location,
		    	'final_education' : resume_final_education,
		    	'select_resume' : resume_select_resume,
		    	'select_public' : resume_select_public,
		    	'resume_coment' : resume_coment
		    },
		    success: function(data){
		    	if(data==1){
		    		alert("이력서가 수정되었습니다.")
		    	}else{
		    		alert("이력서 수정을 실패하였습니다.")
		    	}
		    	
		    	$("#div_resume_title_"+resume_id).text(resume_title);
		    	$("#div_hope_job_"+resume_id).text(resume_hope_job_name);
		    	$("#div_hope_salary_"+resume_id).text(resume_hope_salary);
		    	$("#div_hope_location_"+resume_id).text(resume_hope_location);
		    	$("#div_final_education_"+resume_id).text(resume_final_education);
		    	$("#div_select_resume_"+resume_id).text(resume_select_resume);
		    	$("#div_select_public_"+resume_id).text(resume_select_public);
		    	$("#div_resume_coment_"+resume_id).text(resume_coment);
		    	
		    	
		    	$("#ajaxTest").attr("style", "");
		    	$("#ajaxTest2").hide();
		    },
		    error: function (request, status, error){
		    }
		  });
	}

	
	function ajaxSkillUpdatePage(sid){
		if($("#ajaxSkill2").css("display") == "none"){
			$("#ajaxSkill1").attr("style","float:left;");
			$("#ajaxSkill2").show();
			$("#ajaxSkillInsertBtn").hide();
			$("#ajaxSkillSaveBtn").show();
		}else{
			$("#ajaxSkill1").attr("style","");
			$("#ajaxSkill2").hide();
		}
		
		$.ajax({
		    url: "ajaxSkillUpdatePage.do",
		    type: "post",
		    dataType: "json",
		    data: {'skill_id':sid},
		    success: function(data){
		    	$("#skill_id").val(data.skill_id);
		    	$("#skill_name").val(data.skill_name);
		    	$("#skill_level").val(data.skill_level);
		    },
		    error: function (request, status, error){
		    }
		  });
	}
	
	 function ajaxSkillUpdate(){
		var skill_id = $("#skill_id").val();
		var skill_name = $("#skill_name").val();
		var skill_level = $("#skill_level").val();
		
		$.ajax({
		    url: "ajaxSkillUpdate.do",
		    type: "post",
		    dataType: "json",
		    data: {
		    	'skill_id':skill_id,
		    	'skill_name':skill_name,
		    	'skill_level':skill_level
		    },
		    success: function(data){
		    	if(data==1){
		    		alert("스킬관리 수정이 정상적으로 되었습니다.")
		    	}else{
		    		alert("스킬수정 처리가 실패하였습니다.")
		    	}
		    	
		    	$("#skill_id_"+skill_id).text(skill_id)
	    		$("#skill_name_"+skill_id).text(skill_name)
	    		$("#skill_level_"+skill_id).text(skill_level)
	    		
	    		$("#ajaxSkill1").attr("style","");
	    		$("#ajaxSkill2").hide();
		    },
		    error: function (request, status, error){
		    }
		  });
	}
	 
	 function ajaxSkillInsertPage(){
		 if($("#ajaxSkill2").css("display") == "none") {
		 		$("#ajaxSkill1").attr("style","float:left;");
		 		$("#ajaxSkill2").show();
		 		$("#skill_id").val("");
		 		$("#skill_name").val("");
		 		$("#skill_level").val("");
		 		$("#ajaxSkillSaveBtn").hide();
		 		$("#ajaxSkillInsertBtn").show();
		 }else{
			 $("#ajaxSkill1").attr("style","");
			 $("#ajaxSkill2").hide();
		 }
	 }
	 
	 function ajaxSkillInsert(){
		 var skill_name = $("#skill_name").val();
		 var skill_level = $("#skill_level").val();
		 
		 $.ajax({
			    url: "ajaxSkillInsert.do",
			    type: "post",
			    dataType: "json",
			    data: {
			    	'skill_name':skill_name,
			    	'skill_level':skill_level
			    },
			    success: function(data){
			    	if(data.result==1){
			    		alert("정상적으로 스킬이 등록 되었습니다.")
			    	}else{
			    		alert("ERROR 스킬이 등록되지 않았습니다.")
			    	}
			    	
			    	var skillId = data.skillId;
			    	
			    	var skillHtml = '';
			    	skillHtml += '<td>';
			    	skillHtml +=	'<div id="skill_id_'+skillId+'">'+skillId+'</div>';
			    	skillHtml +=	'<div id="skill_name_'+skillId+'">'+skill_name+'</div>';
			    	skillHtml +=	'<div id="skill_level_'+skillId+'">'+skill_level+'</div>';
			    	skillHtml +=	'<button type="button" class="btn-primary" onclick="skillDelete('+skillId+')">스킬 삭제</button><br>';
			    	skillHtml +=	'<button type="button" class="btn-primary" onclick="ajaxSkillUpdatePage('+skillId+')">스킬 수정</button><br>';
			    	skillHtml += '</td>';
			    	
			    	$("#tr_skill").append(skillHtml);
			    	
			    	$("#ajaxSkill1").attr("style","");
			    	$("#ajaxSkill2").hide();
			    	
			    },
			    error: function (request, status, error){
			    }
			  });
	 }
</script>
</head>
<body>
<div align="center">
<button class="btn-primary" type="button" onclick="location.href='resumeinsertpage.do'">이력서등록</button><br>
<button class="btn-primary" type="button" onclick="resumeCheckDelete()">이력서삭제하기</button><br>
</div>

<div>
	<div id="ajaxTest" align="center">
	<h1>이력서 관리</h1>
	<form id="frm" name="frm" method="post">
	<br>
	<table>
	<tr>
	<c:forEach items="${ rlist }" var="list">
	<td>
		<input type="checkbox" id=resumeDelete name="resumeDelete" value=${ list.resume_id }>
		<div>${ list.resume_id }</div>
		<div id="div_resume_title_${list.resume_id}">${ list.resume_title }</div>
		<div id="div_hope_job_${list.resume_id}">${ list.job_name }</div>
		<div id="div_hope_salary_${list.resume_id}">${ list.hope_salary }</div>
		<div id="div_hope_location_${list.resume_id}">${ list.hope_location }</div>
		<div id="div_final_education_${list.resume_id}">${ list.final_education }</div>
		<%-- <div id="div_select_resume_${list.resume_id}">${ list.select_resume }</div>
		<div id="div_select_poublic_${list.resume_id}">${ list.select_public }</div> --%>
		<button type="button" class="btn-primary" onclick="resumedelete(${ list.resume_id })">이력서 삭제</button><br>
		<%-- <button type="button" class="btn-primary" onclick="resumeupdate(${ list.resume_id })">이력서 수정</button><br> --%>
		<button type="button" class="btn-primary" onclick="resumeupdateAjax(${ list.resume_id })">이력서 수정</button><br>
	</td>
	</c:forEach>
	</tr>
	</table>
	<input type="hidden" id="rid" name="resume_id">
	</form>
	</div>
	<div id="ajaxTest2" align="center" style="display:none;">
	<h1>이력서 관리</h1>
	<br>
	<table>
	<tr>
	<td>
		번호<input type="text" id="resume_id" value="text" readonly="readonly"><br>
		제목<input type="text" id="resume_title" value="text"><br>
		<!-- 희망직무<input type="text" id="resume_hope_job" value="text"><br> -->
		희망직무<select class="form-control input-md" id="resume_hope_job">
				<option value="">종목 선택</option>
				<c:forEach items="${ codeList }" var="clist">
					<option value="${ clist.code_id }">${ clist.code_name}</option>
				</c:forEach>
			</select>
		희망급여<input type="text" id="resume_hope_salary" value="text"><br>
		희망지역<select class="form-control input-md" id="resume_hope_location">
		  		<option value="">지역 선택</option>
		  		<option value="서울">서울</option>
		  		<option value="인천">인천</option>
		  		<option value="경기">경기</option>
		  		<option value="부산">부산</option>
		  		<option value="대구">대구</option>
		  		<option value="광주">광주</option>
		  		<option value="대전">대전</option>
		  		<option value="울산">울산</option>
		  		<option value="세종">세종</option>
		  		<option value="강원">강원</option>
		  		<option value="경남">경남</option>
		  		<option value="경북">경북</option>
		  		<option value="전남">전남</option>
		  		<option value="전북">전북</option>
		  		<option value="충남">충남</option>
		  		<option value="충북">충북</option>
		  		<option value="제주">제주</option>
		  		<option value="강원.">강원</option>
		  		<option value="전국">전국</option>
		  	</select><br>
		최종학력<input type="text" id="resume_final_education" value="text"><br>
		<!-- 대표설정<input type="radio" id="resume_select_resume_Y" name="resume_select_resume" value="Y">Y
			<input type="radio" id="resume_select_resume_N" name="resume_select_resume" value="N">N
			<br>
		공개여부<input type="radio" id="resume_select_public_Y" name="resume_select_public" value="Y">Y
			<input type="radio" id="resume_select_public_N" name="resume_select_public" value="N">N
		<br> -->
		한마디<input type="text" id="resume_coment" value="text"><br>
		<div align="center">
		<button type="button" class="btn-primary" onclick="ajaxResumeUpdate()">수정하기</button>
		</div>
	</td>
	</tr>
	</table>
	<input type="hidden" id="rid" name="resume_id">
	</div>
</div>
<br>

<div align="center">
<button class="btn-primary" type="button" onclick="skillInsertPage()">스킬 등록</button>
</div>
<!-- 스킬관리 시작 -->
<div align="center" id="ajaxSkill1">
<h1>스킬 관리</h1>
<form id="frm2" name="frm2" method="post">
<br>
<table>
<tr id="tr_skill">
<c:forEach items="${ slist }" var="skill">
<td>
<div id="skill_id_${ skill.SKILL_ID }">${ skill.SKILL_ID }</div>
<div id="skill_name_${ skill.SKILL_ID }">${ skill.SKILL_NAME }</div>
<div id="skill_level_${ skill.SKILL_ID }">${ skill.SKILL_LEVEL }</div>
<button type="button" class="btn-primary" onclick="skillDelete(${ skill.SKILL_ID })">스킬 삭제</button><br>
<%-- <button type="button" class="btn-primary" onclick="skillUpdatePage(${ skill.SKILL_ID })">스킬 수정</button><br> --%>
<button type="button" class="btn-primary" onclick="ajaxSkillUpdatePage(${ skill.SKILL_ID })">스킬 수정</button>
</td>
</c:forEach>
</tr>
</table>
<input type="hidden" id="sid" name="skill_id">
</form>
</div>
<!-- 스킬관리 끝 -->
<!-- 스킬관리 시작 -->
<div align="center" id="ajaxSkill2" style="display:none;">
<h1>스킬 관리</h1>
<br>
<table>
<tr>
<td>
스킬번호:<input id="skill_id" type="text" readonly="readonly"><br>
스킬명:<input id="skill_name" type="text"><br>
스킬레벨:<input id="skill_level" type="text"><br>
<div align="center">
<button type="button" class="btn-primary" id="ajaxSkillSaveBtn" onclick="ajaxSkillUpdate()">저장하기</button>
<button type="button" class="btn-primary" id="ajaxSkillInsertBtn" onclick="ajaxSkillInsert()" style="display: none;">등록하기</button>
</div>
</td>
</tr>
</table>
<input type="hidden" id="sid" name="skill_id">
</div>
<!-- 스킬관리 끝 -->
<br>
<br>
<br>





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