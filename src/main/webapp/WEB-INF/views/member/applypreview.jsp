<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

</head>
<body>
	<form id="frm" name="frm" method="post">
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
								<div class="card-body" id="checkvideo">
								<video id="v_img" width="100%" controls poster="download.do?name=${video.VIDEO_IMG}" playsinline preload="none">
		 						</video>
		 						<source id="v_location" src="download.do?name=${video.VIDEO_LOCATION }" type="video/mp4">
								<!--Card content-->
									<!--Title-->
									<h4 class="card-title" id="v_hashtag">${video.JOB_NAME}</h4>
									<input type="hidden" id="video_id" name="video_id" value="${video.VIDEO_ID}">
									<input type="hidden" id="video_location" value="${video.VIDEO_LOCATION}">
									<input type="hidden" id="video_img" value="${video.VIDEO_IMG}">
									<!--Text-->
									<p class="card-text" id="v_content">${video.VIDEO_CONTENTS}</p>
									<%-- <p class="card-text" id="v_img">${video.VIDEO_IMG}</p> --%>
									<%-- <p class="card-text" id="v_location">${video.VIDEO_LOCATION}</p> --%>
									<input type="radio" id="vselect" name="vselect" value="vselect" checked="checked">&nbsp;&nbsp; Pick
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
	<div class="container" align="center">
		<div class="row">
			<c:choose>
				<c:when test="${!empty rlist}">
					<c:forEach var="resume" items="${rlist}">
						<div class="col-sm-4" >
							<!--Card-->
							<div class="card">
								<!--Card image-->
								<!-- <img class="img-fluid"
									src="https://mdbootstrap.com/img/Photos/Horizontal/People/6-col/img%20%283%29.jpg"
									alt="Card image cap"> -->

								<!--Card content-->
								<div class="card-body" id="checkresume">
									<!--Title-->
									<h4 class="card-title" id="r_title">${resume.RESUME_TITLE}</h4>
									<input type="hidden" id="resume_id" name="resume_id" value="${resume.RESUME_ID}">
									<!--Text-->
									<p class="card-text" id="r_hope" style="font-weight: bolder; font-size: larger;">${resume.JOB_NAME}</p>
									<p class="card-text" id="r_salary" style="font-weight: bolder; font-size: larger;">${resume.HOPE_SALARY}</p>
									<p class="card-text" id="r_location" style="font-weight: bolder; font-size: larger;">${resume.HOPE_LOCATION}</p>
									<p class="card-text" id="r_education" style="font-weight: bolder; font-size: larger;">${resume.FINAL_EDUCATION}</p>
									<p class="card-text" id="r_coment" style="font-weight: bolder; font-size: larger;">${resume.RESUME_COMENT}</p>
									<input type="radio" id="rselect" name="rselect" value="rselect" checked="checked" >&nbsp;&nbsp; Pick
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
		<button type="button" class="btn-primary" onclick="pick2()">선택하기</button>
	</div>
	<br>

<script>
	function pick2(){
		
		var rchecked = $(document).find("[name='rselect']:checked").closest("#checkresume");
		var vchecked = $(document).find("[name='vselect']:checked").closest("#checkvideo");
		
		var videoVal = vchecked.find("#video_location").val();
		var videoImg = vchecked.find("#video_img").val();
		
		var video = '<video id="v_img" width="100%" controls poster="download.do?name='+videoImg+'" playsinline preload="none">';
		video += 		'<source id="v_location" src="download.do?name='+videoVal+'" type="video/mp4">';
		video += 	'</video>';
		video += 	'<input type="hidden" id="vCheck" value="'+videoVal+'">';
		
		opener.document.getElementById("v_hashtag").innerHTML = vchecked.find("#v_hashtag").html();
		opener.document.getElementById("v_content").innerHTML = vchecked.find("#v_content").html();
		/* opener.document.getElementById("v_img").innerHTML = vchecked.find("#v_img").html(); */
		
		$("#testVideo", opener.document).empty();
		$("#testVideo", opener.document).append(video);
		
		
		opener.document.getElementById("r_title").innerHTML = rchecked.find("#r_title").html(); 
		opener.document.getElementById("r_hope").innerHTML = rchecked.find("#r_hope").html();
		opener.document.getElementById("r_salary").innerHTML = rchecked.find("#r_salary").html();
		opener.document.getElementById("r_location").innerHTML = rchecked.find("#r_location").html();
		opener.document.getElementById("r_education").innerHTML = rchecked.find("#r_education").html();
		opener.document.getElementById("r_coment").innerHTML = rchecked.find("#r_coment").html();
		
		opener.document.getElementById("resume_id").value = rchecked.find("#resume_id").val();
		opener.document.getElementById("video_id").value = vchecked.find("#video_id").val();
		
		window.close();
	}
</script>
</form>
</body>
</html>