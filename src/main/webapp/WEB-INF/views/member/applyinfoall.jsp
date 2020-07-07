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
	.w3-opacity{
		opacity: 2;
	}
</style>
<script>
	function back(){
		history.back();
	}
	
	function view(){
		$.ajax({
		    url: "vrCheck.do",
		    type: "post",
		    async: false,
		    dataType: "json",
		    success: function(data){
		    	if(data.resumeCnt == 0){
		    		alert("이력서를 먼저 작성해주세요.");
		    		return;
		    	}
		    	if(data.videoCnt == 0){
		    		alert("영상을 먼저 등록해주세요.");
		    		return;
		    	}
		    	
		    	var url = "applypreview.do";
				var preview = window.open(url,"fullscreen", "scrollbars=1"); //풀스크린 방식
		    },
		    error: function (request, status, error){
		    	
		    }
		  });
		
		
	}
	
	function applyInsert(){
		var chk = $("#vCheck").val();
		var rchk = $("#r_title").html();
		
		
		if(chk==null || chk==""){
			alert("영상이 없으면 지원이 불가능합니다. 영상을 먼저 등록하세요");
			return;
		}
		
		if(rchk==null || rchk==""){
			alert("이력서가 없으면 지원이 불가능합니다. 이력서를 먼저 등록하세요");
			return;
		}
		
		
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
						 			<p id="v_hashtag">${vlist[0].JOB_NAME}</p>
								</h4>
							</div>
							<div class="inner02" style="position:absolute; left:5%; top:5%;">
							<br><br>
								<p id="v_content" style="text-align:left;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;
									font-weight: bold;  color:white; text-shadow: 2px 2px 5px black; ">
									${vlist[0].VIDEO_CONTENTS}
								</p>
							</div>
							<div id="testVideo">
								<video id="v_img" width="100%" controls poster="download.do?name=${vlist[0].VIDEO_IMG}" playsinline preload="none">
		 						<source id="v_location" src="download.do?name=${vlist[0].VIDEO_LOCATION }" type="video/mp4">
								</video>
								<input type="hidden" id="vCheck" value="${vlist[0].VIDEO_LOCATION }">
							</div>
							<br>
							<div>
								<p>
									<i class="fas fa-signature w3-margin-right w3-large w3-text-blue"></i>
									${sessionScope.personalVo.member_id}
								</p>
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
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fas fa-file w3-margin-right w3-xxlarge w3-text-blue" ></i>
						<span id="r_title">${rlist[0].RESUME_TITLE}</span>
					</h2>
					<div>
						<table class="w3-opacity" style="font-size: large;">
							<tr>
								<th style="width: 20%">희망연봉</th>
								<td id="r_salary" style="width: 30%">${rlist[0].HOPE_SALARY}</td>
								<th style="width: 20%">희망직무</th>
								<td style="width: 30%" colspan="2" id="r_hope">${rlist[0].JOB_NAME}</td>
							</tr>
							<tr>
								<th>희망근무지역</th>
								<td id="r_location">${rlist[0].HOPE_LOCATION}</td>
								<th>최종학력</th>
								<td colspan="2" id="r_education">${rlist[0].FINAL_EDUCATION}</td>
							</tr>
							<tr>
								<th>한마디</th>
								<td colspan="4" id="r_coment">${rlist[0].RESUME_COMENT}</td>
							</tr>
						</table>
					</div>
					
					
					<%-- <div>
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
					</div> --%>
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
							<%-- <p>회사명:${ career.COMPANY_NAME } | 직무:{ career.JOB_NAME } | 직무내용:${ career.CAREER_CONTENT } | 직책:${ career.JOB_POSITION } | 기간:${ start_date }~${ end_date }</p> --%>
							<span>◈${ career.COMPANY_NAME } | ${ career.JOB_NAME } | ${ start_date }~${ end_date } | 
							${ career.JOB_POSITION }<br> 
							&nbsp;&nbsp;&nbsp;&nbsp;상세업무: &nbsp;${ career.CAREER_CONTENT }</span><br>
							</c:forEach>
						</h5>
						<hr>
					</div>
				</div>
				
				<%-- <div class="w3-card w3-white w3-margin-bottom">
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

				</div> --%>
				
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						보유기술
					</h2>
					<div>
						<h5 class="w3-opacity">
								<c:forEach items="${ slist }" var="skill">
								<div style="margin-bottom: 5px">
									<span>◈${ skill.SKILL_NAME }</span>
								</div>
									<div class="w3-light-grey w3-round-large">
										<div class='w3-blue w3-center w3-round-large w3-large' style='width:${ skill.SKILL_LEVEL }%'>
											${ skill.SKILL_LEVEL }Lv
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
							<c:if test="${habit.PER != 0}">
							<fmt:formatDate value="${habit.HABIT_START_DATE }" pattern="yyyy-MM-dd" var="habit_date" />
							<div style="margin-bottom: 5px">
							<span>◈${ habit.HABIT_NAME}</span><span style="float: right;">시작일:${ habit_date }</span>
							</div>
								<div class="w3-light-grey w3-round-large">
									<div class='w3-blue w3-center w3-round-large w3-large' style='width:${ habit.PER }%'>
										 성공률: ${ habit.PER } %
									</div>
								</div>
							</c:if>
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
</body>
</html>