<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	var tit01 = "공고목록";
</script>

<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">공고목록</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					허빟<br>빛나는 당신을 위해
				</p>
				<div class="en" data-aos="fade-up" data-aos-delay="100">About
					Olive</div>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit">
			<script>
				document.write(tit01);
			</script>
		</div>

		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="javascript:GoPage('olive01')">공고전체</a></li>
			<li class="m2"><a href="javascript:GoPage('olive02')">ㄱ</a></li>
			<li class="m3"><a href="javascript:GoPage('olive03')">진료안내</a></li>
			<li class="m4"><a href="javascript:GoPage('olive04')">둘러보기</a></li>
		</ul>
	</div>
</div>

<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 5%;">
		<div class="sub0101_tit">여긴공고전체 보</div>

		<div class="sub0101_con">
			우리 몸은 수만가지 세포로 정밀하게 이루어진 하나의 생명이기에 아픈 부위를 따로, 겉과 속을 따로 생각하면 안됩니다. <br>
			<br> 몸 전체를 잘 알고 병들의 상호관계를 잘 아는 것이 치료에 있어 가장 중요합니다. <br
				class="pc"> 따라서 타고난 유전적 체질과 생활환경이 미치는 영향을 이해하는 의사를 만나야 합니다. <br>
			<br> 웰리브의 목표는 한 사람 한 사람의 몸을 잘 알고 각각의 환자에게 맞는 모두 다른 1:1 프리미엄 웰에이징
			토탈케어 입니다.
		</div>
		<div class="s_img">
			<img width="100%"
				src="${pageContext.request.contextPath}/resources/images/sub/sub0101_img_01.png" />
		</div>
	</div>
</div>
