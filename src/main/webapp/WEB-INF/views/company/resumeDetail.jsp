<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}
</style>
	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row-padding">
			<!-- Left Column -->
			<div class="w3-third">
				<div class="w3-white w3-text-grey w3-card">
					<div class="w3-display-container">
						<div class='wrap' style='position:relative;'>
						<div class="inner01" style="position:absolute; left:3%; top:3%;">
						<h4 style="align:left; color:white; text-shadow: 2px 2px 5px black; font-weight: bolder; 
				 			padding-top:5px; padding-left:5px;">
				 			<b><u>${member.member_name}</u> 님</b><br>
				 			#${code.code_name}
						</h4>
						</div>
						<div class="inner02" style="position:absolute; left:5%; top:5%;">
						<br><br>
						<p style="text-align:left;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;
							font-weight: bold;  color:white; text-shadow: 2px 2px 5px black; margin-top:2%;">
							${video.video_contents}
						</p>
						</div>
						<video width="100%" controls poster="download.do?name=${video.video_img}" playsinline preload="none">
 						<source src="download.do?name=${video.video_location}" type="video/mp4">영상이 없습니다.
 						</video>
						</div>
					</div>
					<!-- -->
					<br>
					<div class="w3-container">
						<p>
							<i class="fas fa-signature w3-margin-right w3-large w3-text-blue"></i>
							${member.member_name}
						</p>
						<p>
						<i class="fas fa-home w3-margin-right w3-large w3-text-blue"></i>
							${member.member_addr}
						</p>
						<p>
							<i class="fas fa-at w3-margin-right w3-large w3-text-blue"></i>
							${member.member_email}
						</p>
						<p>
							<i class="fas fa-phone w3-margin-right w3-large w3-text-blue"></i>
							${member.member_tel}
						</p>
						<p>
							<i class="fas fa-venus-mars w3-margin-right w3-large w3-text-blue"></i>
							${member.member_gender}
						</p>
						<p>
							<i class="fas fa-birthday-cake w3-margin-right w3-large w3-text-blue"></i>
							${member.member_birth}
						</p>
						
						<hr>
					</div>
					<div align="center">
					<input type="button" class="btn btn-primary w3-margin" value="면접요청" 
							onclick="interviewRe('${member.member_id}')">
					<input type="button" class="btn btn-primary w3-margin" value="입사지원요청"
							onclick="comemploymentlist('${member.member_id}')">
							 <div id="btnsubmit"></div> <br>
					</div>
				</div>
				<br>
				
				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">

				<div class="w3-container w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fas fa-file w3-margin-right w3-xxlarge w3-text-blue" ></i>
						${resume.resume_title}
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>한마디</b>
						</h5>
						<h6 class="w3-text-blue">
							${resume.resume_coment}
						</h6>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망연봉</b>
						</h5>
						<p>${resume.hope_salary}</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망직무</b>
						</h5>
						<p>${code.code_name}</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망근무지역</b>
						</h5>
						<h6 class="w3-text-teal">
							${resume.hope_location}
						</h6>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>최종학력</b>
						</h5>
						<h6 class="w3-text-teal">
							${resume.final_education}
						</h6>
						<br>
					</div>
				</div>
				<br>

				<!-- End Right Column -->
				<br>
				<br>
				<br>  <!--  <input type="button" value="면접요청" onclick="interviewRe('${member.member_id}')"> 
					<input type="button" value="입사지원요청" onclick="comemploymentlist('${member.member_id}')">
					 <div id="btnsubmit"></div>-->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<script>
		function interviewRe(member_id) {

			$.ajax({
				type : "post",
				url : "interviewRe.do",
				data : {
					'member_id' : member_id,
					'alarm_message' : "면접제의"
				},
				dataType : 'json',
				success : function(data) {
					if (data.count == 1)
						alert("면접요청이 완료되었습니다.");
					else
						alert("이미 면접 요청이 진행되었습니다.")
				}
			})
		}

		//입사지원요청 클릭 시 공고목록
		function comemploymentlist(member_id) {
			
			$.ajax({
						type : "get",
						url : "comemploymentlist.do",
						data : {
							'member_id' : member_id
						},
						dataType : 'json',
						success : function(data) {
							console.log(data);
							for (i = 0; i < data.length; i++) {
								$('<div>')
										.append($('<span>').html(data[i].EMPLOYMENT_ID).hide())
										.append($('<span>').html(data[i].EMPLOYMENT_TITLE))
										.append('<input type="button" id="btn" class="btn btn-outline-primary btn-sm" value="입사 지원 요청하기" onclick="applyRe()">')
										.appendTo($('#btnsubmit'))
							}
						}
					})
				}

		//입사지원요청 insert
		function applyRe() {
			$(document).on(
					"click",
					".btn",
					function(event) {
						var employment_id = $(this).parent().find("span")
								.first().html()
						$.ajax({
							type : "post",
							url : "applyRe.do",
							data : {
								'member_id' : '${member.member_id}',
								'alarm_message' : "입사지원요청",
								'employment_id' : employment_id
							},
							dataType : 'json',
							success : function(data) {
								if (data.count == 1)
									alert("입사 지원 요청이 완료되었습니다.");
								else
									alert("이미 입사 지원 요청이 진행되었습니다.")
							}
						});
					});
		}

		
	</script>