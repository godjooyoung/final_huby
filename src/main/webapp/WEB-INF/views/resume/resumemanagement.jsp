<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>

.mb-60 {
	margin-bottom: 60px;
}

.services-inner1 {
	border: 2px solid #ff0081;
	margin-left: 35px;
	transition: .3s;
}

.services-inner2 {
	border: 2px solid #f89b00;
	margin-left: 35px;
	transition: .3s;
}

.services-inner3 {
	border: 2px solid #0000cd;
	margin-left: 35px;
	transition: .3s;
}

.our-services-img {
	float: left;
	margin-left: -36px;
	margin-right: 22px;
	margin-top: 0f8a0f;
}

.our-services-text {
	padding-right: 0000a0;
}

.our-services-text {
	overflow: hidden;
	padding: 28px 0 25px;
}

.our-services-text h4 {
	color: #222222;
	font-size: 18px;
	font-weight: 700;
	letter-spacing: 1px;
	margin-bottom: 8px;
	padding-bottom: 10px;
	position: relative;
	text-transform: uppercase;
}

.our-services-text h4::before {
	background: #ec6d48 none repeat scroll 0 0;
	bottom: 0;
	content: "";
	height: 1px;
	position: absolute;
	width: 35px;
}

.our-services-wrapper:hover .services-inner {
	background: #fff none repeat scroll 0 0;
	border: 2px solid transparent;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.2);
}

.our-services-text p {
	margin-bottom: 0;
}

p {
	font-size: 14px;
	font-weight: 400;
	line-height: 26px;
	color: #666;
	margin-bottom: 15px;
}
</style>

<!-- 애니메이션 이력서 삭제 버튼 -->
<style>
body {
  font-size: 16px;
  font-family: 'Helvetica', 'Arial', sans-serif;
  text-align: center;
  background-color: #f8faff;
}

