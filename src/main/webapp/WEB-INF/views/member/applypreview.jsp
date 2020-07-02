<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title></title>

</head>
<body>
<br><br><br><br><br>

	<form id="frm" name="frm" method="post">
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
								<video id="v_img" width="100%" controls poster="download.do?name=${video.VIDEO_IMG}" playsinline preload="none">
		 						</video>
		 						<source id="v_location" src="download.do?name=${video.VIDEO_LOCATION }" type="video/mp4">
								<!--Card content-->
								<div class="card-body" id="checkvideo">
									<!--Title-->
									<h4 class="card-title" id="v_hashtag">${video.JOB_NAME}</h4>
									<input type="hidden" id="video_id" name="video_id" value="${video.VIDEO_ID}">
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
	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${!empty rlist}">
					<c:forEach var="resume" items="${rlist}">
						<div class="col-sm-4" >
							<!--Card-->
							<div class="card">
								<!--Card image-->
								<img class="img-fluid"
									src="https://mdbootstrap.com/img/Photos/Horizontal/People/6-col/img%20%283%29.jpg"
									alt="Card image cap">

								<!--Card content-->
								<div class="card-body" id="checkresume">
									<!--Title-->
									<h4 class="card-title" id="r_title">${resume.RESUME_TITLE}</h4>
									<input type="hidden" id="resume_id" name="resume_id" value="${resume.RESUME_ID}">
									<!--Text-->
									<p class="card-text" id="r_hope">${resume.JOB_NAME}</p>
									<p class="card-text" id="r_salary">${resume.HOPE_SALARY}</p>
									<p class="card-text" id="r_location">${resume.HOPE_LOCATION}</p>
									<p class="card-text" id="r_education">${resume.FINAL_EDUCATION}</p>
									<p class="card-text" id="r_coment">${resume.RESUME_COMENT}</p>
									<input type="radio" id="rselect" name="rselect" value="rselect" checked="checked">&nbsp;&nbsp; Pick
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

		opener.document.getElementById("v_hashtag").innerHTML = vchecked.find("#v_hashtag").html();
		opener.document.getElementById("v_content").innerHTML = vchecked.find("#v_content").html();
		opener.document.getElementById("v_img").innerHTML = vchecked.find("#v_img").html();
		opener.document.getElementById("v_location").innerHTML = vchecked.find("#v_location").html();

		opener.document.getElementById("r_title").innerHTML = rchecked.find("#r_title").html(); 
		opener.document.getElementById("r_hope").innerHTML = rchecked.find("#r_hope").html();
		opener.document.getElementById("r_salary").innerHTML = rchecked.find("#r_salary").html();
		opener.document.getElementById("r_location").innerHTML = rchecked.find("#r_location").html();
		opener.document.getElementById("r_education").innerHTML = rchecked.find("#r_education").html();
		opener.document.getElementById("r_coment").innerHTML = rchecked.find("#r_coment").html();
		
		opener.document.getElementById("resume_id").value = rchecked.find("#resume_Id").val();
		opener.document.getElementById("video_id").value = vchecked.find("#video_id").val();
		
		window.close();
	}
</script>
</form>
</body>
</html>