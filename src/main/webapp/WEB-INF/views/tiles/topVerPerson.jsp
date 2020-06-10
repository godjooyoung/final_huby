<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" 
	style="display: none; z-index: 2; width: 40%; min-width: 300px"
	id="mySidebar">

	<a href="javascript:void(0)" onclick="w3_close()"
		class="w3-bar-item w3-button"><i class="fas fa-times"></i></a> 
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">지원내역</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">나를 좋아하는 기업 목록</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">스크랩</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">면접채팅</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">나의 자기소개</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">나의 이력서</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">습관관리</a>
		<a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">고객지원센터</a>
</nav>
<!-- End of Sidebar -->

<!-- Top menu -->
<div class="w3-top w3-container">
	<div class="w3-col w3-white w3-xlarge" style="margin: auto">
		<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">
			<i class="fas fa-bars"></i>
		</div>
		<div class="w3-left w3-padding-16 w3-col s2 m2 l2"><a href="#"><b>HUBY</b></a></div>
		<div class="w3-right w3-padding-16 w3-col s12 m3 l3" >
			<div style="float: left" class="w3-padding">사용자이름 님</div>
			<div style="float: left" class= "w3-dropdown-hover">
				<button class="w3-right w3-button"><i class="fas fa-user"></i></button>
					<div class="w3-dropdown-content w3-bar-block w3-card">
					<a href="#" class="w3-bar-item w3-button">마이페이지</a> 
					<a href="#" class="w3-bar-item w3-button">로그아웃</a>
					</div>
			</div>
			<a href="#" class="w3-bar-item w3-button"><i class="fas fa-th-large"></i></a>
			<a href="#" class="w3-bar-item w3-button"><i class="fas fa-bell"></i></a> 
		</div>
	</div>
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 100px"></div>