.bubbly-button1 {
  font-family: 'Helvetica', 'Arial', sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 100px;
  margin-bottom: 60px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #ff0081;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.5);
}
.bubbly-button1:focus {
  outline: 0;
}
.bubbly-button1:before, .bubbly-button1:after {
  position: absolute;
  content: '';
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-button1:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 20%, #ff0081 20%, transparent 30%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-button1:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-button1:active {
  transform: scale(0.9);
  background-color: #e60074;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}
.bubbly-button1.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-button1.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
</style>
<!-- 애니메이션 이력서 삭제 버튼 끝 -->
<!-- 애니메이션 커리어 삭제 버튼 시작-->
<style>
body {
  font-size: 16px;
  font-family: 'Helvetica', 'Arial', sans-serif;
  text-align: center;
  background-color: #f8faff;
}

.bubbly-button2 {
  font-family: 'Helvetica', 'Arial', sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 30px;
  margin-bottom: 60px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #f89b00;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px rgba(255, 115, 033, 0.5);
}
.bubbly-button2:focus {
  outline: 0;
}
.bubbly-button2:before, .bubbly-button2:after {
  position: absolute;
  content: '';
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-button2:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, transparent 20%, #f89b00 20%, transparent 30%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, transparent 10%, #f89b00 15%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-button2:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, transparent 10%, #f89b00 15%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%), radial-gradient(circle, #f89b00 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-button2:active {
  transform: scale(0.9);
  background-color: #f89b00;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}
.bubbly-button2.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-button2.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
</style>
<!-- 애니메이션 커리어 삭제 버튼 끝-->
<!-- 애니메이션 스킬 삭제 버튼 시작-->
<style>
body {
  font-size: 16px;
  font-family: 'Helvetica', 'Arial', sans-serif;
  text-align: center;
  background-color: #f8faff;
}

.bubbly-button3 {
  font-family: 'Helvetica', 'Arial', sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 30px;
  margin-bottom: 60px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #0000cd;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px rgba(0, 0, 255, 0.5);
}
.bubbly-button3:focus {
  outline: 0;
}
.bubbly-button3:before, .bubbly-button3:after {
  position: absolute;
  content: '';
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-button3:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, transparent 20%, #0000cd 20%, transparent 30%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, transparent 10%, #0000cd 15%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-button3:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, transparent 10%, #0000cd 15%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%), radial-gradient(circle, #0000cd 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-button3:active {
  transform: scale(0.9);
  background-color: #0000cd;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}
.bubbly-button3.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-button3.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
</style>
<!-- 애니메이션 커리어 삭제 버튼 끝-->
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
	
	function checkSKillDelete(){
		var chk = $('input[id="skill_id_check"]').is(':checked');
		
		if(chk==false){
			alert("삭제 할 이력서를 선택해주세요");
		}
		if(chk==true){
			var result = confirm("선택한 스킬을 정말 삭제하시겠습니까?");
			if(result){
				$("#frm2").attr("action", "checkSKillDelete.do");
				document.frm2.submit();
			}
		}
	}
	
	function checkCareerDelete(){
		var chk = $('input[id="career_id_check"]').is(':checked');
		
		if(chk==false){
			alert("삭제 할 이력서를 선택해주세요");
		}
		if(chk==true){
			var result = confirm("선택한 경력을 정말 삭제하시겠습니까?");
			if(result){
				$("#frm3").attr("action", "checkCareerDelete.do");
				document.frm3.submit();
			}
		}
	}
	
	function checkResumeDelete(){
		var chk = $('input[id="resume_id_check"]').is(':checked');
		
		if(chk==false){
			alert("삭제 할 이력서를 선택해주세요");
		}
		
		if(chk==true){
			var result = confirm("이력서를 삭제한다면 현재 이력서로 지원한 지원이력도 삭제 됩니다. 정말 삭제하시겠습니까?");
			if(result){
				$("#frm").attr("action", "checkResumeDelete.do");
				document.frm.submit();
			}
		}
	}
	
	function ajaxSkillUpdateCancle(){
		$("#ajaxSkill2").hide();
		$("[id^=ajaxSkill1]").show();
	}
	
	function ajaxCareerCancle(){
		 $("#ajaxCareer2").hide();
	   	 $("[id^=ajaxCareer1]").show();
	 }
	 
	 function ajaxResumeCancle(){
		$("#ajaxTest2").hide();
		$("[id^=ajaxTest1]").show();
	}
	
	 function resumeView(){
		var resumeCnt = $('input[name="resume_id"]').length-1;

		if(resumeCnt >= 3){
			alert("이력서는 최대 3개까지 등록 가능합니다.");
			return;
		}
		
		var url = "resumePreview.do";
		var preview = window.open(url,"fullscreen", "scrollbars=1");
	}
	 
	 function CareerView(){
		var url = "careerPreview.do";
		var preview = window.open(url,"fullscreen", "scrollbars=1");
	}
	 
	 function skillView(){
		var url = "skillPreview.do";
		var preview = window.open(url,"fullscreen", "scrollbars=1");
	 }
	 
	/* function resumeupdateAjax(e,rid){
		var ajaxresume = $("#ajaxTest2").toggle();
		
		$(e.target).closest(".ajaxResumePage").append(ajaxresume);
		
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
	} */
	
	function resumeupdateAjax(e, rid){
		if($("#ajaxTest2").css("display") == "none"){
			 $("#ajaxTest1"+rid).parent().append($("#ajaxTest2"));
			 $("#ajaxTest2").show();
			 $("#ajaxTest1"+rid).hide();
		 }else{
			 $("[id%=ajaxTest1]").show();
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
		    async : false,
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
		    		$("#resume_title_"+resume_id).html(resume_title);
			    	$("#hope_job_"+resume_id).html(resume_hope_job_name);
			    	$("#hope_salary_"+resume_id).html(resume_hope_salary);
			    	$("#hope_location_"+resume_id).html(resume_hope_location);
			    	$("#final_education_"+resume_id).html(resume_final_education);
			    	$("#select_resume_"+resume_id).html(resume_select_resume);
			    	$("#select_public_"+resume_id).html(resume_select_public);
			    	$("#resume_coment_"+resume_id).html(resume_coment);
			    	$("[id^=ajaxTest1]").show();
		    		$("#ajaxTest2").hide();	
		    		alert("이력서가 수정되었습니다.");
		    	}else{
		    		alert("이력서 수정을 실패하였습니다.");
		    	}
		    	
		    	
		    	
		    	
		    	
		    },
		    error: function (request, status, error){
		    }
		  });
	}

	
	function ajaxSkillUpdatePage(e, sid){
		if($("#ajaxSkill2").css("display") == "none"){
			$("#ajaxSkill1"+sid).parent().append($("#ajaxSkill2"));
			$("#ajaxSkill2").show();
			$("#ajaxSkill1"+sid).hide();
			
			$("#ajaxSkillInsertBtn").hide();
			$("#ajaxSkillSaveBtn").show();
		}else{
			$("[id^=ajaxSkill1]").show();
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
		    async: false,
		    data: {
		    	'skill_id':skill_id,
		    	'skill_name':skill_name,
		    	'skill_level':skill_level
		    },
		    success: function(data){
		    	if(data==1){
		    		alert("스킬관리 수정이 정상적으로 되었습니다.")
		    		$("#skill_id_"+skill_id).html(skill_id);
		    		$("#skill_name_"+skill_id).html(skill_name);
		    		$("#skill_level_"+skill_id).html(skill_level);
		    		$("#skill_level_"+skill_id).css('width', skill_level+'%');
		    		$("[id^=ajaxSkill1]").show();
		    		$("#ajaxSkill2").hide();	
		    		
		    	}else{
		    		alert("스킬수정 처리가 실패하였습니다.")
		    	}
		    	
		    	
	    		
	    		
		    },
		    error: function (request, status, error){
		    }
		  });
	}
	 
	 function ajaxCareerUpdatePage(e,cid){
		 if($("#ajaxCareer2").css("display") == "none"){
			 $("#ajaxCareer1"+cid).parent().append($("#ajaxCareer2"));
			 $("#ajaxCareer2").show();
			 $("#ajaxCareer1"+cid).hide();
		 }else{
			 $("[id%=ajaxCareer1]").show();
			 $("#ajaxCareer2").hide();
		 }
		 
		 $.ajax({
			 url:"ajaxCareerUpdatePage.do",
			 type:"post",
			 dataType:"json",
			 data: {'career_id':cid},
			 success: function(data){
				 $("#company_name").val(data.company_name);
				 $("#start_date").val(data.start_date.substr(0,10));
				 $("#end_date").val(data.end_date.substr(0,10));
				 $("#career_content").val(data.career_content);
				 $("#job").val(data.job);
				 $("#job_position").val(data.job_position);
				 $("#career_id").val(data.career_id);
			 },
			 error:function(request,status,error){
				 
			 }
		 });
	 }
	 
	 function ajaxCareerSave(){
		 var career_id = $("#career_id").val();
		 var start_date = $("#start_date").val();
		 var end_date = $("#end_date").val();
		 var company_name = $("#company_name").val();
		 var career_content = $("#career_content").val();
		 var job_position = $("#job_position").val();
		 var job = $("#job").val();
		 var job_name = $("#job option:checked").text();
		 
		 $.ajax({
			    url: "ajaxCareerUpdate.do",
			    type: "post",
			    dataType: "json",
			    async: false,
			    data: {
			    	'career_id':career_id,
			    	'start_date':start_date,
			    	'end_date':end_date,
			    	'company_name':company_name,
			    	'career_content':career_content,
			    	'job_position':job_position,
			    	'job':job
			    },
			    success: function(data){
			    	if(data==1){
			    		alert("스킬관리 수정이 정상적으로 되었습니다.")
			    		$("#start_date_"+career_id).html(start_date);
			    		$("#end_date_"+career_id).html(end_date);
			    		$("#company_name_"+career_id).html(company_name);
			    		$("#career_content_"+career_id).html(career_content);
			    		$("#job_"+career_id).html(job_name);
			    		$("#job_position_"+career_id).html(job_position);
			    		$("[id^=ajaxCareer1]").show();
			    		$("#ajaxCareer2").hide();	
			    		
			    	}else{
			    		alert("스킬수정 처리가 실패하였습니다.")
			    	}
			    },
			    error: function (request, status, error){
			    }
			  });
		}
