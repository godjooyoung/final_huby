<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</div>
<script>
	$(document)
			.ready(
					function() {
						$('.sub_menu_tit')
								.click(
										function() {
											$(
													'.sub01 .sub_menu_box.sub01, .sub02 .sub_menu_box.sub02, .sub03 .sub_menu_box.sub03, .sub04 .sub_menu_box.sub04, .sub05 .sub_menu_box.sub05, .sub06 .sub_menu_box.sub06, .sub07 .sub_menu_box.sub07, .sub08 .sub_menu_box.sub08')
													.slideToggle(200);
										});
					});
</script>
<script>
	var tit01 = "웰리브이념";
</script>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 5%;">
		<div class="sub0101_tit">나에게 맞는 몸속 건강과 아름다움을 동시에</div>

		<div class="sub0101_con">
			우리 몸은 수만가지 세포로 정밀하게 이루어진 하나의 생명이기에 아픈 부위를 따로, 겉과 속을 따로 생각하면 안됩니다. <br>
			<br> 몸 전체를 잘 알고 병들의 상호관계를 잘 아는 것이 치료에 있어 가장 중요합니다. <br
				class="pc"> 따라서 타고난 유전적 체질과 생활환경이 미치는 영향을 이해하는 의사를 만나야 합니다. <br>
			<br> 웰리브의 목표는 한 사람 한 사람의 몸을 잘 알고 각각의 환자에게 맞는 모두 다른 1:1 프리미엄 웰에이징
			토탈케어 입니다.
		</div>
		<div class="s_img">
			<img width="100%" src="/images/sub/sub0101_img_01.png" />
		</div>

	</div>
</div>

<script language="javascript">
	function GoPage(code) {
		if (!code) {
			window.location = "/";
		}

		else if (code == "main") {
			window.location = "/index.php";
		}

		else if (code == "olive01") {
			window.location = "/doc/olive01.php";
		} else if (code == "olive02") {
			window.location = "/doc/olive02.php";
		} else if (code == "olive03") {
			window.location = "/doc/olive03.php";
		} else if (code == "olive04") {
			window.location = "/doc/olive04.php";
		}

		else if (code == "gene01") {
			window.location = "/doc/gene01.php";
		} else if (code == "gene02") {
			window.location = "/doc/gene02.php";
		}

		else if (code == "detox01") {
			window.location = "/doc/detox01.php";
		} else if (code == "detox02") {
			window.location = "/doc/detox02.php";
		}

		else if (code == "skin01") {
			window.location = "/doc/skin01.php";
		} else if (code == "skin02") {
			window.location = "/doc/skin02.php";
		} else if (code == "skin03") {
			window.location = "/doc/skin03.php";
		} else if (code == "skin04") {
			window.location = "/doc/skin04.php";
		}

		else if (code == "body01") {
			window.location = "/doc/body01.php";
		} else if (code == "body02") {
			window.location = "/doc/body02.php";
		} else if (code == "body03") {
			window.location = "/doc/body03.php";
		}

		else if (code == "anti01") {
			window.location = "/doc/anti01.php";
		} else if (code == "anti02") {
			window.location = "/doc/anti02.php";
		} else if (code == "anti03") {
			window.location = "/doc/anti03.php";
		} else if (code == "anti04") {
			window.location = "/doc/anti04.php";
		}

		else if (code == "blog") {
			window.open('https://blog.naver.com/knpdc2018', '_blank');
		}
	}
</script>