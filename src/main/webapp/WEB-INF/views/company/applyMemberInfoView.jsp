<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row-padding">
			<!-- Left Column -->
			<div class="w3-third">
				<div class="w3-white w3-text-grey w3-card">
					<div class="w3-display">
						<div class='wrap' style='position:relative;'>
						<div class="inner01" style="position:absolute; left:3%; top:3%;">
						<h4 style="align:left; color:white; text-shadow: 2px 2px 5px black; font-weight: bolder; 
				 			padding-top:5px; padding-left:5px;">
				 			<b><u>${applyman.member_name}</u> 지원자</b><br>
				 			#${applyman.code_name}
						</h4>
						</div>
						<div class="inner02" style="position:absolute; left:5%; top:5%;">
						<br><br>
						<p style="text-align:left;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;
							font-weight: bold;  color:white; text-shadow: 2px 2px 5px black; ">
							${applyman.video_contents}
						</p>
						</div>
						<video width="100%" controls poster="download.do?name=${applyman.video_img}" playsinline preload="none">
 						<source src="download.do?name=${applyman.video_location }" type="video/mp4">영상을 찾을수 없습니다.
 						</video>
						</div>
					</div>
					<br>
					<div style="padding-left:15px;">
						<p>
							<i class="fas fa-signature w3-margin-right w3-large w3-text-blue"></i>
							${applyman.member_name}(${applyman.member_id})
						</p>
						<p>
						<i class="fas fa-home w3-margin-right w3-large w3-text-blue"></i>
							${applyman.member_addr}
						</p>
						<p>
							<i class="fas fa-at w3-margin-right w3-large w3-text-blue"></i>
							${applyman.member_email}
						</p>
						<p>
							<i class="fas fa-phone w3-margin-right w3-large w3-text-blue"></i>
							${applyman.member_tel}
						</p>
						<p>
							<i class="fas fa-venus-mars w3-margin-right w3-large w3-text-blue"></i>
							<c:set var="gender" value="${applyman.member_gender}"></c:set>
							<c:if test="${gender eq 'M' }">남성</c:if>
							<c:if test="${gender eq 'W' }">여성</c:if>
						</p>
						<p>
							<i class="fas fa-birthday-cake w3-margin-right w3-large w3-text-blue"></i>
							<fmt:formatDate  type="date" value="${applyman.member_birth}"/>
							
						</p>
						
						<hr>
					</div>
					<div align="center">
					<input type="button" class="btn btn-primary w3-margin" id="button" value="면접요청" onclick="interviewRe('${applyman.member_id}')">
					</div>
				</div>
				<br>
				
				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">
				<div class="w3-card w3-white w3-margin-bottom" style="padding-left:15px;">
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fas fa-file w3-margin-right w3-xxlarge w3-text-blue" ></i>
						${applyman.resume_title}
					</h2>
					<div style="width:100%;">
						<h5 class="w3-opacity">
							<b>한마디</b>
						</h5>
						<h6 class="w3-text-blue">
							${applyman.resume_coment}
						</h6>
						<hr>
					</div>
					<div class="w3-cell-row">
					<div style="width:50%;" class="w3-cell">
						<div>
							<h5 class="w3-opacity">
								<b>희망연봉</b>
							</h5>
							<p>${applyman.hope_salary}</p>
							<hr>
						</div>
						<div>
							<h5 class="w3-opacity">
								<b>희망직무</b>
							</h5>
							<p>${applyman.code_name}</p>
							<hr>
						</div>
					</div>	
					<div style="width:50%;" class="w3-cell">
						<div>
							<h5 class="w3-opacity">
								<b>희망근무지역</b>
							</h5>
							<h6 class="w3-text-teal">
								${applyman.hope_location}
							</h6>
							<hr>
						</div>
						<div>
							<h5 class="w3-opacity">
								<b>최종학력</b>
							</h5>
							<h6 class="w3-text-teal">
								${applyman.final_education}
							</h6>
							<br>
						</div>
					</div>
					</div>
				</div>
				<br>
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<a onclick="reciveCareer(event,'${applyman.member_id}')">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						경력사항
						</a>
					</h2>
					<div style="padding-left:15px;">
						<h5 class="w3-opacity">
						<!-- 커리어 -->
						<ul class="nav nav-pills flex-column" id="career${applyman.member_id}">
						<!-- 여기에 가져온 경력정보를 붙이자. li 태그로로 -->
						</ul>
						</h5>
						<hr>
					</div>

				</div>
				
				<div class="w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<a onclick="reciveSkill(event,'${applyman.member_id}')">
						<i  class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>
						보유기술
						</a>
					</h2>
					<div style="padding-left:15px;">
						<h5 class="w3-opacity">
							<ul class="nav nav-pills flex-column" id="skills${applyman.member_id}">
								<!-- 반복문 돌리기 -->
								<!-- 여기에 가져온 스킬정보를 붙이자. li 태그로로 -->
							</ul>
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
					<div style="padding-left:15px;">
						<h5 class="w3-opacity">
							<ul class="nav nav-pills flex-column" id="habits${applyman.member_id}">
							<!-- 여기에 가져온 습관정보를 붙이자. li 태그로로 -->
							</ul>
						</h5>
						<hr>
					</div>

				</div>

				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>	
	
