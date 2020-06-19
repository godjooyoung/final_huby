<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header id="hd_wrap" class="over hd-up">
	<div id="hd_top">
		<div class="hd_logo">
			<a href="javascript:GoPage('main')"></a>
		</div>
	</div>
	<div id="hd_gnb" class="gnb_pc">
		<div class="hd_gnb_logo">
			<a href="companyAfterLogin.do"> <img class="b"
				src="${pageContext.request.contextPath}/resources/images/common/hd_logo_over.png" />
				<img class="t"
				src="${pageContext.request.contextPath}/resources/images/common/hd_logo.png" />
			</a>
		</div>
		<div id="gnb_tel" class="hd_gnb_tel">
			<a href="tel:0536330077"></a>
		</div>
		<%@include file="companyMenu.jsp"%>
		<div id="gnb_menu" class="hd_gnb_menu">
			<span></span>
		</div>
	</div>
	<!-- hd_gnb -->
	<div class="hd_bg"></div>
</header>

<div id="gnb_menu_box" class="gnb_mo_menu">
	<%@include file="companyMenu.jsp"%>
	<ul class="con">
		<li>허비</li>
		<li>대구 어딘가에있어</li>
		<li><a href="javascript:GoPage('olive03')">짜증나짜증나</a></li>
		<li><a href="tel:0536330077">T. 211324</a></li>
	</ul>
</div>



<div class="sub_menu_wrap s-inner sub_menu_pc ">
	<div class="sub_menu_tit">
		<script>
			//document.write(tit01);
		</script>
	</div>

	<ul class="sub_menu_box sub01">
		<!-- 기업정보관리 -->
		<li class="m1"><a href="javascript:GoPage('olive01')">마이페이지</a></li>
		<li class="m2"><a href="javascript:GoPage('olive02')">공고관리</a></li>
		<li class="m3"><a href="javascript:GoPage('olive03')">지원확인</a></li>
		<li class="m4"><a href="javascript:GoPage('olive04')">관심인재</a></li>
	</ul>

	<ul class="sub_menu_box sub02">
		<li class="m1"><a href="javascript:GoPage('gene01')">유전자진단이란?</a></li>
		<li class="m2"><a href="javascript:GoPage('gene02')">유전자시크릿치료</a></li>
	</ul>

	<ul class="sub_menu_box sub03">
		<li class="m1"><a href="javascript:GoPage('detox01')">면역&디톡스란?</a></li>
		<li class="m2"><a href="javascript:GoPage('detox02')">면역&디톡스
				테라피</a></li>
	</ul>

	<ul class="sub_menu_box sub04">
		<li class="m1"><a href="javascript:GoPage('skin01')">나의 피부타입
				알기</a></li>
		<li class="m2"><a href="javascript:GoPage('skin02')">1:1 맞춤
				레이저</a></li>
		<li class="m3"><a href="javascript:GoPage('skin04')">1:1 맞춤
				스킨케어</a></li>
		<li class="m4"><a href="javascript:GoPage('skin03')">일상 속
				피부관리</a></li>
	</ul>

	<ul class="sub_menu_box sub05">
		<li class="m1"><a href="javascript:GoPage('body01')">나의 비만타입
				알기</a></li>
		<li class="m2"><a href="javascript:GoPage('body02')">나에게 맞는
				다이어트</a></li>
		<li class="m3"><a href="javascript:GoPage('body03')">요요없는
				유지관리</a></li>
	</ul>

	<ul class="sub_menu_box sub06">
		<li class="m1"><a href="javascript:GoPage('anti01')">보톡스&줄기세포</a></li>
		<li class="m2"><a href="javascript:GoPage('anti02')">갱년기&호르몬</a></li>
		<li class="m3"><a href="javascript:GoPage('anti03')">영양수액&예방주사</a></li>
		<li class="m4"><a href="javascript:GoPage('anti04')">VIP 올인원</a></li>
	</ul>
</div>


















<!-- Sidebar (hidden by default) -->
<!-- 이전소스
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" 
	style="display: none; z-index: 2; width: 40%; min-width: 300px"
	id="mySidebar">
	<a href="javascript:void(0)" onclick="w3_close()"
		class="w3-bar-item w3-button"><i class="fas fa-times"></i></a> 
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">지원내역</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">스크랩</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">채용관리</a>
		<a href="#" onclick="w3_close()" class="w3-bar-item w3-button">공고관리</a>
		<a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">고객센터</a>
</nav> <!-- End of Sidebar -->

<!-- Top menu -->
<!-- 
<div class="w3-top w3-container">
	<div class="w3-col w3-white w3-xlarge" style="margin: auto">
		<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">
			<i class="fas fa-bars"></i>
		</div>
		<div class="w3-left w3-padding-16 w3-col s2 m2 l2"><a href="#"><b>HUBY</b></div>
		<div class="w3-right w3-padding-16 w3-col s12 m3 l3" >
			<div style="float: left" class="w3-padding">기업명/담당자명 님</div>
			<div style="float: left" class= "w3-dropdown-hover">
				<button class="w3-right w3-button"><i class="fas fa-user"></i></button>
					<div class="w3-dropdown-content w3-bar-block w3-card">
					<a href="#" class="w3-bar-item w3-button">마이페이지</a> 
					<a href="#" class="w3-bar-item w3-button">로그아웃</a>
					</div>
			</div>
			<a href="#" class="w3-bar-item w3-button"><i class="fas fa-bell"></i></a> 
		</div>
	</div>
</div>

<!-- !PAGE CONTENT! -->
<!-- 
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 100px"></div> -->