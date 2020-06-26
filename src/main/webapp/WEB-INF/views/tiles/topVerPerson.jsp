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
		<li><a href="#">공지사항</a></li>
		<li><a href="qInsertMember.do">허비에게 문의하기</a></li>
	</ul>
</div>







