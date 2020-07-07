<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">지원내역</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br> 공고를 눌러 지원자를 확인하세요.

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
		<div class="sub0101_con">
			<!-- 실제소스 -->
			<!-- 공고목록과 그 공고에 지원한 지원자 목록이 뜬다. -->
			<!-- 제목 -->
			<!-- 공고목록 -->
			<div>
				<ul class="list-group list-group-flush">
					<c:forEach var="employment" items="${employmentList }">
						<li class="list-group-item" value="${employment.EMPLOYMENT_ID}"
							onclick="go_applymen_list_page(event,${employment.EMPLOYMENT_ID},${employment.HOPE_JOB})">
							<p align="left" style="float: left;">${employment.EMPLOYMENT_TITLE}</p>
							<p align="left" style="float: left;">

								&nbsp;<span style="font-size: smaller;"
									class="badge badge-pill badge-primary">지원자
									${employment.APPLYCNT}</span>

							</p>
							<p align="right" style="float: right;">
								<fmt:formatDate pattern="yyyy년MM월dd일 까지"
									value="${employment.EMPLOYMENT_TIME}" />
							</p>
						</li>
					</c:forEach>
				</ul>
				<form id="empIdfrm" name="empIdfrm"
					action="companyEmploymentsApply.do">
					<input type="hidden" id="empIdinput" name="empIdinput" value="">
					<input type="hidden" id="empHjinput" name="code_id" value="">
				</form>
			</div>
			<!-- END OF SOURCE -->
			<c:set var="employment" value="${employmentList}" />
			<c:if test="${empty employment}">
				<div align="center">
					<h2>
						등록 된 공고가 없습니다. <br> 허비를 통해 공고를 내보세요. 맞춤 인재를 추천해드립니다!
					</h2>
					<br> <input type="button" value="공고 등록 하러가기"
						class="btn btn-warning btn-lg"
						onClick="location.href='empInsertPageGo.do'">
				</div>
				<br>
				<br>
			</c:if>
		</div>
	</div>
</div>
<script>
function go_applymen_list_page(e, eid, hj){
	var emp_id = eid;
	var hope_job =hj;
	document.getElementById("empIdinput").value = eid;
	document.getElementById("empHjinput").value = hope_job;
	
	document.empIdfrm.action = "companyEmploymentsApply.do";
	document.empIdfrm.method = "post";
	document.empIdfrm.submit();
	
}; // END OF GO_APPLYMEN_LIST_PAGE
</script>


