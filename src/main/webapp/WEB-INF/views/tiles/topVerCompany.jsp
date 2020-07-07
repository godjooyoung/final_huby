<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
		#alarmimg2{
		 width: 40px;
		 background-color: 
		}
	</style>
	
<header id="hd_wrap" class="over hd-up">
	<div id="hd_top">
		<div class="hd_logo">
			<a href="get_matched_video_list_first.do"></a>
		</div>
	</div>
	<div id="hd_gnb" class="gnb_pc">
		<div class="hd_gnb_logo">
			<a href="get_matched_video_list_first.do"> <img class="b"
				src="${pageContext.request.contextPath}/resources/img/common/logo_horison.png" />
				<img class="t"
				src="${pageContext.request.contextPath}/resources/img/common/logo_horison.png" />
			</a>
		</div>
		
		<div class="alarmimg">
			<a href="companyalarm.do"> <img
				src="${pageContext.request.contextPath}/resources/img/common/alarm1.png" /></a>
			<span id="count" class="badge badge-danger" 
			style="position: absolute;
    		top: 0px;
    		left: 25px;"></span>
		</div>
		
		<div id="gnb_tel" class="hd_gnb_tel">
			<a href="companyalarm.do"><img
				src="${pageContext.request.contextPath}/resources/img/common/alarm1.png" /></a>
			<span id="count" class="badge badge-danger" 
			style="position: absolute;
    		top: 0px;
    		left: 25px;"></span>
		</div>
		<%@include file="companyMenu.jsp"%>
		<div id="gnb_menu" class="hd_gnb_menu">
			<span></span>
		</div>
	</div>
	<!-- hd_gnb -->
	<div class="hd_bg"></div>
</header>

<div id="gnb_menu_box" class="gnb_mo_menu">
	<%@include file="companyMenu.jsp"%>
	<ul class="con">
		<li>현재 진행중 공고 <a href="forcomemploymentsList.do"><b><span id="now_employment_cnt"> </span></b></a></li>
		<li>총 지원자 수 <a href="companyEmploymentsList.do"><b><span id="now_applymen_cnt"> </span></b></a></li>
		<li>채용면접 진행 수 <a href="company_chatList.do"><b><span id="now_interview_cnt"> </span></b></a></li>
		<li> &nbsp;</li>
		<li><a href="noticeListCompany.do">공지사항</a></li>
		<li><a href="qListCompany.do">허비에게 문의하기</a></li>
	</ul>
</div>

<!-- 아작스로 현재 count 항목들을 불러오는 script START -->
<script>
$(document).ready(function(){
	$.ajax({
		type : "post",
		url : "loadCompanyNow.do",
		data : {"employment_id" : "얍"},
		success : function(data) {
			console.log(data.now_e.com_now_emp);
			console.log(data.now_a.com_now_apply);
			console.log(data.now_i.com_now_interview);
			var e_place = document.getElementById("now_employment_cnt");
			var a_place =document.getElementById("now_applymen_cnt");
			var i_place =document.getElementById("now_interview_cnt");
			var e_cnt =data.now_e.com_now_emp;
			var a_cnt =data.now_a.com_now_apply;
			var i_cnt =data.now_i.com_now_interview;
			$('<strong>').html(" "+e_cnt)
			.appendTo(e_place);
			$('<strong>').html(" "+a_cnt)
			.appendTo(a_place);
			$('<strong>').html(" "+i_cnt)
			.appendTo(i_place);
		},
		error : function() {
			alert("에러 발생. 관리자에게 문의주세요.");
		}
	})//end OF AJAX
});
</script>
<!-- 아작스로 현재 count 항목들을 불러오는 script END -->