</script>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">이력서관리</div>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit">
		</div>

		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="#" onclick="resumeView();">이력서등록</a></li>
			<li class="m2"><a href="#" onclick="CareerView();">커리어등록</a></li>
			<li class="m2"><a href="#" onclick="skillView();">스킬등록</a></li>
		</ul>
	</div>
</div>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 5% auto 5%;">
	<div class="container">
		<!-- 이력서 관리 폼 시작 -->
		<!-- <h2>이력서 관리</h2> -->
		<!-- <button class="btn-primary" type="button" onclick="location.href='resumeinsertpage.do'">이력서등록</button> -->
		<button class="bubbly-button1" type="button" onclick="checkResumeDelete()">이력서 삭제</button>
		<form id="frm" name="frm" method="post">
		<div class="row">
			<c:forEach items="${ rlist }" var="list">
			<fmt:formatDate value="${career.start_date}" pattern="yyyy-MM-dd" var="startDate" />
			<fmt:formatDate value="${career.end_date}" pattern="yyyy-MM-dd" var="endDate" />
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
					<div class="our-services-wrapper mb-60" id="ajaxTest1${ list.resume_id }">
						<div class="services-inner1" >
							<div class="our-services-img">
								<img
									src="https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png"
									width="68px" alt="">
							</div>
							<div class="our-services-text">
								<h4 id="resume_title_${list.resume_id}">${ list.resume_title }<input type="checkbox" id="resume_id_check" name="resume_id" value="${ list.resume_id }"></h4>
								<p id="hope_job_${list.resume_id}">${ list.job_name }</p>
								<p id="hope_salary_${list.resume_id}">${ list.hope_salary }</p>
								<p id="hope_location_${list.resume_id}">${ list.hope_location }</p>
								<p id="final_education_${list.resume_id}">${ list.final_education  }</p>
								<p id="resume_coment_${list.resume_id}">${ list.resume_coment  }</p>
							</div>
							<%-- <button type="button" class="btn-primary" onclick="resumedelete(${ list.resume_id })">이력서 삭제</button> --%>
							<button type="button" class="btn-primary" style="background: #ff0081" onclick="resumeupdateAjax(window.event,${ list.resume_id })">이력서 수정</button><br>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</form>
		<!-- 이력서 관리 폼 끝 -->
		
		
		<!-- 이력서 수정 폼 시작 -->
		<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12" >
					<div class="our-services-wrapper mb-60" id="ajaxTest2" style="display: none;">
						<div class="services-inner">
							<div class="our-services-img">
								<img src="https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png" width="68px" alt="">
							</div>
							<div class="our-services-text">
								<h4>제목</h4>
								<input type="text" class="form-control input-md" id="resume_title" value="text">
								<p>	희망직무<select class="form-control input-md" id="resume_hope_job">
									<option value="">종목 선택</option>
									<c:forEach items="${ codeList }" var="clist">
										<option value="${ clist.code_id }">${ clist.code_name}</option>
									</c:forEach>
								</select></p>
								<p><input type="hidden" id="resume_id" name="resume_id"></p>
								<!-- <p>희망급여<input type="text" id="resume_hope_salary" value="text"></p> -->
								<p>희망급여
								<select class="form-control input-md" id="resume_hope_salary" required="required">
					      			<option value="" disabled selected>선택</option>
									<option value="회사내규">회사 내규에 따름</option>
									<option value="1,400만원">1,400만원 이하</option>
									<option value="1,400~1,600만원">1,400~1,600만 원</option>
									<option value="1,600~1,800만원">1,600~1,800만원</option>
									<option value="1,800~2,000만원">1,800~2,000만원</option>
									<option value="2,000~2,200만원">2,000~2,200만원</option>
									<option value="2,200~2,400만원">2,200~2,400만원</option>
									<option value="2,400~2,600만원">2,400~2,600만원</option>
									<option value="2,600~2,800만원">2,600~2,800만원</option>
									<option value="2,800~3,000만원">2,800~3,000만원</option>
									<option value="3,000~3,200만원">3,000~3,200만원</option>
									<option value="3,200~3,400만원">3,200~3,400만원</option>
									<option value="3,400~3,600만원">3,400~3,600만원</option>
									<option value="3,600~3,800만원">3,600~3,800만원</option>
									<option value="3,800~4,000만원">3,800~4,000만원</option>
									<option value="4,000~5,000만원">4,000~5,000만원</option>
									<option value="5,000~6,000만원">5,000~6,000만원</option>
									<option value="6,000~7,000만원">6,000~7,000만원</option>
									<option value="7,000~8,000만원">7,000~8,000만원</option>
									<option value="8,000~9,000만원">8,000~9,000만원</option>
									<option value="9,000~1억원">9,000~1억원</option>
								</select>
								</p>
								<script>
									$("#resume_hope_salary").val("${param.resume_hope_salary}");
								</script>
								<p>희망지역<select class="form-control input-md" id="resume_hope_location">
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
									  	</select></p>
									<p>최종학력</p>
									<select class="form-control input-md" id="resume_final_education" name="resume_final_education" required="required">
								  		<option value="">학력 선택</option>
						  				<option value="학력무관"> 학력무관</option>
						  				<option value="고등학교졸업"> 고등학교졸업 이상</option>
						  				<option value="대학졸업"> 대학졸업(2,3년) 이상</option>
						  				<option value="대학교졸업"> 대학교졸업(4년) 이상</option>
						  				<option value="석사졸업"> 석사졸업 이상</option>
						  				<option value="박사졸업"> 박사졸업 이상</option>
								  	</select>
								  	<script>
										$("#resume_final_education").val("${param.resume_final_education}");
									</script>
									<!-- <input type="text" class="form-control input-md" id="resume_final_education" value="text"> -->
									<p>한마디</p>
									<input type="text" class="form-control input-md" id="resume_coment" value="text">
									<button type="button" class="btn-primary" onclick="ajaxResumeUpdate()" style="background-color: #ff0081">수정하기</button>
									<button type="button" class="btn-primary" id="ajaxResumeCancleBtn" onclick="ajaxResumeCancle()" style="background: #ff0081">취소</button>
							</div>
						</div>
					</div>
				</div>
		</div>
		<!-- 이력서 수정 폼 끝 -->
		
		<!-- 커리어 관리 폼 시작 -->
		<!-- <h2>커리어 관리</h2> -->
		<!-- <button class="btn-primary" type="button" onclick="location.href='careerInsertPage.do'">커리어 등록</button> -->
		<button class="bubbly-button2" type="button" onclick="checkCareerDelete()">커리어 삭제</button>
		<form id="frm3" name="frm3" method="post">
		<div class="row">
			<c:forEach items="${ clist }" var="career">
			<fmt:formatDate value="${career.start_date}" pattern="yyyy-MM-dd" var="startDate" />
			<fmt:formatDate value="${career.end_date}" pattern="yyyy-MM-dd" var="endDate" />
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
					<div class="our-services-wrapper mb-60" id="ajaxCareer1${ career.career_id }">
						<div class="services-inner2">
							<div class="our-services-img">
								<img
									src="https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png" width="68px" alt="">
							</div>
							<div class="our-services-text">
								<h4 id="career_name_${ career.career_id }">${ career.company_name }<input type="checkbox" id="career_id_check" name="career_id" value="${ career.career_id }"></h4>
								<p id="start_date_${ career.career_id }">${ startDate }</p>
								<p id="end_date_${ career.career_id }">${ endDate  }</p>
								<p id="career_content_${ career.career_id }">${ career.career_content}</p>
								<p id="job_${ career.career_id }">${ career.job_name  }</p>
								<p id="job_position_${ career.career_id }">${ career.job_position  }</p>
							</div>
							<%-- <button type="button" class="btn-primary" onclick="careerDelete(${ career.career_id })">커리어 삭제</button> --%>
							<button type="button" class="btn-primary" style="background: #f89b00" onclick="ajaxCareerUpdatePage(window.event, ${career.career_id})">커리어 수정</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</form>
		<!-- 커리어 관리 폼 끝 -->
		
		
		<!-- 커리어 수정 폼 시작 -->
		<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12" >
					<div class="our-services-wrapper mb-60" style="display: none;" id="ajaxCareer2">
						<div class="services-inner">
							<div class="our-services-img">
								<img src="https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png" width="68px" alt="">
							</div>
							<div class="our-services-text">
								<p><input id="career_id" type="hidden"></p>
								<p>시작시간</p>
								<input class="form-control input-md" id="start_date" type="date">
								<p>종료기간</p>
								<input class="form-control input-md" id="end_date" type="date">
								<p>회사명</p>
								<input class="form-control input-md" id="company_name" type="text">
								<p>내용</p>
								<input class="form-control input-md" id="career_content" type="text">
								<p>직무:<select class="form-control input-md" id="job">
									<option value="">종목 선택</option>
									<c:forEach items="${ codeList }" var="clist">
										<option value="${ clist.code_id }">${ clist.code_name}</option>
									</c:forEach>
								</select></p>
								<script>
									$("#job").val("${param.job}");
								</script>
								<p>직급</p>
								<select class="form-control input-md" id="job_position" required="required">
					  				<option value="" disabled selected>선택</option>
					  				<option value="사원">사원급</option>
					  				<option value="대리">대리급</option>
					  				<option value="과장">과장급</option>
					  				<option value="차장">차장급</option>
					  				<option value="팀장">팀장급</option>
								</select>
								<script>
									$("#job_position").val("${param.job_position}");
								</script>
							</div>
							<button type="button" class="btn-primary" id="ajaxCareerSaveBtn" onclick="ajaxCareerSave()" style="background-color: #f89b00">수정하기</button>
							<button type="button" class="btn-primary" id="ajaxCareerCancleBtn" onclick="ajaxCareerCancle()" style="background-color: #f89b00">취소</button>
						</div>
					</div>
				</div>
		</div>
		<!-- 커리어 수정 폼 끝 -->
		
		
		<!-- 스킬관리  폼 시작 -->
		<!-- <h2>스킬 관리</h2> -->
		<!-- <button class="btn-primary" type="button" onclick="skillInsertPage()">스킬 등록</button> -->
		<button class="bubbly-button3" type="button" onclick="checkSKillDelete()">스킬 삭제</button><br><br>
		<form id="frm2" name="frm2" method="post">
		<div class="row">
			<c:forEach items="${ slist }" var="skill">
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12" >
					<div class="our-services-wrapper mb-60" id="ajaxSkill1${ skill.SKILL_ID }">
						<div class="services-inner3">
							<div class="our-services-img">
								<img
									src="https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png"
									width="68px" alt="">
							</div>
							<div class="our-services-text">
								<h4 id="skill_name_${ skill.SKILL_ID }">${ skill.SKILL_NAME }<input type="checkbox" id="skill_id_check" name="skill_id" value="${ skill.SKILL_ID }"></h4>
								<%-- <p id="skill_level_${ skill.SKILL_ID }">${ skill.SKILL_LEVEL }</p> --%>
								<p id="skill_level_${ skill.SKILL_ID }" class='w3-blue w3-center w3-round-large w3-tiny' style='width:${ skill.SKILL_LEVEL }%'>
									${ skill.SKILL_LEVEL } lv
								</p>
							</div>
							<%-- <button type="button" class="btn-primary" onclick="skillDelete(${ skill.SKILL_ID })">스킬 삭제</button> --%>
							<button type="button" class="btn-primary" style="background: #0000cd" onclick="ajaxSkillUpdatePage(window.event, ${ skill.SKILL_ID })">스킬 수정</button>
						</div>
					</div>
				</div>
			<!-- <input type="hidden" id="sid" name="skill_id"> -->
			</c:forEach>
		</div>
		</form>
		<!-- 스킬관리  폼 끝 -->
		
		
		<!-- 수정 폼 시작 -->
					<div class="our-services-wrapper mb-60" style="display: none;" id="ajaxSkill2">
						<div class="services-inner">
							<div class="our-services-img">
								<img
									src="https://www.orioninfosolutions.com/assets/img/icon/Agricultural-activities.png"
									width="68px" alt="">
							</div>
							<div class="our-services-text">
								<!-- <p>스킬번호:<input id="skill_id" type="text" readonly="readonly"></p> -->
								<p><input id="skill_id" type="hidden"></p>
								<p>스킬명</p>
								<input class="form-control input-md" id="skill_name" type="text">
								<p>스킬레벨:<select class="form-control input-md" id="skill_level" name="skill_level" required="required" onchange="typecheck(this.value)">
									  		<option value="10">10</option>
									  		<option value="20">20</option>
									  		<option value="30">30</option>
									  		<option value="40">40</option>
									  		<option value="50">50</option>
									  		<option value="60">60</option>
									  		<option value="70">70</option>
									  		<option value="80">80</option>
									  		<option value="90">90</option>
									  		<option value="100">100</option>
									  	</select></p>
									  	<script>
											$("#skill_level").val("${param.skill_level}");
										</script>
							</div>
							<button type="button" class="btn-primary" id="ajaxSkillSaveBtn" onclick="ajaxSkillUpdate()" style="background-color: #0000cd">수정하기</button>
							<button type="button" class="btn-primary" id="ajaxSkillCancleBtn" onclick="ajaxSkillUpdateCancle()" style="background-color: #0000cd">취소</button>
							<button type="button" class="btn-primary" id="ajaxSkillInsertBtn" onclick="ajaxSkillInsert()" style="display: none;">등록하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 수정폼 끝 -->
