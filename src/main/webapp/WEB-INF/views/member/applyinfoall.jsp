<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<form id="frm" name="frm" method="post">
<!-- ----------------------------------------------------- -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row-padding">
			<!-- Left Column -->
			<div class="w3-third" id="checkvideo">
				<div class="w3-white w3-text-grey w3-card">
					<div class="w3-display-container">
						<div class='wrap' style='position:relative;'>
							<div class="inner01" style="position:absolute; left:3%; top:3%;">
								<h4 style="align:left; color:white; text-shadow: 2px 2px 5px black; font-weight: bolder; 
						 			padding-top:5px; padding-left:5px;">
						 			<b><u>${vlist[0].MEMBER_NAME}</u> 지원자</b><br>
						 			<p id="v_hashtag">#${vlist[0].JOB_NAME}</p>
								</h4>
							</div>
							<div class="inner02" style="position:absolute; left:5%; top:5%;">
							<br><br>
								<p id="v_content" style="text-align:left;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;
									font-weight: bold;  color:white; text-shadow: 2px 2px 5px black; ">
									${vlist[0].VIDEO_CONTENTS}
								</p>
							</div>
							<div>
								<video id="v_img" width="100%" controls poster="download.do?name=${vlist[0].VIDEO_IMG}" playsinline preload="none">
		 						<source id="v_location" src="download.do?name=${vlist[0].VIDEO_LOCATION }" type="video/mp4">
								</video>
							</div>
							<br>
							<div>
								<p>
									<i class="fas fa-signature w3-margin-right w3-large w3-text-blue"></i>
									${sessionScope.personalVo.member_name}
								</p>
								<p>
								<i class="fas fa-home w3-margin-right w3-large w3-text-blue"></i>
									${sessionScope.personalVo.member_addr}
								</p>
								<p>
									<i class="fas fa-at w3-margin-right w3-large w3-text-blue"></i>
									${sessionScope.personalVo.member_email}
								</p>
								<p>
									<i class="fas fa-phone w3-margin-right w3-large w3-text-blue"></i>
									${sessionScope.personalVo.member_tel}
								</p>
								<p>
									<c:if test="${sessionScope.personalVo.member_gender == 'M'}">
									<i class="fas fa-venus-mars w3-margin-right w3-large w3-text-blue"></i>
									남자</c:if>
									<c:if test="${sessionScope.personalVo.member_gender == 'W'}">
									<i class="fas fa-venus-mars w3-margin-right w3-large w3-text-blue"></i>
									여자</c:if>
								</p>
								<p>
									<i class="fas fa-birthday-cake w3-margin-right w3-large w3-text-blue"></i>
									<fmt:formatDate value="${sessionScope.personalVo.member_birth}" pattern="yyyy-MM-dd" var="member_birth" />
									${member_birth}
								</p>
								
								<hr>
							</div>
					<div align="center">
						<button type="button" class="btn-primary" onclick="view()">이력서, 동영상 변경</button>
						<button type="button" class="btn-primary" onclick="applyInsert()">지원하기</button>
						<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
					</div>
				</div>
				<br>
				<!-- End Left Column -->
			</div>
			</div>
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">	
				<div class="w3-card w3-white w3-margin-bottom" id="checkresume">
					<h2 class="w3-text-grey w3-padding-16"  id="r_title">
						<i class="fas fa-file w3-margin-right w3-xxlarge w3-text-blue" ></i>
						${rlist[0].RESUME_TITLE}
					</h2>
					<div>
						<h5 class="w3-opacity">
							<b>한마디</b>
						</h5>
						<h6 class="w3-text-blue" id="r_coment">
							${rlist[0].FINAL_COMENTS}
							${resume.resume_coment}
						</h6>
						<hr>
					</div>
					<div>
						<h5 class="w3-opacity">
							<b>희망연봉</b>
						</h5>
						<p id="r_salary">${rlist[0].HOPE_SALARY}</p>
						<hr>
					</div>
					<div>
						<h5 class="w3-opacity" >
							<b>희망직무</b>
						</h5>
						<p id="r_hope">${rlist[0].JOB_NAME}</p>
						<hr>
					</div>
					<div >
						<h5 class="w3-opacity">
							<b>희망근무지역</b>
						</h5>
						<h6 class="w3-text-blue"  id="r_location">
							${rlist[0].HOPE_LOCATION}
						</h6>
						<hr>
					</div>
					<div >
						<h5 class="w3-opacity">
							<b>최종학력</b>
						</h5>
						<h6 class="w3-text-teal"  id="r_education">
							${rlist[0].FINAL_EDUCATION}
						</h6>
						<br>
					</div>
				</div>
				<br>
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						경력사항
					</h2>
					
					<div>
						<h5 class="w3-opacity">
						<!-- 커리어 -->
							<c:forEach items="${ clist }" var="career">
							<fmt:formatDate value="${ career.START_DATE }" pattern="yyyy-MM-dd" var="start_date" />
							<fmt:formatDate value="${ career.END_DATE }" pattern="yyyy-MM-dd" var="end_date" />
							<p>회사명:${ career.COMPANY_NAME } | 직무:{ career.JOB } | 직무내용:${ career.CAREER_CONTENT } | 직책:${ career.JOB_POSITION } | 기간:${ start_date }~${ end_date }</p>
							</c:forEach>
						</h5>
						<hr>
					</div>

				</div>
				
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<a onclick="reciveExp(event,'${applyman.member_id}')">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						관련 경험 및 자기 계발
						</a>
					</h2>
					<div >
						<h5 class="w3-opacity">
							<ul class="nav nav-pills flex-column" id="exp${applyman.member_id}">
							<!-- 여기에 가져온 경험정보를 붙이자. li 태그로로 -->
						</ul>
						</h5>
						<hr>
					</div>

				</div>
				
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						보유기술
					</h2>
					<div>
						<h5 class="w3-opacity">
								<c:forEach items="${ slist }" var="skill">
									<p>${ skill.SKILL_NAME }</p>
									<div clas="w3-light-grey w3-round-large">
										<div class='w3-blue w3-center w3-round-large w3-tiny' style='width:${ skill.SKILL_LEVEL }%'>
											${ skill.SKILL_LEVEL } lv
										</div>
									</div>
								</c:forEach>
						</h5>
						<hr>
					</div>

				</div>
				
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<a onclick="reciveHabit(event,'${applyman.member_id}')">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						습관
						</a>
					</h2>
					<div >
						<h5 class="w3-opacity">
							<c:forEach items="${ hlist }" var="habit">
							<fmt:formatDate value="${habit.HABIT_START_DATE }" pattern="yyyy-MM-dd" var="habit_date" />
							<p>습관명:${ habit.HABIT_NAME} | 시작일:${ habit_date } | 성공률${ habit.PER }%</p>
							</c:forEach>	
						</h5>
						<hr>
					</div>

				</div>

				<!-- End Right Column -->
				</div>
			</div>
			<!-- End Grid -->
		</div>
		<!-- End Page Container -->
