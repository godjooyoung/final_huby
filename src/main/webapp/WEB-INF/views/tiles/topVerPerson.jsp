<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<header id="hd_wrap" class="over hd-up">
	<div id="hd_top">
		<div class="hd_logo">
			<a href="employmentMatch.do"></a>
		</div>
	</div>
	<div id="hd_gnb" class="gnb_pc">
		<div class="hd_gnb_logo">
			<a href="employmentMatch.do"> <img class="b"
				src="${pageContext.request.contextPath}/resources/img/common/huby_icon_clear_01.png" />
				<img class="t"
				src="${pageContext.request.contextPath}/resources/img/common/huby_icon_clear_01.png" />
			</a>
		</div>
		<div id="gnb_tel" class="hd_gnb_tel">
			<a href="employmentMatch.do"></a>
		</div>
		<%@include file="personMenu.jsp"%>
		<div id="gnb_menu" class="hd_gnb_menu">
			<span></span>
		</div>
	</div>
	<!-- hd_gnb -->
	<div class="hd_bg"></div>
</header>

<div id="gnb_menu_box" class="gnb_mo_menu">
	<%@include file="personMenu.jsp"%>
	<ul class="con">
		<li>허비</li>
		<li>대구 어딘가에있어</li>
		<li><a href="#">짜증나짜증나</a></li>
		<li><a href="#">T. 211324</a></li>
	</ul>
</div>



<div class="sub_menu_wrap s-inner sub_menu_pc ">
	<div class="sub_menu_tit">
		<script>
			document.write(tit01);
		</script>
	</div>

	<ul class="sub_menu_box sub01">
		<li class="m1"><a href="javascript:GoPage('olive01')">웰리브이념</a></li>
		<li class="m2"><a href="javascript:GoPage('olive02')">의료진소개</a></li>
		<li class="m3"><a href="javascript:GoPage('olive03')">진료안내</a></li>
		<li class="m4"><a href="javascript:GoPage('olive04')">둘러보기</a></li>
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