<!-- 애니메이션 이력서 삭제 버튼 시작-->
<script>
var animateButton = function(e) {

	  e.preventDefault;
	  //reset animation
	  e.target.classList.remove('animate');
	  
	  e.target.classList.add('animate');
	  setTimeout(function(){
	    e.target.classList.remove('animate');
	  },700);
	};

	var bubblyButtons = document.getElementsByClassName("bubbly-button1");

	for (var i = 0; i < bubblyButtons.length; i++) {
	  bubblyButtons[i].addEventListener('click', animateButton, false);
	}
</script>
<!-- 애니메이션 이력서 삭제 버튼 끝-->
<!-- 애니메이션 경력 삭제 버튼 시작-->
<script>
var animateButton = function(e) {

	  e.preventDefault;
	  //reset animation
	  e.target.classList.remove('animate');
	  
	  e.target.classList.add('animate');
	  setTimeout(function(){
	    e.target.classList.remove('animate');
	  },700);
	};

	var bubblyButtons = document.getElementsByClassName("bubbly-button2");

	for (var i = 0; i < bubblyButtons.length; i++) {
	  bubblyButtons[i].addEventListener('click', animateButton, false);
	}
</script>
<!-- 애니메이션 경력 삭제 버튼 시작-->
<!-- 애니메이션 스킬 삭제 버튼 시작-->
<script>
var animateButton = function(e) {

	  e.preventDefault;
	  //reset animation
	  e.target.classList.remove('animate');
	  
	  e.target.classList.add('animate');
	  setTimeout(function(){
	    e.target.classList.remove('animate');
	  },700);
	};

	var bubblyButtons = document.getElementsByClassName("bubbly-button3");

	for (var i = 0; i < bubblyButtons.length; i++) {
	  bubblyButtons[i].addEventListener('click', animateButton, false);
	}
</script>
<!-- 애니메이션 스킬 삭제 버튼 시작-->