<script>
function reciveSkill(e,memberid){
	var place = document.getElementById("skills"+memberid);
	var plusLi = document.createElement('li');
	$.ajax({
		type:"get",
		url:"showSkills.do",
		data : {'memberid': memberid },
		dataType : 'json',
		success: 
			function(data){	
			$(place).empty();
			$.each(data,function(idx,item){
				$('<li>').html(item.SKILL_NAME 
						+ '<div class="w3-light-grey w3-round-large">' 
						+ "<div class='w3-blue w3-center w3-round-large w3-large' style='width:"
						+item.SKILL_LEVEL+
						"%'>" 
						+ item.SKILL_LEVEL + "lv</div></div><br>"
						)
				.appendTo(place);
			});//each
			
		},
		
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
	};//end skills
	
function reciveHabit(e,memberid){
	var place = document.getElementById("habits"+memberid);
	var plusLi = document.createElement('li');
	var id = memberid;
	$.ajax({
		type:"get",
		url:"showHabit.do",
		data : {'memberid':id },
		contentType: "application/json",
		dataType : 'json',
		success: 
			function(data){	
			console.log("--------------------------"+data[0]);
			
			$(place).empty();
			$.each(data,function(idx,item){
				$('<li>').html(
						"습관"
						+(idx+1)
						+ " : " 
						+ item.habit_name 
						+ "<br>"
						+"시작 날짜  : " 
						+item.habit_start_date 
						+"<br>인증횟수  : " 
						+ item.cnt
						+"<br>성취률 <br>"
						+"<div class=\"w3-light-grey w3-round-large\">"
						+"<div class=\"w3-blue w3-center w3-round-large w3-large\" style='width:"
						+item.per 
						+"%'>"
						+item.per 
						+"</div>"
						+"</div><br>")
				.appendTo(place);
			});//each
			
		},
		
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
};//end habit


function reciveExp(e,memberid){
	var place = document.getElementById("exp"+memberid);
	var plusLi = document.createElement('li');
	$.ajax({
		type:"get",
		url:"showExp.do",
		data : {'memberid': memberid },
		dataType : 'json',
		success: 
			function(data){	
			console.log(data[0]);
			$(place).empty();
			$.each(data,function(idx,item){
				$('<li>').html(item.E_START_DATE + "~" +item.E_END_DATE + " | "+ item.EXPERIENCE_TITLE+"_" + item.EXPERIENCE_PLACE_NAME+ "_"+item.EXPERIENCE_ACTION)
				.appendTo(place);
			});//each
			
		},
		
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
};//endExp

function reciveCareer(e,memberid){
	var place = document.getElementById("career"+memberid);
	var plusLi = document.createElement('li');
	$.ajax({
		type:"get",
		url:"showCareer.do",
		data : {'memberid': memberid },
		dataType : 'json',
		success: 
			function(data){	
			console.log(data.length);
			
			$(place).empty();
			$.each(data,function(idx,item){	
				
				$('<li>').html(item.START_DATE + "~" +item.END_DATE + " | "+ item.COMPANY_NAME + item.CAREER_CONTENT+ "_"+item.CODE_NAME + "_"+ item.JOB_POSITION)
				.appendTo(place);
			});//each
			
		},
		
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
};//endCareer

	//면접제의 버튼
	function interviewRe(member_id){
		
	$.ajax({
		type:"post",
		url:"interviewRe.do",
		data: {'member_id': member_id, 'alarm_message':"면접제의"},
		dataType: 'json',
		
		success: 
			function(data){
			if(data.count == 1)
				alert("면접요청이 완료되었습니다.");
			else
				alert("이미 면접 요청이 진행되었습니다.")
		}
	})
}

</script>