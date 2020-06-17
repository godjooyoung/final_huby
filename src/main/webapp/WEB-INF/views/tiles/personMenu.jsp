<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<ul class="gnb_dp1_wrap">
	<li class="gnb_dp1"><span>채용</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('olive01')">전체채용정보</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('olive01')">지역별</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('olive01')">직무별</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>알림</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('detox01')">알림</a></li>
			<li class="gnb_dp2"><a href="person_chat.do">면접</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>${ loginId }의 Page</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="resumemanagement.do">이력서관리</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('skin01')">지원내역</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('skin02')">습관</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('skin01')">스크랩</a></li>
			<li class="gnb_dp2"><a href="logout.do">로그아웃</a></li>
		</ul></li>
		
		
</ul>