<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<br><br>
<br><br>
<br><br>
hi?lollololololololololo ${applyman}
<h1>지원자 상세 보기</h1>
		
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">
				<h2>${applyman.member_name} 님</h2>
				<h3><br>개인 정보</h3>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item">${applyman.member_addr}</li>
					<li class="nav-item">${applyman.member_tel}</li>
					<li class="nav-item">${applyman.member_email}</li>
					<li class="nav-item">${applyman.member_birth}</li>
					<li class="nav-item">${applyman.member_gender}</li>
				</ul>
				
				<a onclick="reciveSkill(event,'${applyman.member_id}')">
					<h3>
						<br>기술
					</h3>
				</a>
				<ul class="nav nav-pills flex-column" id="skills${applyman.member_id}">
					<!-- 반복문 돌리기 -->
					<!-- 여기에 가져온 스킬정보를 붙이자. li 태그로로 -->
				</ul>
				
				
				<a onclick="reciveHabit(event,'${applyman.member_id}')">
					<h3>
						<br>습관
					</h3>
				</a>
				<ul class="nav nav-pills flex-column" id="habits${applyman.member_id}">
				<!-- 여기에 가져온 습관정보를 붙이자. li 태그로로 -->
				</ul>
				
				<hr class="d-sm-none">
			</div>
			<div class="col-sm-8">
				
				<h2>[이력서]</h2> 
				<h3>${applyman.resume_title}</h3>
				<h4>${applyman.resume_coment}</h4>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item">희망 연봉 : ${applyman.hope_salary}</li>
					<li class="nav-item">희망 직무 : ${applyman.code_name}</li>
					<li class="nav-item">희망 근무 지역 : 
						<c:set var="location" value="${applyman.hope_location}" />
						<c:if test="${location eq null}" >
							없음
						</c:if>
						<c:if test="${location != null}" >
							${applyman.hope_location}
						</c:if>
						</li>
				</ul>
				
				<h2>[자기소개]</h2>
				<h3>${applyman.video_contents}</h3>
				<div>
				<img src="${pageContext.request.contextPath}/resources/img/common/${applyman.video_img}">
				</div>
				<p>${applyman.code_name}</p>
				<br>
				
				<a onclick="reciveCareer(event,'${applyman.member_id}')">
				<h3>경력</h3>
				</a>
				<ul class="nav nav-pills flex-column" id="career${applyman.member_id}">
				<!-- 여기에 가져온 경력정보를 붙이자. li 태그로로 -->
				</ul>
				
				<a onclick="reciveExp(event,'${applyman.member_id}')">
				<h3>경험</h3>
				</a>
				<ul class="nav nav-pills flex-column" id="exp${applyman.member_id}">
				<!-- 여기에 가져온 경험정보를 붙이자. li 태그로로 -->
				</ul>
				
				
			</div>
		</div>
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
			alert ("성공 skills");
			console.log(data[0]);
			
			$(place).empty();
			$.each(data,function(idx,item){
				$('<li>').html(item.SKILL_NAME + item.SKILL_LEVEL)
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
	$.ajax({
		type:"get",
		url:"showHabit.do",
		data : {'memberid': memberid },
		dataType : 'json',
		success: 
			function(data){	
			alert ("성공 habit");
			console.log(data[0]);
			
			$(place).empty();
			$.each(data,function(idx,item){
				$('<li>').html(item.HABIT_NAME + " / " +item.HABIT_START_DATE + "~"+ item.HABIT_COUNT)
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
			alert ("성공 exp");
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
			alert ("성공 career");
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

</script>