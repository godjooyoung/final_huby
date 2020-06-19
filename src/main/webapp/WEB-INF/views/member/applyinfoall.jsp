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
		window.open("여기서부터 쓰면되나요?", "", "fullscreen", "scrollbars=1"); //풀스크린 방식
		
	}
</script>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2 align="center">영상</h2>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${!empty vlist}">
					<c:forEach var="video" items="${vlist}">
						<div class="col-sm-4">
							<!--Card-->
							<div class="card">
								<!--Card image-->
								<%-- <img class="img-fluid"
									src="${pageContext.request.contextPath}/resources/FileUpload/Chrysanthemum.jpg"
									alt="Card image cap"> --%>
								<video controls autoplay loop>
								<source src="${pageContext.request.contextPath}/resources/FileUpload/Wildlife.wmv" type="video/mp4">
								</video>
								<!--Card content-->
								<div class="card-body">
									<!--Title-->
									<h4 class="card-title">${video.hashtag}</h4>
									<!--Text-->
									<p class="card-text">${video.video_contents}</p>
									<p class="card-text">${video.video_img}</p>
									<p class="card-text">${video.video_location}</p>
									<input type="radio" id="vselect" name="vselect" value="vselect">&nbsp;&nbsp; Pick
								</div>
							</div>
							<!--/.Card-->
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
	<br>
	<h2 align="center">이력서</h2>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${!empty rlist}">
					<c:forEach var="resume" items="${rlist}">
						<div class="col-sm-4">
							<!--Card-->
							<div class="card">
								<!--Card image-->
								<img class="img-fluid"
									src="https://mdbootstrap.com/img/Photos/Horizontal/People/6-col/img%20%283%29.jpg"
									alt="Card image cap">

								<!--Card content-->
								<div class="card-body">
									<!--Title-->
									<h4 class="card-title">${resume.RESUME_TITLE}</h4>
									<!--Text-->
									<p class="card-text">${resume.HOPE_JOB}</p>
									<p class="card-text">${resume.HOPE_SALARY}</p>
									<p class="card-text">${resume.HOPE_LOCATION}</p>
									<p class="card-text">${resume.FINAL_EDUCATION}</p>
									<p class="card-text">${resume.RESUME_COMENT}</p>
									<input type="radio" id="rselect" name="rselect" value="rselect">&nbsp;&nbsp; Pick
								</div>
							</div>
							<!--/.Card-->
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
	<br>
	<h2 align="center">스킬</h2>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${!empty slist}">
					<c:forEach var="skills" items="${slist}">
						<div class="col-sm-4">
							<!--Card-->
							<div class="card">
								<!--Card image-->
								<!-- <img class="img-fluid"
									src="https://mdbootstrap.com/img/Photos/Horizontal/People/6-col/img%20%283%29.jpg"
									alt="Card image cap"> -->

								<!--Card content-->
								<div class="card-body">
									<!--Title-->
									<h4 class="card-title">SKILL</h4>
									<!--Text-->
									<p class="card-text">${skills.SKILL_NAME}</p>
									<p class="card-text">${skills.SKILL_LEVEL}</p>
									<input type="radio" id="sselect" name="sselect" value="sselect">&nbsp;&nbsp; Pick
								</div>
							</div>
							<!--/.Card-->
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
	<br>
	<h2 align="center">이력서</h2>
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${!empty clist}">
					<c:forEach var="career" items="${clist}">
						<div class="col-sm-4">
							<!--Card-->
							<div class="card">
								<!--Card image-->
								<!-- <img class="img-fluid"
									src="https://mdbootstrap.com/img/Photos/Horizontal/People/6-col/img%20%283%29.jpg"
									alt="Card image cap"> -->

								<!--Card content-->
								<div class="card-body">
									<!--Title-->
									<h4 class="card-title">CAREER</h4>
									<!--Text-->
									<p class="card-text">${career.START_DATE}</p>
									<p class="card-text">${career.END_DATE}</p>
									<p class="card-text">${career.COMPANY_NAME}</p>
									<p class="card-text">${career.CAREER_CONTENT}</p>
									<p class="card-text">${career.JOB}</p>
									<p class="card-text">${career.JOB_POSITION}</p>
									<input type="radio" id="cselect" name="cselect" value="cselect">&nbsp;&nbsp; Pick
								</div>
							</div>
							<!--/.Card-->
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
	<br>
	<div align="center">
		<button type="button" class="btn-primary" onclick="view()">미리보기</button>
		<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
	</div>
	<br>
</body>
</html>