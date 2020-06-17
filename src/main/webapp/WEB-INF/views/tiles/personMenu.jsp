<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<ul class="gnb_dp1_wrap">
	<li class="gnb_dp1"><span>지원</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('olive01')">지원내역</a></li>
			<li class="gnb_dp2"><a href="resumemanagement.do">이력서관리</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>관심</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('gene01')">관심기업</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('gene02')">관심공고</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>알림</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('detox01')">면접</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('detox02')">알림</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>${ loginId }의 Page</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('skin01')">정보관리</a></li>
			<li class="gnb_dp2"><a href="javascript:GoPage('skin02')">습관</a></li>
			<li class="gnb_dp2"><a href="logout.do">로그아웃</a></li>
		</ul></li>
		
		
</ul>