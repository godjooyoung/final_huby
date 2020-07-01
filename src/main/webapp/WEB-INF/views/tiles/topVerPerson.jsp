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
		<div class="alarmimg">
			<a href="personalarm.do"> <img
				src="${pageContext.request.contextPath}/resources/img/common/alarm1.png" /></a>
			<span id="count" class="badge badge-danger" 
			style="position: absolute;
    		top: 0px;
    		left: 25px;"></span>
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
		<li>지원 이력 <a href="applyManagement.do"><b><span
					id="now_apply_cnt"> </span></b></a></li>
		<li>작성한 이력서<a href="resumemanagement.do"><b><span
					id="now_resume_cnt"> </span></b></a></li>
		<li>촬영한 자기소개 영상 <a href="#"><b><span id="now_video_cnt">
				</span></b></a></li>
		<li>현재 진행중인 채용면접 <a href="person_chatList.do"><b><span
					id="now_interview_cnt"> </span></b></a></li>
		<li>&nbsp;</li>
		<li><a href="noticeListMember.do">공지사항</a></li>
		<li><a href="qListMember.do">허비에게 문의하기</a></li>
	</ul>
</div>

<!-- 아작스로 현재 count 항목들을 불러오는 script START -->
<script>
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "loadMemberNow.do",
			data : {
				"employment_id" : "얍"
			},
			success : function(data) {
				console.log(data.now_i.mem_now_interview);
				console.log(data.now_a.mem_now_apply);
				console.log(data.now_v.mem_now_video);
				console.log(data.now_r.mem_now_resume);
				var r_place = document.getElementById("now_resume_cnt");
				var v_place = document.getElementById("now_video_cnt");
				var a_place = document.getElementById("now_apply_cnt");
				var i_place = document.getElementById("now_interview_cnt");
				var r_cnt = data.now_r.mem_now_resume;
				var v_cnt = data.now_v.mem_now_video;
				var a_cnt = data.now_a.mem_now_apply;
				var i_cnt = data.now_i.mem_now_interview;

				$('<strong>').html(" " + r_cnt).appendTo(r_place);
				$('<strong>').html(" " + v_cnt).appendTo(v_place);
				$('<strong>').html(" " + a_cnt).appendTo(a_place);
				$('<strong>').html(" " + i_cnt).appendTo(i_place);
			},
			error : function() {
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end OF AJAX
	});
</script>
<!-- 아작스로 현재 count 항목들을 불러오는 script END -->






