<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 지원자</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br>
					공고에 지원한 지원자를 확인하세요.
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="forcomemploymentsList.do">공고관리</a></li>
			<li class="m2"><a href="empInsertPageGo.do">공고등록</a></li>
			<li class="m3"><a href="companyEmploymentsList.do">지원내역</a></li>
		</ul>
	</div>
</div>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 2%;">    
    <!-- 실제소스 -->

<h2><b>공고 </b> : ${title.employment_title} </h2>
${title.employment_contents} <br>
${title.hope_career}<br>
${title.hope_graduate}<br>
${title.hope_job_position}<br>
${title.hope_location}<br>
${title.hope_work_type}<br>
${title.employment_prefer}<br>

<h1>공고 지원자 목록 페이지</h1>
<c:forEach var="applymen" items="${applymenList}">
<h2><b>공고 </b>
${applymen.apply_date}</h2> 
<span>
${applymen.member_name}
<a href="javascript:void(0);" onClick="showPeson(${applymen.apply_id})"><b>${applymen.apply_id}번 지원자</b></a>
<form id="applyfrm${applymen.apply_id}" name="applyfrm" action="" method="">
<input type="hidden" value="" name="applyidInput" id="applyidInput${applymen.apply_id}">
</form>
</span>
</c:forEach>
	<!--END-->
</div>
</div>

<script>
function showPeson(id){
	var apply_id = id;
	var inputTagId = "applyidInput"+apply_id;
	var formTagId="applyfrm"+apply_id;
	alert(apply_id);
	document.getElementById(inputTagId).value=apply_id;
	  document.getElementById(formTagId).action = "companyApplyMember.do";
	  document.getElementById(formTagId).method = "post";
	  document.getElementById(formTagId).submit();
};
</script>

