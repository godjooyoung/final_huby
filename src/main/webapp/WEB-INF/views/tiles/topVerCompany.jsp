<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" 
	style="display: none; z-index: 2; width: 40%; min-width: 300px"
	id="mySidebar">
	<a href="javascript:void(0)" onclick="w3_close()"
		class="w3-bar-item w3-button"><i class="fas fa-times"></i></a> 
		<a href="#food" onclick="w3_close()" class="w3-bar-item w3-button">메뉴1</a>
		<a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">고객센터</a>
</nav>
<!-- End of Sidebar -->

<!-- Top menu -->
<div class="w3-top w3-container">
	<div class="w3-col w3-white w3-xlarge" style="margin: auto">
		<div class="w3-button w3-padding-16 w3-left w3-col s1 m1 l1" onclick="w3_open()">
			<i class="fas fa-bars"></i>
		</div>
		<div class="w3-left w3-padding-16 w3-col s2 m2 l2"><b>HUBY</b></div>
		<div class="w3-padding w3-col s2 m2 l2">
			<a href="#" class="w3-button">공고관리</a>
		</div>
		<div class="w3-padding w3-col s2 m2 l2">
			<a href="#" class="w3-button">지원관리</a>
		</div>

		<div class="w3-right w3-padding">
			<div class="w3-dropdown-hover w3-right w3-col s3 m3 l3">
				<button class="w3-button w3-col s2 m2 l2 ">'기 업 명'님</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4 w3-col s2 m2 l2 ">
					<a href="#" class="w3-bar-item w3-button">마이페이지</a> 
					<a href="#" class="w3-bar-item w3-button">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 100px"></div>