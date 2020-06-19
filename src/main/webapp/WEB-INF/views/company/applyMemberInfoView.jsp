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
				<ul class="nav nav-pills flex-column" id="habits${applyman.member_id}">
					<!-- 반복문 돌리기 -->
					<!-- 여기에 가져온 스킬정보를 붙이자. li 태그로로 -->
					
				</ul>
				
				<a onclick="reciveHabit(event,'${applyman.member_id}')">
					<h3>
						<br>습관
					</h3>
				</a>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link" href="#">${applyman.member_addr}</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">${applyman.member_tel}</a></li>
					<li class="nav-item"><a class="nav-link" href="#">${applyman.member_email}</a></li>
					<li class="nav-item"><a class="nav-link" href="#">${applyman.member_birth}</a></li>
					<li class="nav-item"><a class="nav-link" href="#">${applyman.member_gender}</a>
					</li>
				</ul>
				<hr class="d-sm-none">
			</div>
			<div class="col-sm-8">
				<h2>이력서 ${applyman.resume_title}</h2>
				<h5> ${applyman.resume_coment}</h5>
				<p>${applyman.code_name}</p>
				<br>
				<h2>자기소개 영상 </h2>
				<h2>${applyman.video_contents}</h2>
				<div class="#">
				<img src="${pageContext.request.contextPath}/resources/img/common/${applyman.video_img}">
				</div>
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
			alert ("성공..");
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
			alert ("성공..");
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
function showPeson(id){
		var apply_id = id.getAttribute( 'id' );
		alert(apply_id);
		document.getElementById("applyIdInput").value=apply_id;
		  document.applyIdfrm.action = "companyApplyMember.do";
		  document.applyIdfrm.method = "post";
		  document.applyIdfrm.submit();
};
</script>