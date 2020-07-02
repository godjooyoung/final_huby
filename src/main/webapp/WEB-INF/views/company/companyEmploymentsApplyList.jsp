<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 지원내역</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br>
					공고를 눌러 지원자를 확인하세요.
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
<!-- 공고목록과 그 공고에 지원한 지원자 목록이 뜬다. -->
<h1>POSTED EMPLOYMENTS</h1>
<span>
	<b> 
		공고제목을 눌러 지원자를 확인하세요.
	</b>
</span>
<br>
<!-- 제목 -->
<!-- 공고목록 -->
<div class="accordion-box">
	<c:forEach var="employment" items="${employmentList }">
  		<div id="accordion${employment.EMPLOYMENT_ID}">
    		<div class="card">
      			<div class="card-header">
        			<p class="card-link" 
        			onclick="go_applymen_list_page(event,${employment.EMPLOYMENT_ID})">
          				${employment.EMPLOYMENT_TITLE}
        			</p>
        			<span>${employment.EMPLOYMENT_TIME}</span>
        			<p>지원자 수 <span class="w3-badge w3-green">${employment.APPLYCNT}</span></p>
      			</div>
      			
      			<div id="div${employment.EMPLOYMENT_ID}" name="listBody" style="display:none">${employment.EMPLOYMENT_ID}</div>
    		
    		</div>
  		</div>
	</c:forEach>
</div>
<form id="empIdfrm" name="empIdfrm" action="companyEmploymentsApply.do">
	<input type="hidden" id ="empIdinput"  name ="empIdinput" value="">
</form>
<!-- END OF SOURCE -->
	</div>
</div>
<script>
function go_applymen_list_page(e, eid){
	var emp_id = eid;
	document.getElementById("empIdinput").value=eid;
	document.empIdfrm.action = "companyEmploymentsApply.do";
	document.empIdfrm.method = "post";
	document.empIdfrm.submit();
	
}; // END OF GO_APPLYMEN_LIST_PAGE
</script>


