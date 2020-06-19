<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<br>
<br>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}
</style>


<body class="w3-light-grey">
	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row-padding">
			<!-- Left Column -->
			<div class="w3-third">
				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<img
							src="${pageContext.request.contextPath}/resources/img/common/${video.video_img }"
							style="width: 100%" alt="Avatar">
						<div class="w3-display-bottomleft w3-container w3-text-black">
							<h2>${member.member_name}</h2>
						</div>
					</div>
					<div class="w3-container">
						<p>
							<i
								class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>${video.video_contents}
						</p>
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>${member.member_addr}
						</p>
						<p>
							<i
								class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${member.member_email}
						</p>
						<p>
							<i
								class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${member.member_gender}
						</p>
						<hr>
					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">

				<div class="w3-container w3-card w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>${resume.resume_title}
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망직무</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.hope_job}
							<span class="w3-tag w3-teal w3-round">Current</span>
						</h6>
						<p>블라블라</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>희망근무지역</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.hope_location}
						</h6>
						<p>ㅇㅇㅇ</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>최종학력</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.final_education}
						</h6>
						<p>ㅇㅇㅇ</p>
						<br>
					</div>
				</div>

				<div class="w3-container w3-card w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>한마디
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>소개</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>${resume.resume_coment}
						</h6>
						<p>Web Development! All I need to know in one place</p>
						<hr>
					</div>


				</div>

				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>