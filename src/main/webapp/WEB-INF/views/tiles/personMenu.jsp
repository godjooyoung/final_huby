<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="gnb_dp1_wrap">
	<li class="gnb_dp1"><span>채용</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="employmentList.do">전체채용정보</a></li>
			<li class="gnb_dp2"><a href="#">지역별</a></li>
			<li class="gnb_dp2"><a href="#">직무별</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>알림</span>
		<ul class="gnb_dp2_wrap">

			<li class="gnb_dp2"><a href="personalarm.do">알림</a></li>
			<li class="gnb_dp2"><a href="person_chatList.do">면접</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>${ loginId }의 Page</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="myInfoUpdatePage.do">개인정보수정</a></li>
			<li class="gnb_dp2"><a href="memberVideoInsertForm.do">영상등록</a></li>
			<li class="gnb_dp2"><a href="resumemanagement.do">이력서관리</a></li>
			<li class="gnb_dp2"><a href="applyManagement.do">지원내역</a></li>
			<li class="gnb_dp2"><a href="habitManagement.do">습관</a></li>
			<li class="gnb_dp2"><a href="load_employment_like_list.do">스크랩</a></li>
			<li class="gnb_dp2"><a href="logout.do">로그아웃</a></li>
		</ul></li>


</ul>