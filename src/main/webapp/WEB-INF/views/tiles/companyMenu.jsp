<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="gnb_dp1_wrap">
	<li class="gnb_dp1"><span>공고</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="forcomemploymentsList.do">공고관리</a></li>
			<li class="gnb_dp2"><a href="empInsertPageGo.do">공고등록</a></li>
			<li class="gnb_dp2"><a href="companyEmploymentsList.do">지원내역</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>인재</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="select_video_all.do">전체인재목록</a></li>
			<li class="gnb_dp2"><a href="comLikeVideoList.do">영상스크랩</a></li>
			<li class="gnb_dp2"><a href="companyAfterLogin.do">맞춤추천인재</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>채용</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="company_chatList.do">채용인터뷰</a></li>
		</ul></li>
	<li class="gnb_dp1"><span>${ loginId }님</span>
		<ul class="gnb_dp2_wrap">
			<li class="gnb_dp2"><a href="javascript:GoPage('skin01')">마이페이지</a></li>
			<li class="gnb_dp2"><a href="companyalarm.do">알림</a></li>
			<li class="gnb_dp2"><a href="logout.do">로그아웃</a></li>
		</ul></li>
</ul>
