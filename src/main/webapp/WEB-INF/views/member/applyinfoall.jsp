<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
	h2 { background-color: lightgray; }
	button { width: 100px; height: 50px;}
</style>
<script>
	function back(){
		history.back();
	}
	
	function view(){
		var url = "applypreview.do";
		var preview = window.open(url,"fullscreen", "scrollbars=1"); //풀스크린 방식
	}
	
	function applyInsert(){
		$("#frm").attr("action","applyInsert.do");
		document.frm.submit();
	}
</script>
<body>
<form id="frm" name="frm" method="post">
	<br>
	<br>
	<br>
	
	
	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row-padding">
			<!-- Left Column -->
			<div id="checkvideo" class="w3-third">
				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
					<c:if test="${ not empty vlist[0].VIDEO_IMG }">
						<img src="${pageContext.request.contextPath}/resources/img/common/${vlist[0].VIDEO_IMG }" style="width: 100%" alt="Avatar">
					</c:if>
					<c:if test="${ empty vlist[0].VIDEO_IMG }">
						<img src="${pageContext.request.contextPath}/resources/img/employment01.JPG" style="width: 100%" alt="Avatar">
					</c:if>
						<p id="v_content">${video.VIDEO_CONTENTS}</p>
						<div class="w3-display-bottomleft w3-container w3-text-black">
							<h2>${member.member_name}</h2>
						</div>
					</div>
					<div class="w3-container">
						<p id="v_hashtag">${video.HASHTAG}</p>
						<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_name}</p>
						<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_addr}</p>
						<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_email}</p>
						<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_gender}</p>
						<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_tel}</p>
						<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_birth}</p>
						<hr>
					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">
			<div>
				<div id="checkresume" class="w3-container w3-card w3-white w3-margin-bottom">
				
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>이력서
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>제목</b>
						</h5>
						<p id="r_title">${rlist[0].RESUME_TITLE}</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망직무</b>
						</h5>
						<p id="r_hope">${rlist[0].HOPE_JOB}</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망연봉</b>
						</h5>
						<p id="r_salary">${rlist[0].HOPE_SALARY}</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망지역</b>
						</h5>
						<p id="r_location">${rlist[0].HOPE_LOCATION}</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>최종학력</b>
						</h5>
						<%-- <h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.hope_location}
						</h6> --%>
						<p id="r_education">${rlist[0].FINAL_EDUCATION}</p>
						<hr>
					</div>
				</div>

				<div class="w3-container w3-card w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>한마디
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<!-- <b>소개</b> -->
						</h5>
						<h6 class="w3-text-teal">
							<%-- <i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.resume_coment} --%>
						</h6>
						<p id="r_coment">${rlist[0].FINAL_COMENTS}</p>
						<hr>
					</div>

				</div>
			</div>
				<div class="w3-container w3-card w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>스킬
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<!-- <b>소개</b> -->
						</h5>
						<h6 class="w3-text-teal">
							<%-- <i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.resume_coment} --%>
						</h6>
						<c:forEach items="${ slist }" var="skill">
						<p>${ skill.SKILL_NAME } | ${ skill.SKILL_LEVEL }</p>
						</c:forEach>
						<hr>
					</div>


				</div>
				<div class="w3-container w3-card w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>습관
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<!-- <b>소개</b> -->
						</h5>
						<h6 class="w3-text-teal">
							<%-- <i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.resume_coment} --%>
						</h6>
						<c:forEach items="${ hlist }" var="habit">
						<p>${ habit.HABIT_NAME} | ${habit.HABIT_START_DATE } | ${ habit.HABIT_COUNT }</p>
						</c:forEach>
						<hr>
					</div>


				</div>
				<div class="w3-container w3-card w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>커리어
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<!-- <b>소개</b> -->
						</h5>
						<h6 class="w3-text-teal">
							<%-- <i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.resume_coment} --%>
						</h6>
						<c:forEach items="${ clist }" var="career">
						<p>${ career.COMPANY_NAME } | ${ career.CAREER_CONTENT } | { career.JOB } | ${ career.JOB_POSITION } | ${ career.START_DATE } | ${ career.END_DATE }</p>
						</c:forEach>
						<hr>
					</div>
				</div>
				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>
	<div align="center">
		<button type="button" class="btn-primary" onclick="view()">이력서, 동영상 변경</button>
		<button type="button" class="btn-primary" onclick="applyInsert()">지원하기</button>
		<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
	</div>
	<br>
	<input type="hidden" id="employment_id" name="employment_id" value="${ mapvo.EMPLOYMENT_ID }">
	<input type="hidden" id="resume_id" name="resume_id" value="${ rlist[0].RESUME_ID }">
	<input type="hidden" id="video_id" name="video_id" value="${ vlist[0].VIDEO_ID }">
	<input type="hidden" id="member_id" name="member_id" value="${sessionScope.personalVo.member_id}">
</form>
</body>
</html>