<!-- ----------------------------------------------------- -->

	<c:if test="${not empty mapvo.employment_id }">
		<input type="hidden" id="employment_id" name="employment_id" value="${mapvo.employment_id}">
	</c:if>
	<c:if test="${not empty mapvo.empid }">
		<input type="hidden" id="employment_id" name="employment_id" value="${mapvo.empid}">
	</c:if>
	<input type="hidden" id="resume_id" name="resume_id" value="${ rlist[0].RESUME_ID }">
	<input type="hidden" id="video_id" name="video_id" value="${ vlist[0].VIDEO_ID }">
</form>

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
						<video id="v_img" width="100%" controls poster="download.do?name=${vlist[0].VIDEO_IMG}" playsinline preload="none">
 						</video>
 						<source id="v_location" src="download.do?name=${vlist[0].VIDEO_LOCATION }" type="video/mp4">
						<div class="w3-display-topleft w3-container w3-text-black">
							<br>
							<h2><b><u>${vlist[0].MEMBER_NAME}</u> 지원자</b></h2>
							<p id="v_hashtag">${vlist[0].JOB_NAME}</p>
							<p id="v_content"><b>${vlist[0].VIDEO_CONTENTS}</b></h3>
						</div>
					</div>
					<div>
						<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_name}</p>
						<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_addr}</p>
						<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_email}</p>
						<c:if test="${sessionScope.personalVo.member_gender == 'M'}">
							<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>남자</p>
						</c:if>
						<c:if test="${sessionScope.personalVo.member_gender == 'Y'}">
							<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>여자</p>
						</c:if>
						<%-- <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_gender}</p> --%>
						<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${sessionScope.personalVo.member_tel}</p>
						<fmt:formatDate value="${sessionScope.personalVo.member_birth}" pattern="yyyy-MM-dd" var="member_birth" />
						<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${member_birth}</p>
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
						<p id="r_hope">${rlist[0].JOB_NAME}</p>
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
						<p>${ skill.SKILL_NAME }</p>
						<div clas="w3-light-grey w3-round-large">
						<div class='w3-blue w3-center w3-round-large w3-tiny' style='width:${ skill.SKILL_LEVEL }%'>
						${ skill.SKILL_LEVEL } lv
						</div>
						</div>
						</c:forEach>
						<hr>
					</div><br>


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
						<fmt:formatDate value="${habit.HABIT_START_DATE }" pattern="yyyy-MM-dd" var="habit_date" />
						<p>습관명:${ habit.HABIT_NAME} | 시작일:${ habit_date } | 성공률${ habit.PER }%</p>
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
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.resume_coment}
						</h6>
						<c:forEach items="${ clist }" var="career">
						<fmt:formatDate value="${ career.START_DATE }" pattern="yyyy-MM-dd" var="start_date" />
						<fmt:formatDate value="${ career.END_DATE }" pattern="yyyy-MM-dd" var="end_date" />
						<p>회사명:${ career.COMPANY_NAME } | 직무:{ career.JOB } | 직무내용:${ career.CAREER_CONTENT } | 직책:${ career.JOB_POSITION } | 기간:${ start_date }~${ end_date }</p>
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
	<c:if test="${not empty mapvo.employment_id }">
		<input type="hidden" id="employment_id" name="employment_id" value="${mapvo.employment_id}">
	</c:if>
	<c:if test="${not empty mapvo.empid }">
		<input type="hidden" id="employment_id" name="employment_id" value="${mapvo.empid}">
	</c:if>
	<input type="hidden" id="resume_id" name="resume_id" value="${ rlist[0].RESUME_ID }">
	<input type="hidden" id="video_id" name="video_id" value="${ vlist[0].VIDEO_ID }">
	<%-- <input type="hidden" id="member_id" name="member_id" value="${sessionScope.personalVo.member_id}"> --%>
</form>
</body>
</html>