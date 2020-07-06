<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="gnb_dp1_wrap">
	<li class="gnb_dp1"><span>공고</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="employmentList.do">전체채용공고</a></li>
			<li class="gnb_dp2"><a href="empMatch.do">맞춤채용공고</a></li>
			<li class="gnb_dp2"><a href="load_employment_like_list.do">관심채용공고</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>채용</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="person_chatList.do">채용인터뷰</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>등록</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="memberVideoInsertForm.do">영상등록</a></li>
			<li class="gnb_dp2"><a href="resumemanagement.do">이력서관리</a></li>
			<li class="gnb_dp2"><a href="applyManagement.do">지원내역</a></li>
			<li class="gnb_dp2"><a href="habitManagement.do">습관</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>${ loginName } 님</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="myInfoUpdatePage.do">개인정보수정</a></li>
			<li class="gnb_dp2"><a href="personalarm.do">알림</a></li>
			<li class="gnb_dp2"><a href="logout.do">로그아웃</a></li>
		</ul></li>
</ul>