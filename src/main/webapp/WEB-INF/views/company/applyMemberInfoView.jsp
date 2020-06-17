<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
hi?lollololololololololo ${applyman}
<h1>${applyman.code_name}</h1>

<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-4">
				<h2>${applyman.member_name}</h2>
				<h5> &nbsp; </h5>
				<div class="fakeimg">Fake Image</div>
				<p>Some text about me in culpa qui officia deserunt mollit
					anim..</p>
				<h3>개인 정보</h3>
				<p>개인정보입니다.</p>
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
				<p>//////////////////</p>
				<br>
				<h2>자기소개 영상 ${applyman.video_contents}</h2>
				<h5>&nbsp; </h5>
				<div class="#">
				<img src="${pageContext.request.contextPath}/resources/img/common/${applyman.video_img}">
				</div>
				<p>Some text..</p>
				<p>Sunt in culpa qui officia deserunt mollit anim id est laborum
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercitation ullamco.</p>
			</div>
		</div>
	</div>